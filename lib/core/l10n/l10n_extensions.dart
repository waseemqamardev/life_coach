import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension AppLocalizationsHelpers on AppLocalizations {
  List<String> get wizardSteps =>
      <String>[stepDefine, stepAnalyze, stepQuestions, stepResult];

  String riskLevelLabel(int score) {
    if (score <= 35) return lowRisk;
    if (score >= 60) return highRisk;
    return mediumRisk;
  }

  String successChanceLabel(int score) {
    if (score >= 70) return goodChance;
    if (score >= 40) return fairChance;
    return poorChance;
  }

  String scoreTier(int score) {
    if (score <= 35) return low;
    if (score <= 65) return medium;
    return high;
  }

  String confidenceTier(int score) {
    if (score >= 70) return high;
    if (score >= 40) return medium;
    return low;
  }

  String relativeTime(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return justNow;
    if (diff.inMinutes < 60) return minutesAgo(diff.inMinutes.clamp(1, 59));
    if (diff.inHours < 24) {
      return diff.inHours == 1
          ? hoursAgo(1)
          : hoursAgoPlural(diff.inHours);
    }
    return diff.inDays == 1 ? daysAgo(1) : daysAgoPlural(diff.inDays);
  }
}
