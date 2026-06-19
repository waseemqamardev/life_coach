import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static const BorderRadius _fieldRadius = BorderRadius.all(Radius.circular(14));

  static InputDecorationTheme _inputDecorationTheme({
    required Color fillColor,
    required Color borderColor,
    required Color hintColor,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: TextStyle(
        fontFamily: AppFonts.inter,
        color: hintColor,
        fontSize: 14,
      ),
      errorStyle: const TextStyle(
        fontFamily: AppFonts.inter,
        color: AppColors.danger,
        fontSize: 12,
        height: 1.3,
      ),
      border: OutlineInputBorder(
        borderRadius: _fieldRadius,
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _fieldRadius,
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: _fieldRadius,
        borderSide: BorderSide(color: AppColors.primaryPurple, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: _fieldRadius,
        borderSide: BorderSide(color: AppColors.danger),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: _fieldRadius,
        borderSide: BorderSide(color: AppColors.danger, width: 1.5),
      ),
    );
  }

  static TextTheme _textTheme(Brightness brightness, Color textColor) {
    final TextTheme base = brightness == Brightness.light
        ? Typography.material2021().black
        : Typography.material2021().white;
    return base.apply(
      fontFamily: AppFonts.inter,
      bodyColor: textColor,
      displayColor: textColor,
    );
  }

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFonts.inter,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primaryPurple,
    canvasColor: AppColors.lightBackground,
    splashFactory: InkRipple.splashFactory,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryPurple,
      secondary: AppColors.primaryBlue,
      surface: AppColors.lightBackground,
      error: AppColors.danger,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.lightTextPrimary,
      onError: Colors.white,
    ),
    textTheme: _textTheme(Brightness.light, AppColors.lightTextPrimary),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
      titleTextStyle: AppTextStyles.h3.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: _inputDecorationTheme(
      fillColor: AppColors.lightCard,
      borderColor: AppColors.lightBorder,
      hintColor: AppColors.lightTextMuted,
    ),
    dividerTheme:
        const DividerThemeData(color: AppColors.lightBorder, thickness: 1),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      selectedItemColor: AppColors.primaryPurple,
      unselectedItemColor: AppColors.lightTextMuted,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFonts.inter,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryPurple,
    canvasColor: AppColors.darkBackground,
    splashFactory: InkRipple.splashFactory,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryPurple,
      secondary: AppColors.primaryBlue,
      surface: AppColors.darkBackground,
      error: AppColors.danger,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.darkTextPrimary,
      onError: Colors.white,
    ),
    textTheme: _textTheme(Brightness.dark, AppColors.darkTextPrimary),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
      titleTextStyle: AppTextStyles.h3.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: _inputDecorationTheme(
      fillColor: AppColors.darkCard,
      borderColor: AppColors.darkBorder,
      hintColor: AppColors.darkTextMuted,
    ),
    dividerTheme:
        const DividerThemeData(color: AppColors.darkBorder, thickness: 1),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.primaryPurple,
      unselectedItemColor: AppColors.darkTextSecondary,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
}
