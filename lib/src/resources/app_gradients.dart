import 'package:flutter/material.dart';

import 'color_provider.dart';

class AppGradients {
  static LinearGradient primaryGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        ColorProvider.of(context).primary,
        ColorProvider.of(context).primaryVariant,
        ColorProvider.of(context).primaryVariant,
        ColorProvider.of(context).primary,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
  }

  static LinearGradient backgroundGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        ColorProvider.of(context).primaryContainer,
        ColorProvider.of(context).primaryContainerAlt,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
  }

  static LinearGradient errorGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        const Color(0XFFF5515F), // A vibrant red
        ColorProvider.of(context).error, // The theme's primary error color
        const Color(0XFFA1051D), // A deep, dark red
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
  }
}
