// ignore_for_file: public_member_api_docs, sort_constructors_first
enum AppEnvironment { dev, staging, prod }

class AppEnv {
  final AppEnvironment env;
  final Uri apiBaseUrl;
  final String domain;
  final bool featurePayments;
  final String logLevel;
  final bool enableLogger;

  const AppEnv({
    required this.env,
    required this.apiBaseUrl,
    required this.domain,
    required this.featurePayments,
    required this.logLevel,
    required this.enableLogger,
  });

  factory AppEnv.fromDefines() {
    final envStr = const String.fromEnvironment(
      'ENV',
      defaultValue: 'prod',
    ).toLowerCase();
    const api = String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://api.example.com',
    );
    const domain = String.fromEnvironment(
      'DOMAIN',
      defaultValue: 'example.com',
    );
    final payments =
        const String.fromEnvironment(
          'FEATURE_PAYMENTS',
          defaultValue: 'false',
        ).toLowerCase() ==
        'true';
    const logLevel = String.fromEnvironment('LOG_LEVEL', defaultValue: 'info');

    final env = switch (envStr) {
      'dev' => AppEnvironment.dev,
      'staging' => AppEnvironment.staging,
      _ => AppEnvironment.prod,
    };

    final uri = Uri.parse(api);
    if (uri.scheme != 'https') {
      throw StateError('API_BASE_URL must be HTTPS');
    }

    final enableLogger =
        const String.fromEnvironment(
          'ENABLE_LOGGER',
          defaultValue: 'false',
        ).toLowerCase() ==
        'true';

    return AppEnv(
      env: env,
      apiBaseUrl: uri,
      domain: domain,
      featurePayments: payments,
      logLevel: logLevel,
      enableLogger: enableLogger,
    );
  }

  bool get isProd => env == AppEnvironment.prod;
  String get envName => switch (env) {
    AppEnvironment.dev => 'dev',
    AppEnvironment.staging => 'staging',
    AppEnvironment.prod => 'prod',
  };
}
