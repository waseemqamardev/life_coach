import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/decision_text.dart';
import '../../../core/utils/report_text.dart';
import '../../../data/models/ai/decision_report.dart';
import '../../../data/models/decision.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';

class OutcomePredictionScreen extends ConsumerStatefulWidget {
  const OutcomePredictionScreen({super.key});

  @override
  ConsumerState<OutcomePredictionScreen> createState() => _OutcomePredictionScreenState();
}

class _OutcomePredictionScreenState extends ConsumerState<OutcomePredictionScreen> {

  static const Color _selectedFill = Color(0xFFEEEDFD);
  static const double _sectionGap = 16;

  static List<BoxShadow> get _cardShadow => <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];

  static List<
      ({
        String label,
        String? asset,
        IconData icon,
        Color color,
        Color bg,
        String status,
        double progress,
      })> _factorItems(AppLocalizations l10n) => <({
    String label,
    String? asset,
    IconData icon,
    Color color,
    Color bg,
    String status,
    double progress,
  })>[
    (
      label: l10n.financialImpact,
      asset: Assets.iconsLow,
      icon: Icons.shield_outlined,
      color: AppColors.success,
      bg: Color(0xFFE7F8EE),
      status: l10n.high,
      progress: 0.6,
    ),
    (
      label: l10n.riskLevel,
      asset: Assets.iconsMarkerRisk,
      icon: Icons.warning_amber_rounded,
      color: AppColors.danger,
      bg: Color(0xFFFDECEC),
      status: l10n.medium,
      progress: 0.6,
    ),
    (
      label: l10n.timeInvestment,
      asset: Assets.iconsTimeRsik,
      icon: Icons.schedule_rounded,
      color: AppColors.primaryPurple,
      bg: Color(0xFFEEEDFD),
      status: l10n.low,
      progress: 0.6,
    ),
    (
      label: l10n.longTermSustainability,
      asset: Assets.iconsExecutionRisk,
      icon: Icons.track_changes_rounded,
      color: AppColors.primaryBlue,
      bg: Color(0xFFE6F0FE),
      status: l10n.high,
      progress: 0.6,
    ),
    (
      label: l10n.personalGrowth,
      asset: Assets.iconsPersonalRsik,
      icon: Icons.groups_outlined,
      color: AppColors.warning,
      bg: Color(0xFFFFF7E6),
      status: l10n.high,
      progress: 0.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final Decision? draft = ref.watch(draftDecisionProvider);
    final DecisionReport? report = ref.watch(draftDecisionReportProvider);
    final int fitScore = DecisionText.fitScore(draft);
    final int successLikelihood = ReportText.successLikelihood(draft, report);
    final String summary = ReportText.summary(draft, report);
    final int positivePercent = ReportText.positiveOutcome(draft, report);
    final int neutralPercent = ReportText.neutralOutcome(draft, report);
    final int negativePercent = ReportText.negativeOutcome(draft, report);
    final String recommendationLabel =
        draft?.recommendationLabel.isNotEmpty == true
            ? draft!.recommendationLabel
            : l10n.bestOverallChoice;
    final String title = l10n.outcomePrediction;
    final int space = title.lastIndexOf(' ');

    return AppScreen(
      titleLeading: space < 0 ? title : title.substring(0, space),
      titleAccent: space < 0 ? '' : title.substring(space + 1),
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _overallPredictionCard(
            l10n: l10n,
            recommendationLabel: recommendationLabel,
            fitScore: fitScore,
            description: summary,
          ),
          const SizedBox(height: _sectionGap),
          _successLikelihoodCard(
            l10n: l10n,
            likelihood: successLikelihood,
            description: draft?.outcomePrediction.trim().isNotEmpty == true
                ? draft!.outcomePrediction.trim()
                : summary,
          ),
          const SizedBox(height: _sectionGap),
          Row(
            children: <Widget>[
              Image.asset(
                Assets.iconsOutcome,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.show_chart_rounded,
                  color: AppColors.success,
                  size: 22,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                l10n.outcomeBreakdown,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _outcomeBreakdownCard(
                    icon: Icons.trending_up_rounded,
                    iconColor: AppColors.success,
                    percent: positivePercent,
                    title: l10n.positiveOutcome,
                    titleColor: AppColors.success,
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: _outcomeBreakdownCard(
                    icon: Icons.remove_circle_outline_rounded,
                    iconColor: AppColors.primaryPurple,
                    percent: neutralPercent,
                    title: l10n.neutralOutcome,
                    titleColor: AppColors.primaryPurple,
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: _outcomeBreakdownCard(
                    icon: Icons.trending_down_rounded,
                    iconColor: AppColors.danger,
                    percent: negativePercent,
                    title: l10n.negativeOutcome,
                    titleColor: AppColors.danger,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: _sectionGap),
          Text(
            l10n.keyOutcomeFactors,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < _factorItems(l10n).length; i++) ...<Widget>[
            _outcomeFactorRow(item: _factorItems(l10n)[i]),
            if (i < _factorItems(l10n).length - 1) const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }

  Widget _overallPredictionCard({
    required AppLocalizations l10n,
    required String recommendationLabel,
    required int fitScore,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(12),
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
                      l10n.overallPrediction,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary(context),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.recommendedChoiceLabel,
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
                              recommendationLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w500,
                                fontSize: 9,
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
                  _FitScoreBadge(score: fitScore),
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
                    fontSize: 10,
                    height: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Text(
                  l10n.fitScore,
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
  Widget _successLikelihoodCard({
    required AppLocalizations l10n,
    required int likelihood,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.successLikelihood,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  maxLines: 2,
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
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$likelihood%',
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                l10n.scoreTier(likelihood),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _outcomeBreakdownCard({
    required IconData icon,
    required Color iconColor,
    required int percent,
    required String title,
    required Color titleColor,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 24),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor(context)),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, color: iconColor, size: 16),
              const SizedBox(width: 4),
              Text(
                '$percent%',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: titleColor,
              fontWeight: FontWeight.w600,
              fontSize: 9,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _outcomeFactorRow({
    required ({
      String label,
      String? asset,
      IconData icon,
      Color color,
      Color bg,
      String status,
      double progress,
    }) item,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: _SquareIconBadge(
            size: 34,
            background: item.bg,
            child: item.asset != null
                ? Image.asset(
                    item.asset!,
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      item.icon,
                      color: item.color,
                      size: 16,
                    ),
                  )
                : Icon(item.icon, color: item.color, size: 16),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width:88,
                    child: Text(
                      item.label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary(context),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: 4,
                        child: LinearProgressIndicator(
                          value: item.progress,
                          backgroundColor: const Color(0xFFE8E8E8),
                          valueColor: AlwaysStoppedAnimation<Color>(item.color),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  item.status,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: item.color,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SquareIconBadge extends StatelessWidget {
  const _SquareIconBadge({
    required this.size,
    required this.background,
    required this.child,
  });

  final double size;
  final Color background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class _FitScoreBadge extends StatelessWidget {
  const _FitScoreBadge({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ScallopedBadgePainter(),
      child: SizedBox(
        width: 64,
        height: 64,
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
      final Offset point = center +
          Offset(
            math.cos(angle) * radius,
            math.sin(angle) * radius,
          );
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
    canvas.drawPath(
      path,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
