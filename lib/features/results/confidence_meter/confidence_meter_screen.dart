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

class ConfidenceMeterScreen extends ConsumerStatefulWidget {
  const ConfidenceMeterScreen({super.key});

  @override
  ConsumerState<ConfidenceMeterScreen> createState() => _ConfidenceMeterScreenState();
}

class _ConfidenceMeterScreenState extends ConsumerState<ConfidenceMeterScreen> {

  static const Color _selectedFill = Color(0xFFEEEDFD);
  static const double _sectionGap = 16;

  static List<
      ({
        String label,
        String? asset,
        IconData icon,
        Color color,
        Color bg,
        int percent,
      })> _breakdownItems(AppLocalizations l10n) => <
      ({
        String label,
        String? asset,
        IconData icon,
        Color color,
        Color bg,
        int percent,
      })>[
    (
      label: l10n.outcomeConsistency,
      asset: Assets.iconsLow,
      icon: Icons.shield_outlined,
      color: AppColors.success,
      bg: Color(0xFFE7F8EE),
      percent: 80,
    ),
    (
      label: l10n.riskAssessment,
      asset: Assets.iconsMarkerRisk,
      icon: Icons.warning_amber_rounded,
      color: AppColors.danger,
      bg: Color(0xFFFDECEC),
      percent: 20,
    ),
    (
      label: l10n.historicalSimilarity,
      asset: Assets.iconsTimeRsik,
      icon: Icons.schedule_rounded,
      color: AppColors.primaryPurple,
      bg: Color(0xFFEEEDFD),
      percent: 45,
    ),
    (
      label: l10n.relevanceMatch,
      asset: Assets.iconsExecutionRisk,
      icon: Icons.track_changes_rounded,
      color: AppColors.primaryBlue,
      bg: Color(0xFFE6F0FE),
      percent: 75,
    ),
    (
      label: l10n.dataQuality,
      asset: Assets.iconsPersonalRsik,
      icon: Icons.groups_outlined,
      color: AppColors.warning,
      bg: Color(0xFFFFF7E6),
      percent: 90,
    ),
  ];

  static const List<
      ({
        String range,
        String level,
        String description,
        Color color,
        Color bg,
      })> _interpretationItems = <
      ({
        String range,
        String level,
        String description,
        Color color,
        Color bg,
      })>[
    (
      range: '80%-100%',
      level: 'Low',
      description: 'Generally reliable recommend',
      color: AppColors.success,
      bg: Color(0xFFE7F8EE),
    ),
    (
      range: '60%-79%',
      level: 'Moderate',
      description: 'Generally reliable with some risks',
      color: AppColors.primaryBlue,
      bg: Color(0xFFE6F0FE),
    ),
    (
      range: '40%-59%',
      level: 'Low',
      description: 'Consider risks carefully',
      color: AppColors.warning,
      bg: Color(0xFFFFF7E6),
    ),
    (
      range: '0%-39%',
      level: 'Very Low',
      description: 'High uncertainty cautiously',
      color: AppColors.danger,
      bg: Color(0xFFFDECEC),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final Decision? draft = ref.watch(draftDecisionProvider);
    final DecisionReport? report = ref.watch(draftDecisionReportProvider);
    final int confidence = DecisionText.confidence(draft);
    final String recommendationLabel =
        draft?.recommendationLabel.isNotEmpty == true
            ? draft!.recommendationLabel
            : l10n.bestOverallChoice;
    final String title = l10n.confidenceMeter;
    final int space = title.lastIndexOf(' ');

    return AppScreen(
      titleLeading: space < 0 ? title : title.substring(0, space),
      titleAccent: space < 0 ? '' : title.substring(space + 1),
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _overallConfidenceCard(
            l10n: l10n,
            recommendationLabel: recommendationLabel,
            fitScore: confidence,
            description: ReportText.confidenceSummary(draft, report),
          ),
          const SizedBox(height: _sectionGap),
          Text(
            l10n.confidenceBreakdown,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < _breakdownItems(l10n).length; i++) ...<Widget>[
            _confidenceBreakdownRow(
              item: _breakdownItems(l10n)[i],
              percent: ReportText.confidenceSubScore(draft, report, i),
            ),
            if (i < _breakdownItems(l10n).length - 1) const SizedBox(height: 14),
          ],
          const SizedBox(height: _sectionGap),
          Text(
            l10n.confidenceInterpretation,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (int i = 0; i < _interpretationItems.length; i++) ...<Widget>[
                  Expanded(
                    child: _interpretationCard(item: _interpretationItems[i]),
                  ),
                  if (i < _interpretationItems.length - 1)
                    const SizedBox(width: 6),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _overallConfidenceCard({
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
                      l10n.overallConfidence,
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
                    fontSize: 12,
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
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
  Widget _confidenceBreakdownRow({
    required ({
      String label,
      String? asset,
      IconData icon,
      Color color,
      Color bg,
      int percent,
    }) item,
    required int percent,
  }) {
    final double progress = percent / 100;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SquareIconBadge(
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
          const SizedBox(width: 12),
          SizedBox(
            width: 84,
            child: Text(
              item.label,
              maxLines: 2,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: 4,
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: const Color(0xFFE8E8E8),
                        valueColor: AlwaysStoppedAnimation<Color>(item.color),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$percent%',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: item.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _interpretationCard({
    required ({
      String range,
      String level,
      String description,
      Color color,
      Color bg,
    }) item,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 9, 5, 7),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 2
          )
        ]
        // border: Border.all(color: AppColors.borderColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(Assets.iconsBestOverall,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            color: item.color,
          ),
          const SizedBox(height: 4),
          Text(
            item.range,
            style: AppTextStyles.bodySmall.copyWith(
              color: item.color,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.level,
            style: AppTextStyles.bodySmall.copyWith(
              color: item.color,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              item.description,
              maxLines: 4,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted(context),
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
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
