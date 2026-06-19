class ComparisonRow {
  const ComparisonRow({
    required this.criterion,
    required this.scores,
  });

  final String criterion;
  final Map<String, int> scores;

  factory ComparisonRow.fromJson(Map<String, dynamic> json) {
    final Map<String, int> scores = <String, int>{};
    final dynamic raw = json['scores'] ?? json['values'];
    if (raw is Map) {
      raw.forEach((dynamic k, dynamic v) {
        scores[k.toString()] = _score(v);
      });
    }
    return ComparisonRow(
      criterion: json['criterion']?.toString() ?? json['label']?.toString() ?? '',
      scores: scores,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'criterion': criterion,
        'scores': scores,
      };

  static int _score(dynamic value) {
    if (value is int) return value.clamp(0, 100);
    if (value is double) return value.round().clamp(0, 100);
    return int.tryParse(value.toString()) ?? 0;
  }
}

class ComparisonResult {
  const ComparisonResult({
    required this.options,
    required this.rows,
    required this.summary,
  });

  final List<String> options;
  final List<ComparisonRow> rows;
  final String summary;

  factory ComparisonResult.fromJson(Map<String, dynamic> json) {
    return ComparisonResult(
      options: _list(json['options']),
      rows: (json['comparisonMatrix'] as List<dynamic>? ?? const <dynamic>[])
          .whereType<Map<String, dynamic>>()
          .map(ComparisonRow.fromJson)
          .toList(),
      summary: json['comparisonSummary']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'options': options,
        'comparisonMatrix': rows.map((ComparisonRow r) => r.toJson()).toList(),
        'comparisonSummary': summary,
      };

  static List<String> _list(dynamic value) {
    if (value is! List<dynamic>) return <String>[];
    return value.map((dynamic e) => e.toString()).toList();
  }
}
