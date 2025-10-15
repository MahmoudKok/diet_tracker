import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveManager {
  static bool? _isLandscape;
  static bool isTablet(BuildContext context) =>
      ScreenUtil().deviceType(context) == DeviceType.tablet;

  static bool isLandscape(BuildContext context) {
    _isLandscape ??=
        MediaQuery.of(context).orientation == Orientation.landscape;
    return _isLandscape!;
  }
}
