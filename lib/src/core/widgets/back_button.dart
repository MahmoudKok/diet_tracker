// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diet_tracker/src/resources/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../router/app_router.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final double? size;
  final VoidCallback? onTap;
  const CustomBackButton({super.key, this.color, this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            AppRouter.getRouter.pop();
          },
      child: Icon(
        Icons.chevron_left_rounded,
        color: color ?? ColorProvider.of(context).darkest,
        size: size ?? 40.sp,
      ),
    );
  }
}
