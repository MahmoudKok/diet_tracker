part of 'init_app_bloc.dart';

abstract class InitAppEvent extends Equatable {
  const InitAppEvent();
  @override
  List<Object?> get props => [];
}

class LoadUserSettingsEvent extends InitAppEvent {}

class ChangeAppLocaleEvent extends InitAppEvent {
  final Locale locale;
  const ChangeAppLocaleEvent({required this.locale});
}

class ChangeAppThemeEvent extends InitAppEvent {}
