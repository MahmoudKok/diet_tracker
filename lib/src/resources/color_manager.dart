import 'package:flutter/material.dart';

abstract class ColorManager {
  // ===== Surfaces (variants) =====
  /// instead of echoSystemColor
  Color get surfaceVariant;

  /// instead of echoSystemColor2
  Color get onSurfaceVariant;

  // ===== Primary =====
  /// instead of primary60Color
  Color get primary;

  /// instead of primary50Color
  Color get primaryVariant;

  /// instead of primary05Color
  Color get primaryContainer;

  /// instead of primary02HalfColor
  Color get primaryContainerAlt;
  Color get onPrimary;
  Color get onPrimaryContainer;

  // ===== Secondary =====
  /// instead of secondary60Color
  Color get secondary;
  Color get onSecondary;
  Color get onSecondaryContainer;

  /// instead of secondary50Color
  Color get secondaryVariant;

  /// instead of secondary05Color
  Color get secondaryContainer;

  /// instead of secondary02HalfColor
  Color get secondaryContainerAlt;

  // ===== Error =====
  /// instead of error100Color
  Color get error;
  Color get onError;

  /// instead of error25Color
  Color get errorContainer;
  Color get onErrorContainer;

  // ===== Neutral text levels =====
  /// كان textGrey90Color (أغمق واحد)
  Color get dark;

  /// كان textGrey70Color
  Color get darker;

  /// كان textGrey50Color
  Color get darkest;

  /// كان textGrey30Color
  Color get faint;

  /// كان textGrey10Color
  Color get disabled;

  /// كان textGrey05Color (خلفيات/أسطح حيادية فاتحة)
  Color get surfaceNeutral;

  // ===== Text base =====
  /// كان textBlack100Color
  Color get textPrimary;

  /// كان textWhite100Color
  Color get textInverse;

  // ===== Misc / States =====
  /// instead of borderColor
  Color get border;

  /// instead of selectedBnvColor (مستخدم فعليًا كـ unselected في BNV)
  Color get unselected;

  /// instead of appBarForegroundColor
  Color get appBarForeground;

  /// instead of inputOutLineSuffixColor (65% أسود)
  Color get inputSuffix;

  // ===== Screen-specific simplified tokens =====
  /// instead of profileAppbarBackgroundColor, profileBackgroundColor
  Color get surfaceAlt;

  /// instead of notification*, certificate*, course*, privacyPolicy*, terms*,
  ///      courseContent*, courseUnits*, examResults*
  Color get surfaceInfo;

  Color get scrim;

  // ===== Status Colors =====
  Color get success;
  Color get onSuccess;
  Color get successContainer;
  Color get onSuccessContainer;

  Color get warning;
  Color get onWarning;
  Color get warningContainer;
  Color get onWarningContainer;

  Color get info;
  Color get onInfo;
  Color get infoContainer;
  Color get onInfoContainer;

  // ===== Material 3 Roles =====
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get onSurface;
  Color get outline;
  Color get outlineVariant;
  Color get shadow;
  Color get inverseSurface;
  Color get inverseOnSurface;
  Color get inversePrimary;

  // ===== Text Scale (renamed for clarity) =====
  // On light surfaces:
  Color get textDark; // body text (was darkest)
  Color get textDarker; // secondary text (was darker)
  Color get textDarkest; // de-emphasized (was dark)
  // On dark surfaces:
  Color get textLight; // body text
  Color get textLighter; // secondary text
  Color get textLightest; // de-emphasized
  Color get textMuted; // disabled/placeholder

  // ===== Chart/Visualization Colors =====
  Color get chartPrimary; // main series (calories consumed)
  Color get chartSecondary; // comparison series (goal line)
  Color get chartTertiary; // tertiary data
  Color get chartPositive; // surplus/gain
  Color get chartNegative; // deficit/loss
  Color get chartGrid; // axis/gridlines
  Color get chartLabel; // axis labels
}



/*
const Color surfaceVariant     = Color(0xFFE4E4E4); // instead of echoSystemColor
const Color onSurfaceVariant   = Color(0xFF989898); // instead of echoSystemColor2
const Color primary            = Color(0xFF15308C); // instead of primary60Color
const Color primaryVariant     = Color(0xFF4362CB); // instead of primary50Color
const Color primaryContainer   = Color(0xFFE5EBFF); // instead of primary05Color
const Color primaryContainerAlt= Color(0xFFF9FAFF); // instead of primary02HalfColor
const Color secondary            = Color(0xFF3D8E0C); // instead of secondary60Color
const Color secondaryVariant     = Color(0xFF77D13E); // instead of secondary50Color
const Color secondaryContainer   = Color(0xFFE1FFF9); // instead of secondary05Color
const Color secondaryContainerAlt= Color(0xFFF2FFEA); // instead of secondary02HalfColor
const Color error           = Color(0xFFAA3C3C); // instead of error100Color
const Color errorContainer  = Color(0xFFFFCFCF); // instead of error25Color
const Color dark     = Color(0xFF393939); // كان textGrey90Color (أغمق واحد)
const Color darker   = Color(0xFF646464); // كان textGrey70Color
const Color darkest  = Color(0xFF989898); // كان textGrey50Color
const Color faint    = Color(0xFFB5B5B5); // كان textGrey30Color
const Color disabled = Color(0xFFE4E4E4); // كان textGrey10Color
const Color surfaceNeutral = Color(0xFFEFEFEF); // كان textGrey05Color

const Color textPrimary = Color(0xFF000000); // كان textBlack100Color
const Color textInverse = Color(0xFFFFFFFF); // كان textWhite100Color

const Color border   = Color(0xFFE5DCDC); // instead of borderColor
const Color unselected = Color(0xFF9C9C9C); // instead of selectedBnvColor

const Color appBarForeground = Colors.white;          // instead of appBarForegroundColor
const Color inputSuffix      = Color(0xA6000000);     // instead of inputOutLineSuffixColor (65% شفافية أسود)
const Color surfaceAlt  = Color(0xFFF9FAFF); // instead of profileAppbarBackgroundColor, profileBackgroundColor
const Color surfaceInfo = Color(0xFFE5EBFF); // instead of notification*, certificate*, course*, privacyPolicy*, terms*, courseContent*, courseUnits*, examResults*

*/