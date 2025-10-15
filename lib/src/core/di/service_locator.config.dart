// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../app/features/init_app/presentation/bloc/init_app_bloc.dart'
    as _i383;
import '../env_manager/env_service.dart' as _i913;
import '../services/home/home_services.dart' as _i308;
import '../services/internet_services.dart' as _i1051;
import '../services/local_storage.dart' as _i645;
import '../services/notifications_services/notifications_services.dart' as _i79;
import '../services/secure_storage_services.dart' as _i720;
import 'service_locator.dart' as _i105;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final serviceLocator = _$ServiceLocator();
  gh.lazySingleton<_i383.InitAppBloc>(() => _i383.InitAppBloc());
  gh.lazySingleton<_i895.Connectivity>(() => serviceLocator.connectivity);
  gh.lazySingleton<_i361.Dio>(() => serviceLocator.dio);
  gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
    () => serviceLocator.navigatorKey,
  );
  gh.lazySingleton<_i913.EnvService>(() => _i913.EnvService());
  gh.lazySingleton<_i1051.InternetService>(() => _i1051.InternetService());
  gh.lazySingleton<_i645.LocalStorage>(() => _i645.LocalStorage());
  gh.lazySingleton<_i79.NotificationService>(() => _i79.NotificationService());
  gh.lazySingleton<_i720.SecureStorageServices>(
    () => _i720.SecureStorageServices(),
  );
  gh.factory<String>(
    () => serviceLocator.ipApiBaseUrl,
    instanceName: 'ipApiBaseUrl',
  );
  gh.factory<String>(() => serviceLocator.baseUrl, instanceName: 'baseUrl');
  gh.lazySingleton<_i308.HomeServices>(
    () => _i308.HomeServices.new(
      gh<_i361.Dio>(),
      baseUrl: gh<String>(instanceName: 'baseUrl'),
    ),
  );
  return getIt;
}

class _$ServiceLocator extends _i105.ServiceLocator {}
