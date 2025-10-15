// ignore_for_file: public_member_api_docs

import 'dart:io' show Platform;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

import '../../../logger/dev_logger.dart';
import '../../enums/notifications_type.dart';
import 'notifictions_constants.dart';

/// Unified local notifications service:
/// - Fixed Android channel IDs (no time-based suffix).
/// - Single generic builder for grouped notifications (reduces duplication).
/// - Optional big-picture style for images.
/// - Optional custom sound (Android raw resource name / iOS bundled file).
/// - Progress notifications with a stable ID per job key.
@LazySingleton()
class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  /// Group keys per notification type to bundle notifications nicely.
  static const String _generalGroupKey = 'general_group_key';
  static const String _reportsGroupKey = 'reports_group_key';
  static const String _tasksGroupKey = 'tasks_group_key';
  static const String _uploadGroupKey = 'upload_progress_group_key';

  /// Stable channel for progress updates (low importance).
  static const String _uploadChannelId = 'upload_channel';
  static const String _uploadChannelName = 'Upload Progress';

  FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      _plugin;

  /// Initializes the plugin, requests permissions when appropriate,
  /// and creates the notification channels on Android.
  Future<void> initialize({bool isBackground = false}) async {
    const iosInit = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const androidInit = AndroidInitializationSettings('ic_notification');
    const init = InitializationSettings(android: androidInit, iOS: iosInit);

    await _plugin.initialize(init);

    if (!isBackground) {
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
      await _createNotificationChannels();
    }
  }

  /// Handles notification taps (parse payload if your app needs deep links).
  Future<void> handleNotificationClick(String? payload) async {
    if (payload == null) return;
    // Handle payload navigation if needed.
  }

  /// Shows a notification based on [type].
  /// [soundName] should be the raw resource name on Android (without extension)
  /// and a bundled filename prefix on iOS; the service appends a proper extension.
  Future<void> showNotification({
    required NotificationType type,
    required String title,
    required String message,
    String? imageUrl,
    String? soundName,
    String? progressKey,
    int? progress, // 0..100 when [type] == NotificationType.progress
  }) async {
    switch (type) {
      case NotificationType.progress:
        if (progressKey == null) {
          Dev.logError('Progress notification requires a non-null progressKey');
          return;
        }
        await _showProgressNotification(
          title: title,
          message: message,
          progressKey: progressKey,
          progress: progress ?? 0,
        );
        return;

      case NotificationType.report:
        await _showGroupedNotification(
          title: title,
          message: message,
          channel: NotificationConstants.reportsChannel,
          groupKey: _reportsGroupKey,
          imageUrl: imageUrl,
          soundName: soundName,
        );
        return;

      case NotificationType.task:
        await _showGroupedNotification(
          title: title,
          message: message,
          channel: NotificationConstants.tasksChannel,
          groupKey: _tasksGroupKey,
          imageUrl: imageUrl,
          soundName: soundName,
        );
        return;

      case NotificationType.general:
      case NotificationType.nan:
        await _showGroupedNotification(
          title: title,
          message: message,
          channel: NotificationConstants.generalChannel,
          groupKey: _generalGroupKey,
          imageUrl: imageUrl,
          soundName: soundName,
        );
        return;
    }
  }

  /// Shows a grouped notification for the given [channel] and [groupKey].
  Future<void> _showGroupedNotification({
    required String title,
    required String message,
    required NotifictationsChannelConfigs channel,
    required String groupKey,
    String? imageUrl,
    String? soundName,
  }) async {
    try {
      AndroidNotificationDetails? androidDetails;

      if (imageUrl != null && imageUrl.isNotEmpty) {
        final bitmap = await _downloadBitmap(imageUrl);
        final bigPicture = BigPictureStyleInformation(
          bitmap,
          contentTitle: title,
          summaryText: message,
        );

        androidDetails = AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel.importanceLevel,
          priority: channel.priority,
          icon: 'ic_notification',
          styleInformation: bigPicture,
          groupKey: groupKey,
          playSound: true,
          sound: soundName != null
              ? RawResourceAndroidNotificationSound(soundName)
              : null,
        );
      } else {
        androidDetails = AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel.importanceLevel,
          priority: channel.priority,
          icon: 'ic_notification',
          groupKey: groupKey,
          playSound: true,
          sound: soundName != null
              ? RawResourceAndroidNotificationSound(soundName)
              : null,
        );
      }

      final iosDetails = DarwinNotificationDetails(
        /// iOS expects a bundled filename (e.g., sound.caf / .aiff / .wav).
        /// The service appends .aiff by default; adjust if your assets differ.
        //TODO: Make sure to change the aiff if needed
        sound: soundName != null ? '$soundName.aiff' : null,
        categoryIdentifier: groupKey,
      );

      final details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      final id = DateTime.now().millisecondsSinceEpoch.remainder(100000);
      await _plugin.show(id, title, message, details);
    } catch (e) {
      Dev.logLineWithTagError(
        tag: 'NOTIFICATIONS',
        message: 'Failed to show grouped notification',
        error: e,
      );

      final fallback = NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel.importanceLevel,
          priority: channel.priority,
          icon: 'ic_notification',
          groupKey: groupKey,
          playSound: true,
        ),
        iOS: const DarwinNotificationDetails(
          categoryIdentifier: _generalGroupKey,
        ),
      );

      final id = DateTime.now().millisecondsSinceEpoch.remainder(100000);
      await _plugin.show(id, title, message, fallback);
    }
  }

  /// Shows or updates a progress notification.
  /// Use a stable [progressKey] to differentiate parallel jobs.
  Future<void> _showProgressNotification({
    required String title,
    required String message,
    required String progressKey,
    required int progress,
  }) async {
    final notificationId = _stableIdFromKey(progressKey);

    if (progress >= 100) {
      await _plugin.cancel(notificationId);
      if (Platform.isIOS) return;
    }

    final android = AndroidNotificationDetails(
      _uploadChannelId,
      _uploadChannelName,
      channelDescription: 'Background uploads and long-running tasks',
      importance: Importance.low,
      priority: Priority.low,
      groupKey: _uploadGroupKey,
      playSound: false,
      showProgress: true,
      maxProgress: 100,
      progress: progress.clamp(0, 100),
      icon: 'ic_notification',
      ongoing: progress < 100,
    );

    const ios = DarwinNotificationDetails(
      sound: null,
      threadIdentifier: _uploadGroupKey,
      interruptionLevel: InterruptionLevel.passive,
      presentAlert: true,
      presentBadge: true,
      presentSound: false,
      categoryIdentifier: 'upload_progress',
    );

    final details = NotificationDetails(android: android, iOS: ios);

    if (progress < 100) {
      await _plugin.show(
        notificationId,
        title,
        '$message ($progress%)',
        details,
      );
    }
  }

  /// Creates all required Android channels with fixed IDs.
  static Future<void> _createNotificationChannels() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) return;

    final general = AndroidNotificationChannel(
      NotificationConstants.generalChannel.id,
      NotificationConstants.generalChannel.name,
      description: NotificationConstants.generalChannel.description,
      importance: NotificationConstants.generalChannel.importanceLevel,
    );

    final reports = AndroidNotificationChannel(
      NotificationConstants.reportsChannel.id,
      NotificationConstants.reportsChannel.name,
      description: NotificationConstants.reportsChannel.description,
      importance: NotificationConstants.reportsChannel.importanceLevel,
    );

    final tasks = AndroidNotificationChannel(
      NotificationConstants.tasksChannel.id,
      NotificationConstants.tasksChannel.name,
      description: NotificationConstants.tasksChannel.description,
      importance: NotificationConstants.tasksChannel.importanceLevel,
    );

    const upload = AndroidNotificationChannel(
      _uploadChannelId,
      _uploadChannelName,
      description: 'Background uploads and long-running tasks',
      importance: Importance.low,
    );

    await android.createNotificationChannel(general);
    await android.createNotificationChannel(reports);
    await android.createNotificationChannel(tasks);
    await android.createNotificationChannel(upload);
  }

  /// Downloads an image and converts it to an Android bitmap.
  static Future<AndroidBitmap<Object>> _downloadBitmap(String url) async {
    try {
      final dio = Dio();
      final res = await dio.get<Uint8List>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      return ByteArrayAndroidBitmap(res.data!) as AndroidBitmap<Object>;
    } catch (e) {
      Dev.logLineWithTagError(
        tag: 'NOTIFICATIONS',
        message: 'Image download failed',
        error: e,
      );
      rethrow;
    }
  }

  /// Stable ID derived from a logical key to avoid clashes across uploads/jobs.
  static int _stableIdFromKey(String key) {
    // Simple deterministic hash → 32-bit positive int
    final hash = key.codeUnits.fold<int>(
      0,
      (h, c) => (h * 31 + c) & 0x7fffffff,
    );
    return 1000 + (hash % 80000);
    // Keeps IDs in a readable, non-colliding range.
  }
}
