import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:diet_tracker/src/errors/failures/app_failures.dart';

import '../../logger/dev_logger.dart';

@LazySingleton()
class SecureStorageServices {
  final FlutterSecureStorage _storage;
  final String _accessKey = 'access_token';
  final String _cookieKey = 'cookie';

  String? _accessToken;
  String? _cookie;

  String? get token => _accessToken;
  String? get cookies => _cookie;
  SecureStorageServices() : _storage = const FlutterSecureStorage();

  Future<void> init() async {
    _accessToken = await loadAccessToken();
    _cookie = await loadCookie();
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String cookie,
  }) async {
    try {
      await _storage.write(key: _accessKey, value: accessToken);
      _accessToken = accessToken;
    } catch (e) {
      Dev.logError('Error saving tokens: $e');
    }
  }

  Future<void> saveCookie({required String cookie}) async {
    await _storage.write(key: _cookieKey, value: cookie);
    _cookie = cookie;
  }

  Future<String?> loadAccessToken() async {
    try {
      final token = await _storage.read(key: _accessKey);
      return token;
    } catch (e) {
      Dev.logError('Error loading access token: $e');
      return null;
    }
  }

  Future<String?> loadCookie() async {
    try {
      final cookie = await _storage.read(key: _cookieKey);
      return cookie;
    } catch (e) {
      Dev.logError('Error loading cookie: $e');
      return null;
    }
  }

  Future<void> clear() async {
    try {
      await _storage.delete(key: _accessKey);
      _accessToken = null;
      await _storage.delete(key: _cookieKey);
      _cookie = null;
    } catch (e) {
      Dev.logError('Error clearing tokens: $e');
      throw CategoricalFailure(
        FailureCategory.server,
        cause: e,
        reason: FailureReason.cacheError,
      );
    }
  }
}
