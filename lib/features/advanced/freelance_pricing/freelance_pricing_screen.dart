import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/score_gauge.dart';
import '../../../shared/widgets/widgets.dart';

class FreelancePricingScreen extends StatelessWidget {
  const FreelancePricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.freelancePricingLeading,
      titleAccent: l10n.freelancePricingAccent,
      subtitle: l10n.freelancePricingSubtitle,
      trailing: IconButton(
        icon: const Icon(Icons.attach_money_rounded,
            color: AppColors.success),
        onPressed: () {},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCard(
            child: Row(
              children: <Widget>[
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(14)),
                  child: const Icon(Icons.web_rounded,
                      color: Colors.white, size: 26),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Website Design Project',
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context))),
                      Text('40 hours • Mid-complexity',
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
              children: <Widget>[
                Text(l10n.recommendedPrice,
                    style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary(context))),
                const SizedBox(height: 4),
                Text(r'$2,500 – $3,200',
                    style: AppTextStyles.h1
                        .copyWith(color: AppColors.success)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ScoreGauge(value: 89, size: 110),
                  ],
                ),
                const SizedBox(height: 4),
                Text(l10n.pricingScore,
                    style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary(context))),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.priceComparison,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    _priceCol(context, l10n.priceLower, r'$1,800', 'Win 92%',
                        r'Profit $720', AppColors.warning),
                    _priceCol(context, l10n.priceRecommended, r'$2,800',
                        'Win 71%', r'Profit $1,680', AppColors.primaryPurple,
                        highlight: true),
                    _priceCol(context, l10n.priceHigher, r'$3,800', 'Win 45%',
                        r'Profit $2,420', AppColors.info),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.priceDrivers,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 12),
                LabelledBar(
                    icon: Icons.bar_chart_rounded,
                    label: l10n.marketRate,
                    value: 80,
                    valueLabel: l10n.high,
                    color: AppColors.primaryPurple),
                LabelledBar(
                    icon: Icons.workspace_premium_rounded,
                    label: l10n.experienceLabel,
                    value: 75,
                    valueLabel: l10n.experienceAdvanced,
                    color: AppColors.info),
                LabelledBar(
                    icon: Icons.schedule_rounded,
                    label: l10n.timelineLabel,
                    value: 60,
                    valueLabel: l10n.timeModerateAvail,
                    color: AppColors.warning),
                LabelledBar(
                    icon: Icons.layers_rounded,
                    label: l10n.complexityLabel,
                    value: 68,
                    valueLabel: l10n.medium,
                    color: AppColors.success),
                LabelledBar(
                    icon: Icons.diamond_outlined,
                    label: l10n.projectValue,
                    value: 82,
                    valueLabel: l10n.high,
                    color: AppColors.primaryPurple),
              ],
            ),
          ),
          const SizedBox(height: 14),
          WhyThisMatters(
            title: l10n.aiRecommendation,
            body: l10n.freelancePricingRecommendationBody,
            icon: Icons.smart_toy_rounded,
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.actionPlan,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 8),
                for (final ({String step, String body}) s
                    in <({String step, String body})>[
                  (step: '1', body: 'Send a detailed scope of work doc.'),
                  (step: '2', body: r'Propose $2,800 fixed with 50% upfront.'),
                  (step: '3', body: "If pushed, offer a phased plan, not a discount."),
                ])
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.softPrimary(context),
                              shape: BoxShape.circle),
                          child: Text(s.step,
                              style: AppTextStyles.caption.copyWith(
                                  color: AppColors.primaryPurple,
                                  fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(s.body,
                              style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textPrimary(context))),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GradientButton(
              label: l10n.sendProposal,
              icon: Icons.send_rounded,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(l10n.proposalSent),
                ));
              }),
        ],
      ),
    );
  }

  Widget _priceCol(BuildContext c, String label, String price, String win,
      String profit, Color color,
      {bool highlight = false}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: highlight
              ? AppColors.softPrimary(c)
              : Colors.transparent,
          border: Border.all(
              color: highlight
                  ? AppColors.primaryPurple
                  : AppColors.borderColor(c)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary(c),
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(price,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h4
                    .copyWith(color: color, fontSize: 14)),
            const SizedBox(height: 4),
            Text(win,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(
                    color: AppColors.textPrimary(c),
                    fontWeight: FontWeight.w600)),
            Text(profit,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textMuted(c))),
          ],
        ),
      ),
    );
  }
}
