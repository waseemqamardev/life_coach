import 'package:flutter/material.dart';

/// Centralised colour tokens for the Life Coach design system.
///
/// All widgets read from here. To re-skin the app, change values in this file
/// only.
class AppColors {
  AppColors._();

  // ---- Brand / primary --------------------------------------------------
  /// Deep indigo used at the start of every gradient button.
  static const Color primaryBlue = Color(0xff012EED);

  /// Vibrant violet used at the end of every gradient button.
  static const Color primaryPurple = Color(0xFF684BF9);
  static const Color lightPurple = Color(0xFF916BF8);

  /// Softer purple used for icons, links, secondary accents in light mode.
  static const Color accentPurple = Color(0xFF7C5CFC);

  /// Brand gradient used on every primary CTA button.
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[primaryBlue, primaryPurple],
  );

  static const LinearGradient primaryTwoGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[Color(0xff012EED),Color(0xff8951FB)],
  );

  // ---- Semantic colours -------------------------------------------------
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // ---- Light theme ------------------------------------------------------
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF7F8FA);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color  lightTextPrimary = Color(0xFF010E39);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightTextMuted = Color(0xFF7A7A7A);

  // ---- Dark theme -------------------------------------------------------
  static const Color darkBackground = Color(0xFF020817);
  static const Color darkSurface = Color(0xFF0B1220);
  static const Color darkCard = Color(0xFF111827);
  static const Color darkBorder = Color(0xFF1F2937);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFD9D9D9);
  static const Color darkTextMuted = Color(0xFFD9D9D9);
  static const Color darkGreetingCard = Color(0xFF111827);

  // ---- Soft accent backgrounds (for tinted icon containers) -------------
  static Color softPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFEEF0FF)
          : const Color(0xFF1B2347);

  static Color softSuccess(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFE7F8EE)
          : const Color(0xFF14281E);

  static Color softWarning(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFFEF3E2)
          : const Color(0xFF2B2010);

  static Color softDanger(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFFDECEC)
          : const Color(0xFF2A1717);

  static Color softInfo(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFE6F0FE)
          : const Color(0xFF12233F);

  // ---- Surface helpers --------------------------------------------------
  static Color cardColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? lightCard
          : darkCard;

  static Color borderColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? lightBorder
          : darkBorder;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? lightTextPrimary
          : darkTextPrimary;

  static Color textSecondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? lightTextSecondary
          : darkTextSecondary;

  static Color textMuted(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? lightTextMuted
          :
      darkTextMuted;

  static Color scaffoldColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : darkBackground;

  static bool isLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;

  static Color selectedFillColor(BuildContext context) =>
      isLight(context) ? const Color(0xFFEEEDFD) : const Color(0xFF221C53);

  static Color surfaceBackground(BuildContext context) =>
      isLight(context) ? lightSurface : darkSurface;

  static Color accentTitleColor(BuildContext context) =>
      isLight(context) ? const Color(0xFF022088) : darkTextPrimary;

  static Color linkActionColor(BuildContext context) =>
      isLight(context) ? primaryBlue : accentPurple;

  /// App bar leading title — navy in light, white in dark.
  static Color appBarTitleColor(BuildContext context) =>
      isLight(context) ? const Color(0xFF022088) : Colors.white;

  /// App bar accent word — purple in light, white in dark.
  static Color appBarAccentColor(BuildContext context) =>
      isLight(context) ? primaryPurple : Colors.white;

  /// App bar icons (back, menu, actions) — navy in light, white in dark.
  static Color appBarIconColor(BuildContext context) =>
      isLight(context) ? const Color(0xFF022088) : Colors.white;

  static Color optionCardColor(BuildContext context, {required bool selected}) =>
      selected ? selectedFillColor(context) : cardColor(context);

  static List<BoxShadow> cardShadowList(BuildContext context) {
    if (isLight(context)) {
      return <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];
    }
    return <BoxShadow>[
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.35),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ];
  }

  static BoxDecoration themedCardDecoration(
    BuildContext context, {
    double borderRadius = 12,
    Color? color,
    bool showShadow = true,
  }) {
    return BoxDecoration(
      color: color ?? cardColor(context),
      borderRadius: BorderRadius.circular(borderRadius),
      border: isLight(context) ? null : Border.all(color: darkBorder),
      boxShadow: showShadow ? cardShadowList(context) : null,
    );
  }

  static Color homeCardColor(BuildContext context) =>
      cardColor(context);

  static Color greetingCardColor(BuildContext context) =>
      isLight(context) ? const Color(0xFFEEEDFD) : darkGreetingCard;

  static List<BoxShadow> homeCardShadow(BuildContext context) {
    if (isLight(context)) {
      return <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.16),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ];
    }
    return <BoxShadow>[
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.35),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ];
  }

  static List<BoxShadow> homeStatCardShadow(BuildContext context) {
    if (isLight(context)) {
      return <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.16),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];
    }
    return <BoxShadow>[];
  }

  static Color riskBadgeBackground(
    BuildContext context, {
    required bool highRisk,
  }) {
    if (isLight(context)) {
      return highRisk ? const Color(0xFFFFEBEE) : const Color(0xFFE8F5E9);
    }
    return highRisk
        ? danger.withValues(alpha: 0.18)
        : success.withValues(alpha: 0.18);
  }

  static Color riskBadgeForeground(
    BuildContext context, {
    required bool highRisk,
  }) {
    if (isLight(context)) {
      return highRisk ? danger : const Color(0xFF388E3C);
    }
    return highRisk ? danger : success;
  }
}
