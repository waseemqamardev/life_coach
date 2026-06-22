import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/decision_text.dart';
import '../../../data/models/decision.dart';
import '../../../generated/assets.dart';
import '../../../shared/widgets/rtl_aware.dart';

class ResultUi {
  ResultUi._();

  static Color selectedFill(BuildContext context) =>
      AppColors.selectedFillColor(context);

  static List<BoxShadow> cardShadow(BuildContext context) =>
      AppColors.cardShadowList(context);

  static const double sectionGap = 16;

  static int benefitScore(Decision? draft) => DecisionText.benefitScore(draft);

  static String riskLevel(int score) {
    if (score <= 35) return 'Low';
    if (score <= 65) return 'Medium';
    return 'High';
  }

  static String benefitLevel(int score) {
    if (score >= 70) return 'High';
    if (score >= 40) return 'Medium';
    return 'Low';
  }

  static String confidenceLevel(int score) {
    if (score >= 70) return 'High';
    if (score >= 40) return 'Medium';
    return 'Low';
  }
}

/// Bottom sheets and taps shared across result screens.
class ResultInteractions {
  ResultInteractions._();

  static void showDetailSheet(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.cardColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            16,
            20,
            MediaQuery.paddingOf(ctx).bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textMuted(context).withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                body,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted(context),
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showOptionsSheet(
    BuildContext context, {
    required List<String> options,
    required String recommended,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.cardColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            16,
            20,
            MediaQuery.paddingOf(ctx).bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Your options',
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              for (final String option in options) ...<Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(option),
                  trailing: option.trim().toLowerCase() ==
                          recommended.trim().toLowerCase()
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE7F8EE),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            'Recommended',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  static void showActionStepSheet(BuildContext context, ActionPlanStep step) {
    showDetailSheet(
      context,
      title: step.title,
      body: step.description,
    );
  }
}

class ResultHeroCard extends StatelessWidget {
  const ResultHeroCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badgeLabel,
    required this.description,
    required this.fitScore,
  });

