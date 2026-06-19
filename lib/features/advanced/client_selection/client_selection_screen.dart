import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/widgets.dart';

class ClientSelectionScreen extends StatelessWidget {
  const ClientSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<({String name, String type, int score, Color color})> clients =
        const <({String name, String type, int score, Color color})>[
      (
        name: 'Acme Corp',
        type: 'Enterprise — 6 month engagement',
        score: 91,
        color: AppColors.success
      ),
      (
        name: 'Bright Startup',
        type: 'Early-stage — 1 month project',
        score: 72,
        color: AppColors.info
      ),
      (
        name: 'Big Brand Co',
        type: 'Long lead time, slow payer',
        score: 54,
        color: AppColors.warning
      ),
      (
        name: 'Mystery Client',
        type: 'Unclear scope — vague brief',
        score: 31,
        color: AppColors.danger
      ),
    ];

    return AppScreen(
      titleLeading: l10n.clientSelectionLeading,
      titleAccent: l10n.clientSelectionAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.whichClientQuestion,
              style: AppTextStyles.h3
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          Text(l10n.clientSelectionSubtitle,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.textSecondary(context))),
          const SizedBox(height: 14),
          for (final ({String name, String type, int score, Color color}) c
              in clients)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                child: Row(
                  children: <Widget>[
                    TintedIcon(
                        icon: Icons.business_center_rounded, color: c.color),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(c.name,
                              style: AppTextStyles.h4.copyWith(
                                  color: AppColors.textPrimary(context),
                                  fontSize: 14)),
                          Text(c.type,
                              style: AppTextStyles.caption.copyWith(
                                  color: AppColors.textSecondary(context))),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: c.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text('${c.score}',
                          style: AppTextStyles.h4
                              .copyWith(color: c.color, fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          WhyThisMatters(
            title: l10n.aiVerdict,
            body: l10n.clientSelectionVerdictBody,
            icon: Icons.smart_toy_rounded,
          ),
        ],
      ),
    );
  }
}
