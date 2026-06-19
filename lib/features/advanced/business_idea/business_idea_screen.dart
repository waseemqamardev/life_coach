import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/score_gauge.dart';
import '../../../shared/widgets/widgets.dart';

class BusinessIdeaScreen extends StatefulWidget {
  const BusinessIdeaScreen({super.key});

  @override
  State<BusinessIdeaScreen> createState() => _BusinessIdeaScreenState();
}

class _BusinessIdeaScreenState extends State<BusinessIdeaScreen> {
  final TextEditingController _idea = TextEditingController();

  @override
  void dispose() {
    _idea.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.businessIdeaLeading,
      titleAccent: l10n.businessIdeaAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.describeBusinessIdea,
              style: AppTextStyles.h3
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          Text(l10n.businessIdeaSubtitle,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.textSecondary(context))),
          const SizedBox(height: 14),
          TextField(
            controller: _idea,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: l10n.businessIdeaHint,
            ),
          ),
          const SizedBox(height: 16),
          AppCard(
            child: Column(
              children: <Widget>[
                ScoreGauge(value: 76, size: 130),
                const SizedBox(height: 8),
                Text(l10n.viabilityScore,
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
                Text(l10n.scoreBreakdown,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 10),
                LabelledBar(
                    icon: Icons.public_rounded,
                    label: l10n.marketSize,
                    value: 80,
                    valueLabel: l10n.large,
                    color: AppColors.success),
                LabelledBar(
                    icon: Icons.people_outline_rounded,
                    label: l10n.competition,
                    value: 65,
                    valueLabel: l10n.moderate,
                    color: AppColors.warning),
                LabelledBar(
                    icon: Icons.attach_money_rounded,
                    label: l10n.profitability,
                    value: 72,
                    valueLabel: l10n.good,
                    color: AppColors.info),
                LabelledBar(
                    icon: Icons.flash_on_rounded,
                    label: l10n.executionEase,
                    value: 68,
                    valueLabel: l10n.medium,
                    color: AppColors.primaryPurple),
              ],
            ),
          ),
          const SizedBox(height: 14),
          WhyThisMatters(
            title: l10n.aiVerdict,
            body: l10n.businessIdeaVerdictBody,
            icon: Icons.smart_toy_rounded,
          ),
          const SizedBox(height: 18),
          GradientButton(
            label: l10n.generateFullPlan,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(l10n.fullPlanGenerated),
              ));
            },
          ),
        ],
      ),
    );
  }
}
