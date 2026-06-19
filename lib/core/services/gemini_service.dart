import 'package:flutter/material.dart';

import '../../data/models/decision.dart';
import '../../domain/services/decision_analysis_service.dart';
import '../ai/gemini_client.dart';
import '../config/app_env.dart';

/// Backward-compatible Gemini facade for chat and legacy imports.
class GeminiService {
  GeminiService._();
  static final GeminiService instance = GeminiService._();

  final DecisionAnalysisService _analysis = DecisionAnalysisService();

  Future<Decision> analyseDecision(
    Decision decision, {
    required Locale locale,
  }) async {
    final AnalysisResult result =
        await _analysis.analyze(decision, locale: locale);
    return result.decision;
  }

  Future<String> chatReply({
    required String userMessage,
    required List<({bool isUser, String text})> priorMessages,
    required Locale locale,
  }) {
    return GeminiClient.instance.chat(
      userMessage: userMessage,
      priorMessages: priorMessages,
      locale: locale,
    );
  }

  static bool get hasApiKey => AppEnv.hasGeminiKey;
}

/// Legacy alias — prefer [AiException].
typedef GeminiException = AiException;
