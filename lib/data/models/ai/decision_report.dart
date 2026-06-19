import 'action_plan.dart';
import 'comparison_result.dart';
import 'confidence_analysis.dart';
import 'outcome_prediction.dart';
import 'recommendation.dart';
import 'risk_analysis.dart';

/// Full structured AI decision report (15 output sections).
class DecisionReport {
  const DecisionReport({
    required this.executiveSummary,
    required this.recommendation,
    required this.riskAnalysis,
    required this.confidenceAnalysis,
    required this.outcomePrediction,
    required this.actionPlan,
    required this.pros,
    required this.cons,
    required this.alternativeApproaches,
    required this.comparisonResult,
    required this.keyConsiderations,
    required this.potentialBlindSpots,
    required this.overallScore,
    required this.generatedAt,
    this.aiInsight = '',
  });

  final String executiveSummary;
  final Recommendation recommendation;
  final RiskAnalysis riskAnalysis;
  final ConfidenceAnalysis confidenceAnalysis;
  final OutcomePrediction outcomePrediction;
  final ActionPlan actionPlan;
  final List<String> pros;
  final List<String> cons;
  final List<String> alternativeApproaches;
  final ComparisonResult comparisonResult;
  final List<String> keyConsiderations;
  final List<String> potentialBlindSpots;
  final int overallScore;
  final DateTime generatedAt;
  final String aiInsight;

  factory DecisionReport.fromJson(Map<String, dynamic> json) {
    return DecisionReport(
      executiveSummary: _str(json['executiveSummary']),
      recommendation: Recommendation.fromJson(json),
      riskAnalysis: RiskAnalysis.fromJson(json),
      confidenceAnalysis: ConfidenceAnalysis.fromJson(json),
      outcomePrediction: OutcomePrediction.fromJson(json),
      actionPlan: ActionPlan.fromJson(json),
      pros: _list(json['pros']),
      cons: _list(json['cons']),
      alternativeApproaches: _list(json['alternativeApproaches']),
      comparisonResult: ComparisonResult.fromJson(
        json['comparisonResult'] is Map<String, dynamic>
            ? json['comparisonResult'] as Map<String, dynamic>
            : json,
      ),
      keyConsiderations: _list(json['keyConsiderations']),
      potentialBlindSpots: _list(json['potentialBlindSpots']),
      overallScore: _score(json['overallScore']),
      generatedAt: DateTime.tryParse(json['generatedAt']?.toString() ?? '') ??
          DateTime.now(),
      aiInsight: _str(json['aiInsight']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'executiveSummary': executiveSummary,
        ...recommendation.toJson(),
        ...riskAnalysis.toJson(),
        ...confidenceAnalysis.toJson(),
        ...outcomePrediction.toJson(),
        ...actionPlan.toJson(),
        'pros': pros,
        'cons': cons,
        'alternativeApproaches': alternativeApproaches,
        'comparisonResult': comparisonResult.toJson(),
        'keyConsiderations': keyConsiderations,
        'potentialBlindSpots': potentialBlindSpots,
        'overallScore': overallScore,
        'generatedAt': generatedAt.toIso8601String(),
        'aiInsight': aiInsight,
      };

  static String _str(dynamic value) {
    if (value is String) return value.trim();
    return '';
  }

  static List<String> _list(dynamic value) {
    if (value is! List<dynamic>) return <String>[];
    return value
        .map((dynamic e) => e.toString().trim())
        .where((String s) => s.isNotEmpty)
        .toList();
  }

  static int _score(dynamic value) {
    if (value is int) return value.clamp(0, 100);
    if (value is double) return value.round().clamp(0, 100);
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
