import 'package:injectable/injectable.dart';
import 'package:diet_tracker/src/logger/dev_logger.dart';
import 'app_env.dart';

@LazySingleton()
class EnvService {
  static late final AppEnv _env;
  static AppEnv get env => _env;

  static Future<void> initFromDefines() async {
    _env = AppEnv.fromDefines();
    Dev.logLine(
      '[ENV] env=${_env.env.name} baseUrl=${_env.apiBaseUrl} domain=${_env.domain} log=${_env.logLevel}',
    );
  }
}
