// error_response.dart

import '../error_response.dart';

class AppException implements Exception {
  final ErrorResponse errorResponse;
  AppException({ErrorResponse? errorResponse})
    : errorResponse = errorResponse ?? const ErrorResponse();

  @override
  String toString() =>
      'Exception: ${errorResponse.message} (Code: ${errorResponse.statusCode})';
}

// 4xx
class BadRequestException extends AppException {
  BadRequestException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 400, message: 'Bad Request'),
      );
}

class InvalidInfoException extends AppException {
  InvalidInfoException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 400,
              message: 'Invalid Information',
            ),
      );
}

class UnprocessableException extends AppException {
  UnprocessableException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 422,
              message: 'Unprocessable Entity',
            ),
      );
}

class NotFoundException extends AppException {
  NotFoundException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 404, message: 'Not Found'),
      );
}

class ConflictException extends AppException {
  ConflictException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 409, message: 'Conflict'),
      );
}

class PreconditionFailedException extends AppException {
  PreconditionFailedException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 412,
              message: 'Precondition Failed',
            ),
      );
}

class PaymentRequiredException extends AppException {
  PaymentRequiredException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 402, message: 'Payment Required'),
      );
}

// Auth
class UnauthorizedException extends AppException {
  UnauthorizedException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 401, message: 'Unauthorized'),
      );
}

class ForbiddenException extends AppException {
  ForbiddenException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 403, message: 'Forbidden'),
      );
}

// 5xx
class ServerException extends AppException {
  ServerException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 500,
              message: 'Internal Server Error',
            ),
      );
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 503,
              message: 'Service Unavailable',
            ),
      );
}

// 429
class RateLimitedException extends AppException {
  RateLimitedException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 429, message: 'Too Many Requests'),
      );
}

// عميل/شبكة
class NoInternetConnectionException extends AppException {
  NoInternetConnectionException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: -1, message: 'No Internet'),
      );
}

class TimeoutExceptionEx extends AppException {
  TimeoutExceptionEx({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: -2, message: 'Timeout'),
      );
}

class TlsExceptionEx extends AppException {
  TlsExceptionEx({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: -3, message: 'TLS Handshake Error'),
      );
}

class DnsExceptionEx extends AppException {
  DnsExceptionEx({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: -4, message: 'DNS Lookup Failed'),
      );
}

// عميل/تحويل/كاش
class JsonConvertException extends AppException {
  JsonConvertException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 0,
              message: 'JSON Conversion Error',
            ),
      );
}

class ParsingException extends AppException {
  ParsingException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 0, message: 'Parsing Error'),
      );
}

class CacheException extends AppException {
  CacheException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 0, message: 'Cache Error'),
      );
}

class UnknownException extends AppException {
  UnknownException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 520, message: 'Unknown Error'),
      );
}
