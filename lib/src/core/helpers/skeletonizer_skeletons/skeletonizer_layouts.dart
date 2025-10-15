// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:diet_tracker/src/core/enums/roundness_level.dart';
import 'package:diet_tracker/src/core/extensions/widget_extensions.dart';
import 'package:diet_tracker/src/core/helpers/functions/calculation_functions.dart';
import 'package:diet_tracker/src/resources/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final RoundnessLevel? roundnessLevel;
  final Color? color;
  final Widget? child;
  const SkeletonizerContainer({
    super.key,
    this.width,
    this.height,
    this.roundnessLevel,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        width: width ?? 40.w,
        height: height ?? 40.h,
        decoration: BoxDecoration(
          color: color ?? ColorProvider.of(context).surfaceAlt,
          // boxShadow: const [
          //   BoxShadow(
          //     offset: Offset(1, 1),
          //     blurRadius: 2,
          //     blurStyle: BlurStyle.outer,
          //   )
          // ],
          borderRadius: BorderRadius.circular(
            calculateRoundness(
              width ?? 40.w,
              height ?? 40.h,
              roundnessLevel ?? RoundnessLevel.none,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

class SkeletonizerContainerImage extends StatelessWidget {
  final double? width;
  final double? height;
  final RoundnessLevel? roundnessLevel;
  final Color? color;
  final Widget? child;
  const SkeletonizerContainerImage({
    super.key,
    this.width,
    this.height,
    this.roundnessLevel,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        width: width ?? 40.w,
        height: height ?? 40.h,
        decoration: BoxDecoration(
          color: color ?? ColorProvider.of(context).surfaceAlt,
          // boxShadow: const [
          //   BoxShadow(
          //     offset: Offset(1, 1),
          //     blurRadius: 2,
          //     blurStyle: BlurStyle.outer,
          //   )
          // ],
          borderRadius: BorderRadius.circular(
            calculateRoundness(
              width ?? 40.w,
              height ?? 40.h,
              roundnessLevel ?? RoundnessLevel.none,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

class SkeletonizerRowOfText extends StatelessWidget {
  final int numberOfItems;
  final int textLength;
  final MainAxisAlignment? axisAlignment;
  final double? height;
  const SkeletonizerRowOfText({
    super.key,
    required this.numberOfItems,
    this.textLength = 1,
    this.axisAlignment,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: axisAlignment ?? MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        numberOfItems,
        (index) => Skeleton.unite(
          child: Text('Text' * textLength, style: TextStyle(height: height)),
        ),
      ),
    );
  }
}

class SkeletonizerColumnOfText extends StatelessWidget {
  final int numberOfItems;
  final int textLength;
  final MainAxisAlignment? axisAlignment;
  const SkeletonizerColumnOfText({
    super.key,
    required this.numberOfItems,
    this.textLength = 1,
    this.axisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: axisAlignment ?? MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        numberOfItems,
        (index) => Text('Text' * textLength).symmetricPadding(vertical: 5.h),
      ),
    );
  }
}

class SkeletonizerColumnOfTextDifferentSizes extends StatelessWidget {
  final int numberOfItems;
  final int textLength;
  final MainAxisAlignment? axisAlignment;
  const SkeletonizerColumnOfTextDifferentSizes({
    super.key,
    required this.numberOfItems,
    this.textLength = 1,
    this.axisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: axisAlignment ?? MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        numberOfItems,
        (index) => Text(
          'Text' * (math.Random().nextInt(textLength) + 1),
        ).symmetricPadding(vertical: 5.h),
      ),
    );
  }
}

class SkeletonizerCircle extends StatelessWidget {
  final double? radius;
  final Color? color;
  const SkeletonizerCircle({super.key, this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Skeleton.shade(
      child: CircleAvatar(
        radius: radius ?? math.min(40.w, 40.h) / 2,
        backgroundColor: color ?? Colors.grey,
      ),
    );
  }
}
