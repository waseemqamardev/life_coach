import '../../../data/models/ai/action_plan.dart';
import '../../../data/models/ai/comparison_result.dart';
import '../../../data/models/ai/confidence_analysis.dart';
import '../../../data/models/ai/decision_report.dart';
import '../../../data/models/ai/outcome_prediction.dart';
import '../../../data/models/ai/recommendation.dart';
import '../../../data/models/ai/risk_analysis.dart';
import '../../../data/models/decision.dart';
import '../../../data/models/decision_input.dart';
import '../../errors/ai_exception.dart';
import 'json_response_parser.dart';

class DecisionReportParser {
  DecisionReportParser._();

  static DecisionReport parse(String raw) {
    try {
      final Map<String, dynamic> json = JsonResponseParser.parseObject(raw);
      return DecisionReport.fromJson(json);
    } on AiException {
      rethrow;
    } catch (e) {
      throw AiParseException('Decision report parse failed: $e');
    }
  }

  /// Applies structured report onto legacy [Decision] for existing UI compatibility.
  static Decision applyToDecision({
    required Decision decision,
    required DecisionReport report,
  }) {
    decision
      ..overallScore = report.overallScore
      ..riskScore = report.riskAnalysis.score
      ..confidence = report.confidenceAnalysis.score
      ..recommendation = _pickOption(decision.options, report.recommendation.option)
      ..recommendationLabel = report.recommendation.label.isNotEmpty
          ? report.recommendation.label
          : 'Best Overall Choice'
      ..pros = report.pros
      ..cons = report.cons
      ..actionPlan = report.actionPlan.steps
      ..outcomePrediction = report.outcomePrediction.prediction.isNotEmpty
          ? report.outcomePrediction.prediction
          : report.executiveSummary
      ..isRecommended = true;
    return decision;
  }

  static String _pickOption(List<String> options, String raw) {
    if (raw.isEmpty && options.isNotEmpty) return options.first;
    for (final String option in options) {
      if (option.trim().toLowerCase() == raw.trim().toLowerCase()) {
        return option;
      }
    }
    if (options.contains(raw)) return raw;
    return options.isNotEmpty ? options.first : raw;
  }

  static DecisionReport fallback(DecisionInput input, {String? reason}) {
    final String option =
        input.options.isNotEmpty ? input.options.first : 'Option 1';
    return DecisionReport(
      executiveSummary: reason ??
          'Analysis could not be fully generated. Review your inputs and retry.',
      recommendation: Recommendation(
        option: option,
        label: 'Needs Review',
        reasoning: 'Fallback report generated locally.',
        finalRecommendation: option,
      ),
      riskAnalysis: const RiskAnalysis(score: 50, level: 'Medium', summary: ''),
      confidenceAnalysis:
          const ConfidenceAnalysis(score: 50, level: 'Medium', summary: ''),
      outcomePrediction: const OutcomePrediction(
        prediction: '',
        shortTermImpact: '',
        longTermImpact: '',
      ),
      actionPlan: const ActionPlan(steps: <String>[
        'Plan — Review your options carefully.',
        'Prepare — Gather missing information.',
        'Execute — Retry analysis when online.',
      ]),
      pros: const <String>[],
      cons: const <String>[],
      alternativeApproaches: const <String>[],
      comparisonResult: ComparisonResult(
        options: input.options,
        rows: const <ComparisonRow>[],
        summary: '',
      ),
      keyConsiderations: const <String>[],
      potentialBlindSpots: const <String>[],
      overallScore: 0,
      generatedAt: DateTime.now(),
    );
  }
}
