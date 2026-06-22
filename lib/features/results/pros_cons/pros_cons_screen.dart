import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';

import '../../../core/theme/app_colors.dart';

import '../../../core/theme/app_text_styles.dart';

import '../../../core/utils/decision_text.dart';

import '../../../core/utils/report_text.dart';

import '../../../data/models/decision.dart';

import '../../../providers/providers.dart';

import '../../../shared/widgets/app_screen.dart';

import '../shared/result_ui_widgets.dart';

class ProsConsScreen extends ConsumerStatefulWidget {
  const ProsConsScreen({super.key});

  @override
  ConsumerState<ProsConsScreen> createState() => _ProsConsScreenState();
}

class _ProsConsScreenState extends ConsumerState<ProsConsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final Decision? draft = ref.watch(draftDecisionProvider);

    final report = ref.watch(draftDecisionReportProvider);

    final int fitScore = DecisionText.fitScore(draft);

    final String badgeLabel = draft?.recommendationLabel.isNotEmpty == true
        ? draft!.recommendationLabel
        : l10n.bestOverallChoice;

    final List<String> pros = DecisionText.pros(draft);

    final List<String> cons = DecisionText.cons(draft);

    final String title = l10n.prosCons;

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
            title: l10n.overallProsConsTitle,
            subtitle: l10n.recommendedChoiceLabel,
            badgeLabel: badgeLabel,
            description: ReportText.summary(draft, report),
            fitScore: fitScore,
          ),
          const SizedBox(height: ResultUi.sectionGap),
          _ProsConsListCard(
            title: l10n.prosTitle,
            items: pros,
            iconColor: AppColors.success,
          ),
          const SizedBox(height: ResultUi.sectionGap),
          _ProsConsListCard(
            title: l10n.consTitle,
            items: cons,
            iconColor: AppColors.success,
          ),
        ],
      ),
    );
  }
}

class _ProsConsListCard extends StatelessWidget {
  const _ProsConsListCard({
    required this.title,
    required this.items,
    required this.iconColor,
  });

  final String title;

  final List<String> items;

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadowList(context),
      ),
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
          const SizedBox(height: 12),
          for (int i = 0; i < items.length; i++) ...<Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(top: 1),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: iconColor,
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
                    items[i],
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            if (i < items.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
