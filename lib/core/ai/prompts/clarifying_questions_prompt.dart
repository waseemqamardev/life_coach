import 'package:flutter/material.dart';

import '../../../data/models/decision_input.dart';
import '../../l10n/ai_locale.dart';

class ClarifyingQuestionsPrompt {
  ClarifyingQuestionsPrompt._();

  static String build(DecisionInput input, {required Locale locale}) {
    final String options = input.options.isEmpty
        ? 'None provided'
        : input.options.map((String o) => '"$o"').join(', ');

    return '''
You are an expert decision coach. The user is about to make an important decision and has already shared context through a wizard. Generate personalized follow-up multiple-choice questions to fill gaps before AI analysis.

Return ONLY valid JSON in this schema:
{
  "questions": [
    {
      "question": "string (specific to this user's decision, not generic)",
      "options": ["string", "string", "string", "string"]
    }
  ]
}

User decision context:
Title: ${input.title.isEmpty ? 'Not specified' : input.title}
Problem: ${input.problemStatement.isEmpty ? 'Not specified' : input.problemStatement}
Additional context: ${input.context.isEmpty ? 'Not specified' : input.context}
Category: ${input.category.isEmpty ? 'Not specified' : input.category}
Importance: ${input.importance.isEmpty ? 'Not specified' : input.importance}
Options being considered: $options
Goals: ${input.goals.isEmpty ? 'Not specified' : input.goals}
Urgency: ${input.urgency.isEmpty ? 'Not specified' : input.urgency}
Budget: ${input.budget > 0 ? input.budget.toStringAsFixed(0) : 'Not specified'}
Risk tolerance: ${input.riskTolerance.isEmpty ? 'Not specified' : input.riskTolerance}
Experience level: ${input.experienceLevel.isEmpty ? 'Not specified' : input.experienceLevel}
Time availability: ${input.timeAvailability.isEmpty ? 'Not specified' : input.timeAvailability}

Rules:
- Generate exactly 5 questions.
- Each question must reference the user's actual situation (problem, options, goals, or constraints).
- Do NOT reuse generic templates like "What outcome matters most?" unless rewritten for their case.
- Each question must have exactly 4 concise answer options (max 8 words each).
- Options must be mutually distinct and actionable.
- Avoid repeating information the user already provided in the wizard.
- Questions should uncover priorities, trade-offs, fears, success criteria, or missing context.
${AiLocale.responseLanguageInstruction(locale)}
''';
  }
}
