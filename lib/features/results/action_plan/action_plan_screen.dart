import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';



import '../../../core/constants/app_constants.dart';

import '../../../core/l10n/l10n_extensions.dart';

import '../../../core/theme/app_colors.dart';

import '../../../core/theme/app_text_styles.dart';

import '../../../core/utils/decision_text.dart';

import '../../../core/utils/report_text.dart';

import '../../../data/models/ai/decision_report.dart';

import '../../../data/models/decision.dart';

import '../../../providers/providers.dart';

import '../../../shared/widgets/app_screen.dart';

import '../shared/result_ui_widgets.dart';



class ActionPlanScreen extends ConsumerStatefulWidget {

  const ActionPlanScreen({super.key});



  @override

  ConsumerState<ActionPlanScreen> createState() => _ActionPlanScreenState();

}



class _ActionPlanScreenState extends ConsumerState<ActionPlanScreen> {



  @override

  Widget build(BuildContext context) {

    final l10n = context.l10n;

    final Decision? draft = ref.watch(draftDecisionProvider);

    final DecisionReport? report = ref.watch(draftDecisionReportProvider);

    final int fitScore = DecisionText.fitScore(draft);

    final int riskScore = DecisionText.riskScore(draft);

    final int confidence = DecisionText.confidence(draft);

    final int benefitScore = ResultUi.benefitScore(draft);

    final String badgeLabel = draft?.recommendationLabel.isNotEmpty == true

        ? draft!.recommendationLabel

        : l10n.bestOverallChoice;

    final String title = l10n.actionPlan;

    final int space = title.lastIndexOf(' ');



    return AppScreen(

      titleLeading: space < 0 ? title : title.substring(0, space),

      titleAccent: space < 0 ? '' : title.substring(space + 1),

      plainBackButton: true,

      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[

          ResultHeroCard(

            title: l10n.yourActionPlan,

            subtitle: l10n.recommendedChoiceLabel,

            badgeLabel: badgeLabel,

            description: ReportText.summary(draft, report),

            fitScore: fitScore,

          ),

          const SizedBox(height: ResultUi.sectionGap),

          ResultSummaryScoreRow(

            riskScore: riskScore,

            benefitScore: benefitScore,

            confidence: confidence,

            onRiskTap: () => context.push(AppRoutes.riskScore),

            onBenefitTap: () => context.push(AppRoutes.outcomePrediction),

            onConfidenceTap: () => context.push(AppRoutes.confidenceMeter),

          ),

          const SizedBox(height: ResultUi.sectionGap),

          Text(

            l10n.yourActionPlan,

            style: AppTextStyles.h4.copyWith(

              color: AppColors.textPrimary(context),

              fontWeight: FontWeight.w700,

              fontSize: 16,

            ),

          ),

          const SizedBox(height: 12),

          ActionPlanTimeline(

            steps: ActionPlanSteps.fromDecision(draft),

            onStepTap: (ActionPlanStep step) =>

                ResultInteractions.showActionStepSheet(context, step),

          ),

          const SizedBox(height: ResultUi.sectionGap),

          AiInsightCard(

            title: l10n.aiInsight,

            body: ReportText.actionPlanInsight(draft, report),

          ),

        ],

      ),

    );

  }

}

