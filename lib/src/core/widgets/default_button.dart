// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diet_tracker/src/core/helpers/functions/null_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:diet_tracker/src/core/enums/roundness_level.dart';
import 'package:diet_tracker/src/core/enums/general_enums.dart';
import 'package:diet_tracker/src/core/helpers/functions/calculation_functions.dart';
import 'package:diet_tracker/src/resources/app_gradients.dart';
import 'package:diet_tracker/src/resources/color_provider.dart';

class DefaultButton extends StatelessWidget {
  final Widget? content;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final Function() onTap;
  final Function()? onDisableTap;
  final RoundnessLevel roundnessLevel;
  final bool isEnable;
  final Gradient? gradient;
  final bool isHavingError;
  final Color? borderColor;

  // New state management properties
  final RequestState? requestState;
  final Function()? onLoadingTap;
  final Function()? onSuccessTap;
  final Function()? onErrorTap;
  final Widget? loadingContent;
  final Widget? successContent;
  final Widget? errorContent;
  final Color? loadingBackgroundColor;
  final Color? successBackgroundColor;
  final Color? errorBackgroundColor;
  final bool showStateContent;

  const DefaultButton({
    super.key,
    this.content,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    required this.onTap,
    this.onDisableTap,
    this.roundnessLevel = RoundnessLevel.medium,
    this.isEnable = true,
    this.gradient,
    this.isHavingError = false,
    this.borderColor,
    this.requestState,
    this.onLoadingTap,
    this.onSuccessTap,
    this.onErrorTap,
    this.loadingContent,
    this.successContent,
    this.errorContent,
    this.loadingBackgroundColor,
    this.successBackgroundColor,
    this.errorBackgroundColor,
    this.showStateContent = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);

    // Determine current state and properties
    final currentState = requestState ?? RequestState.init;
    final isButtonEnabled = _isButtonEnabled(currentState);
    final currentBackgroundColor = _getBackgroundColor(context, currentState);
    final currentContent = _getContent(context, currentState);
    final currentOnTap = _getOnTap(currentState);

    return SizedBox(
      width: width ?? 0.8.sw,
      height: height ?? 60.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: _getGradient(context, currentState),
          color: _getGradient(context, currentState) == null
              ? currentBackgroundColor
              : null,
          borderRadius: BorderRadius.circular(
            calculateRoundness(width ?? 0.8.sw, height ?? 60.h, roundnessLevel),
          ),
          border: borderColor != null
              ? Border.all(
                  color: borderColor ?? colorProvider.primary,
                  width: 1,
                )
              : null,
        ),
        child: MaterialButton(
          onPressed: isButtonEnabled ? currentOnTap : (onDisableTap),
          elevation: 0,
          color: isNull(onDisableTap)
              ? null
              : (isButtonEnabled
                    ? currentBackgroundColor
                    : colorProvider.disabled),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              calculateRoundness(
                width ?? 0.8.sw,
                height ?? 60.h,
                roundnessLevel,
              ),
            ),
          ),
          disabledColor: _getGradient(context, currentState) != null
              ? Colors
                    .transparent // Show gradient even when disabled
              : colorProvider.faint,
          child: currentContent,
        ),
      ),
    );
  }

  bool _isButtonEnabled(RequestState state) {
    if (!isEnable) return false;

    switch (state) {
      case RequestState.loading:
        return onLoadingTap != null;
      case RequestState.success:
        return onSuccessTap != null;
      case RequestState.error:
        return onErrorTap != null;
      case RequestState.init:
        return true;
    }
  }

  Color? _getBackgroundColor(BuildContext context, RequestState state) {
    final colorProvider = ColorProvider.of(context);

    switch (state) {
      case RequestState.loading:
        return loadingBackgroundColor ?? colorProvider.primary;
      case RequestState.success:
        return successBackgroundColor ?? Colors.green;
      case RequestState.error:
        return errorBackgroundColor ?? colorProvider.error;
      case RequestState.init:
        return backgroundColor ?? colorProvider.primary;
    }
  }

  Widget? _getContent(BuildContext context, RequestState state) {
    if (!showStateContent) return content;

    switch (state) {
      case RequestState.loading:
        return loadingContent ?? _buildDefaultLoadingContent(context);
      case RequestState.success:
        return successContent ?? _buildDefaultSuccessContent(context);
      case RequestState.error:
        return errorContent ?? _buildDefaultErrorContent(context);
      case RequestState.init:
        return content;
    }
  }

  Function()? _getOnTap(RequestState state) {
    switch (state) {
      case RequestState.loading:
        return onLoadingTap;
      case RequestState.success:
        return onSuccessTap;
      case RequestState.error:
        return onErrorTap;
      case RequestState.init:
        return onTap;
    }
  }

  Gradient? _getGradient(BuildContext context, RequestState state) {
    switch (state) {
      case RequestState.error:
        return isHavingError ? AppGradients.errorGradient(context) : null;
      default:
        return gradient;
    }
  }

  Widget _buildDefaultLoadingContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              textColor ?? ColorProvider.of(context).onPrimary,
            ),
          ),
        ),
        8.w.horizontalSpace,
        if (content != null) content!,
      ],
    );
  }

  Widget _buildDefaultSuccessContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check,
          color: textColor ?? ColorProvider.of(context).onPrimary,
          size: 20.sp,
        ),
        8.w.horizontalSpace,
        if (content != null) content!,
      ],
    );
  }

  Widget _buildDefaultErrorContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: textColor ?? ColorProvider.of(context).onPrimary,
          size: 20.sp,
        ),
        8.w.horizontalSpace,
        if (content != null) content!,
      ],
    );
  }
}
