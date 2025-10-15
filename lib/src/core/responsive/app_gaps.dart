import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGaps {
  static double get xs => 8.h;
  static double get s => 12.h;
  static double get m => 16.h;
  static double get l => 24.h;
  static double get xl => 32.h;

  static double section(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    if (h < 620) return l; //  Short Devices
    if (h < 800) return xl; // Mid Devices
    return 40.h; // Tall Devices
  }
}
