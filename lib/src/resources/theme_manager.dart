import 'package:flutter/services.dart';
import 'package:diet_tracker/src/core/extensions/numbers_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

// lib/theme/app_theme.dart

import 'color_provider.dart';

extension _Let<T> on T {
  R let<R>(R Function(T it) block) => block(this);
}

class AppTheme {
  // ----- Light Theme -----
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true)
      .copyWith(
        brightness: Brightness.light,
        extensions: <ThemeExtension<dynamic>>[ColorProvider.light()],
      )
      .let((base) {
        final ext =
            (base.extensions[ColorProvider] as ColorProvider?) ??
            ColorProvider.light();

        final colorScheme = ColorScheme.light(
          primary: ext.primary,
          onPrimary: ext.onPrimary,
          primaryContainer: ext.primaryContainer,
          onPrimaryContainer: ext.onPrimaryContainer,
          secondary: ext.secondary,
          onSecondary: ext.onSecondary,
          secondaryContainer: ext.secondaryContainer,
          onSecondaryContainer: ext.onSecondaryContainer,
          tertiary: ext.info, // use info as tertiary
          onTertiary: ext.onInfo,
          tertiaryContainer: ext.infoContainer,
          onTertiaryContainer: ext.onInfoContainer,
          error: ext.error,
          onError: ext.onError,
          errorContainer: ext.errorContainer,
          onErrorContainer: ext.onErrorContainer,
          surface: ext.surface,
          onSurface: ext.onSurface,
          surfaceContainerHighest: ext.surfaceVariant,
          onSurfaceVariant: ext.onSurfaceVariant,
          outline: ext.outline,
          outlineVariant: ext.outlineVariant,
          shadow: ext.shadow,
          scrim: ext.scrim,
          inverseSurface: ext.inverseSurface,
          onInverseSurface: ext.inverseOnSurface,
          inversePrimary: ext.inversePrimary,
        );

        return base.copyWith(
          // خلفية الشاشة العامة
          scaffoldBackgroundColor:
              ext.background, // كان presentationBackgroundColor
          // ألوان عامة
          primaryColor: ext.primary,
          shadowColor: Colors.black.withValues(alpha: 0.15), // (بدل shadow)
          hoverColor: ext.primaryVariant, // (بدل lightPrimary)
          primaryColorLight: ext.primary,
          primaryColorDark: ext.primary,
          disabledColor: ext.disabled, // (بدل grey)
          splashColor: Colors.transparent,
          unselectedWidgetColor: ext.dark, // كان black
          secondaryHeaderColor: ext.onSurfaceVariant, // (بدل scrim)
          colorScheme: colorScheme,

          // البطاقات
          cardColor: ext.surface, // سطح افتراضي فاتح
          cardTheme: CardThemeData(
            color: ext.surface,
            shadowColor: ext.shadow,
            elevation: 0,
          ),

          // DatePicker
          datePickerTheme: DatePickerThemeData(
            dayStyle: TextStyle(color: ext.dark, fontSize: 12.sp),
            cancelButtonStyle: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                TextStyle(color: ext.darker, fontSize: 16.sp),
              ),
            ),
            confirmButtonStyle: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                TextStyle(color: ext.primary, fontSize: 16.sp),
              ),
            ),
          ),

          // Icons
          iconTheme: IconThemeData(size: 25.sp, color: ext.onSurface),

          // Slider
          sliderTheme: SliderThemeData(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.sp),
          ),

          // AppBar
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: ext.surface, // خلفية خفيفة
            foregroundColor: ext.onSurface,
            scrolledUnderElevation: 0.0,
            titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
              fontFamily: AppFonts.primary,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),

          // Switch
          switchTheme: SwitchThemeData(
            overlayColor: WidgetStatePropertyAll(ext.primary),
          ),

          // Buttons (legacy)
          buttonTheme: ButtonThemeData(
            shape: const RoundedRectangleBorder(),
            disabledColor: ext.textMuted,
            buttonColor: ext.primary,
            splashColor: ext.primaryVariant,
          ),

          // IconButton
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              iconSize: 25.sp,
              foregroundColor: ext.onSurface,
              padding: EdgeInsets.all(8.sp),
            ),
          ),

          // TextButton
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              minimumSize: Size(50.w, 30.h),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeightManager.light,
                color: ext.primary,
                fontFamily: AppFonts.primary,
              ),
            ),
          ),

          // ElevatedButton
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: ext.textInverse,
              disabledBackgroundColor: ext.disabled,
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeightManager.light,
                color: ext.textInverse,
                fontFamily: AppFonts.primary,
              ),
              backgroundColor: ext.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),

          // TextTheme
          textTheme: TextTheme(
            // Large metrics (calories, weight totals)
            displayLarge: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeightManager.bold,
              color: ext.textDark,
              letterSpacing: -0.5,
            ),
            // Section headers (Daily Summary, Weekly Goal)
            headlineLarge: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeightManager.semiBold,
              color: ext.textDark,
            ),
            // Meal entry numbers
            headlineMedium: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
              letterSpacing: 0,
            ),
            // Card titles, labels
            titleLarge: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
            ),
            // Body text
            bodyLarge: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarker,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarker,
            ),
            // Secondary info, timestamps
            bodySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarkest,
            ),
            // Button/chip labels
            labelLarge: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.primary,
              letterSpacing: 0.1,
            ),
            // Legacy mappings for compatibility
            displayMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
            ),
            titleMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarker,
            ),
            displaySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarkest,
            ),
            titleSmall: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeightManager.light,
              color: ext.textDarkest,
            ),
          ).apply(fontFamily: AppFonts.primary),

          // Inputs
          inputDecorationTheme: InputDecorationTheme(
            hoverColor: Colors.transparent,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeightManager.light,
              color: ext.darker,
              fontFamily: AppFonts.primary,
            ),
            labelStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeightManager.light,
              color: ext.darker,
              fontFamily: AppFonts.primary,
            ),
            errorStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.error,
              fontFamily: AppFonts.primary,
            ),
            errorMaxLines: 1,
            filled: true,
            fillColor: ext.surfaceVariant, // use semantic surface variant
            suffixIconColor: ext.darkest,
            prefixIconColor: ext.darkest,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.border, width: 0.4.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.disabled, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.primary, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.error, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.error, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ext.border, width: 0.4.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
          ),

          // TabBar
          tabBarTheme: TabBarThemeData(
            labelColor: ext.primary,
            unselectedLabelColor: ext.darkest,
            indicatorColor: ext.primary,
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.primary,
              fontFamily: AppFonts.primary,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.darkest,
              fontFamily: AppFonts.primary,
            ),
            dividerHeight: 0.2.h,
            dividerColor: ext.primary,
          ),

          // FAB
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ext.primary,
            foregroundColor: ext.textInverse,
          ),
        );
      });

  // ----- Dark Theme -----
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true)
      .copyWith(
        brightness: Brightness.dark,
        extensions: <ThemeExtension<dynamic>>[ColorProvider.dark()],
      )
      .let((base) {
        final ext =
            (base.extensions[ColorProvider] as ColorProvider?) ??
            ColorProvider.dark();

        final colorScheme = ColorScheme.dark(
          primary: ext.primary,
          onPrimary: ext.onPrimary,
          primaryContainer: ext.primaryContainer,
          onPrimaryContainer: ext.onPrimaryContainer,
          secondary: ext.secondary,
          onSecondary: ext.onSecondary,
          secondaryContainer: ext.secondaryContainer,
          onSecondaryContainer: ext.onSecondaryContainer,
          tertiary: ext.info, // use info as tertiary
          onTertiary: ext.onInfo,
          tertiaryContainer: ext.infoContainer,
          onTertiaryContainer: ext.onInfoContainer,
          error: ext.error,
          onError: ext.onError,
          errorContainer: ext.errorContainer,
          onErrorContainer: ext.onErrorContainer,
          surface: ext.surface,
          onSurface: ext.onSurface,
          surfaceContainerHighest: ext.surfaceVariant,
          onSurfaceVariant: ext.onSurfaceVariant,
          outline: ext.outline,
          outlineVariant: ext.outlineVariant,
          shadow: ext.shadow,
          scrim: ext.scrim,
          inverseSurface: ext.inverseSurface,
          onInverseSurface: ext.inverseOnSurface,
          inversePrimary: ext.inversePrimary,
        );

        return base.copyWith(
          scaffoldBackgroundColor: ext.scrim, // 0xFF121212

          primaryColor: ext.primary,
          shadowColor: Colors.black.withValues(alpha: 0.5),
          hoverColor: ext.primaryVariant,
          primaryColorLight: ext.primary,
          primaryColorDark: ext.primary,
          disabledColor: ext.disabled,
          splashColor: Colors.transparent,
          unselectedWidgetColor: ext.textInverse,
          secondaryHeaderColor: ext.onSurfaceVariant,
          colorScheme: colorScheme,

          cardColor: ext.surface, // use semantic surface
          cardTheme: CardThemeData(
            color: ext.surface,
            shadowColor: ext.shadow,
            elevation: 0,
          ),

          datePickerTheme: DatePickerThemeData(
            dayStyle: TextStyle(color: ext.dark, fontSize: 12.sp),
            cancelButtonStyle: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                TextStyle(color: ext.darker, fontSize: 16.sp),
              ),
            ),
            confirmButtonStyle: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                TextStyle(color: ext.primary, fontSize: 16.sp),
              ),
            ),
          ),

          iconTheme: IconThemeData(size: 25.sp, color: ext.onSurface),

          sliderTheme: SliderThemeData(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.sp),
          ),

          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: ext.surface, // use semantic surface
            foregroundColor: ext.onSurface,
            scrolledUnderElevation: 0.0,
            titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
              fontFamily: AppFonts.primary,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          ),

          switchTheme: SwitchThemeData(
            overlayColor: WidgetStatePropertyAll(ext.primary),
          ),

          buttonTheme: ButtonThemeData(
            shape: const RoundedRectangleBorder(),
            disabledColor: ext.textMuted,
            buttonColor: ext.primary,
            splashColor: ext.primaryVariant,
          ),

          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              iconSize: 25.sp,
              foregroundColor: ext.onSurface,
              padding: EdgeInsets.all(8.sp),
            ),
          ),

          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              minimumSize: Size(50.w, 30.h),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeightManager.light,
                color: ext.primary,
                fontFamily: AppFonts.primary,
              ),
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: ext.textInverse,
              disabledBackgroundColor: ext.disabled,
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeightManager.light,
                color: ext.textInverse,
                fontFamily: AppFonts.primary,
              ),
              backgroundColor: ext.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),

          textTheme: TextTheme(
            // Large metrics (calories, weight totals)
            displayLarge: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeightManager.bold,
              color: ext.textDark,
              letterSpacing: -0.5,
            ),
            // Section headers (Daily Summary, Weekly Goal)
            headlineLarge: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeightManager.semiBold,
              color: ext.textDark,
            ),
            // Meal entry numbers
            headlineMedium: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
              letterSpacing: 0,
            ),
            // Card titles, labels
            titleLarge: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
            ),
            // Body text
            bodyLarge: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarker,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarker,
            ),
            // Secondary info, timestamps
            bodySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarkest,
            ),
            // Button/chip labels
            labelLarge: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.primary,
              letterSpacing: 0.1,
            ),
            // Legacy mappings for compatibility
            displayMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.medium,
              color: ext.textDark,
            ),
            titleMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarker,
            ),
            displaySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.textDarkest,
            ),
            titleSmall: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeightManager.light,
              color: ext.textDarkest,
            ),
          ).apply(fontFamily: AppFonts.primary),

          inputDecorationTheme: InputDecorationTheme(
            hoverColor: Colors.transparent,
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeightManager.light,
              color: ext.darker,
              fontFamily: AppFonts.primary,
            ),
            labelStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.dark,
              fontFamily: AppFonts.primary,
            ),
            errorStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.error,
              fontFamily: AppFonts.primary,
            ),
            errorMaxLines: 1,
            filled: true,
            fillColor: ext.surfaceVariant, // use semantic surface variant
            suffixIconColor: ext.darkest,
            prefixIconColor: ext.darkest,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.border, width: 0.4.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.disabled, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.primary, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.error, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ext.error, width: 0.5.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ext.border, width: 0.4.w),
              borderRadius: BorderRadius.all(8.0.toRadius),
            ),
          ),

          tabBarTheme: TabBarThemeData(
            labelColor: ext.primary,
            unselectedLabelColor: ext.darkest,
            indicatorColor: ext.primary,
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.primary,
              fontFamily: AppFonts.primary,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightManager.regular,
              color: ext.darkest,
              fontFamily: AppFonts.primary,
            ),
            dividerHeight: 0.2.h,
            dividerColor: ext.primary,
          ),

          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ext.primary,
            foregroundColor: ext.textInverse,
          ),
        );
      });
}
