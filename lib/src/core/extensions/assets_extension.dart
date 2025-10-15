import 'package:diet_tracker/src/core/Api/base_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diet_tracker/src/resources/media/media_paths.dart';
import 'package:lottie/lottie.dart';

import '../../resources/color_provider.dart';
// import 'package:lottie/lottie.dart';

extension AssetsExtension on String {
  String get asNetworkImage => "${BaseUrls.networkImageBaseUrl}$this";

  String get asAssetsImage => "${MediaPaths.images}/$this";

  String get asAssetsIcons => "${MediaPaths.icons}/$this";

  String get asAssetsLottie => "${MediaPaths.lotties}/$this";

  Widget asAssetsSvg({
    double? width,
    double? height,
    Color? color,
    BoxFit? fit,
  }) {
    return SvgPicture.asset(
      this,
      width: width ?? 18.w,
      height: height ?? 18.h,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
      fit: fit ?? BoxFit.contain,
    );
  }

  Widget asNetworkSvg({
    double? width,
    double? height,
    Color? color,
    Widget Function(BuildContext)? placeholderBuilder,
  }) {
    return SvgPicture.network(
      placeholderBuilder:
          placeholderBuilder ??
          (context) {
            ColorProvider colorProvider = ColorProvider.of(context);
            return SizedBox(
              height: 20.h,
              width: 20.w,
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                color: colorProvider.primary,
                strokeWidth: 2,
              ),
            );
          },
      this,
      width: width ?? 18.w,
      height: height ?? 18.h,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : ColorFilter.mode(ColorProvider.light().textDarker, BlendMode.srcIn),
    );
  }

  Widget asImageAssets({
    double? width,
    double? height,
    BoxFit? boxFit,
    Alignment? alignment,
  }) {
    return Image.asset(
      this,
      fit: boxFit,
      width: width ?? 50.w,
      height: height ?? 50.h,
      alignment: alignment ?? Alignment.center,
    );
  }

  Widget asImageNetwork({double? width, double? height}) {
    return Image.network(this, width: width ?? 50.w, height: height ?? 50.h);
  }

  Widget asLottieAssets({double? width, double? height}) {
    return Lottie.asset(this, width: width ?? 50.w, height: height ?? 50.h);
  }
}
