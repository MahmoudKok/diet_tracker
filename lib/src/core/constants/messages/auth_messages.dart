import 'package:diet_tracker/generated/locale_keys.g.dart';
import 'package:diet_tracker/src/core/constants/messages/general_messages.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthMessages extends GeneralMessages {
  String get numberAlreadyExist =>
      LocaleKeys.general_this_number_is_already_exist.tr();

  String get userNameAlreadyExist =>
      LocaleKeys.general_user_name_already_exist.tr();
  String get emailAlreadyExist =>
      LocaleKeys.error_this_email_already_exists.tr();
}
