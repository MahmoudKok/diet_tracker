import 'package:hive_ce/hive.dart';
import 'package:diet_tracker/src/core/data/models/user_information.dart';
import 'package:diet_tracker/src/core/configs/hive_configs/hive_boxes.dart';
import 'package:diet_tracker/src/core/data/models/user_local_settings.dart';
import 'package:diet_tracker/src/core/services/secure_storage_services.dart';
import 'package:diet_tracker/src/localization/app_languages.dart';
import 'package:injectable/injectable.dart';

import '../../logger/dev_logger.dart';
import '../di/service_locator.dart';

@LazySingleton()
class LocalStorage {
  LocalStorage() {
    init();
  }
  //? Hive Boxes name
  //-------------
  static const String _userSettings = HiveBoxesName.userLocalSettingsBox;
  static const String _userInfo = HiveBoxesName.userInfoBox;
  //-------------
  //? Default values
  //-------------
  static UserLocalSettings _defaultUserLocalSettings =
      UserLocalSettings.defaultSettings;
  static UserInformation _defaultUserInfo = UserInformation.defaultValue;
  //-------------

  Future<void> init() async {
    try {
      Dev.logLine("HI INIT");

      // Open UserLocalSettings box
      var userSettingsBox = await Hive.openBox<UserLocalSettings>(
        _userSettings,
      );

      // Retrieve UserLocalSettings if it exists, otherwise use default
      if (userSettingsBox.isNotEmpty && userSettingsBox.get(0) != null) {
        Dev.logLine("USer settings not empty");
        var userSettings = userSettingsBox.get(0) as UserLocalSettings;
        Dev.logLineWithTag(
          tag: 'UserSettings',
          message:
              'User Settings Stored in Local => ${userSettings.toString()}',
        );
        _defaultUserLocalSettings = userSettings;
        AppLanguages.currentLocal = userSettings.locale;
      } else {
        // Save default settings if no user settings found
        Dev.logLineWithTag(
          tag: 'UserSettings',
          message:
              'No User Settings Stored. Saving default ${_defaultUserLocalSettings.toString()}',
        );
        AppLanguages.currentLocal = _defaultUserLocalSettings.locale;
        await sl<LocalStorage>().saveUserSettings(_defaultUserLocalSettings);
      }

      // Open UserEntity box
      var userInfoBox = await Hive.openBox<UserInformation>(_userInfo);

      // Retrieve UserEntity if it exists, otherwise use default
      if (userInfoBox.isNotEmpty && userInfoBox.get(0) != null) {
        Dev.logLine("USer settings not empty");

        var userInfo = userInfoBox.get(0) as UserInformation;
        Dev.logLineWithTag(
          tag: 'UserEntity',
          message: 'User Information from local => ${userInfo.toString()}',
        );
        if (sl<SecureStorageServices>().token == '') {
          _defaultUserInfo = userInfo;
        }
      } else {
        // Save default user info if no user info found
        Dev.logLineWithTag(
          tag: 'UserEntity',
          message: 'No User Information Stored. Saving default info',
        );
        await sl<LocalStorage>().saveUserInfo(_defaultUserInfo);
      }
    } catch (e) {
      Dev.logLine("Error during Hive initialization: $e");
    }
  }

  Future<void> deleteUserInfoLocalStorage() async {
    try {
      // Close all open Hive boxes

      // await Hive.deleteBoxFromDisk(_userSettings);
      // await Hive.deleteBoxFromDisk(_userInfo);
      // Delete all Hive boxes and data from disk
      await Hive.deleteFromDisk();
      Dev.logLine("Local Storage Deleted");

      // Reinitialize Hive after deletion
      await init();
    } catch (e) {
      Dev.logLine("Error during deletion or re-initialization: $e");
    }
  }

  String? getUserToken() {
    try {
      sl<SecureStorageServices>().token;
    } catch (e) {
      return null;
    }
    return null;
  }

  //? Getter
  //-------------
  Box<UserLocalSettings> get _userSettingsBox =>
      Hive.box<UserLocalSettings>(_userSettings);
  Box<UserInformation> get _userInfoBox => Hive.box<UserInformation>(_userInfo);
  UserLocalSettings get userSettings =>
      _userSettingsBox.get(0) ?? _defaultUserLocalSettings;
  UserInformation get userInformation =>
      _userInfoBox.get(0) ?? _defaultUserInfo;
  //-------------

  //? Setter
  //-------------
  Future<void> saveUserSettings(UserLocalSettings settings) async {
    _defaultUserLocalSettings = settings;
    await _userSettingsBox.put(0, settings);
  }

  Future<void> saveUserInfo(UserInformation info) async {
    _defaultUserInfo = info;
    await _userInfoBox.put(0, info);
  }

  // Future<void> resetMemory() async {
  //   try {
  //     _defaultUserLocalSettings = UserLocalSettings(
  //       theme: AppThemeType.light,
  //       locale: Locale(AppLocales.arabicLocale.languageCode),
  //       isFirstTimeOpenApp: false,
  //       userAuth: UserAuth.unauthorized,
  //     );

  //     _defualtUserinfo = UserEntity.defaultValue;
  //     _defaultUserLocalSettings = UserLocalSettings.defaultSettings;

  //     await _userSettingsBox.clear();
  //     await _userinfoBox.clear();

  //     await saveUserSettings(_defaultUserLocalSettings);
  //     await saveUserInfo(_defualtUserinfo);

  //     try {
  //       await FireBaseTokenMangment.deleteFCMToken();
  //     } catch (e) {
  //       Dev.logError("Error during delete Fcm token: $e");
  //     }

  //     Dev.logLine("Memory Reset Successfully");
  //   } catch (e) {
  //     Dev.logError("Error during memory reset: $e");
  //     throw CacheException();
  //   }
  // }

  //-------------
}
