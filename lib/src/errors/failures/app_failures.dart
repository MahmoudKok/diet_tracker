// failure.dart
sealed class Failure {
  final String? code; // كود منطقي من السيرفر (AUTH_001...)
  final int? statusCode; // HTTP إن وُجد
  final String? message; // رسالة تقنية (ليست للـ UI مباشرة)
  final Object? cause; // الاستثناء الأصلي
  final StackTrace? stack;
  const Failure({
    this.code,
    this.statusCode,
    this.message,
    this.cause,
    this.stack,
  });
}

enum FailureCategory {
  network,
  auth,
  validation,
  resource,
  rateLimited,
  server,
  unknown,
}

enum FailureReason {
  // Network
  offline,
  timeout,
  tls,
  dns,

  // Validation
  badRequest,
  schemaMismatch,

  // Resource
  notFound,
  conflict,
  preconditionFailed,
  paymentRequired,

  // Server
  unavailable, // 503
  // Auth
  unauthorized, // 401
  forbidden, // 403
  // Internal
  parseError,
  cacheError,

  // Misc
  warning, // تحذير غير قاتل (soft notice)
  none,
  unknown,
}

final class CategoricalFailure extends Failure {
  final FailureCategory category;
  final FailureReason reason;
  final Duration? retryAfter; // للـ rate limit
  final Map<String, Object?>? details;
  final String? service; // للمايكروسيرفس
  final String? correlationId; // تتبّع عبر الخدمات
  const CategoricalFailure(
    this.category, {
    this.reason = FailureReason.none,
    this.retryAfter,
    this.details,
    this.service,
    this.correlationId,
    super.code,
    super.statusCode,
    super.message,
    super.cause,
    super.stack,
  });
  @override
  String toString() {
    final sb = StringBuffer('CategoricalFailure(');
    sb.write('category: $category');
    sb.write(', reason: $reason');
    if (message != null) sb.write(', message: "$message"');
    if (statusCode != null) sb.write(', statusCode: $statusCode');
    if (code != null) sb.write(', code: "$code"');
    if (service != null) sb.write(', service: "$service"');
    if (correlationId != null) sb.write(', correlationId: "$correlationId"');
    if (retryAfter != null) sb.write(', retryAfter: $retryAfter');
    if (details != null) sb.write(', details: $details');
    if (cause != null) sb.write(', cause: $cause');
    // Omitting 'stack' from toString for brevity, as it can be very long.
    // It can be accessed directly if needed for detailed logging.
    sb.write(')');
    return sb.toString();
  }
}
