import 'package:firebase_core/firebase_core.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:diet_tracker/src/core/Api/base_urls.dart';
import 'package:diet_tracker/src/core/configs/hive_configs/hive_initializer.dart';
import 'package:diet_tracker/src/core/di/service_locator.dart';
import 'package:diet_tracker/src/core/router/app_router.dart';
import 'package:diet_tracker/src/core/services/secure_storage_services.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../logger/dev_logger.dart';
import '../env_manager/env_service.dart';
import '../services/notifications_services/firebase_notifications_services.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../../../firebase_options.dart';

abstract class AppInitializer {
  static init() async {
    //-- Flutter init --
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    await EnvService.initFromDefines();
    //Logger Config
    Dev.configure(enabled: EnvService.env.enableLogger);

    /// Get the directory where Hive stores data
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final hiveDir = Directory(appDocumentDir.path); // Hive storage directory

    // // Delete the Hive storage directory if it exists
    // if (hiveDir.existsSync()) {
    //   hiveDir.deleteSync(recursive: true);
    // }
    // --- Init Firebase ---
    // Dev.logList(Firebase.apps, listName: 'Firebase');

    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
    );

    await setupFirebaseMessaging();
    // Handle notifications that opened the app from a terminated state
    await handleInitialMessage();

    //-- Load base URL's  --
    BaseUrls.init();
    //-- Hive initialize --
    await Hive.initFlutter();
    //-- Hive initialize Boxes --
    await HiveInitializer.initialize();
    //-- Dependency injection  --
    await configurationDependencies();
    //-- Local Storage init --
    // sl<LocalStorage>().init();
    //-- Notification Service init --

    // await sl<NotificationService>().initialize(true);
    //-- Router init --
    AppRouter.init();
    //-- Localization init  --
    await EasyLocalization.ensureInitialized();
    await sl<SecureStorageServices>().init();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
