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

class RiskScoreScreen extends ConsumerStatefulWidget {
  const RiskScoreScreen({super.key});

  @override
  ConsumerState<RiskScoreScreen> createState() => _RiskScoreScreenState();
}

class _RiskScoreScreenState extends ConsumerState<RiskScoreScreen> {

  static const Color _selectedFill = Color(0xFFEEEDFD);
  static const double _sectionGap = 16;

  static List<BoxShadow> get _cardShadow => <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];

  static List<({String label, String? asset, IconData icon, Color color, Color bg})>
      _breakdownItems(AppLocalizations l10n) =>
      <({String label, String? asset, IconData icon, Color color, Color bg})>[
    (
      label: l10n.financialRisk,
      asset: Assets.iconsBestOverall,
      icon: Icons.shield_outlined,
      color: AppColors.success,
      bg: Color(0xFFE7F8EE),
    ),
    (
      label: l10n.marketRisk,
      asset: Assets.iconsMarkerRisk,
      icon: Icons.warning_amber_rounded,
      color: AppColors.danger,
      bg: Color(0xFFFDECEC),
    ),
    (
      label: l10n.timeRisk,
      asset: Assets.iconsTimeRsik,
      icon: Icons.schedule_rounded,
      color: AppColors.primaryPurple,
      bg: Color(0xFFEEEDFD),
    ),
    (
      label: l10n.executionRisk,
      asset: Assets.iconsExecutionRisk,
      icon: Icons.track_changes_rounded,
      color: AppColors.primaryBlue,
      bg: Color(0xFFE6F0FE),
    ),
    (
      label: l10n.personalRisk,
      asset: Assets.iconsPersonalRsik,
      icon: Icons.groups_outlined,
      color: AppColors.warning,
      bg: Color(0xFFFFF7E6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final Decision? draft = ref.watch(draftDecisionProvider);
    final DecisionReport? report = ref.watch(draftDecisionReportProvider);
    final int riskScore = DecisionText.riskScore(draft);
    final String riskLabel = DecisionText.riskLabel(draft, l10n);
    final String riskTitle = l10n.riskScore;
    final int leadingSpace = riskTitle.lastIndexOf(' ');

    return AppScreen(
      titleLeading:
          leadingSpace < 0 ? riskTitle : riskTitle.substring(0, leadingSpace),
      titleAccent: leadingSpace < 0 ? '' : riskTitle.substring(leadingSpace + 1),
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _overallRiskCard(
            l10n: l10n,
            riskLabel: riskLabel,
            fitScore: riskScore,
            description: ReportText.riskInterpretation(draft, report, l10n),
          ),
          const SizedBox(height: _sectionGap),
          Row(
            children: <Widget>[
              Image.asset(
                Assets.iconsRiskIconScore,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.danger,
                  size: 22,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                l10n.riskBreakdown,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          for (int i = 0; i < _breakdownItems(l10n).length; i++) ...<Widget>[
            _riskBreakdownRow(
              item: _breakdownItems(l10n)[i],
              score: ReportText.riskSubScore(draft, report, i),
            ),
            if (i < _breakdownItems(l10n).length - 1) const SizedBox(height: 14),
          ],
          const SizedBox(height: _sectionGap),
          _interpretationCard(l10n, report, draft),
          const SizedBox(height: _sectionGap),
          _howToImproveCard(l10n),
        ],
      ),
    );
  }

  static int _subScore(int index, Decision? draft) {
    if (draft == null || draft.riskScore == 0) return 0;
    const List<int> offsets = <int>[0, 6, -4, 8, -6];
    return (draft.riskScore + offsets[index]).clamp(0, 100);
  }

  Widget _overallRiskCard({
    required AppLocalizations l10n,
    required String riskLabel,
    required int fitScore,
    required String description,
  }) {
    final bool isLowRisk = riskLabel.toLowerCase().contains('low');
    final Color badgeColor = isLowRisk ? AppColors.success : AppColors.danger;
    final Color badgeBg =
    isLowRisk ? const Color(0xFFE7F8EE) : const Color(0xFFFDECEC);

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
                      l10n.overallRiskScore,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary(context),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.yourDecisionRiskLevel,
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
                        color: badgeBg,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        riskLabel,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: badgeColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                        ),
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
                  l10n.riskScore,
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

  Widget _riskBreakdownRow({
    required ({String label, String? asset, IconData icon, Color color, Color bg})
        item,
    required int score,
  }) {
    final double progress = score / 100;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            const  SizedBox(height: 15,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    item.label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: 4,
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: const Color(0xFFE8E8E8),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(item.color),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: '$score',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: item.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                      TextSpan(
                        text: '/100',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textMuted(context),
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _interpretationCard(
    AppLocalizations l10n,
    DecisionReport? report,
    Decision? draft,
  ) {
    final String text = ReportText.riskInterpretation(draft, report, l10n);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _SquareIconBadge(
            size: 38,
            background: const Color(0xFFE7F8EE),
            child: Image.asset(
              Assets.iconsBestOverall,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.shield_outlined,
                color: AppColors.success,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.riskInterpretation,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _howToImproveCard(AppLocalizations l10n) {
    final List<String> tips =
        DecisionText.riskImproveTips(ref.read(draftDecisionProvider), l10n);
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.howToImprove,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          for (int i = 0; i < tips.length; i++) ...<Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(top: 1),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tips[i],
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            if (i < tips.length - 1) const SizedBox(height: 12),
          ],
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
