import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';

class PremiumFeaturesScreen extends StatelessWidget {
  const PremiumFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<({IconData icon, String title, String body, Color color})> features =
        <({IconData icon, String title, String body, Color color})>[
      (icon: Icons.auto_awesome_rounded, title: l10n.premiumFeature1Title, body: l10n.premiumFeature1Body, color: AppColors.primaryPurple),
      (icon: Icons.insights_rounded, title: l10n.premiumFeature2Title, body: l10n.premiumFeature2Body, color: AppColors.info),
      (icon: Icons.compare_arrows_rounded, title: l10n.premiumFeature3Title, body: l10n.premiumFeature3Body, color: AppColors.success),
      (icon: Icons.file_download_outlined, title: l10n.premiumFeature4Title, body: l10n.premiumFeature4Body, color: AppColors.warning),
      (icon: Icons.cloud_upload_outlined, title: l10n.premiumFeature5Title, body: l10n.premiumFeature5Body, color: AppColors.accentPurple),
      (icon: Icons.support_agent_rounded, title: l10n.premiumFeature6Title, body: l10n.premiumFeature6Body, color: AppColors.danger),
    ];

    return AppScreen(
      titleLeading: l10n.premiumFeaturesLeading,
      titleAccent: l10n.premiumFeaturesAccent,
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
                      borderRadius: BorderRadius.circular(16)),
                  child: const Icon(Icons.workspace_premium_rounded,
                      color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.upgradePremium,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context))),
                      Text(l10n.premiumUnlockSubtitle,
                          style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: features.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (BuildContext c, int i) {
              final feat = features[i];
              return AppCard(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TintedIcon(icon: feat.icon, color: feat.color),
                    const SizedBox(height: 8),
                    Text(feat.title,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(c), fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(feat.body,
                        style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary(c))),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 18),
          GradientButton(
              label: l10n.choosePlan,
              trailingArrow: true,
              onPressed: () => context.push(AppRoutes.subscription)),
        ],
      ),
    );
  }
}
