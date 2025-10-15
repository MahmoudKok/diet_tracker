// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "general": {
    "something_went_wrong_please_try_again_later": "حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً",
    "retry": "إعادة المحاولة",
    "oops_no_internet": "عذراً! لا يوجد اتصال بالإنترنت",
    "something_happened_try_again": "حدث شيء ما، يرجى المحاولة مرة أخرى",
    "oops_unauthorized": "عذراً! وصول غير مصرح به",
    "check_your_input": "يرجى التحقق من المدخلات",
    "service_down_try_again_later": "الخدمة غير متاحة، يرجى المحاولة مرة أخرى لاحقاً",
    "something_unexpected_happened": "حدث شيء غير متوقع",
    "not_found_error": "خطأ في عدم العثور على البيانات",
    "account_not_exist": "الحساب غير موجود",
    "this_number_is_already_exist": "هذا الرقم موجود بالفعل",
    "user_name_already_exist": "اسم المستخدم موجود بالفعل",
    "not_exist": "غير موجود",
    "error": "خطأ",
    "female_t": "أنثى",
    "male_t": "ذكر",
    "please_check_your_internet_connection_and_try_again_later": "يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى لاحقاً"
  },
  "error": {
    "this_email_already_exists": "هذا البريد الإلكتروني موجود بالفعل"
  },
  "update": "تحديث"
};
static const Map<String,dynamic> _en = {
  "general": {
    "something_went_wrong_please_try_again_later": "Something went wrong, please try again later",
    "retry": "Retry",
    "oops_no_internet": "Oops! No internet connection",
    "something_happened_try_again": "Something happened, please try again",
    "oops_unauthorized": "Oops! Unauthorized access",
    "check_your_input": "Please check your input",
    "service_down_try_again_later": "Service is down, please try again later",
    "something_unexpected_happened": "Something unexpected happened",
    "not_found_error": "Not found error",
    "account_not_exist": "Account does not exist",
    "this_number_is_already_exist": "This number already exists",
    "user_name_already_exist": "Username already exists",
    "not_exist": "Not exist",
    "error": "Error",
    "female_t": "Female",
    "male_t": "Male",
    "please_check_your_internet_connection_and_try_again_later": "Please check your internet connection and try again later"
  },
  "error": {
    "this_email_already_exists": "This email already exists"
  },
  "update": "Update"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
