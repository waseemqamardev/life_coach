import '../../data/models/decision.dart';

import '../../l10n/app_localizations.dart';



/// Real copy and decision-derived text helpers (no lorem / placeholder filler).

class DecisionText {

  DecisionText._();



  static String greetingName(String name, [AppLocalizations? l10n]) {

    final String trimmed = name.trim();

    if (trimmed.isEmpty) {

      return l10n?.greetingFallbackName ?? 'there';

    }

    return trimmed;

  }



  static String summary(Decision? decision, [AppLocalizations? l10n]) {

    if (decision == null) {

      return l10n?.noDescription ?? 'No description provided.';

    }

    if (decision.outcomePrediction.trim().isNotEmpty) {

      return decision.outcomePrediction.trim();

    }

    if (decision.description.trim().isNotEmpty) {

      return decision.description.trim();

    }

    return l10n?.noDescription ?? 'No description provided.';

  }



  static String insightDescription(Decision decision, [AppLocalizations? l10n]) {

    if (decision.outcomePrediction.trim().isNotEmpty) {

      return decision.outcomePrediction.trim();

    }

    if (decision.recommendation.trim().isNotEmpty) {

      if (l10n != null) {

        return l10n.recommendedPrefix(decision.recommendation.trim());

      }

      return 'Recommended: ${decision.recommendation.trim()}';

    }

    if (decision.description.trim().isNotEmpty) {

      return decision.description.trim();

    }

    return l10n?.noDescription ?? 'No description provided.';

  }



  static String recommendation(Decision? decision, [AppLocalizations? l10n]) {

    if (decision?.recommendation.trim().isNotEmpty == true) {

      return decision!.recommendation.trim();

    }

    if (decision != null && decision.options.isNotEmpty) {

      return decision.options.first.trim();

    }

    return l10n?.pendingAnalysis ?? 'Pending analysis';

  }



  static String optionAt(Decision? decision, int index) {

    if (decision == null || decision.options.length <= index) return '';

    return decision.options[index].trim();

  }



  static String decisionTitle(Decision? decision, [AppLocalizations? l10n]) {

    if (decision?.title.trim().isNotEmpty == true) {

      return decision!.title.trim();

    }

    return l10n?.untitledDecision ?? 'Untitled decision';

  }



  static int fitScore(Decision? decision) => decision?.overallScore ?? 0;



  static int riskScore(Decision? decision) => decision?.riskScore ?? 0;



  static int confidence(Decision? decision) => decision?.confidence ?? 0;



  static int benefitScore(Decision? decision) {

    if (decision == null || decision.overallScore == 0) return 0;

    return ((decision.overallScore + (100 - decision.riskScore)) / 2)

        .round()

        .clamp(0, 100);

  }



  static String riskLabel(Decision? decision, [AppLocalizations? l10n]) {

    if (decision == null || decision.riskScore == 0) {

      return l10n?.notAssessed ?? 'Not assessed';

    }

    return decision.riskLabel;

  }



  static List<String> pros(Decision? decision) => decision?.pros ?? const <String>[];



  static List<String> cons(Decision? decision) => decision?.cons ?? const <String>[];



  static List<String> actionPlan(Decision? decision) =>

      decision?.actionPlan ?? const <String>[];



  static String riskInterpretation(Decision? decision, [AppLocalizations? l10n]) {

    if (decision?.outcomePrediction.trim().isNotEmpty == true) {

      return decision!.outcomePrediction.trim();

    }

    if (decision != null && decision.riskScore > 0) {

      if (l10n != null) {

        return l10n.decisionTextRiskInterpretation(

          decision.riskLabel.toLowerCase(),

          decision.riskScore,

        );

      }

      return 'Your overall risk level is ${decision.riskLabel.toLowerCase()} '

          '(${decision.riskScore}%). Review the breakdown below to understand '

          'what drives this score.';

    }

    return l10n?.riskInterpretationEmpty ??

        'Complete an analysis to see a personalized risk interpretation.';

  }



  static List<String> riskImproveTips(Decision? decision, [AppLocalizations? l10n]) {

    if (decision?.cons.isNotEmpty == true) {

      return decision!.cons.take(4).toList();

    }

    if (decision?.actionPlan.isNotEmpty == true) {

      return decision!.actionPlan;

    }

    return <String>[

      l10n?.decisionTextRiskFallback ??

          'Run a full analysis to get tailored risk-reduction tips.',

    ];

  }

}