  final String title;
  final String subtitle;
  final String badgeLabel;
  final String description;
  final int fitScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryTwoGradient,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  Assets.iconsTrophySolid,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary(context),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textMuted(context),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7F8EE),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            Assets.iconsBestOverall,
                            width: 10,
                            height: 10,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 3),
                          Flexible(
                            child: Text(
                              badgeLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Column(
                children: <Widget>[
                  FitScoreBadge(score: fitScore),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Text(
                  'Fit Score',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecommendedChoiceCard extends StatefulWidget {
  const RecommendedChoiceCard({
    super.key,
    required this.recommendation,
    required this.recommendationLabel,
    required this.fitScore,
    required this.description,
    this.reasoning,
    this.allOptions = const <String>[],
    this.headerLabel = 'Recommended Choice',
    this.showShadow = true,
    this.scoreFooterLabel = 'Fit Score',
  });

  final String recommendation;
  final String recommendationLabel;
  final int fitScore;
  final String description;
  final String? reasoning;
  final List<String> allOptions;
  final String headerLabel;
  final bool showShadow;
  final String scoreFooterLabel;

  @override
  State<RecommendedChoiceCard> createState() => _RecommendedChoiceCardState();
}

class _RecommendedChoiceCardState extends State<RecommendedChoiceCard> {
  bool _expanded = false;

  void _onArrowTap() {
    if (widget.allOptions.length > 1) {
      ResultInteractions.showOptionsSheet(
        context,
        options: widget.allOptions,
        recommended: widget.recommendation,
      );
      return;
    }
    setState(() => _expanded = !_expanded);
  }

  String get _bodyText {
    final String reasoning = widget.reasoning?.trim() ?? '';
    if (_expanded && reasoning.isNotEmpty) return reasoning;
    return widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: widget.showShadow ? ResultUi.cardShadow(context) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryTwoGradient,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  Assets.iconsTrophySolid,
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return AppColors.primaryTwoGradient
                            .createShader(bounds);
                      },
                      child: Text(
                        widget.headerLabel,
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          widget.recommendation,
                          maxLines: _expanded ? null : 2,
                          overflow: _expanded ? null : TextOverflow.ellipsis,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                       const SizedBox(width: 2,),
                        GestureDetector(
                          onTap: _onArrowTap,
                          child: AnimatedRotation(
                            turns: _expanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.cardColor(context),
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.textMuted(context),
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7F8EE),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            Assets.iconsBestOverall,
                            width: 10,
                            height: 10,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              widget.recommendationLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: <Widget>[
                  FitScoreBadge(score: widget.fitScore),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: widget.allOptions.length <= 1
                      ? () => setState(() => _expanded = !_expanded)
                      : null,
                  child: Text(
                    _bodyText,
                    maxLines: _expanded ? null : 2,
                    overflow: _expanded ? null : TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      height: 1.55,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Text(
                  widget.scoreFooterLabel,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResultSummaryScoreRow extends StatelessWidget {
  const ResultSummaryScoreRow({
    super.key,
    required this.riskScore,
    required this.benefitScore,
    required this.confidence,
    this.onRiskTap,
    this.onBenefitTap,
    this.onConfidenceTap,
  });

  final int riskScore;
  final int benefitScore;
  final int confidence;
  final VoidCallback? onRiskTap;
  final VoidCallback? onBenefitTap;
  final VoidCallback? onConfidenceTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: _SummaryScoreCard(
              iconAsset: Assets.iconsRiskIconScore,
              iconBg: const Color(0xFFFDECEC),
              title: l10n.riskScore,
              level: ResultUi.riskLevel(riskScore),
              levelColor: AppColors.danger,
              value: '$riskScore/100',
              onTap: onRiskTap,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _SummaryScoreCard(
              iconAsset: Assets.iconsMediumScore,
              iconBg: const Color(0xFFE7F8EE),
              title: l10n.benefitScore,
              level: ResultUi.benefitLevel(benefitScore),
              levelColor: AppColors.success,
              value: '$benefitScore/100',
              onTap: onBenefitTap,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _SummaryScoreCard(
              iconAsset: Assets.iconsConfidenceHigh,
              iconBg: const Color(0xFFEEEDFD),
              title: l10n.confidence,
              level: ResultUi.confidenceLevel(confidence),
              levelColor: AppColors.primaryPurple,
              value: '$confidence/100',
              onTap: onConfidenceTap,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionPlanTimeline extends StatelessWidget {
  const ActionPlanTimeline({
    super.key,
    required this.steps,
    this.onStepTap,
  });

  final List<ActionPlanStep> steps;
  final ValueChanged<ActionPlanStep>? onStepTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < steps.length; i++) ...<Widget>[
              _StepCircle(
                number: steps[i].number,
                color: steps[i].color,
              ),
              if (i < steps.length - 1)
                SizedBox(
                  height: 88,
                  width: 24,
                  child: CustomPaint(
                    painter: _DashedLinePainter(
                      color:
                          AppColors.textMuted(context).withValues(alpha: 0.45),
                    ),
                  ),
                ),
            ],
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < steps.length; i++) ...<Widget>[
                _ActionStepCard(
                  step: steps[i],
                  onTap: onStepTap == null
                      ? null
                      : () => onStepTap!(steps[i]),
                ),
                if (i < steps.length - 1) const SizedBox(height: 12),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class ActionPlanStep {
  const ActionPlanStep({
    required this.number,
    required this.title,
    required this.description,
    required this.color,
    required this.iconBg,
    required this.badge,
    required this.badgeColor,
    required this.badgeBg,
    this.iconAsset,
    required this.icon,
  });

  final int number;
  final String title;
  final String description;
  final Color color;
  final Color iconBg;
  final String badge;
  final Color badgeColor;
  final Color badgeBg;
  final String? iconAsset;
  final IconData icon;
}

class ActionPlanSteps {
  ActionPlanSteps._();

  static List<ActionPlanStep> fromDecision(Decision? draft) {
    final List<String> raw = draft?.actionPlan.isNotEmpty == true
        ? draft!.actionPlan
        : const <String>[
            'Plan — Define your next steps clearly and set your priorities.',
            'Prepare — Gather required resources and analyse all key factors.',
            'Execute — Take action and track progress consistently.',
          ];

    const List<
        ({
          String badge,
          Color color,
          Color bg,
          Color badgeColor,
          String? asset,
          IconData icon
        })> meta = <({
      String badge,
      Color color,
      Color bg,
      Color badgeColor,
      String? asset,
      IconData icon
    })>[
      (
        badge: 'Low Risk',
        color: AppColors.success,
        bg: Color(0xFFE7F8EE),
        badgeColor: AppColors.success,
        asset: Assets.iconsAcPlan,
        icon: Icons.track_changes_rounded,
      ),
      (
        badge: 'Next',
        color: AppColors.primaryPurple,
        bg: Color(0xFFEEEDFD),
        badgeColor: AppColors.primaryPurple,
        asset: Assets.iconsPrepare,
        icon: Icons.description_outlined,
      ),
      (
        badge: 'Later',
        color: AppColors.primaryBlue,
        bg: Color(0xFFE6F0FE),
        badgeColor: AppColors.primaryBlue,
        asset: Assets.iconsRocket,
        icon: Icons.rocket_launch_rounded,
      ),
    ];

    return List<ActionPlanStep>.generate(3, (int i) {
      final String line = i < raw.length ? raw[i] : raw.last;
      final List<String> parts = line.split(' — ');
      final String title = parts.first;
      final String desc =
          parts.length > 1 ? parts.sublist(1).join(' — ') : line;
      final ({
        String badge,
        Color color,
        Color bg,
        Color badgeColor,
        String? asset,
        IconData icon
      }) m = meta[i];

      return ActionPlanStep(
        number: i + 1,
        title: title,
        description: desc,
        color: m.color,
        iconBg: m.bg,
        badge: m.badge,
        badgeColor: m.badgeColor,
        badgeBg: m.bg,
        iconAsset: m.asset,
        icon: m.icon,
      );
    });
  }
}

class AiInsightCard extends StatelessWidget {
  const AiInsightCard({
    super.key,
    this.title = 'AI Insight',
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Assets.iconsMatter,
            width: 68,
            height: 68,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  body,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryScoreCard extends StatelessWidget {
  const _SummaryScoreCard({
    required this.iconAsset,
    required this.iconBg,
    required this.title,
    required this.level,
    required this.levelColor,
    required this.value,
    this.onTap,
  });

  final String iconAsset;
  final Color iconBg;
  final String title;
  final String level;
  final Color levelColor;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
      padding: const EdgeInsets.fromLTRB(10, 12, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: ResultUi.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconAsset,
              width: 22,
              height: 22,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            level,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              color: levelColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  const _StepCircle({required this.number, required this.color});

  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        '$number',
        style: AppTextStyles.bodySmall.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _ActionStepCard extends StatelessWidget {
  const _ActionStepCard({required this.step, this.onTap});

  final ActionPlanStep step;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: ResultUi.cardShadow(context),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: step.iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: step.iconAsset != null
                  ? Image.asset(
                      step.iconAsset!,
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        step.icon,
                        color: step.color,
                        size: 18,
                      ),
                    )
                  : Icon(step.icon, color: step.color, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    step.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.textPrimary(context),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    step.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RtlChevronIcon(
                  color: AppColors.textMuted(context),
                  size: 18,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: step.badgeBg,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    step.badge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: step.badgeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class FitScoreBadge extends StatelessWidget {
  const FitScoreBadge({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ScallopedBadgePainter(),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$score',
              style: AppTextStyles.h4.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w700,
                fontSize: 22,
                height: 1,
              ),
            ),
            Text(
              '/100',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted(context),
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const double dash = 3;
    const double gap = 3;
    double y = 0;
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.5;
    while (y < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, math.min(y + dash, size.height)),
        paint,
      );
      y += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScallopedBadgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double outerRadius = size.width / 2 - 1;
    final double innerRadius = outerRadius * 0.86;
    const int bumps = 14;
    final Path path = Path();

    for (int i = 0; i < bumps * 2; i++) {
      final double angle = (i * math.pi / bumps) - (math.pi / 2);
      final double radius = i.isEven ? outerRadius : innerRadius;
      final Offset point =
          center + Offset(math.cos(angle) * radius, math.sin(angle) * radius);
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();
    canvas.drawShadow(
      path,
      Colors.black.withValues(alpha: 0.08),
      2,
      false,
    );
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
