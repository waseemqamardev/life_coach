import 'package:flutter/material.dart';

import '../../core/ai/gemini_client.dart';
import '../../core/ai/parsers/clarifying_questions_parser.dart';
import '../../core/ai/prompts/clarifying_questions_prompt.dart';
import '../../core/errors/ai_exception.dart';
import '../../data/models/ai/clarifying_question.dart';
import '../../data/models/decision.dart';
import '../../data/models/decision_input.dart';

class ClarifyingQuestionsResult {
  const ClarifyingQuestionsResult({
    required this.questions,
    this.usedFallback = false,
  });

  final List<ClarifyingQuestion> questions;
  final bool usedFallback;
}

/// Generates personalized follow-up questions from the user's wizard input.
class ClarifyingQuestionsService {
  ClarifyingQuestionsService({GeminiClient? client})
      : _client = client ?? GeminiClient.instance;

  final GeminiClient _client;

  Future<ClarifyingQuestionsResult> generate(
    Decision decision, {
    required Locale locale,
  }) async {
    final DecisionInput input = DecisionInput.fromDecision(decision);

    try {
      final String raw = await _client.generateJson(
        prompt: ClarifyingQuestionsPrompt.build(input, locale: locale),
        temperature: 0.6,
      );
      final List<ClarifyingQuestion> questions =
          ClarifyingQuestionsParser.parse(raw);
      return ClarifyingQuestionsResult(questions: questions);
    } on AiMissingApiKeyException {
      return ClarifyingQuestionsResult(
        questions: ClarifyingQuestionsParser.fallback(input),
        usedFallback: true,
      );
    } on AiException {
      return ClarifyingQuestionsResult(
        questions: ClarifyingQuestionsParser.fallback(input),
        usedFallback: true,
      );
    } catch (_) {
      return ClarifyingQuestionsResult(
        questions: ClarifyingQuestionsParser.fallback(input),
        usedFallback: true,
      );
    }
  }
}
