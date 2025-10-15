import 'dart:async';
import 'dart:io';

import 'package:diet_tracker/src/errors/exceptions/app_exception.dart';
import 'package:diet_tracker/src/errors/failures/app_failures.dart';
import 'package:diet_tracker/src/logger/dev_logger.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

Future<Either<Failure, T>> safeCall<T>(Future<T> Function() run) async {
  try {
    final value = await run();
    return Right(value);
  } catch (e, s) {
    Dev.logErrorWithStackTrace(e, s);
    return Left(_mapThrowableToFailure(e, s));
  }
}

Failure _mapThrowableToFailure(Object error, [StackTrace? stack]) {
  if (error is DioException) {
    final inner = error.error;

    if (inner is AppException) {
      return _mapAppExceptionToFailure(inner, stack);
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return CategoricalFailure(
          FailureCategory.network,
          reason: FailureReason.timeout,
          message: 'Connection timeout',
          cause: error,
          stack: stack,
        );

      case DioExceptionType.badCertificate:
        return CategoricalFailure(
          FailureCategory.network,
          reason: FailureReason.tls,
          message: 'TLS Handshake Error',
          cause: error,
          stack: stack,
        );

      case DioExceptionType.unknown:
        final cause = error.error;
        if (cause is SocketException) {
          final msg = cause.message.toLowerCase();
          final isDns =
              msg.contains('failed host lookup') || msg.contains('lookup');
          return CategoricalFailure(
            FailureCategory.network,
            reason: isDns ? FailureReason.dns : FailureReason.offline,
            message: isDns ? 'DNS Lookup Failed' : 'No Internet connection',
            cause: error,
            stack: stack,
          );
        }
        return CategoricalFailure(
          FailureCategory.unknown,
          reason: FailureReason.unknown,
          message: error.message ?? 'Unexpected error',
          cause: error,
          stack: stack,
        );

      default:
        return CategoricalFailure(
          FailureCategory.unknown,
          reason: FailureReason.unknown,
          message: error.message ?? 'Unexpected error',
          cause: error,
          stack: stack,
        );
    }
  }

  if (error is AppException) {
    return _mapAppExceptionToFailure(error, stack);
  }

  if (error is TimeoutException) {
    return CategoricalFailure(
      FailureCategory.network,
      reason: FailureReason.timeout,
      message: 'Connection timeout',
      cause: error,
      stack: stack,
    );
  }
  if (error is SocketException) {
    return CategoricalFailure(
      FailureCategory.network,
      reason: FailureReason.offline,
      message: 'No Internet connection',
      cause: error,
      stack: stack,
    );
  }

  return CategoricalFailure(
    FailureCategory.unknown,
    reason: FailureReason.unknown,
    message: error.toString(),
    cause: error,
    stack: stack,
  );
}

Failure _mapAppExceptionToFailure(AppException e, [StackTrace? stack]) {
  final er = e.errorResponse;
  final s = er.statusCode;
  final msg = er.message ?? 'Unknown error';

  if (e is RateLimitedException || s == 429) {
    return CategoricalFailure(
      FailureCategory.rateLimited,
      reason: FailureReason.warning,
      retryAfter: er.retryAfter,
      statusCode: 429,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }

  if (e is UnauthorizedException || s == 401) {
    return CategoricalFailure(
      FailureCategory.auth,
      reason: FailureReason.unauthorized,
      statusCode: 401,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is ForbiddenException || s == 403) {
    return CategoricalFailure(
      FailureCategory.auth,
      reason: FailureReason.forbidden,
      statusCode: 403,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }

  if (e is BadRequestException || s == 400) {
    return CategoricalFailure(
      FailureCategory.validation,
      reason: FailureReason.badRequest,
      statusCode: 400,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is UnprocessableException || s == 422) {
    return CategoricalFailure(
      FailureCategory.validation,
      reason: FailureReason.schemaMismatch,
      statusCode: 422,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }

  if (e is NotFoundException || s == 404) {
    return CategoricalFailure(
      FailureCategory.resource,
      reason: FailureReason.notFound,
      statusCode: 404,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is ConflictException || s == 409) {
    return CategoricalFailure(
      FailureCategory.resource,
      reason: FailureReason.conflict,
      statusCode: 409,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is PreconditionFailedException || s == 412) {
    return CategoricalFailure(
      FailureCategory.resource,
      reason: FailureReason.preconditionFailed,
      statusCode: 412,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is PaymentRequiredException || s == 402) {
    return CategoricalFailure(
      FailureCategory.resource,
      reason: FailureReason.paymentRequired,
      statusCode: 402,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }

  if (e is ServiceUnavailableException || s == 503) {
    return CategoricalFailure(
      FailureCategory.server,
      reason: FailureReason.unavailable,
      statusCode: 503,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is ServerException || (s != null && s >= 500)) {
    return CategoricalFailure(
      FailureCategory.server,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }

  if (e is NoInternetConnectionException) {
    return CategoricalFailure(
      FailureCategory.network,
      reason: FailureReason.offline,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is TimeoutExceptionEx) {
    return CategoricalFailure(
      FailureCategory.network,
      reason: FailureReason.timeout,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is TlsExceptionEx) {
    return CategoricalFailure(
      FailureCategory.network,
      reason: FailureReason.tls,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is DnsExceptionEx) {
    return CategoricalFailure(
      FailureCategory.network,
      reason: FailureReason.dns,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }

  if (e is JsonConvertException || e is ParsingException) {
    return CategoricalFailure(
      FailureCategory.unknown,
      reason: FailureReason.parseError,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is CacheException) {
    return CategoricalFailure(
      FailureCategory.unknown,
      reason: FailureReason.cacheError,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }
  if (e is UnknownException) {
    return CategoricalFailure(
      FailureCategory.unknown,
      reason: FailureReason.unknown,
      statusCode: s,
      message: msg,
      code: er.code,
      service: er.service,
      correlationId: er.correlationId,
      details: er.details,
      cause: e,
      stack: stack,
    );
  }

  return CategoricalFailure(
    FailureCategory.unknown,
    reason: FailureReason.unknown,
    statusCode: s,
    message: msg,
    code: er.code,
    service: er.service,
    correlationId: er.correlationId,
    details: er.details,
    cause: e,
    stack: stack,
  );
}
