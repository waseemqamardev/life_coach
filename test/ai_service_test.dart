import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_life_navigator/core/services/ai_service.dart';
import 'package:ai_life_navigator/data/models/decision.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:ai_life_navigator/data/local/local_database.dart';

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_life_navigator/core/services/storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('AI service returns a decision with analysis values', () async {
    HttpOverrides.global = null;
    await dotenv.load(fileName: '.env');
    SharedPreferences.setMockInitialValues({});
    
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async {
        return '.';
      },
    );

    await StorageService.instance.init();
    await LocalDatabase.instance.switchUser('test-user');

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
