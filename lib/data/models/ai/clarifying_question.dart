class ClarifyingQuestion {
  const ClarifyingQuestion({
    required this.question,
    required this.options,
  });

  final String question;
  final List<String> options;

  factory ClarifyingQuestion.fromJson(Map<String, dynamic> json) {
    final List<String> options = (json['options'] as List<dynamic>? ?? const <dynamic>[])
        .map((dynamic o) => o.toString().trim())
        .where((String o) => o.isNotEmpty)
        .toList();

    return ClarifyingQuestion(
      question: _str(json['question']),
      options: options.length >= 3 ? options.take(4).toList() : options,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'question': question,
        'options': options,
      };

  static String _str(dynamic value, {String fallback = ''}) {
    if (value is String && value.trim().isNotEmpty) return value.trim();
    return fallback;
  }
}
