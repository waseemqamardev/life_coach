import 'package:hive/hive.dart';

part 'decision.g.dart';

@HiveType(typeId: 0)
class Decision extends HiveObject {
  Decision({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.importance,
    required this.createdAt,
    this.options = const <String>[],
    this.goal = '',
    this.urgency = '',
    this.budget = 0,
    this.riskTolerance = '',
    this.experienceLevel = '',
    this.timeAvailability = '',
    this.overallScore = 0,
    this.riskScore = 0,
    this.confidence = 0,
    this.recommendation = '',
    this.recommendationLabel = '',
    this.pros = const <String>[],
    this.cons = const <String>[],
    this.actionPlan = const <String>[],
    this.outcomePrediction = '',
    this.notes = '',
    this.folder = '',
    this.isRecommended = false,
    this.aiQuestionAnswers = const <String>[],
  });

  @HiveField(0) final String id;
  @HiveField(1) String title;
  @HiveField(2) String description;
  @HiveField(3) String category;
  @HiveField(4) String importance;
  @HiveField(5) DateTime createdAt;
  @HiveField(6) List<String> options;
  @HiveField(7) String goal;
  @HiveField(8) String urgency;
  @HiveField(9) double budget;
  @HiveField(10) String riskTolerance;
  @HiveField(11) String experienceLevel;
  @HiveField(12) String timeAvailability;

  // AI outputs
  @HiveField(13) int overallScore;
  @HiveField(14) int riskScore;
  @HiveField(15) int confidence;
  @HiveField(16) String recommendation;
  @HiveField(17) String recommendationLabel;
  @HiveField(18) List<String> pros;
  @HiveField(19) List<String> cons;
  @HiveField(20) List<String> actionPlan;
  @HiveField(21) String outcomePrediction;

  // Saved metadata
  @HiveField(22) String notes;
  @HiveField(23) String folder;
  @HiveField(24) bool isRecommended;
  @HiveField(25) List<String> aiQuestionAnswers;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'importance': importance,
        'createdAt': createdAt.toIso8601String(),
        'options': options,
        'goal': goal,
        'urgency': urgency,
        'budget': budget,
        'riskTolerance': riskTolerance,
        'experienceLevel': experienceLevel,
        'timeAvailability': timeAvailability,
        'overallScore': overallScore,
        'riskScore': riskScore,
        'confidence': confidence,
        'recommendation': recommendation,
        'recommendationLabel': recommendationLabel,
        'pros': pros,
        'cons': cons,
        'actionPlan': actionPlan,
        'outcomePrediction': outcomePrediction,
        'notes': notes,
        'folder': folder,
        'isRecommended': isRecommended,
        'aiQuestionAnswers': aiQuestionAnswers,
      };

  factory Decision.fromJson(Map<String, dynamic> json) {
    return Decision(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      importance: json['importance'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      options: List<String>.from(json['options'] as List<dynamic>? ?? const <String>[]),
      goal: json['goal'] as String? ?? '',
      urgency: json['urgency'] as String? ?? '',
      budget: (json['budget'] as num?)?.toDouble() ?? 0,
      riskTolerance: json['riskTolerance'] as String? ?? '',
      experienceLevel: json['experienceLevel'] as String? ?? '',
      timeAvailability: json['timeAvailability'] as String? ?? '',
      overallScore: json['overallScore'] as int? ?? 0,
      riskScore: json['riskScore'] as int? ?? 0,
      confidence: json['confidence'] as int? ?? 0,
      recommendation: json['recommendation'] as String? ?? '',
      recommendationLabel: json['recommendationLabel'] as String? ?? '',
      pros: List<String>.from(json['pros'] as List<dynamic>? ?? const <String>[]),
      cons: List<String>.from(json['cons'] as List<dynamic>? ?? const <String>[]),
      actionPlan: List<String>.from(json['actionPlan'] as List<dynamic>? ?? const <String>[]),
      outcomePrediction: json['outcomePrediction'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      folder: json['folder'] as String? ?? '',
      isRecommended: json['isRecommended'] as bool? ?? false,
      aiQuestionAnswers: List<String>.from(
        json['aiQuestionAnswers'] as List<dynamic>? ?? const <String>[],
      ),
    );
  }

  String get riskLabel {
    if (riskScore <= 35) return 'Low Risk';
    if (riskScore <= 65) return 'Medium Risk';
    return 'High Risk';
  }
}
