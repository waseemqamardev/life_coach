import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/decision_text.dart';
import '../../../data/models/decision.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../core/utils/report_text.dart';
import '../../../data/models/ai/decision_report.dart';
import '../../../providers/providers.dart';
import '../../../providers/app_providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../results/shared/result_ui_widgets.dart';

class CompareScreen extends ConsumerWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final Decision? draft = ref.watch(draftDecisionProvider);

    if (draft != null) {
      final DecisionReport? report = ref.watch(draftDecisionReportProvider);
      return _buildFromDecision(
        l10n: l10n,
        decision: draft,
        report: report,
        missingOptionsMessage: l10n.decisionNeedsTwoOptionsToCompare,
      );
    }

    final List<String> selectedIds = ref.watch(compareSelectionProvider);
    if (selectedIds.length != 1) {
      return _CompareEmptyState(message: l10n.selectOneDecisionToCompare);
    }

    final List<Decision> all = ref.watch(decisionsProvider);
    final Decision? decision = _findDecision(all, selectedIds.first);
    if (decision == null) {
      return _CompareEmptyState(message: l10n.selectOneDecisionToCompare);
    }

    final DecisionReport? report =
        ref.watch(decisionReportProvider(decision.id));

    return _buildFromDecision(
      l10n: l10n,
      decision: decision,
      report: report,
      missingOptionsMessage: l10n.decisionNeedsTwoOptionsToCompare,
    );
  }

  static Widget _buildFromDecision({
    required AppLocalizations l10n,
    required Decision decision,
    required DecisionReport? report,
    required String missingOptionsMessage,
  }) {
    if (!_hasTwoOptions(decision)) {
      return _CompareEmptyState(message: missingOptionsMessage);
    }

    final String nameA = _optionName(decision, 0, l10n.firstOption);
    final String nameB = _optionName(decision, 1, l10n.secondOption);
    final bool recIsA = decision.recommendation.trim().toLowerCase() ==
        nameA.trim().toLowerCase();
    final int winnerScore = DecisionText.fitScore(decision);
    final int loserScore = ReportText.comparisonScore(
      report,
      recIsA ? nameB : nameA,
      l10n.overallFit,
      (100 - winnerScore).clamp(0, 100),
    );

    return _CompareContent(
      l10n: l10n,
      optionA: nameA,
      optionASub: decision.title.isNotEmpty ? decision.title : decision.category,
      optionB: nameB,
      optionBSub: decision.goal.isNotEmpty ? decision.goal : decision.category,
      scoreA: recIsA ? winnerScore : loserScore,
      scoreB: recIsA ? loserScore : winnerScore,
      riskA: recIsA
          ? DecisionText.riskScore(decision)
          : ReportText.comparisonScore(
              report, nameA, 'Risk', DecisionText.riskScore(decision)),
      riskB: recIsA
          ? ReportText.comparisonScore(
              report, nameB, 'Risk', DecisionText.riskScore(decision))
          : DecisionText.riskScore(decision),
      confidenceA: recIsA
          ? DecisionText.confidence(decision)
          : ReportText.comparisonScore(
              report, nameA, 'Confidence', DecisionText.confidence(decision)),
      confidenceB: recIsA
          ? ReportText.comparisonScore(
              report, nameB, 'Confidence', DecisionText.confidence(decision))
          : DecisionText.confidence(decision),
      showRecommendedOnA: recIsA,
      actionDraft: decision,
    );
  }

  static bool _hasTwoOptions(Decision decision) {
    return decision.options.length >= 2 &&
        decision.options[0].trim().isNotEmpty &&
        decision.options[1].trim().isNotEmpty;
  }

  static Decision? _findDecision(List<Decision> all, String id) {
    for (final Decision decision in all) {
      if (decision.id == id) return decision;
    }
    return null;
  }

  static String _optionName(Decision draft, int index, String fallback) {
    if (draft.options.length > index && draft.options[index].isNotEmpty) {
      return draft.options[index];
    }
    return fallback;
  }
}

