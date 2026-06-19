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
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/step_indicator.dart';
import '../../../shared/widgets/rtl_aware.dart';
import '../shared/result_ui_widgets.dart';

class DecisionResultScreen extends ConsumerStatefulWidget {
  const DecisionResultScreen({super.key});

  @override
  ConsumerState<DecisionResultScreen> createState() =>
      _DecisionResultScreenState();
}

class _DecisionResultScreenState extends ConsumerState<DecisionResultScreen> {

  static const Color _selectedFill = Color(0xFFEEEDFD);

  static List<BoxShadow> get _cardShadow => <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final Decision? draft = ref.watch(draftDecisionProvider);
    final DecisionReport? report = ref.watch(draftDecisionReportProvider);
    final int fitScore = DecisionText.fitScore(draft);
    final int riskScore = DecisionText.riskScore(draft);
    final int confidence = DecisionText.confidence(draft);
    final int benefitScore = _benefitScore(draft);
    final String recommendation = DecisionText.recommendation(draft, l10n);
    final String recommendationLabel =
        draft?.recommendationLabel.isNotEmpty == true
            ? draft!.recommendationLabel
            : l10n.bestOverallFit;

    return AppScreen(
      titleLeading: l10n.decisionResult,
      titleAccent: l10n.resultWord,
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StepIndicator(
            steps: l10n.wizardSteps,
            currentStep: 4,
            completedShowsNumber: true,
          ),
          const SizedBox(height: 24),
          RecommendedChoiceCard(
            recommendation: recommendation,
            recommendationLabel: recommendationLabel,
            fitScore: fitScore,
            description: ReportText.summary(draft, report),
            reasoning: ReportText.recommendationReasoning(draft, report),
            allOptions: draft?.options ?? const <String>[],
            headerLabel: l10n.recommendedChoice,
            scoreFooterLabel: l10n.fitScore,
          ),
          const SizedBox(height: 16),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _summaryScoreCard(
                    iconAsset: Assets.iconsRiskIconScore,
                    icon: Icons.warning_amber_rounded,
                    iconColor: AppColors.danger,
                    iconBg: const Color(0xFFFDECEC),
                    title: l10n.riskScore,
                    level: l10n.riskLevelLabel(riskScore),
                    levelColor: AppColors.danger,
                    value: '$riskScore/100',
                    onTap: () => context.push(AppRoutes.riskScore),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _summaryScoreCard(
                    iconAsset: Assets.iconsMediumScore,
                    icon: Icons.show_chart_rounded,
                    iconColor: AppColors.success,
                    iconBg: const Color(0xFFE7F8EE),
                    title: l10n.benefitScore,
                    level: l10n.scoreTier(benefitScore),
                    levelColor: AppColors.success,
                    value: '$benefitScore/100',
                    onTap: () => context.push(AppRoutes.outcomePrediction),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _summaryScoreCard(
                    iconAsset: Assets.iconsConfidenceHigh,
                    icon: Icons.speed_rounded,
                    iconColor: AppColors.primaryPurple,
                    iconBg: const Color(0xFFEEEDFD),
                    title: l10n.confidence,
                    level: l10n.confidenceTier(confidence),
                    levelColor: AppColors.primaryPurple,
                    value: '$confidence/100',
                    onTap: () => context.push(AppRoutes.confidenceMeter),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Image.asset(
                Assets.iconsResultBreak,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Text(
                l10n.resultBreakdown,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 3,
            childAspectRatio: 1.55,
            mainAxisExtent: 96,
            children: <Widget>[
              _breakdownTile(
                iconAsset: Assets.iconsFinal,
                icon: Icons.emoji_events_rounded,
                iconColor: AppColors.warning,
                iconBg: const Color(0xFFFFF7E6),
                title: _twoLineTitle(l10n.finalRecommendation),
                onTap: () => context.push(AppRoutes.finalRecommendation),
              ),
              _breakdownTile(
                iconAsset: Assets.iconsRiskIconScore,
                icon: Icons.warning_amber_rounded,
                iconColor: AppColors.danger,
                iconBg: const Color(0xFFFDECEC),
                title: _twoLineTitle(l10n.riskScore),
                onTap: () => context.push(AppRoutes.riskScore),
              ),
              _breakdownTile(
                iconAsset: Assets.iconsOutcome,
                icon: Icons.bar_chart_rounded,
                iconColor: AppColors.success,
                iconBg: const Color(0xFFE7F8EE),
                title: _twoLineTitle(l10n.outcomePrediction),
                onTap: () => context.push(AppRoutes.outcomePrediction),
              ),
              _breakdownTile(
                iconAsset: Assets.iconsConfidenceHigh,
                icon: Icons.speed_rounded,
                iconColor: AppColors.primaryPurple,
                iconBg: const Color(0xFFEEEDFD),
                title: _twoLineTitle(l10n.confidenceMeter),
                onTap: () => context.push(AppRoutes.confidenceMeter),
              ),
              _breakdownTile(
                iconAsset: Assets.iconsPlan,
                icon: Icons.checklist_rounded,
                iconColor: const Color(0xFF06B6D4),
                iconBg: const Color(0xFFE0F7FA),
                title: _twoLineTitle(l10n.actionPlan),
                onTap: () => context.push(AppRoutes.actionPlan),
              ),
              _breakdownTile(
                iconAsset: Assets.iconsPros,
                icon: Icons.balance_rounded,
                iconColor: AppColors.primaryPurple,
                iconBg: const Color(0xFFEEEDFD),
                title: _twoLineTitle(l10n.prosCons),
                onTap: () => context.push(AppRoutes.prosCons),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _aiTipCard(l10n, report, draft),
          const SizedBox(height: 24),
          _saveReportButton(
            label: l10n.saveReport,
            onTap: () => _saveReport(context, ref),
          ),
          const SizedBox(height: 12),
          _startNewDecisionButton(
            l10n: l10n,
            onTap: () {
              ref.read(draftDecisionProvider.notifier).clear();
              context.go(AppRoutes.startDecision);
            },
          ),
        ],
      ),
    );
  }

  static String _twoLineTitle(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return title;
    return '${title.substring(0, space)}\n${title.substring(space + 1)}';
  }

  static Future<void> _saveReport(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final Decision? draft = ref.read(draftDecisionProvider);
    if (draft == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.noReportToSave)),
      );
      return;
    }

    final report = ref.read(decisionRepositoryProvider).getReport(draft.id);
    await ref.read(decisionsProvider.notifier).save(draft, report: report);
    ref.read(draftDecisionProvider.notifier).clear();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.reportSaved)),
    );
    context.go(AppRoutes.history);
  }

  static int _benefitScore(Decision? draft) {
    if (draft == null || draft.overallScore == 0) return 0;
    return ((draft.overallScore + (100 - draft.riskScore)) / 2)
        .round()
        .clamp(0, 100);
  }

  Widget _summaryScoreCard({
    String? iconAsset,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String level,
    required Color levelColor,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _TintedIconBox(
            size: 36,
            background: iconBg,
            child: _ResultIcon(
              asset: iconAsset,
              fallback: icon,
              fallbackColor: iconColor,
              size: 22,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 4),
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
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _breakdownTile({
    String? iconAsset,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.only(left: 5,right: 2,top: 6,bottom: 12),
        decoration: BoxDecoration(
        color: AppColors.cardColor(context),
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.cardShadowList(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _TintedIconBox(
                  size: 34,
                  background: iconBg,
                  child: _ResultIcon(
                    asset: iconAsset,
                    fallback: icon,
                    fallbackColor: iconColor,
                    size: 20,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.selectedFillColor(context)),
                  child: Center(
                    child:                     RtlChevronIcon(
                      color: AppColors.textMuted(context),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              title,
              maxLines: 2,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _aiTipCard(AppLocalizations l10n, DecisionReport? report, Decision? draft) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Assets.iconsMatter,
            width: 72,
            height: 72,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.tipFromAi,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  ReportText.aiTip(draft, report),
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

  Widget _saveReportButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: AppColors.primaryTwoGradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              Assets.iconsReport,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.save_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _startNewDecisionButton({
    required AppLocalizations l10n,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.selectedFillColor(context),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: '${l10n.startNewDecision.replaceAll(l10n.decisionWord, '').trim()} ',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary(context),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: l10n.decisionWord,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.primaryPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              Assets.iconsRefreshIcon,
              width: 16,
              height: 16,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultIcon extends StatelessWidget {
  const _ResultIcon({
    this.asset,
    required this.fallback,
    required this.fallbackColor,
    required this.size,
  });

  final String? asset;
  final IconData fallback;
  final Color fallbackColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (asset == null) {
      return Icon(fallback, color: fallbackColor, size: size * 0.82);
    }
    return Image.asset(
      asset!,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
          Icon(fallback, color: fallbackColor, size: size * 0.82),
    );
  }
}

class _TintedIconBox extends StatelessWidget {
  const _TintedIconBox({
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
