import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class ProductivityScreen extends StatelessWidget {
  const ProductivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<({String task, String pill, Color color, IconData icon})> tasks =
        <({String task, String pill, Color color, IconData icon})>[
      (task: 'Ship the launch email', pill: l10n.doNow, color: AppColors.danger, icon: Icons.bolt_rounded),
      (task: 'Reply to client questions', pill: l10n.doToday, color: AppColors.warning, icon: Icons.mail_outline_rounded),
      (task: 'Refactor onboarding flow', pill: l10n.scheduleLabel, color: AppColors.info, icon: Icons.schedule_rounded),
      (task: 'Browse competitor sites', pill: l10n.deleteLabel, color: AppColors.textSecondary(context), icon: Icons.delete_outline_rounded),
    ];

    return AppScreen(
      titleLeading: l10n.productivityLeading,
      titleAccent: l10n.productivityAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.eisenhowerPriority,
              style: AppTextStyles.h3
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          Text(l10n.productivitySubtitle,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.textSecondary(context))),
          const SizedBox(height: 14),
          for (final ({String task, String pill, Color color, IconData icon}) t
              in tasks)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                child: Row(
                  children: <Widget>[
                    TintedIcon(icon: t.icon, color: t.color),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(t.task,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context),
                              fontSize: 14)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: t.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(t.pill,
                          style: AppTextStyles.caption.copyWith(
                              color: t.color,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          WhyThisMatters(
              title: l10n.tipLabel,
              body: l10n.productivityTipBody),
          const SizedBox(height: 18),
          GradientButton(
            label: l10n.startFocusBlock,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(l10n.focusBlockStarted),
              ));
            },
          ),
        ],
      ),
    );
  }
}
