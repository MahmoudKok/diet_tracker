import 'dart:math';

import 'package:diet_tracker/src/core/enums/roundness_level.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double calculateRoundness(
  double width,
  double height,
  RoundnessLevel roundness,
) {
  final size = (width + height) / 2;
  double borderRadius;

  switch (roundness) {
    case RoundnessLevel.none:
      borderRadius = 0.0;
      break;
    case RoundnessLevel.low:
      borderRadius = max(size / 30, 4.r);
      break;
    case RoundnessLevel.medium:
      borderRadius = max(size / 15, 8.r);
      break;
    case RoundnessLevel.high:
      borderRadius = max(size / 10, 12.r);
      break;
  }

  return borderRadius;
}
