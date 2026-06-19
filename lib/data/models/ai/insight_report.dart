class InsightMetric {
  const InsightMetric({
    required this.label,
    required this.value,
    this.trend = '',
  });

  final String label;
  final String value;
  final String trend;

  factory InsightMetric.fromJson(Map<String, dynamic> json) {
    return InsightMetric(
      label: json['label']?.toString() ?? '',
      value: json['value']?.toString() ?? '',
      trend: json['trend']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'label': label,
        'value': value,
        'trend': trend,
      };
}

class InsightReport {
  const InsightReport({
    required this.id,
    required this.summary,
    required this.metrics,
    required this.patterns,
    required this.recommendations,
    required this.generatedAt,
  });

  final String id;
  final String summary;
  final List<InsightMetric> metrics;
  final List<String> patterns;
  final List<String> recommendations;
  final DateTime generatedAt;

  factory InsightReport.fromJson(Map<String, dynamic> json) {
    return InsightReport(
      id: json['id']?.toString() ?? '',
      summary: json['summary']?.toString() ?? '',
      metrics: (json['metrics'] as List<dynamic>? ?? const <dynamic>[])
          .whereType<Map<String, dynamic>>()
          .map(InsightMetric.fromJson)
          .toList(),
      patterns: _list(json['patterns']),
      recommendations: _list(json['recommendations']),
      generatedAt: DateTime.tryParse(json['generatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'summary': summary,
        'metrics': metrics.map((InsightMetric m) => m.toJson()).toList(),
        'patterns': patterns,
        'recommendations': recommendations,
        'generatedAt': generatedAt.toIso8601String(),
      };

  static List<String> _list(dynamic value) {
    if (value is! List<dynamic>) return <String>[];
    return value.map((dynamic e) => e.toString()).toList();
  }
}
