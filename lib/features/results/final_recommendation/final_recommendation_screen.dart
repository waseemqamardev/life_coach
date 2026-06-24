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
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/rtl_aware.dart';
import '../shared/result_ui_widgets.dart';

class FinalRecommendationScreen extends ConsumerStatefulWidget {
  const FinalRecommendationScreen({super.key});

  @override
  ConsumerState<FinalRecommendationScreen> createState() => _FinalRecommendationScreenState();
}

class _FinalRecommendationScreenState extends ConsumerState<FinalRecommendationScreen> {

  static const double _sectionGap = 16;

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
    final String decisionTitle = DecisionText.decisionTitle(draft, l10n);
    final String riskLabel = DecisionText.riskLabel(draft, l10n);
    final List<String> reasons = ReportText.whyRecommended(draft, report);
    final String timeAgo = _timeAgo(draft?.createdAt ?? DateTime.now());

    return AppScreen(
      titleLeading: _titleLeading(l10n.finalRecommendation),
      titleAccent: _titleAccent(l10n.finalRecommendation),
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RecommendedChoiceCard(
            recommendation: recommendation,
            recommendationLabel: recommendationLabel,
            fitScore: fitScore,
            description: ReportText.summary(draft, report),
            reasoning: ReportText.recommendationReasoning(draft, report),
            allOptions: draft?.options ?? const <String>[],
            showShadow: false,
            headerLabel: l10n.recommendedChoice,
            scoreFooterLabel: l10n.fitScore,
          ),
          const SizedBox(height: _sectionGap),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _summaryScoreCard(
                    iconAsset: Assets.iconsRiskIconScore,
                    iconBg: const Color(0xFFFDECEC),
                    title: l10n.riskScore,
                    level: l10n.riskLevelLabel(riskScore),
                    levelColor: AppColors.danger,
                    value: '$riskScore/100',
                    onTap: () => context.push(AppRoutes.riskScore),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _summaryScoreCard(
                    iconAsset: Assets.iconsMediumScore,
                    iconBg: const Color(0xFFE7F8EE),
                    title: l10n.benefitScore,
                    level: l10n.scoreTier(benefitScore),
                    levelColor: AppColors.success,
                    value: '$benefitScore/100',
                    onTap: () => context.push(AppRoutes.outcomePrediction),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _summaryScoreCard(
                    iconAsset: Assets.iconsConfidenceHigh,
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
          const SizedBox(height: _sectionGap),
          _decisionSummaryCard(
            title: decisionTitle,
            riskLabel: riskLabel,
            description: draft?.description.trim().isNotEmpty == true
                ? draft!.description.trim()
                : ReportText.summary(draft, report),
            timeAgo: timeAgo,
            onTap: () => context.push(AppRoutes.compareDecisions),
          ),
          const SizedBox(height: _sectionGap),
          _whyRecommendedCard(l10n, reasons: reasons),
        ],
      ),
    );
  }

  static String _titleLeading(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return title;
    return title.substring(0, space);
  }

  static String _titleAccent(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return '';
    return title.substring(space + 1);
  }

  static int _benefitScore(Decision? draft) {
    if (draft == null || draft.overallScore == 0) return 0;
    return ((draft.overallScore + (100 - draft.riskScore)) / 2)
        .round()
        .clamp(0, 100);
  }

  static String _timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes.clamp(1, 59)} min ago';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours} hour ago';
    }
    return '${diff.inDays} day ago';
  }

  Widget _summaryScoreCard({
    required String iconAsset,
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
      padding: const EdgeInsets.fromLTRB(10, 12, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _CircleIconBadge(
            size: 38,
            background: iconBg,
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
              fontSize: 10,
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

  Widget _decisionSummaryCard({
    required String title,
    required String riskLabel,
    required String description,
    required String timeAgo,
    VoidCallback? onTap,
  }) {
    final bool isLowRisk = riskLabel.toLowerCase().contains('low');
    final Color riskColor = isLowRisk ? AppColors.success : AppColors.danger;
    final Color riskBg =
        isLowRisk ? const Color(0xFFE7F8EE) : const Color(0xFFFDECEC);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        
              Image.asset(Assets.imagesPurpleBulb,
              width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.textPrimary(context),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: riskBg,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          riskLabel,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: riskColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        Assets.iconsMageCalendar,
                        width: 12,
                        height: 12,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        timeAgo,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textMuted(context),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: RtlChevronIcon(
                size: 26,
                color: AppColors.textMuted(context),
              ),
            ),
        
          ],
        ),
      ),
    ),
    );
  }

  Widget _whyRecommendedCard(
    AppLocalizations l10n, {
    required List<String> reasons,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadowList(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryTwoGradient,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.thumb_up_alt_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l10n.whyRecommended,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          for (int i = 0; i < reasons.length; i++) ...<Widget>[
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
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    reasons[i],
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            if (i < reasons.length - 1) const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }
}

class _CircleIconBadge extends StatelessWidget {
  const _CircleIconBadge({
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
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
