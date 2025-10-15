import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:diet_tracker/src/core/extensions/assets_extension.dart';
import 'package:diet_tracker/src/resources/media/image_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../resources/color_provider.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorProvider.of(context).surfaceVariant,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      errorWidget: (context, url, error) =>
          ImageManager.logo.asImageAssets(width: width, height: height),
    );
  }
}
