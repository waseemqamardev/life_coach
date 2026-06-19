import 'decision.dart';

/// User-provided decision input captured during the wizard.
class DecisionInput {
  const DecisionInput({
    required this.id,
    required this.title,
    required this.problemStatement,
    required this.context,
    required this.category,
    required this.importance,
    required this.options,
    required this.goals,
    required this.constraints,
    required this.urgency,
    required this.budget,
    required this.riskTolerance,
    required this.experienceLevel,
    required this.timeAvailability,
    required this.aiQuestionAnswers,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String problemStatement;
  final String context;
  final String category;
  final String importance;
  final List<String> options;
  final String goals;
  final String constraints;
  final String urgency;
  final double budget;
  final String riskTolerance;
  final String experienceLevel;
  final String timeAvailability;
  final List<String> aiQuestionAnswers;
  final DateTime createdAt;

  factory DecisionInput.fromDecision(Decision decision) {
    return DecisionInput(
      id: decision.id,
      title: decision.title,
      problemStatement: decision.description,
      context: decision.notes,
      category: decision.category,
      importance: decision.importance,
      options: List<String>.from(decision.options),
      goals: decision.goal,
      constraints: _buildConstraints(decision),
      urgency: decision.urgency,
      budget: decision.budget,
      riskTolerance: decision.riskTolerance,
      experienceLevel: decision.experienceLevel,
      timeAvailability: decision.timeAvailability,
      aiQuestionAnswers: List<String>.from(decision.aiQuestionAnswers),
      createdAt: decision.createdAt,
    );
  }

  static String _buildConstraints(Decision decision) {
    final List<String> parts = <String>[];
    if (decision.budget > 0) {
      parts.add('Budget: ${decision.budget.toStringAsFixed(0)}');
    }
    if (decision.urgency.isNotEmpty) parts.add('Urgency: ${decision.urgency}');
    if (decision.riskTolerance.isNotEmpty) {
      parts.add('Risk tolerance: ${decision.riskTolerance}');
    }
    if (decision.timeAvailability.isNotEmpty) {
      parts.add('Time availability: ${decision.timeAvailability}');
    }
    return parts.join('; ');
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'problemStatement': problemStatement,
        'context': context,
        'category': category,
        'importance': importance,
        'options': options,
        'goals': goals,
        'constraints': constraints,
        'urgency': urgency,
        'budget': budget,
        'riskTolerance': riskTolerance,
        'experienceLevel': experienceLevel,
        'timeAvailability': timeAvailability,
        'aiQuestionAnswers': aiQuestionAnswers,
        'createdAt': createdAt.toIso8601String(),
      };
}
