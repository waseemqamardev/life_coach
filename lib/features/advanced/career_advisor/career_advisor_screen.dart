import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/score_gauge.dart';
import '../../../shared/widgets/widgets.dart';

class CareerAdvisorScreen extends StatelessWidget {
  const CareerAdvisorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.careerAdvisorLeading,
      titleAccent: l10n.careerAdvisorAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCard(
            child: Column(
              children: <Widget>[
                ScoreGauge(value: 84, size: 130),
                const SizedBox(height: 8),
                Text(l10n.careerFitScore,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.topPathProductManager,
                    style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary(context))),
                const SizedBox(height: 8),
                Text(l10n.careerAdvisorDescription,
                    style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary(context))),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.skillMatch,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 10),
                LabelledBar(
                    icon: Icons.psychology_alt_rounded,
                    label: l10n.strategyLabel,
                    value: 88,
                    valueLabel: l10n.high,
                    color: AppColors.success),
                LabelledBar(
                    icon: Icons.people_outline_rounded,
                    label: l10n.communicationLabel,
                    value: 92,
                    valueLabel: l10n.excellent,
                    color: AppColors.success),
                LabelledBar(
                    icon: Icons.bar_chart_rounded,
                    label: l10n.analyticsLabel,
                    value: 70,
                    valueLabel: l10n.good,
                    color: AppColors.info),
                LabelledBar(
                    icon: Icons.code_rounded,
                    label: l10n.technicalLabel,
                    value: 62,
                    valueLabel: l10n.moderate,
                    color: AppColors.warning),
              ],
            ),
          ),
          const SizedBox(height: 14),
          WhyThisMatters(
            title: l10n.nextSteps,
            body: l10n.careerAdvisorNextStepsBody,
          ),
          const SizedBox(height: 18),
          GradientButton(
            label: l10n.build90DayPlan,
            trailingArrow: true,
            onPressed: () => context.push(AppRoutes.actionPlan),
          ),
        ],
      ),
    );
  }
}