class _CompareEmptyState extends StatelessWidget {
  const _CompareEmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      titleLeading: context.l10n.comparisonWord,
      titleAccent: context.l10n.decisionWord,
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: AppColors.themedCardDecoration(
          context,
          borderRadius: 16,
        ),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.compare_arrows_rounded,
              size: 48,
              color: AppColors.textMuted(context),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompareContent extends StatelessWidget {
  const _CompareContent({
    required this.l10n,
    required this.optionA,
    required this.optionASub,
    required this.optionB,
    required this.optionBSub,
    required this.scoreA,
    required this.scoreB,
    required this.riskA,
    required this.riskB,
    required this.confidenceA,
    required this.confidenceB,
    required this.showRecommendedOnA,
    required this.actionDraft,
  });

  final AppLocalizations l10n;
  final String optionA;
  final String optionASub;
  final String optionB;
  final String optionBSub;
  final int scoreA;
  final int scoreB;
  final int riskA;
  final int riskB;
  final int confidenceA;
  final int confidenceB;
  final bool showRecommendedOnA;
  final Decision? actionDraft;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      titleLeading: l10n.comparisonWord,
      titleAccent: l10n.decisionWord,
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: <Widget>[
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: _OptionCard(
                          title: optionA,
                          subtitle: optionASub,
                          showRecommended: showRecommendedOnA,
                          recommendedLabel: l10n.recommended,
                        ),
                      ),
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: _OptionCard(
                        title: optionB,
                        subtitle: optionBSub,
                        showRecommended: !showRecommendedOnA,
                        recommendedLabel: l10n.recommended,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
        color: AppColors.cardColor(context),
                  shape: BoxShape.circle,
                  boxShadow: ResultUi.cardShadow(context),
                ),
                child: Text(
                  l10n.versus,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: ResultUi.sectionGap),
          Row(
            children: <Widget>[
              Text(
                l10n.keyComparison,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  l10n.overallScore,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ComparisonTable(
            l10n: l10n,
            labelA: optionA,
            labelB: optionB,
            scoreA: scoreA,
            scoreB: scoreB,
            riskA: riskA,
            riskB: riskB,
            confidenceA: confidenceA,
            confidenceB: confidenceB,
          ),
          const SizedBox(height: ResultUi.sectionGap),
          Text(
            l10n.yourActionPlan,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          ActionPlanTimeline(
            steps: ActionPlanSteps.fromDecision(actionDraft),
            onStepTap: (ActionPlanStep step) =>
                ResultInteractions.showActionStepSheet(context, step),
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.title,
    required this.subtitle,
    required this.showRecommended,
    required this.recommendedLabel,
  });

  final String title;
  final String subtitle;
  final bool showRecommended;
  final String recommendedLabel;

  static const double _badgeHeight = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 14),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(14),
        border: AppColors.isLight(context)
            ? null
            : Border.all(color: AppColors.borderColor(context)),
        boxShadow: AppColors.isLight(context)
            ? null
            : AppColors.homeCardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: _badgeHeight,
            child: showRecommended
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.softSuccess(context),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            Assets.iconsBestOverall,
                            width: 9,
                            height: 9,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            recommendedLabel,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 4),
          Center(
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: AppColors.primaryTwoGradient,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                Assets.iconsTrophySolid,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _ComparisonTable extends StatelessWidget {
  const _ComparisonTable({
    required this.l10n,
    required this.labelA,
    required this.labelB,
    required this.scoreA,
    required this.scoreB,
    required this.riskA,
    required this.riskB,
    required this.confidenceA,
    required this.confidenceB,
  });

  final AppLocalizations l10n;
  final String labelA;
  final String labelB;
  final int scoreA;
  final int scoreB;
  final int riskA;
  final int riskB;
  final int confidenceA;
  final int confidenceB;

  List<String> get _labels => <String>[
        l10n.overallScore,
        l10n.riskScore,
        l10n.confidence,
        l10n.outcomePrediction,
        l10n.fitScore,
      ];

  static String _shortLabel(String value) {
    final String trimmed = value.trim();
    if (trimmed.length <= 14) return trimmed;
    return '${trimmed.substring(0, 12)}…';
  }

  @override
  Widget build(BuildContext context) {
    final List<(int, int)> values = <(int, int)>[
      (scoreA, scoreB),
      (riskA, riskB),
      (confidenceA, confidenceB),
      (scoreA, scoreB),
      (confidenceA, confidenceB),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: AppColors.themedCardDecoration(context),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  l10n.keyPoints,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  _shortLabel(labelA),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _shortLabel(labelB),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < _labels.length; i++) ...<Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      _labels[i],
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textMuted(context),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _ScoreCell(score: values[i].$1),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _ScoreCell(score: values[i].$2),
                  ),
                ],
              ),
            ),

          ],
        ],
      ),
    );
  }
}

class _ScoreCell extends StatelessWidget {
  const _ScoreCell({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: '$score',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: '/100',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
