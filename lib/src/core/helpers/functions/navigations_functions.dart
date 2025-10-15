import 'package:diet_tracker/src/core/di/service_locator.dart';

import '../../services/secure_storage_services.dart';

bool isUserAuthorized() {
  return sl<SecureStorageServices>().token != '';
}
