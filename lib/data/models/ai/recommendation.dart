class Recommendation {
  const Recommendation({
    required this.option,
    required this.label,
    required this.reasoning,
    required this.finalRecommendation,
  });

  final String option;
  final String label;
  final String reasoning;
  final String finalRecommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      option: _str(json['recommendedOption'] ?? json['recommendation']),
      label: _str(json['recommendationLabel'], fallback: 'Best Overall Choice'),
      reasoning: _str(json['recommendationReasoning']),
      finalRecommendation: _str(json['finalRecommendation']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'recommendedOption': option,
        'recommendationLabel': label,
        'recommendationReasoning': reasoning,
        'finalRecommendation': finalRecommendation,
        'recommendation': option,
      };

  static String _str(dynamic value, {String fallback = ''}) {
    if (value is String && value.trim().isNotEmpty) return value.trim();
    return fallback;
  }
}
