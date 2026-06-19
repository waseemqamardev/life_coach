// GENERATED-COMPATIBLE FILE
// This file is hand-written to mirror what build_runner would emit for the
// Decision model. Running `flutter pub run build_runner build` will overwrite
// it — that is intentional.

// ignore_for_file: type=lint

part of 'decision.dart';

class DecisionAdapter extends TypeAdapter<Decision> {
  @override
  final int typeId = 0;

  @override
  Decision read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Decision(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      category: fields[3] as String,
      importance: fields[4] as String,
      createdAt: fields[5] as DateTime,
      options: (fields[6] as List?)?.cast<String>() ?? const <String>[],
      goal: fields[7] as String? ?? '',
      urgency: fields[8] as String? ?? '',
      budget: (fields[9] as num?)?.toDouble() ?? 0,
      riskTolerance: fields[10] as String? ?? '',
      experienceLevel: fields[11] as String? ?? '',
      timeAvailability: fields[12] as String? ?? '',
      overallScore: fields[13] as int? ?? 0,
      riskScore: fields[14] as int? ?? 0,
      confidence: fields[15] as int? ?? 0,
      recommendation: fields[16] as String? ?? '',
      recommendationLabel: fields[17] as String? ?? '',
      pros: (fields[18] as List?)?.cast<String>() ?? const <String>[],
      cons: (fields[19] as List?)?.cast<String>() ?? const <String>[],
      actionPlan:
          (fields[20] as List?)?.cast<String>() ?? const <String>[],
      outcomePrediction: fields[21] as String? ?? '',
      notes: fields[22] as String? ?? '',
      folder: fields[23] as String? ?? '',
      isRecommended: fields[24] as bool? ?? false,
      aiQuestionAnswers:
          (fields[25] as List?)?.cast<String>() ?? const <String>[],
    );
  }

  @override
  void write(BinaryWriter writer, Decision obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)..write(obj.id)
      ..writeByte(1)..write(obj.title)
      ..writeByte(2)..write(obj.description)
      ..writeByte(3)..write(obj.category)
      ..writeByte(4)..write(obj.importance)
      ..writeByte(5)..write(obj.createdAt)
      ..writeByte(6)..write(obj.options)
      ..writeByte(7)..write(obj.goal)
      ..writeByte(8)..write(obj.urgency)
      ..writeByte(9)..write(obj.budget)
      ..writeByte(10)..write(obj.riskTolerance)
      ..writeByte(11)..write(obj.experienceLevel)
      ..writeByte(12)..write(obj.timeAvailability)
      ..writeByte(13)..write(obj.overallScore)
      ..writeByte(14)..write(obj.riskScore)
      ..writeByte(15)..write(obj.confidence)
      ..writeByte(16)..write(obj.recommendation)
      ..writeByte(17)..write(obj.recommendationLabel)
      ..writeByte(18)..write(obj.pros)
      ..writeByte(19)..write(obj.cons)
      ..writeByte(20)..write(obj.actionPlan)
      ..writeByte(21)..write(obj.outcomePrediction)
      ..writeByte(22)..write(obj.notes)
      ..writeByte(23)..write(obj.folder)
      ..writeByte(24)..write(obj.isRecommended)
      ..writeByte(25)..write(obj.aiQuestionAnswers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecisionAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
