import 'dart:io';

import 'package:diet_tracker/generated/locale_keys.g.dart';
import 'package:diet_tracker/src/core/services/local_storage.dart';
import 'package:diet_tracker/src/errors/error_response.dart';
import 'package:diet_tracker/src/errors/exceptions/app_exception.dart';
import 'package:diet_tracker/src/localization/app_languages.dart';
import 'package:diet_tracker/src/logger/dev_logger.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../di/service_locator.dart';
import '../../enums/user_auth.dart';
import '../../services/internet_services.dart';
import '../../services/secure_storage_services.dart';

class RemoteInterceptor extends Interceptor {
  final LocalStorage storageProvider;
  RemoteInterceptor(this.storageProvider);

  void _saveCookie(Response? response) {
    if (response == null) return;

    response = _normalizeEmptySuccess(response);
    final cookies = response.headers[HttpHeaders.setCookieHeader];
    if (cookies != null && cookies.isNotEmpty) {
      final cookieHeader = cookies.join('; ');
      sl<SecureStorageServices>().saveCookie(cookie: cookieHeader);
    }
  }

  bool _isEmptyBody(Response res) {
    if (res.statusCode == 204) return true;

    final cl = res.headers.value(Headers.contentLengthHeader);
    if (cl != null && int.tryParse(cl) == 0) return true;

    final d = res.data;
    if (d == null) return true;
    if (d is String && d.trim().isEmpty) return true;

    return false;
  }

  Response _normalizeEmptySuccess(Response res) {
    if (res.statusCode == null) return res;

    final sc = res.statusCode!;
    final is2xx = sc >= 200 && sc < 300;
    if (is2xx && _isEmptyBody(res)) {
      return Response(
        data: <String, dynamic>{},
        headers: Headers.fromMap({
          ...res.headers.map,
          Headers.contentTypeHeader: ['application/json; charset=utf-8'],
        }),
        requestOptions: res.requestOptions.copyWith(
          responseType: ResponseType.json,
        ),
      );
    }
    return res;
  }

  Duration? _parseRetryAfter(String? raw) {
    if (raw == null) return null;

    final secs = int.tryParse(raw.trim());
    if (secs != null) return Duration(seconds: secs);

    try {
      final dt = HttpDate.parse(raw);
      final now = DateTime.now().toUtc();
      final diff = dt.toUtc().difference(now);
      if (!diff.isNegative) return diff;
    } catch (_) {}
    return null;
  }

  ErrorResponse _buildErrorResponse(Response? res, DioException err) {
    try {
      // Handle null response
      if (res == null) {
        return const ErrorResponse(
          statusCode: 520,
          message: 'No response received from server',
        );
      }

      final status = res.statusCode ?? 520;
      final headers = res.headers;

      final is5xx = status >= 500 && status <= 599;
      final message = is5xx
          ? LocaleKeys.general_something_went_wrong_please_try_again_later.tr()
          : (res.data is Map && (res.data['message'] is String)
                ? res.data['message'] as String
                : (res.statusMessage ?? 'Unknown Error'));

      return ErrorResponse(
        statusCode: status,
        message: message,
        code: (res.data is Map) ? res.data['code'] as String? : null,
        correlationId:
            headers.value('x-correlation-id') ?? headers.value('x-request-id'),
        retryAfter: _parseRetryAfter(headers.value('retry-after')),
        service: headers.value('x-service') ?? headers.value('server'),
        details: (res.data is Map) ? Map<String, Object?>.from(res.data) : null,
      );
    } catch (e) {
      Dev.logLineWithTagError(
        tag: 'DIO',
        message: 'buildErrorResponse catch',
        error: e,
      );
      return const ErrorResponse(statusCode: 520, message: 'Unknown Error');
    }
  }

