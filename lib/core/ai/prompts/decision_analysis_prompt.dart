import 'package:flutter/material.dart';

import '../../../data/models/decision_input.dart';
import '../../l10n/ai_locale.dart';

class DecisionAnalysisPrompt {
  DecisionAnalysisPrompt._();

  static String build(DecisionInput input, {required Locale locale}) {
    final String options = input.options.isEmpty
        ? 'None provided'
        : input.options.map((String o) => '"$o"').join(', ');
    final String qa = input.aiQuestionAnswers.isEmpty
        ? 'None'
        : input.aiQuestionAnswers.join('\n');

    return '''
You are an expert decision analyst. Analyze the user's decision and return ONLY valid JSON.

Required JSON schema:
{
  "executiveSummary": "string",
  "recommendedOption": "string (must exactly match one user option)",
  "recommendationLabel": "string",
  "recommendationReasoning": "string",
  "finalRecommendation": "string",
  "overallScore": 0-100,
  "confidenceScore": 0-100,
  "confidenceLevel": "Low|Medium|High",
  "confidenceSummary": "string",
  "riskScore": 0-100,
  "riskLevel": "Low|Medium|High",
  "riskSummary": "string",
  "riskBreakdown": {
    "financialRisk": 0-100,
    "marketRisk": 0-100,
    "timeRisk": 0-100,
    "executionRisk": 0-100,
    "personalRisk": 0-100
  },
  "confidenceScore": 0-100,
  "confidenceLevel": "Low|Medium|High",
  "confidenceSummary": "string",
  "confidenceBreakdown": {
    "outcomeConsistency": 0-100,
    "riskAssessment": 0-100,
    "historicalSimilarity": 0-100,
    "relevanceMatch": 0-100,
    "dataQuality": 0-100
  },
  "outcomePrediction": "string",
  "shortTermImpactAnalysis": "string",
  "longTermImpactAnalysis": "string",
  "outcomeBreakdown": {
    "successLikelihood": 0-100,
    "positiveOutcome": 0-100,
    "neutralOutcome": 0-100,
    "negativeOutcome": 0-100,
    "keyFactors": [
      {"label": "Financial Impact", "score": 0-100, "level": "Low|Medium|High"}
    ]
  },
  "aiInsight": "string (short actionable tip)",
  "pros": ["string", "..."],
  "cons": ["string", "..."],
  "actionPlan": ["Plan — ...", "Prepare — ...", "Execute — ..."],
  "alternativeApproaches": ["string", "..."],
  "comparisonResult": {
    "options": ["option1", "option2"],
    "comparisonMatrix": [
      {"criterion": "Overall Fit", "scores": {"option1": 80, "option2": 60}}
    ],
    "comparisonSummary": "string"
  },
  "keyConsiderations": ["string", "..."],
  "potentialBlindSpots": ["string", "..."]
}

User decision input:
Title: ${input.title}
Problem: ${input.problemStatement}
Context: ${input.context.isEmpty ? 'Not specified' : input.context}
Category: ${input.category}
Importance: ${input.importance}
Options: $options
Goals: ${input.goals.isEmpty ? 'Not specified' : input.goals}
Constraints: ${input.constraints.isEmpty ? 'Not specified' : input.constraints}
Urgency: ${input.urgency.isEmpty ? 'Not specified' : input.urgency}
Budget: ${input.budget > 0 ? input.budget.toStringAsFixed(0) : 'Not specified'}
Risk tolerance: ${input.riskTolerance.isEmpty ? 'Not specified' : input.riskTolerance}
Experience: ${input.experienceLevel.isEmpty ? 'Not specified' : input.experienceLevel}
Time availability: ${input.timeAvailability.isEmpty ? 'Not specified' : input.timeAvailability}
Additional Q&A:
$qa

Rules:
- Use the user's actual inputs; avoid generic filler text.
- recommendedOption must match one option exactly.
- actionPlan must contain exactly 3 steps prefixed with Plan —, Prepare —, Execute —.
- All list fields should contain at least 3 items where applicable.
- riskBreakdown, confidenceBreakdown, outcomeBreakdown.keyFactors must reflect this specific decision.
- comparisonMatrix must include scores for each user option on Overall Fit, Risk, Confidence, Potential Outcome, and Feasibility.
${AiLocale.responseLanguageInstruction(locale)}
''';
  }
}
