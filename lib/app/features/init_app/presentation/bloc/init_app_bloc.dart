import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../src/core/data/models/user_local_settings.dart';
import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/app_theme_types.dart';

import '../../../../../src/core/services/local_storage.dart';
import '../../../../../src/localization/app_languages.dart';

import '../../../../../src/logger/dev_logger.dart';

part 'init_app_event.dart';
part 'init_app_state.dart';

@LazySingleton()
class InitAppBloc extends Bloc<InitAppEvent, InitAppState> {
  InitAppBloc() : super(InitAppState.initial()) {
    on<LoadUserSettingsEvent>(_loadUserSettings);
    on<ChangeAppThemeEvent>(_changeAppTheme);
    on<ChangeAppLocaleEvent>(_changeAppLocale);
  }

  FutureOr<void> _loadUserSettings(event, Emitter<InitAppState> emit) async {
    UserLocalSettings storedUserSettings = sl<LocalStorage>().userSettings;
    // AppThemes.changeCurrentTheme(storedUserSettings.theme);
    AppLanguages.currentLocal = storedUserSettings.locale;
    emit(state.copyWith(userSettings: storedUserSettings));
  }

  Future<void> _changeAppTheme(
    ChangeAppThemeEvent event,
    Emitter<InitAppState> emit,
  ) async {
    AppThemeType type;
    Dev.logLine('Theme: ${sl<LocalStorage>().userSettings.theme}');
    if (sl<LocalStorage>().userSettings.theme == AppThemeType.light) {
      type = AppThemeType.dark;
    } else {
      type = AppThemeType.light;
    }
    final newUserSettings = sl<LocalStorage>().userSettings.copyWith(
      theme: type,
    );
    await sl<LocalStorage>().saveUserSettings(newUserSettings);
    // AppThemes.changeCurrentTheme(type);
    emit(state.copyWith(userSettings: newUserSettings));
  }

  Future<void> _changeAppLocale(
    ChangeAppLocaleEvent event,
    Emitter<InitAppState> emit,
  ) async {
    AppLanguages.currentLocal = event.locale;
    final newSettings = state.userSettings.copyWith(locale: event.locale);
    await sl<LocalStorage>().saveUserSettings(newSettings);

    emit(state.copyWith(userSettings: newSettings));
  }
}
