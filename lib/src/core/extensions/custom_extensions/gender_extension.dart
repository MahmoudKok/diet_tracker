import 'package:easy_localization/easy_localization.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../enums/gender_enum.dart';

extension GenderExtension on Gender {
  String tr() {
    if (this == Gender.female) {
      return LocaleKeys.general_female_t.tr();
    } else {
      return LocaleKeys.general_male_t.tr();
    }
  }
}
