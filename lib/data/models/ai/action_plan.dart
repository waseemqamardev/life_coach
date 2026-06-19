class ActionPlan {
  const ActionPlan({required this.steps});

  final List<String> steps;

  factory ActionPlan.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return ActionPlan(steps: _list(json['actionPlan'] ?? json['steps']));
    }
    if (json is List<dynamic>) {
      return ActionPlan(steps: _list(json));
    }
    return const ActionPlan(steps: <String>[]);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'actionPlan': steps};

  static List<String> _list(dynamic value) {
    if (value is! List<dynamic>) return <String>[];
    return value
        .map((dynamic e) => e.toString().trim())
        .where((String s) => s.isNotEmpty)
        .toList();
  }
}
