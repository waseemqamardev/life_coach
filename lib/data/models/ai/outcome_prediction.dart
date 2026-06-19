import 'outcome_factor.dart';

class OutcomePrediction {
  const OutcomePrediction({
    required this.prediction,
    required this.shortTermImpact,
    required this.longTermImpact,
    this.successLikelihood = 0,
    this.positiveOutcome = 0,
    this.neutralOutcome = 0,
    this.negativeOutcome = 0,
    this.keyFactors = const <OutcomeFactor>[],
  });

  final String prediction;
  final String shortTermImpact;
  final String longTermImpact;
  final int successLikelihood;
  final int positiveOutcome;
  final int neutralOutcome;
  final int negativeOutcome;
  final List<OutcomeFactor> keyFactors;

  factory OutcomePrediction.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> breakdown = json['outcomeBreakdown'] is Map
        ? (json['outcomeBreakdown'] as Map).cast<String, dynamic>()
        : json;
    final int success = _score(
      breakdown['successLikelihood'] ?? json['successLikelihood'],
    );

    return OutcomePrediction(
      prediction: _str(json['outcomePrediction']),
      shortTermImpact: _str(json['shortTermImpactAnalysis']),
      longTermImpact: _str(json['longTermImpactAnalysis']),
      successLikelihood: success,
      positiveOutcome: _score(breakdown['positiveOutcome']),
      neutralOutcome: _score(breakdown['neutralOutcome']),
      negativeOutcome: _score(breakdown['negativeOutcome']),
      keyFactors: _factors(breakdown['keyFactors']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'outcomePrediction': prediction,
        'shortTermImpactAnalysis': shortTermImpact,
        'longTermImpactAnalysis': longTermImpact,
        'outcomeBreakdown': <String, dynamic>{
          'successLikelihood': successLikelihood,
          'positiveOutcome': positiveOutcome,
          'neutralOutcome': neutralOutcome,
          'negativeOutcome': negativeOutcome,
          'keyFactors': keyFactors
              .map((OutcomeFactor f) => <String, dynamic>{
                    'label': f.label,
                    'score': f.score,
                    'level': f.level,
                  })
              .toList(),
        },
      };

  static List<OutcomeFactor> _factors(dynamic raw) {
    if (raw is! List<dynamic>) return <OutcomeFactor>[];
    return raw
        .whereType<Map>()
        .map((Map<dynamic, dynamic> m) =>
            OutcomeFactor.fromJson(m.cast<String, dynamic>()))
        .where((OutcomeFactor f) => f.label.isNotEmpty)
        .toList();
  }

  static String _str(dynamic value) {
    if (value is String) return value.trim();
    return '';
  }

  static int _score(dynamic value) {
    if (value is int) return value.clamp(0, 100);
    if (value is double) return value.round().clamp(0, 100);
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
