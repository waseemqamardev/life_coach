import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_screen.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final List<({String title, String body})> steps =
        <({String title, String body})>[
      (title: l10n.howToUseStep1Title, body: l10n.howToUseStep1Body),
      (title: l10n.howToUseStep2Title, body: l10n.howToUseStep2Body),
      (title: l10n.howToUseStep3Title, body: l10n.howToUseStep3Body),
      (title: l10n.howToUseStep4Title, body: l10n.howToUseStep4Body),
    ];

    return AppScreen(
      titleLeading: l10n.howToUseLeading,
      titleAccent: l10n.useWord,
      plainBackButton: true,
      backgroundColor: AppColors.scaffoldColor(context),
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < steps.length; i++) ...<Widget>[
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cardColor(context),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.borderColor(context)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.selectedFillColor(context),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${i + 1}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primaryPurple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          steps[i].title,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          steps[i].body,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textMuted(context),
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (i < steps.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
