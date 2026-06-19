import 'package:uuid/uuid.dart';

import '../../core/ai/gemini_client.dart';
import '../../core/ai/parsers/json_response_parser.dart';
import '../../core/ai/prompts/insight_generation_prompt.dart';
import '../../core/errors/ai_exception.dart';
import '../../data/local/local_database.dart';
import '../../data/models/ai/insight_report.dart';
import '../../data/models/decision.dart';
import '../../data/repositories/app_repositories.dart';

class InsightService {
  InsightService({
    GeminiClient? client,
    DecisionRepository? decisionRepository,
    InsightRepository? insightRepository,
  })  : _client = client ?? GeminiClient.instance,
        _decisions = decisionRepository ?? DecisionRepository(LocalDatabase.instance),
        _insights = insightRepository ?? InsightRepository(LocalDatabase.instance);

  final GeminiClient _client;
  final DecisionRepository _decisions;
  final InsightRepository _insights;
  final Uuid _uuid = const Uuid();

  InsightReport? getLatest() => _insights.getLatest();

  Map<String, dynamic> computeLocalStats(List<Decision> decisions) {
    if (decisions.isEmpty) {
      return <String, dynamic>{'totalDecisions': 0};
    }
    final Map<String, int> categories = <String, int>{};
    int totalRisk = 0;
    int totalConfidence = 0;
    int totalScore = 0;
    for (final Decision d in decisions) {
      categories[d.category] = (categories[d.category] ?? 0) + 1;
      totalRisk += d.riskScore;
      totalConfidence += d.confidence;
      totalScore += d.overallScore;
    }
    final int count = decisions.length;
    return <String, dynamic>{
      'totalDecisions': count,
      'topCategory': categories.entries
          .reduce((MapEntry<String, int> a, MapEntry<String, int> b) =>
              a.value >= b.value ? a : b)
          .key,
      'averageRisk': (totalRisk / count).round(),
      'averageConfidence': (totalConfidence / count).round(),
      'averageScore': (totalScore / count).round(),
      'categoryBreakdown': categories,
    };
  }

  Future<InsightReport> generate({bool useGemini = true}) async {
    final List<Decision> decisions = _decisions.getAll();
    final Map<String, dynamic> stats = computeLocalStats(decisions);

    if (decisions.isEmpty) {
      final InsightReport empty = InsightReport(
        id: _uuid.v4(),
        summary: 'Complete your first decision analysis to unlock insights.',
        metrics: const <InsightMetric>[
          InsightMetric(label: 'Decisions', value: '0', trend: 'stable'),
        ],
        patterns: const <String>[],
        recommendations: const <String>[
          'Start a new analysis from the home screen.',
        ],
        generatedAt: DateTime.now(),
      );
      await _insights.save(empty);
      return empty;
    }

    if (!useGemini) {
      return _localInsight(decisions, stats);
    }

    try {
      final String raw = await _client.generateJson(
        prompt: InsightGenerationPrompt.build(decisions, stats),
      );
      final Map<String, dynamic> json = JsonResponseParser.parseObject(raw);
      final InsightReport report = InsightReport.fromJson(<String, dynamic>{
        ...json,
        'id': _uuid.v4(),
        'generatedAt': DateTime.now().toIso8601String(),
      });
      await _insights.save(report);
      return report;
    } on AiException {
      return _localInsight(decisions, stats);
    }
  }

  Future<InsightReport> _localInsight(
    List<Decision> decisions,
    Map<String, dynamic> stats,
  ) async {
    final InsightReport report = InsightReport(
      id: _uuid.v4(),
      summary:
          'You have ${stats['totalDecisions']} saved decisions. Most common category: ${stats['topCategory']}.',
      metrics: <InsightMetric>[
        InsightMetric(
          label: 'Avg Risk',
          value: '${stats['averageRisk']}%',
          trend: 'stable',
        ),
        InsightMetric(
          label: 'Avg Confidence',
          value: '${stats['averageConfidence']}%',
          trend: 'stable',
        ),
        InsightMetric(
          label: 'Avg Score',
          value: '${stats['averageScore']}%',
          trend: 'stable',
        ),
      ],
      patterns: <String>[
        'Most decisions fall under ${stats['topCategory']}.',
      ],
      recommendations: <String>[
        'Review past decisions in History before starting a new one.',
      ],
      generatedAt: DateTime.now(),
    );
    await _insights.save(report);
    return report;
  }
}
