import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';

class DailyDecisionScreen extends StatelessWidget {
  const DailyDecisionScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppScreen(
      titleLeading: _titleLeading(l10n.dailyDecision),
      titleAccent: _titleAccent(l10n.dailyDecision),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCard(
            color: AppColors.softPrimary(context),
            borderColor: Colors.transparent,
            child: Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.calendar_today_rounded,
                      color: Colors.white),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.todaysDecisionPrompt,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context))),
                      const SizedBox(height: 4),
                      Text(l10n.dailyDecisionExerciseSub,
                          style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.dailyDecisionQuestion,
                    style: AppTextStyles.h3
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 12),
                Text(l10n.dailyDecisionScenario,
                    style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary(context))),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                                color: AppColors.borderColor(context)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(l10n.no,
                              style: AppTextStyles.buttonText.copyWith(
                                  color: AppColors.danger))),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: AppColors.success,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(l10n.yes,
                            style: AppTextStyles.buttonText
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GradientButton(
              label: l10n.seeAiAnalysis,
              trailingArrow: true,
              onPressed: () => context.push(AppRoutes.startDecision)),
        ],
      ),
    );
  }
}
