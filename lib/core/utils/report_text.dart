import '../../l10n/app_localizations.dart';
import '../../data/models/ai/confidence_analysis.dart';
import '../../data/models/ai/decision_report.dart';
import '../../data/models/ai/risk_analysis.dart';
import '../../data/models/decision.dart';
import 'decision_text.dart';

/// Reads Gemini report fields with fallbacks to legacy [Decision] data.
class ReportText {
  ReportText._();

  static String summary(
    Decision? decision,
    DecisionReport? report, [
    AppLocalizations? l10n,
  ]) {
    if (report?.executiveSummary.isNotEmpty == true) {
      return report!.executiveSummary.trim();
    }
    return DecisionText.summary(decision, l10n);
  }

  static String recommendationReasoning(
    Decision? decision,
    DecisionReport? report, [
    AppLocalizations? l10n,
  ]) {
    if (report?.recommendation.reasoning.isNotEmpty == true) {
      return report!.recommendation.reasoning.trim();
    }
    if (report?.recommendation.finalRecommendation.isNotEmpty == true) {
      return report!.recommendation.finalRecommendation.trim();
    }
    return DecisionText.summary(decision, l10n);
  }

  static String aiTip(Decision? decision, DecisionReport? report) {
    if (report?.aiInsight.isNotEmpty == true) return report!.aiInsight.trim();
    if (report?.keyConsiderations.isNotEmpty == true) {
      return report!.keyConsiderations.first;
    }
    return 'Review your plan regularly and stay flexible to adapt as conditions change.';
  }

  static String actionPlanInsight(Decision? decision, DecisionReport? report) {
    if (report?.aiInsight.isNotEmpty == true) return report!.aiInsight.trim();
    if (report?.keyConsiderations.isNotEmpty == true) {
      return report!.keyConsiderations.first;
    }
    return 'Consistent execution of these steps increases your success probability and reduces risks.';
  }

  static List<String> whyRecommended(Decision? decision, DecisionReport? report) {
    if (report?.recommendation.reasoning.isNotEmpty == true) {
      return _splitSentences(report!.recommendation.reasoning).take(4).toList();
    }
    final List<String> pros = DecisionText.pros(decision);
    if (pros.isNotEmpty) return pros.take(4).toList();
    return const <String>[
      'Higher potential benefits with manageable risks',
      'Aligns well with your goals and priorities',
      'Good balance of time, cost and resources',
      'Strong long-term impact and sustainability',
    ];
  }

  static String riskInterpretation(
    Decision? decision,
    DecisionReport? report, [
    AppLocalizations? l10n,
  ]) {
    if (report?.riskAnalysis.summary.isNotEmpty == true) {
      return report!.riskAnalysis.summary.trim();
    }
    return DecisionText.riskInterpretation(decision, l10n);
  }

  static String confidenceSummary(
    Decision? decision,
    DecisionReport? report, [
    AppLocalizations? l10n,
  ]) {
    if (report?.confidenceAnalysis.summary.isNotEmpty == true) {
      return report!.confidenceAnalysis.summary.trim();
    }
    return summary(decision, report, l10n);
  }

  static int riskSubScore(Decision? decision, DecisionReport? report, int index) {
    if (report != null) return report.riskAnalysis.scoreAt(index);
    if (decision == null || decision.riskScore == 0) return 0;
    return RiskAnalysis.derivedBreakdown(decision.riskScore).values.elementAt(index);
  }

  static int confidenceSubScore(
    Decision? decision,
    DecisionReport? report,
    int index,
  ) {
    if (report != null) return report.confidenceAnalysis.scoreAt(index);
    if (decision == null || decision.confidence == 0) return 0;
    return ConfidenceAnalysis.derivedBreakdown(decision.confidence)
        .values
        .elementAt(index);
  }

  static int successLikelihood(Decision? decision, DecisionReport? report) {
    if (report != null && report.outcomePrediction.successLikelihood > 0) {
      return report.outcomePrediction.successLikelihood;
    }
    return DecisionText.fitScore(decision);
  }

  static int positiveOutcome(Decision? decision, DecisionReport? report) {
    if (report != null && report.outcomePrediction.positiveOutcome > 0) {
      return report.outcomePrediction.positiveOutcome;
    }
    return successLikelihood(decision, report);
  }

  static int neutralOutcome(Decision? decision, DecisionReport? report) {
    if (report != null && report.outcomePrediction.neutralOutcome > 0) {
      return report.outcomePrediction.neutralOutcome;
    }
    final int positive = positiveOutcome(decision, report);
    return ((100 - positive) * 0.35).round().clamp(0, 100);
  }

  static int negativeOutcome(Decision? decision, DecisionReport? report) {
    if (report != null && report.outcomePrediction.negativeOutcome > 0) {
      return report.outcomePrediction.negativeOutcome;
    }
    final int positive = positiveOutcome(decision, report);
    final int neutral = neutralOutcome(decision, report);
    return (100 - positive - neutral).clamp(0, 100);
  }

  static int comparisonScore(
    DecisionReport? report,
    String option,
    String criterion,
    int fallback,
  ) {
    if (report == null || report.comparisonResult.rows.isEmpty) return fallback;
    for (final row in report.comparisonResult.rows) {
      if (!_matchesCriterion(row.criterion, criterion)) continue;
      for (final MapEntry<String, int> entry in row.scores.entries) {
        if (entry.key.trim().toLowerCase() == option.trim().toLowerCase()) {
          return entry.value;
        }
      }
    }
    return fallback;
  }

  static bool _matchesCriterion(String rowLabel, String target) {
    final String a = rowLabel.trim().toLowerCase();
    final String b = target.trim().toLowerCase();
    return a.contains(b) || b.contains(a);
  }

  static List<String> _splitSentences(String text) {
    return text
        .split(RegExp(r'(?<=[.!?])\s+'))
        .map((String s) => s.trim())
        .where((String s) => s.isNotEmpty)
        .toList();
  }
}
