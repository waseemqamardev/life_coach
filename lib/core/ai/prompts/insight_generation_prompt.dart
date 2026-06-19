import '../../../data/models/decision.dart';

class InsightGenerationPrompt {
  InsightGenerationPrompt._();

  static String build(List<Decision> decisions, Map<String, dynamic> localStats) {
    final String summary = decisions
        .take(10)
        .map(
          (Decision d) =>
              '- ${d.title} | category=${d.category} | risk=${d.riskScore} | confidence=${d.confidence} | recommendation=${d.recommendation}',
        )
        .join('\n');

    return '''
You are a behavioral insights analyst. Using the historical decision data below, return ONLY JSON:

{
  "summary": "string",
  "metrics": [
    {"label": "string", "value": "string", "trend": "up|down|stable"}
  ],
  "patterns": ["string"],
  "recommendations": ["string"]
}

Local computed stats:
${localStats.entries.map((MapEntry<String, dynamic> e) => '${e.key}: ${e.value}').join('\n')}

Recent decisions:
$summary

Focus on categories, risk trends, confidence trends, recommendation patterns, and decision quality indicators.
''';
  }
}
