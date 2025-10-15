import 'color_manager.dart';

// lib/theme/color_provider.dart
import 'package:flutter/material.dart';

@immutable
class ColorProvider extends ThemeExtension<ColorProvider>
    implements ColorManager {
  // ===== Surfaces (variants) =====
  @override
  final Color surfaceVariant; // بدل echoSystemColor
  @override
  final Color onSurfaceVariant; // بدل echoSystemColor2

  // ===== Primary =====
  @override
  final Color primary; // بدل primary60Color
  @override
  final Color onPrimary;
  @override
  final Color onPrimaryContainer;
  @override
  final Color primaryVariant; // بدل primary50Color
  @override
  final Color primaryContainer; // بدل primary05Color
  @override
  final Color primaryContainerAlt; // بدل primary02HalfColor

  // ===== Secondary =====
  @override
  final Color secondary; // بدل secondary60Color
  @override
  final Color onSecondary;
  @override
  final Color onSecondaryContainer;
  @override
  final Color secondaryVariant; // بدل secondary50Color
  @override
  final Color secondaryContainer; // بدل secondary05Color
  @override
  final Color secondaryContainerAlt; // بدل secondary02HalfColor

  // ===== Error =====
  @override
  final Color error; // بدل error100Color
  @override
  final Color onError;
  @override
  final Color errorContainer; // بدل error25Color
  @override
  final Color onErrorContainer;

  // ===== Neutral levels =====
  @override
  final Color dark; // كان textGrey90Color
  @override
  final Color darker; // كان textGrey70Color
  @override
  final Color darkest; // كان textGrey50Color
  @override
  final Color faint; // كان textGrey30Color
  @override
  final Color disabled; // كان textGrey10Color
  @override
  final Color surfaceNeutral; // كان textGrey05Color

  // ===== Text base =====
  @override
  final Color textPrimary; // كان textBlack100Color
  @override
  final Color textInverse; // كان textWhite100Color

  // ===== Misc / States =====
  @override
  final Color border; // بدل borderColor
  @override
  final Color unselected; // بدل selectedBnvColor
  @override
  final Color appBarForeground; // بدل appBarForegroundColor
  @override
  final Color inputSuffix; // بدل inputOutLineSuffixColor

  // ===== Section surfaces =====
  @override
  final Color surfaceAlt; // بدل profile* F9FAFF
  @override
  final Color surfaceInfo; // بدل *E5EBFF (notification/course/..)
  @override
  final Color scrim;

  // ===== Status Colors =====
  @override
  final Color success;
  @override
  final Color onSuccess;
  @override
  final Color successContainer;
  @override
  final Color onSuccessContainer;

  @override
  final Color warning;
  @override
  final Color onWarning;
  @override
  final Color warningContainer;
  @override
  final Color onWarningContainer;

  @override
  final Color info;
  @override
  final Color onInfo;
  @override
  final Color infoContainer;
  @override
  final Color onInfoContainer;

  // ===== Material 3 Roles =====
  @override
  final Color background;
  @override
  final Color onBackground;
  @override
  final Color surface;
  @override
  final Color onSurface;
  @override
  final Color outline;
  @override
  final Color outlineVariant;
  @override
  final Color shadow;
  @override
  final Color inverseSurface;
  @override
  final Color inverseOnSurface;
  @override
  final Color inversePrimary;

  // ===== Text Scale (renamed for clarity) =====
  @override
  final Color textDark; // body text (was darkest)
  @override
  final Color textDarker; // secondary text (was darker)
  @override
  final Color textDarkest; // de-emphasized (was dark)
  @override
  final Color textLight; // body text
  @override
  final Color textLighter; // secondary text
  @override
  final Color textLightest; // de-emphasized
  @override
  final Color textMuted; // disabled/placeholder

  // ===== Chart/Visualization Colors =====
  @override
  final Color chartPrimary; // main series (calories consumed)
  @override
  final Color chartSecondary; // comparison series (goal line)
  @override
  final Color chartTertiary; // tertiary data
  @override
  final Color chartPositive; // surplus/gain
  @override
  final Color chartNegative; // deficit/loss
  @override
  final Color chartGrid; // axis/gridlines
  @override
  final Color chartLabel; // axis labels

  const ColorProvider({
    // Surfaces (variants)
    required this.surfaceVariant,
    required this.onSurfaceVariant,

    // Primary
    required this.primary,
    required this.onPrimary,
    required this.onPrimaryContainer,
    required this.primaryVariant,
    required this.primaryContainer,
    required this.primaryContainerAlt,

    // Secondary
    required this.secondary,
    required this.onSecondary,
    required this.onSecondaryContainer,
    required this.secondaryVariant,
    required this.secondaryContainer,
    required this.secondaryContainerAlt,

    // Error
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,

    // Neutral levels
    required this.dark,
    required this.darker,
    required this.darkest,
    required this.faint,
    required this.disabled,
    required this.surfaceNeutral,

    // Text base
    required this.textPrimary,
    required this.textInverse,

    // Misc / States
    required this.border,
    required this.unselected,
    required this.appBarForeground,
    required this.inputSuffix,

    // Section surfaces
    required this.surfaceAlt,
    required this.surfaceInfo,
    required this.scrim,

    // Status Colors
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,

    // Material 3 Roles
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,

    // Text Scale
    required this.textDark,
    required this.textDarker,
    required this.textDarkest,
    required this.textLight,
    required this.textLighter,
    required this.textLightest,
    required this.textMuted,

    // Chart Colors
    required this.chartPrimary,
    required this.chartSecondary,
    required this.chartTertiary,
    required this.chartPositive,
    required this.chartNegative,
    required this.chartGrid,
    required this.chartLabel,
  });

  /// الوصول من الواجهة بدون أي context extension:
  static ColorProvider of(BuildContext context) {
    final ext = Theme.of(context).extension<ColorProvider>();
    assert(ext != null, 'ColorProvider is missing from ThemeData.extensions');
    return ext!;
    // الآن تقدر تكتب: ColorProvider.of(context).primary
  }

  // ---------- Light Palette (قيمك كما هي) ----------
  factory ColorProvider.light() {
    return const ColorProvider(
      // Surfaces (variants)
      surfaceVariant: Color(0xFFE4E4E4), // بدل echoSystemColor
      onSurfaceVariant: Color(0xFF989898), // بدل echoSystemColor2
      // Primary
      primary: Color(0xFF15308C), // بدل primary60Color
      onPrimary: Colors.white,
      onPrimaryContainer: Color(0xFF15308C), // same as primary for contrast
      primaryVariant: Color(0xFF4362CB), // بدل primary50Color
      primaryContainer: Color(0xFFE5EBFF), // بدل primary05Color
      primaryContainerAlt: Color(0xFFF9FAFF), // بدل primary02HalfColor
      // Secondary
      secondary: Color(0xFF3D8E0C), // بدل secondary60Color
      onSecondary: Colors.white,
      onSecondaryContainer: Color(0xFF3D8E0C), // same as secondary for contrast
      secondaryVariant: Color(0xFF77D13E), // بدل secondary50Color
      secondaryContainer: Color(0xFFE1FFF9), // بدل secondary05Color
      secondaryContainerAlt: Color(0xFFF2FFEA), // بدل secondary02HalfColor
      // Error
      error: Color(
        0xFFBA1A1A,
      ), // بدل error100Color (refined for better contrast)
      onError: Colors.white,
      errorContainer: Color(0xFFFFCFCF), // بدل error25Color
      onErrorContainer: Color(0xFFBA1A1A), // same as error for contrast
      // Neutral levels
      dark: Color(0xFF989898), // كان textGrey90Color
      darker: Color(0xFF646464), // كان textGrey70Color
      darkest: Color(0xFF393939), // كان textGrey50Color
      faint: Color(0xFFB5B5B5), // كان textGrey30Color
      disabled: Color(0xFFE4E4E4), // كان textGrey10Color
      surfaceNeutral: Color(0xFFEFEFEF), // كان textGrey05Color
      // Text base
      textPrimary: Color(0xFF000000), // كان textBlack100Color
      textInverse: Color(0xFFFFFFFF), // كان textWhite100Color
      // Misc / States
      border: Color(0xFFE5DCDC), // بدل borderColor
      unselected: Color(0xFF9C9C9C), // بدل selectedBnvColor
      appBarForeground: Colors.white, // بدل appBarForegroundColor
      inputSuffix: Color(0xA6000000), // بدل inputOutLineSuffixColor (65% أسود)
      // Section surfaces
      surfaceAlt: Color(0xFFF9FAFF), // بدل profile* F9FAFF
      surfaceInfo: Color(0xFFE5EBFF), // بدل *E5EBFF (notification/course/...)
      scrim: Colors.white,

      // Status Colors
      success: Color(0xFF2E7D32), // green-700
      onSuccess: Colors.white,
      successContainer: Color(0xFFC8E6C9), // green-100
      onSuccessContainer: Color(0xFF1B5E20), // green-800
      warning: Color(0xFFF57C00), // orange-700
      onWarning: Colors.white,
      warningContainer: Color(0xFFFFE0B2), // orange-100
      onWarningContainer: Color(0xFFE65100), // orange-800
      info: Color(0xFF1976D2), // blue-700
      onInfo: Colors.white,
      infoContainer: Color(0xFFBBDEFB), // blue-100
      onInfoContainer: Color(0xFF0D47A1), // blue-800
      // Material 3 Roles
      background: Color(0xFFFFFFFF), // white
      onBackground: Color(0xFF1C1B1F), // dark text
      surface: Color(0xFFFAFAFA), // light gray
      onSurface: Color(0xFF1C1B1F), // dark text
      outline: Color(0xFF79747E), // medium gray
      outlineVariant: Color(0xFFCAC4D0), // light gray
      shadow: Color(0xFF000000), // black
      inverseSurface: Color(0xFF2B2930), // dark surface
      inverseOnSurface: Color(0xFFE6E1E5), // light text
      inversePrimary: Color(0xFFA8C7FA), // light primary
      // Text Scale (Light Mode)
      textDark: Color(0xFF1C1B1F), // body text
      textDarker: Color(0xFF49454F), // secondary text
      textDarkest: Color(0xFF79747E), // de-emphasized
      textLight: Color(0xFFE6E1E5), // for dark surfaces
      textLighter: Color(0xFFCAC4D0), // for dark surfaces
      textLightest: Color(0xFF938F99), // for dark surfaces
      textMuted: Color(0xFFB5B5B5), // disabled/placeholder
      // Chart Colors
      chartPrimary: Color(0xFF15308C), // primary blue
      chartSecondary: Color(0xFF3D8E0C), // secondary green
      chartTertiary: Color(0xFF1976D2), // info blue
      chartPositive: Color(0xFF2E7D32), // success green
      chartNegative: Color(0xFFBA1A1A), // error red
      chartGrid: Color(0xFFE0E0E0), // light gray
      chartLabel: Color(0xFF49454F), // medium gray
    );
  }

  // ---------- Dark Palette (محاذاة لقيم الدارك المقترحة) ----------
  factory ColorProvider.dark() {
    return const ColorProvider(
      // Surfaces (variants)
      surfaceVariant: Color(
        0xFF424242,
      ), // بدل echoSystemColor (رمادي غامق للسطوح الثانوية)
      onSurfaceVariant: Color(
        0xFF9E9E9E,
      ), // بدل echoSystemColor2 (نصوص/أيقونات فوق الـ surfaceVariant)
      // Primary
      primary: Color(
        0xFFA8C7FA,
      ), // بدل primary60Color (lightened for dark mode)
      onPrimary: Color(0xFF15308C), // dark primary for contrast
      onPrimaryContainer: Color(0xFFA8C7FA), // light primary for contrast
      primaryVariant: Color(
        0xFF2C4EB8,
      ), // بدل primary50Color (أغمق للأيقونات/الخلفيات)
      primaryContainer: Color(0xFF2C2C2C), // بدل primary05Color (خلفية غامقة)
      primaryContainerAlt: Color(
        0xFF1A1A1A,
      ), // بدل primary02HalfColor (أغمق أكثر)
      // Secondary
      secondary: Color(
        0xFF81C784,
      ), // بدل secondary60Color (lightened for dark mode)
      onSecondary: Color(0xFF3D8E0C), // dark secondary for contrast
      onSecondaryContainer: Color(0xFF81C784), // light secondary for contrast

      secondaryVariant: Color(0xFF5AB34D), // بدل secondary50Color (أفتح شوي)
      secondaryContainer: Color(
        0xFF2C3A2C,
      ), // بدل secondary05Color (خلفية غامقة مع تينت أخضر)
      secondaryContainerAlt: Color(0xFF1A291A), // بدل secondary02HalfColor
      // Error
      error: Color(0xFFFFB4AB), // بدل error100Color (lightened for dark mode)
      onError: Color(0xFFBA1A1A), // dark error for contrast
      errorContainer: Color(0xFF8C1D18), // بدل error25Color (خلفية خطأ غامقة)
      onErrorContainer: Color(0xFFFFB4AB), // light error for contrast
      // Neutral levels
      dark: Color(0xFFECECEC), // نصوص قوية
      darker: Color(0xFFE1E1E1), // نصوص متوسطة
      darkest: Color(0xFFCDCDCD), // نصوص أخف
      faint: Color(0xFF9E9E9E), // نص ثانوي ضعيف
      disabled: Color(0xFF616161), // معطل
      surfaceNeutral: Color(0xFF424242), // سطح محايد داكن
      // Text base
      textPrimary: Color(0xFFFFFFFF), // النص الأساسي (أبيض فوق خلفية داكنة)
      textInverse: Color(0xFF000000), // نص معاكس (أسود فوق أسطح فاتحة)
      // Misc / States
      border: Color(0xFF616161), // حدود بالدارك
      unselected: Color(0xFF9C9C9C), // عناصر غير مختارة
      appBarForeground: Color(0xFFFFFFFF),
      inputSuffix: Color(0xFFECECEC),

      // Section surfaces
      surfaceAlt: Color(0xFF1E1E1E), // خلفيات profile (بدل F9FAFF)
      surfaceInfo: Color(
        0xFF121212,
      ), // كل الخلفيات الأزرق الفاتح القديمة (notification/course/...)
      scrim: Colors.black,

      // Status Colors
      success: Color(0xFF81C784), // green-300
      onSuccess: Color(0xFF1B5E20), // green-800
      successContainer: Color(0xFF1B5E20), // green-800
      onSuccessContainer: Color(0xFF81C784), // green-300
      warning: Color(0xFFFFB74D), // orange-300
      onWarning: Color(0xFFE65100), // orange-800
      warningContainer: Color(0xFFE65100), // orange-800
      onWarningContainer: Color(0xFFFFB74D), // orange-300
      info: Color(0xFF64B5F6), // blue-300
      onInfo: Color(0xFF0D47A1), // blue-800
      infoContainer: Color(0xFF0D47A1), // blue-800
      onInfoContainer: Color(0xFF64B5F6), // blue-300
      // Material 3 Roles
      background: Color(0xFF1C1B1F), // dark background
      onBackground: Color(0xFFE6E1E5), // light text
      surface: Color(0xFF2B2930), // dark surface
      onSurface: Color(0xFFE6E1E5), // light text
      outline: Color(0xFF938F99), // medium gray
      outlineVariant: Color(0xFF49454F), // dark gray
      shadow: Color(0xFF000000), // black
      inverseSurface: Color(0xFFFAFAFA), // light surface
      inverseOnSurface: Color(0xFF1C1B1F), // dark text
      inversePrimary: Color(0xFF15308C), // dark primary
      // Text Scale (Dark Mode)
      textDark: Color(0xFFE6E1E5), // body text
      textDarker: Color(0xFFCAC4D0), // secondary text
      textDarkest: Color(0xFF938F99), // de-emphasized
      textLight: Color(0xFFE6E1E5), // for light surfaces
      textLighter: Color(0xFFCAC4D0), // for light surfaces
      textLightest: Color(0xFF938F99), // for light surfaces
      textMuted: Color(0xFF616161), // disabled/placeholder
      // Chart Colors
      chartPrimary: Color(0xFFA8C7FA), // light primary blue
      chartSecondary: Color(0xFF81C784), // light green
      chartTertiary: Color(0xFF64B5F6), // light blue
      chartPositive: Color(0xFF81C784), // success green
      chartNegative: Color(0xFFFFB4AB), // error red
      chartGrid: Color(0xFF49454F), // dark gray
      chartLabel: Color(0xFFCAC4D0), // light gray
    );
  }

  // ---------- ThemeExtension API ----------
  @override
  ColorProvider copyWith({
    // Surfaces (variants)
    Color? surfaceVariant,
    Color? onSurfaceVariant,

    // Primary
    Color? primary,
    Color? onPrimary,
    Color? onPrimaryContainer,
    Color? primaryVariant,
    Color? primaryContainer,
    Color? primaryContainerAlt,

    // Secondary
    Color? secondary,
    Color? onSecondary,
    Color? onSecondaryContainer,
    Color? secondaryVariant,
    Color? secondaryContainer,
    Color? secondaryContainerAlt,

    // Error
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,

    // Neutral levels
    Color? dark,
    Color? darker,
    Color? darkest,
    Color? faint,
    Color? disabled,
    Color? surfaceNeutral,

    // Text base
    Color? textPrimary,
    Color? textInverse,

    // Misc / States
    Color? border,
    Color? unselected,
    Color? appBarForeground,
    Color? inputSuffix,

    // Section surfaces
    Color? surfaceAlt,
    Color? surfaceInfo,
    Color? scrim,

    // Status Colors
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,

    // Material 3 Roles
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? inversePrimary,

    // Text Scale
    Color? textDark,
    Color? textDarker,
    Color? textDarkest,
    Color? textLight,
    Color? textLighter,
    Color? textLightest,
    Color? textMuted,

    // Chart Colors
    Color? chartPrimary,
    Color? chartSecondary,
    Color? chartTertiary,
    Color? chartPositive,
    Color? chartNegative,
    Color? chartGrid,
    Color? chartLabel,
  }) {
    return ColorProvider(
      // Surfaces (variants)
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,

      // Primary
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      primaryContainerAlt: primaryContainerAlt ?? this.primaryContainerAlt,

      // Secondary
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      secondaryContainerAlt:
          secondaryContainerAlt ?? this.secondaryContainerAlt,

      // Error
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,

      // Neutral levels
      dark: dark ?? this.dark,
      darker: darker ?? this.darker,
      darkest: darkest ?? this.darkest,
      faint: faint ?? this.faint,
      disabled: disabled ?? this.disabled,
      surfaceNeutral: surfaceNeutral ?? this.surfaceNeutral,

      // Text base
      textPrimary: textPrimary ?? this.textPrimary,
      textInverse: textInverse ?? this.textInverse,

      // Misc / States
      border: border ?? this.border,
      unselected: unselected ?? this.unselected,
      appBarForeground: appBarForeground ?? this.appBarForeground,
      inputSuffix: inputSuffix ?? this.inputSuffix,

      // Section surfaces
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      surfaceInfo: surfaceInfo ?? this.surfaceInfo,
      scrim: scrim ?? this.scrim,

      // Status Colors
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,

      // Material 3 Roles
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      shadow: shadow ?? this.shadow,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,

      // Text Scale
      textDark: textDark ?? this.textDark,
      textDarker: textDarker ?? this.textDarker,
      textDarkest: textDarkest ?? this.textDarkest,
      textLight: textLight ?? this.textLight,
      textLighter: textLighter ?? this.textLighter,
      textLightest: textLightest ?? this.textLightest,
      textMuted: textMuted ?? this.textMuted,

      // Chart Colors
      chartPrimary: chartPrimary ?? this.chartPrimary,
      chartSecondary: chartSecondary ?? this.chartSecondary,
      chartTertiary: chartTertiary ?? this.chartTertiary,
      chartPositive: chartPositive ?? this.chartPositive,
      chartNegative: chartNegative ?? this.chartNegative,
      chartGrid: chartGrid ?? this.chartGrid,
      chartLabel: chartLabel ?? this.chartLabel,
    );
  }

  @override
  ColorProvider lerp(ThemeExtension<ColorProvider>? other, double t) {
    if (other is! ColorProvider) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;

    return ColorProvider(
      // Surfaces (variants)
      surfaceVariant: l(surfaceVariant, other.surfaceVariant),
      onSurfaceVariant: l(onSurfaceVariant, other.onSurfaceVariant),

      // Primary
      primary: l(primary, other.primary),
      onPrimary: l(onPrimary, other.onPrimary),
      onPrimaryContainer: l(onPrimaryContainer, other.onPrimaryContainer),
      primaryVariant: l(primaryVariant, other.primaryVariant),
      primaryContainer: l(primaryContainer, other.primaryContainer),
      primaryContainerAlt: l(primaryContainerAlt, other.primaryContainerAlt),

      // Secondary
      secondary: l(secondary, other.secondary),
      onSecondary: l(onSecondary, other.onSecondary),
      onSecondaryContainer: l(onSecondaryContainer, other.onSecondaryContainer),
      secondaryVariant: l(secondaryVariant, other.secondaryVariant),
      secondaryContainer: l(secondaryContainer, other.secondaryContainer),
      secondaryContainerAlt: l(
        secondaryContainerAlt,
        other.secondaryContainerAlt,
      ),

      // Error
      error: l(error, other.error),
      onError: l(onError, other.onError),
      errorContainer: l(errorContainer, other.errorContainer),
      onErrorContainer: l(onErrorContainer, other.onErrorContainer),

      // Neutral levels
      dark: l(dark, other.dark),
      darker: l(darker, other.darker),
      darkest: l(darkest, other.darkest),
      faint: l(faint, other.faint),
      disabled: l(disabled, other.disabled),
      surfaceNeutral: l(surfaceNeutral, other.surfaceNeutral),

      // Text base
      textPrimary: l(textPrimary, other.textPrimary),
      textInverse: l(textInverse, other.textInverse),

      // Misc / States
      border: l(border, other.border),
      unselected: l(unselected, other.unselected),
      appBarForeground: l(appBarForeground, other.appBarForeground),
      inputSuffix: l(inputSuffix, other.inputSuffix),

      // Section surfaces
      surfaceAlt: l(surfaceAlt, other.surfaceAlt),
      surfaceInfo: l(surfaceInfo, other.surfaceInfo),
      scrim: l(scrim, other.scrim),

      // Status Colors
      success: l(success, other.success),
      onSuccess: l(onSuccess, other.onSuccess),
      successContainer: l(successContainer, other.successContainer),
      onSuccessContainer: l(onSuccessContainer, other.onSuccessContainer),
      warning: l(warning, other.warning),
      onWarning: l(onWarning, other.onWarning),
      warningContainer: l(warningContainer, other.warningContainer),
      onWarningContainer: l(onWarningContainer, other.onWarningContainer),
      info: l(info, other.info),
      onInfo: l(onInfo, other.onInfo),
      infoContainer: l(infoContainer, other.infoContainer),
      onInfoContainer: l(onInfoContainer, other.onInfoContainer),

      // Material 3 Roles
      background: l(background, other.background),
      onBackground: l(onBackground, other.onBackground),
      surface: l(surface, other.surface),
      onSurface: l(onSurface, other.onSurface),
      outline: l(outline, other.outline),
      outlineVariant: l(outlineVariant, other.outlineVariant),
      shadow: l(shadow, other.shadow),
      inverseSurface: l(inverseSurface, other.inverseSurface),
      inverseOnSurface: l(inverseOnSurface, other.inverseOnSurface),
      inversePrimary: l(inversePrimary, other.inversePrimary),

      // Text Scale
      textDark: l(textDark, other.textDark),
      textDarker: l(textDarker, other.textDarker),
      textDarkest: l(textDarkest, other.textDarkest),
      textLight: l(textLight, other.textLight),
      textLighter: l(textLighter, other.textLighter),
      textLightest: l(textLightest, other.textLightest),
      textMuted: l(textMuted, other.textMuted),

      // Chart Colors
      chartPrimary: l(chartPrimary, other.chartPrimary),
      chartSecondary: l(chartSecondary, other.chartSecondary),
      chartTertiary: l(chartTertiary, other.chartTertiary),
      chartPositive: l(chartPositive, other.chartPositive),
      chartNegative: l(chartNegative, other.chartNegative),
      chartGrid: l(chartGrid, other.chartGrid),
      chartLabel: l(chartLabel, other.chartLabel),
    );
  }
}
