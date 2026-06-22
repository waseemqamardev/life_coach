import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../shared/widgets/ai_insight_card.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../../../shared/widgets/insights_hero_card.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/widgets/rtl_aware.dart';

class DailySuggestionScreen extends StatelessWidget {
  const DailySuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.scaffoldColor(context),
      bottomNavigationBar: AppBottomNav.forScaffold(
        context,
        currentIndex: 2,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _InsightsAppBar(title: l10n.insightsTitle),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20,
                  12,
                  20,
                  AppBottomNav.contentBottomPadding(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const InsightsHeroCard(),
                    const SizedBox(height: 16),
                    AiInsightCard(
                      title: l10n.insightCompoundTitle,
                      message: l10n.insightCompoundMessage,
                      icon: Icons.lightbulb_outline_rounded,
                      accentColor: AppColors.warning,
                    ),
                    const SizedBox(height: 12),
                    AiInsightCard(
                      title: l10n.insightParalysisTitle,
                      message: l10n.insightParalysisMessage,
                      icon: Icons.psychology_alt_rounded,
                      accentColor: AppColors.primaryPurple,
                    ),
                    const SizedBox(height: 12),
                    AiInsightCard(
                      title: l10n.insightRiskStressTitle,
                      message: l10n.insightRiskStressMessage,
                      icon: Icons.shield_outlined,
                      accentColor: AppColors.success,
                    ),
                    const SizedBox(height: 12),
                    AiInsightCard(
                      title: l10n.insightFutureYouTitle,
                      message: l10n.insightFutureYouMessage,
                      icon: Icons.access_time_rounded,
                      accentColor: AppColors.info,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      child: Row(
                        children: <Widget>[
                          TintedIcon(
                            icon: Icons.local_fire_department_rounded,
                            color: AppColors.danger,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n.streakDays(5),
                                  style: AppTextStyles.h4.copyWith(
                                    color: AppColors.textPrimary(context),
                                  ),
                                ),
                                Text(
                                  l10n.streakKeepGoing,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightsAppBar extends StatelessWidget {
  const _InsightsAppBar({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 4, 0),
      child: Row(
        children: <Widget>[
          // RtlBackIconButton(
          //   onPressed: () {
          //     if (context.canPop()) {
          //       context.pop();
          //     }
          //   },
          //   size: 22,
          // ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.h3.copyWith(
                color: AppColors.appBarAccentColor(context),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          PopupMenuButton<String>(
            offset: const Offset(0, 42),
            icon: Icon(
              Icons.more_vert_rounded,
              color: AppColors.appBarIconColor(context),
              size: 22,
            ),
            color: AppColors.cardColor(context),
            elevation: 10,
            shadowColor: Colors.black.withValues(alpha: 0.14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                height: 46,
                enabled: false,
                child: Text(
                  l10n.moreOptionsComingSoon,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
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