  AppException _mapDioToAppException(DioException err) {
    // Handle null response (no response received at all)
    if (err.response == null) {
      if (err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.receiveTimeout ||
          err.type == DioExceptionType.sendTimeout) {
        return TimeoutExceptionEx(
          errorResponse: const ErrorResponse(
            statusCode: -2,
            message: 'Connection timeout',
          ),
        );
      }

      if (err.error is HandshakeException) {
        return TlsExceptionEx(
          errorResponse: const ErrorResponse(
            statusCode: -3,
            message: 'TLS Handshake Error',
          ),
        );
      }

      if (err.error is SocketException) {
        final se = err.error as SocketException;
        final msg = se.message.toLowerCase();
        if (msg.contains('failed host lookup') ||
            msg.contains('lookup') ||
            se.osError?.errorCode == 7) {
          return DnsExceptionEx(
            errorResponse: const ErrorResponse(
              statusCode: -4,
              message: 'DNS Lookup Failed',
            ),
          );
        }
      }

      return UnknownException(
        errorResponse: const ErrorResponse(
          statusCode: 520,
          message: 'No response received from server',
        ),
      );
    }

    // Handle response with null data (response received but data is null)
    final res = err.response!;
    if (res.data == null) {
      Dev.logLineWithTag(
        tag: 'DIO',
        message:
            'Response received but data is null, status: ${res.statusCode}',
      );

      return UnknownException(
        errorResponse: ErrorResponse(
          statusCode: res.statusCode ?? 520,
          message: 'Response received but data is null',
        ),
      );
    }

    final r = _buildErrorResponse(res, err);
    switch (res.statusCode) {
      case 401:
        return UnauthorizedException(errorResponse: r);
      case 403:
        return ForbiddenException(errorResponse: r);

      case 400:
        return BadRequestException(errorResponse: r);
      case 422:
        return UnprocessableException(errorResponse: r);

      case 404:
        return NotFoundException(errorResponse: r);
      case 409:
        return ConflictException(errorResponse: r);
      case 412:
        return PreconditionFailedException(errorResponse: r);
      case 402:
        return PaymentRequiredException(errorResponse: r);

      case 429:
        return RateLimitedException(errorResponse: r);

      case 503:
        return ServiceUnavailableException(errorResponse: r);
      case 500:
      case 501:
      case 502:
      case 504:
        return ServerException(errorResponse: r);

      default:
        return UnknownException(errorResponse: r);
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final dioOption = options.copyWith(
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    );
    final session = sl<SecureStorageServices>().cookies ?? '';
    final langCode = AppLanguages.currentLocal.languageCode;
    final Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      if (session.isNotEmpty) "Cookie": "$session;languagePref=$langCode",
    };

    if (storageProvider.userSettings.userAuth == UserAuth.unauthorized) {
      headers['language'] = langCode;
    }
    String? token;

    dioOption.headers['Authorization'] = 'Bearer $token';
    dioOption.headers.addAll(headers);

    final internetService = sl<InternetService>();
    final hasConnection = await internetService.checkConnection();
    Dev.logLineWithTag(
      tag: 'DIO',
      message:
          'Internet Connection is: ${hasConnection ? "Active" : "Not-Active"}',
    );
    if (!hasConnection) {
      Dev.logLineWithTag(tag: 'DIO', message: 'NO INTERNET CONNECTION');
      final appEx = NoInternetConnectionException(
        errorResponse: ErrorResponse(
          statusCode: -1,
          message: LocaleKeys
              .general_please_check_your_internet_connection_and_try_again_later
              .tr(),
        ),
      );
      return handler.reject(
        DioException(
          requestOptions: dioOption,
          type: DioExceptionType.unknown,
          error: appEx,
        ),
      );
    }

    handler.next(dioOption);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle null response data even with 200 status
    if (response.data == null) {
      Dev.logLineWithTag(
        tag: 'DIO',
        message: 'Response data is null, normalizing to empty object',
      );

      // Create a normalized response with empty data
      final normalizedResponse = Response(
        data: <String, dynamic>{},
        headers: Headers.fromMap({
          ...response.headers.map,
          Headers.contentTypeHeader: ['application/json; charset=utf-8'],
        }),
        requestOptions: response.requestOptions.copyWith(
          responseType: ResponseType.json,
        ),
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );

      _saveCookie(normalizedResponse);
      return handler.next(normalizedResponse);
    }

    _saveCookie(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Dev.logLineWithTagError(tag: 'DIO', message: 'onError Called', error: err);

    try {
      if (err.error is AppException) {
        return handler.reject(err);
      }

      final appEx = _mapDioToAppException(err);

      Dev.logLineWithTagError(
        tag: 'Process',
        message: 'Dio OnError mapped to ${appEx.runtimeType}',
        error: appEx,
      );

      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: appEx,
        ),
      );
    } catch (e, s) {
      Dev.logLineWithTagError(
        tag: 'Process',
        message: 'Dio OnError mapping failed: ${e.runtimeType}',
        error: e,
      );

      final appEx = UnknownException(
        errorResponse: const ErrorResponse(
          statusCode: 520,
          message: 'Unknown Error',
        ),
      );
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: appEx,
          stackTrace: s,
        ),
      );
    }
  }
}
