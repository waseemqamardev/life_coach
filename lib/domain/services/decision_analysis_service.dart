import 'package:flutter/material.dart';

import '../../core/ai/gemini_client.dart';
import '../../core/ai/parsers/decision_report_parser.dart';
import '../../core/ai/parsers/json_response_parser.dart';
import '../../core/ai/prompts/decision_analysis_prompt.dart';
import '../../core/errors/ai_exception.dart';
import '../../data/local/local_database.dart';
import '../../data/models/ai/decision_report.dart';
import '../../data/models/decision.dart';
import '../../data/models/decision_input.dart';
import '../../data/repositories/app_repositories.dart';

class AnalysisResult {
  const AnalysisResult({required this.decision, required this.report});
  final Decision decision;
  final DecisionReport report;
}

/// Orchestrates decision analysis: prompt → Gemini → parse → persist mapping.
class DecisionAnalysisService {
  DecisionAnalysisService({
    GeminiClient? client,
    DecisionRepository? repository,
  })  : _client = client ?? GeminiClient.instance,
        _repository = repository ?? DecisionRepository(LocalDatabase.instance);

  final GeminiClient _client;
  final DecisionRepository _repository;

  Future<AnalysisResult> analyze(Decision decision, {required Locale locale}) async {
    final DecisionInput input = DecisionInput.fromDecision(decision);
    final String raw = await _client.generateJson(
      prompt: DecisionAnalysisPrompt.build(input, locale: locale),
    );

    DecisionReport report;
    try {
      report = DecisionReportParser.parse(raw);
    } on AiParseException {
      report = DecisionReportParser.fallback(
        input,
        reason: 'AI response could not be parsed. A partial report was created.',
      );
    }

    DecisionReportParser.applyToDecision(decision: decision, report: report);
    await _repository.saveDecision(decision, report: report);
    return AnalysisResult(decision: decision, report: report);
  }

  DecisionReport? getStoredReport(String decisionId) =>
      _repository.getReport(decisionId);
}
