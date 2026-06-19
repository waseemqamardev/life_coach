class OutcomeFactor {
  const OutcomeFactor({
    required this.label,
    required this.score,
    required this.level,
  });

  final String label;
  final int score;
  final String level;

  factory OutcomeFactor.fromJson(Map<String, dynamic> json) {
    return OutcomeFactor(
      label: json['label']?.toString().trim() ?? '',
      score: _score(json['score']),
      level: json['level']?.toString().trim() ?? '',
    );
  }

  static int _score(dynamic value) {
    if (value is int) return value.clamp(0, 100);
    if (value is double) return value.round().clamp(0, 100);
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
