class RiskAnalysis {
  const RiskAnalysis({
    required this.score,
    required this.level,
    required this.summary,
    this.breakdown = const <String, int>{},
  });

  final int score;
  final String level;
  final String summary;
  final Map<String, int> breakdown;

  static const List<String> breakdownKeys = <String>[
    'financialRisk',
    'marketRisk',
    'timeRisk',
    'executionRisk',
    'personalRisk',
  ];

  factory RiskAnalysis.fromJson(Map<String, dynamic> json) {
    final int score = _score(json['riskScore']);
    return RiskAnalysis(
      score: score,
      level: _str(json['riskLevel'], fallback: _levelFromScore(score)),
      summary: _str(json['riskSummary']),
      breakdown: _parseBreakdown(json['riskBreakdown'], score),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'riskScore': score,
        'riskLevel': level,
        'riskSummary': summary,
        'riskBreakdown': breakdown,
      };

  int scoreAt(int index) {
    if (index < 0 || index >= breakdownKeys.length) return 0;
    return breakdown[breakdownKeys[index]] ?? 0;
  }

  static Map<String, int> _parseBreakdown(dynamic raw, int overall) {
    if (raw is Map) {
      final Map<String, int> parsed = <String, int>{};
      for (final String key in breakdownKeys) {
        parsed[key] = _score(raw[key]);
      }
      if (parsed.values.any((int v) => v > 0)) return parsed;
    }
    return derivedBreakdown(overall);
  }

  static Map<String, int> derivedBreakdown(int overall) {
    const List<int> offsets = <int>[0, 6, -4, 8, -6];
    final Map<String, int> result = <String, int>{};
    for (int i = 0; i < breakdownKeys.length; i++) {
      result[breakdownKeys[i]] = (overall + offsets[i]).clamp(0, 100);
    }
    return result;
  }

  static int _score(dynamic value) {
    if (value is int) return value.clamp(0, 100);
    if (value is double) return value.round().clamp(0, 100);
    if (value is String) return (int.tryParse(value) ?? 0).clamp(0, 100);
    return 0;
  }

  static String _str(dynamic value, {String fallback = ''}) {
    if (value is String && value.trim().isNotEmpty) return value.trim();
    return fallback;
  }

  static String _levelFromScore(int score) {
    if (score <= 35) return 'Low';
    if (score <= 65) return 'Medium';
    return 'High';
  }
}
