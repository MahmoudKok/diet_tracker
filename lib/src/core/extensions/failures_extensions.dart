import 'package:diet_tracker/src/core/constants/messages/auth_messages.dart';
import 'package:diet_tracker/src/core/constants/messages/general_messages.dart';
import 'package:diet_tracker/src/errors/failures/app_failures.dart';

extension FailureMessage on CategoricalFailure {
  String getErrorMessage() {
    final messages = GeneralMessages();
    final auth = AuthMessages();

    switch (category) {
      case FailureCategory.network:
        switch (reason) {
          case FailureReason.offline:
            return messages.noInternetMessage;
          case FailureReason.timeout:
            return messages.someThingWentWrong;
          case FailureReason.tls:
          case FailureReason.dns:
            return messages.noInternetMessage;
          default:
            return messages.someThingWentWrong;
        }

      case FailureCategory.auth:
        switch (reason) {
          case FailureReason.unauthorized:
            return messages.unauthorizedMessage;
          case FailureReason.forbidden:
            return messages.unauthorizedMessage;
          default:
            return messages.unauthorizedMessage;
        }

      case FailureCategory.validation:
        switch (reason) {
          case FailureReason.badRequest:
            return messages.badRequestMessage;
          case FailureReason.schemaMismatch:
            return messages.badRequestMessage;
          default:
            return messages.badRequestMessage;
        }

      case FailureCategory.resource:
        switch (reason) {
          case FailureReason.notFound:
            return messages.notFoundMessage;
          case FailureReason.conflict:
            return auth.emailAlreadyExist;
          case FailureReason.preconditionFailed:
            return messages.someThingWentWrong;
          case FailureReason.paymentRequired:
            return messages.accountNotExist;
          default:
            return messages.someThingWentWrong;
        }

      case FailureCategory.rateLimited:
        return messages.serviceUnavailableMessage;

      case FailureCategory.server:
        switch (reason) {
          case FailureReason.unavailable:
            return messages.serviceUnavailableMessage;
          default:
            return messages.internalServerErrorMessage;
        }

      case FailureCategory.unknown:
        switch (reason) {
          case FailureReason.parseError:
            return messages.someThingWentWrong;
          case FailureReason.cacheError:
            return messages.someThingWentWrong;
          case FailureReason.unknown:
          default:
            return messages.unknownErrorMessage;
        }
    }
  }
}
