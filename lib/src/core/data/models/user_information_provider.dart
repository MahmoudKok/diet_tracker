import 'package:diet_tracker/src/core/enums/user_auth.dart';
import 'package:diet_tracker/src/core/services/local_storage.dart';

import '../../di/service_locator.dart';
import 'user_information.dart';

class UserInformationProvider {
  final UserInformation _userInformation = UserInformation.defaultValue;
  UserInformation get userInformation {
    switch (sl<LocalStorage>().userSettings.userAuth) {
      case UserAuth.unauthorized:
        return _userInformation;

      case UserAuth.authorized:
        return sl<LocalStorage>().userInformation;
    }
  }
}
