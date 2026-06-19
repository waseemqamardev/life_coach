import 'package:flutter/material.dart';

/// Text style tokens. Uses bundled [AppFonts.inter] from assets/fonts/.
class AppFonts {
  AppFonts._();
  static const String inter = 'Inter';
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      );

  // Headings -------------------------------------------------------------
  static TextStyle h1 = _style(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static TextStyle h2 = _style(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static TextStyle h3 = _style(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static TextStyle h4 = _style(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  // Body -----------------------------------------------------------------
  static TextStyle bodyLarge = _style(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle bodyMedium = _style(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle bodySmall = _style(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  // Labels / numeric -----------------------------------------------------
  static TextStyle label = _style(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static TextStyle caption = _style(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.35,
  );

  static TextStyle bigScore = _style(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  static TextStyle buttonText = _style(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.2,
  );
}
