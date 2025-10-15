import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:diet_tracker/src/core/di/app_initializer.dart';
import 'package:diet_tracker/src/resources/theme_manager.dart';
import 'app/features/init_app/presentation/bloc/init_app_bloc.dart';
import 'generated/codegen_loader.g.dart';
import 'src/core/di/service_locator.dart';
import 'src/core/enums/app_theme_types.dart';
import 'src/core/router/app_router.dart';
import 'src/logger/dev_logger.dart';

Future<void> startApp({bool isDebug = true}) async {
  // Main Init
  await AppInitializer.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(
      BlocProvider<InitAppBloc>(
        create: (context) => sl<InitAppBloc>()..add(LoadUserSettingsEvent()),
        child: MainApp(isDebug: isDebug),
      ),
    );
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isDebug});
  final bool isDebug;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/i18n',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
        enableScaleText: () => false,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<InitAppBloc, InitAppState>(
            bloc: context.read<InitAppBloc>(),
            buildWhen: (previous, current) =>
                previous.userSettings != current.userSettings,
            builder: (context, state) {
              Dev.logLine('context: ${MediaQuery.of(context).size}');
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: isDebug,
                  supportedLocales: context.supportedLocales,
                  builder: (context, child) => BotToastInit()(context, child),
                  localizationsDelegates: context.localizationDelegates,
                  locale: EasyLocalization.of(context)!.locale,
                  routerConfig: AppRouter.getRouter,
                  theme: state.userSettings.theme == AppThemeType.light
                      ? AppTheme.lightTheme
                      : AppTheme.darkTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: state.userSettings.theme == AppThemeType.light
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  title: 'Learning-Go',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
