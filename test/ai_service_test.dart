import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_life_navigator/core/services/ai_service.dart';
import 'package:ai_life_navigator/data/models/decision.dart';

void main() {
  test('AI service returns a decision with analysis values', () async {
    final Decision sample = Decision(
      id: 'test-id',
      title: 'Test Decision',
      description: 'Verify AI analysis output',
      category: 'General',
      importance: 'High',
      createdAt: DateTime.now(),
      options: const <String>['Option A', 'Option B'],
    );

    final Decision result = await AiService.instance.analyse(
      sample,
      locale: const Locale('en', 'US'),
    );

    expect(result.overallScore, greaterThan(0));
    expect(result.riskScore, greaterThanOrEqualTo(20));
    expect(result.confidence, greaterThan(0));
    expect(result.recommendation, isNotEmpty);
    expect(result.pros, isNotEmpty);
    expect(result.cons, isNotEmpty);
  });
}
