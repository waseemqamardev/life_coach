import 'package:flutter/material.dart';

import '../../data/models/decision.dart';
import '../../domain/services/decision_analysis_service.dart';

/// Facade used by existing UI — delegates to [DecisionAnalysisService].
class AiService {
  AiService._();
  static final AiService instance = AiService._();

  final DecisionAnalysisService _analysis = DecisionAnalysisService();

  Future<Decision> analyse(
    Decision decision, {
    required Locale locale,
  }) async {
    final AnalysisResult result =
        await _analysis.analyze(decision, locale: locale);
    return result.decision;
  }
}
