import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String _selected = 'Premium';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.subscriptionLeading,
      titleAccent: l10n.subscriptionAccent,
      subtitle: l10n.subscriptionSubtitle,
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
                  child: const Icon(Icons.psychology_alt_rounded,
                      color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.makeSmarterDecisions,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context))),
                      Text(l10n.subscriptionHeroBody,
                          style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _plan(context, l10n, l10n.planBasic, 'Basic', r'$4.99',
              <String>['5 analyses per month', 'Basic insights', 'Email support']),
          const SizedBox(height: 10),
          _plan(context, l10n, l10n.planPremium, 'Premium', r'$9.99',
              <String>['Unlimited analyses', 'Advanced AI insights', 'Action plans', 'Priority support', 'Cloud backup'],
              isPopular: true),
          const SizedBox(height: 10),
          _plan(context, l10n, l10n.planPro, 'Pro', r'$19.99',
              <String>['Everything in Premium', 'Team workspaces', 'White-label exports', 'API access', 'Dedicated success manager']),
          const SizedBox(height: 16),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.allPlansInclude,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.textPrimary(context))),
                const SizedBox(height: 10),
                for (final String f in <String>[
                  'AI-powered decision analysis',
                  'Dark and light themes',
                  'Local-first private storage',
                  'Cancel anytime',
                ])
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.check_circle_rounded,
                            color: AppColors.success, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(f,
                              style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textPrimary(context))),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            color: AppColors.softSuccess(context),
            borderColor: Colors.transparent,
            child: Row(
              children: <Widget>[
                const Icon(Icons.shield_outlined,
                    color: AppColors.success, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.moneyBackGuarantee,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.success, fontSize: 14)),
                      Text(l10n.moneyBackGuaranteeBody,
                          style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GradientButton(
              label: l10n.freeTrial,
              trailingArrow: true,
              onPressed: () => context.push(AppRoutes.payment)),
          const SizedBox(height: 10),
          Center(
            child: Text(l10n.subscribeTermsNote,
                textAlign: TextAlign.center,
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textMuted(context))),
          ),
          const SizedBox(height: 12),
          SecureFooter(label: l10n.securePaymentEncryption),
        ],
      ),
    );
  }

  Widget _plan(BuildContext c, AppLocalizations l10n, String displayName, String id,
      String price, List<String> features,
      {bool isPopular = false}) {
    final bool selected = _selected == id;
    return AppCard(
      onTap: () => setState(() => _selected = id),
      borderColor: selected
          ? AppColors.primaryPurple
          : AppColors.borderColor(c),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected
                        ? AppColors.primaryPurple
                        : AppColors.borderColor(c),
                    width: 2,
                  ),
                ),
                child: selected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: AppColors.primaryPurple,
                              shape: BoxShape.circle),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 10),
              Text(displayName,
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.textPrimary(c))),
              if (isPopular) ...<Widget>[
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(l10n.mostPopular,
                      style: AppTextStyles.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
              ],
              const Spacer(),
              Text(price,
                  style: AppTextStyles.h3.copyWith(
                      color: AppColors.primaryPurple)),
              Text(l10n.perMonth,
                  style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary(c))),
            ],
          ),
          const SizedBox(height: 10),
          for (final String f in features)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.check_rounded,
                      color: AppColors.success, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(f,
                        style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textPrimary(c))),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
