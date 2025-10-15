import 'package:diet_tracker/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class GeneralMessages {
  String get noInternetMessage => LocaleKeys.general_oops_no_internet.tr();

  String get someThingWentWrong =>
      LocaleKeys.general_something_happened_try_again.tr();

  String get unauthorizedMessage => LocaleKeys.general_oops_unauthorized.tr();

  String get internalServerErrorMessage =>
      LocaleKeys.general_something_went_wrong_please_try_again_later.tr();

  String get badRequestMessage => LocaleKeys.general_check_your_input.tr();

  String get serviceUnavailableMessage =>
      LocaleKeys.general_service_down_try_again_later.tr();

  String get unknownErrorMessage =>
      LocaleKeys.general_something_unexpected_happened.tr();

  String get notFoundMessage => LocaleKeys.general_not_found_error.tr();

  String get accountNotExist => LocaleKeys.general_account_not_exist.tr();
}
