import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppScreen(
      titleLeading: l10n.emptyTitleLeading,
      titleAccent: l10n.emptyTitleAccent,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: <Widget>[
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: <Color>[
                  AppColors.primaryPurple.withOpacity(0.18),
                  Colors.transparent,
                ]),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.softPrimary(context),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.inbox_outlined,
                    size: 44, color: AppColors.primaryPurple),
              ),
            ),
            const SizedBox(height: 24),
            Text(l10n.emptyQuietTitle,
                style: AppTextStyles.h2
                    .copyWith(color: AppColors.textPrimary(context))),
            const SizedBox(height: 8),
            Text(
                l10n.emptyHistoryHint,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.textSecondary(context))),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GradientButton(
                label: l10n.startADecision,
                icon: Icons.auto_awesome_rounded,
                trailingArrow: true,
                onPressed: () => context.push(AppRoutes.startDecision),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
