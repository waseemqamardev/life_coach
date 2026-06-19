import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/gradient_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: <Color>[
                        AppColors.success.withOpacity(0.2),
                        Colors.transparent,
                      ]),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.success.withOpacity(0.5),
                          blurRadius: 28,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.check_rounded,
                        color: Colors.white, size: 64),
                  ),
                  Positioned(
                      top: 18,
                      left: 12,
                      child: _confetti(AppColors.warning, 14)),
                  Positioned(
                      top: 30,
                      right: 20,
                      child: _confetti(AppColors.primaryPurple, 10)),
                  Positioned(
                      bottom: 24,
                      left: 30,
                      child: _confetti(AppColors.info, 8)),
                  Positioned(
                      bottom: 18,
                      right: 14,
                      child: _confetti(AppColors.danger, 12)),
                ],
              ),
              const SizedBox(height: 24),
              Text.rich(
                TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: '${l10n.paymentSuccessLeading} ',
                      style: AppTextStyles.h1
                          .copyWith(color: AppColors.textPrimary(context))),
                  TextSpan(
                      text: l10n.paymentSuccessAccent,
                      style: AppTextStyles.h1.copyWith(color: AppColors.success)),
                ]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(l10n.thankYouUpgrade,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary(context))),
              const SizedBox(height: 24),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(l10n.paymentDetails,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context))),
                    const SizedBox(height: 10),
                    _row(context, l10n.planLabel, l10n.premiumMonthly),
                    _row(context, l10n.amountLabel, r'$9.99'),
                    _row(context, l10n.methodLabel, 'Visa •• 3456'),
                    _row(context, l10n.transactionIdLabel, 'TXN2471298756'),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(l10n.youNowHaveAccessTo,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context))),
                    const SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3.2,
                      ),
                      itemBuilder: (BuildContext c, int i) {
                        final List<({IconData icon, String label, Color color})>
                            feats = <({IconData icon, String label, Color color})>[
                          (icon: Icons.auto_awesome_rounded, label: l10n.unlimitedAi, color: AppColors.primaryPurple),
                          (icon: Icons.insights_rounded, label: l10n.deepInsightsShort, color: AppColors.info),
                          (icon: Icons.compare_arrows_rounded, label: l10n.compareShort, color: AppColors.success),
                          (icon: Icons.file_download_outlined, label: l10n.exportsShort, color: AppColors.warning),
                          (icon: Icons.cloud_upload_outlined, label: l10n.cloudSyncShort, color: AppColors.accentPurple),
                          (icon: Icons.support_agent_rounded, label: l10n.prioritySupportShort, color: AppColors.danger),
                        ];
                        return Row(
                          children: <Widget>[
                            TintedIcon(
                                icon: feats[i].icon,
                                color: feats[i].color,
                                size: 32,
                                iconSize: 14),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(feats[i].label,
                                  style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textPrimary(c),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        );
                      },
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
                        color: AppColors.success, size: 24),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(l10n.moneyBackGuarantee,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.success, fontSize: 14)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              GradientButton(
                label: l10n.getStarted,
                trailingArrow: true,
                onPressed: () => context.go(AppRoutes.home),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.go(AppRoutes.home),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.borderColor(context)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(l10n.goToDashboard,
                      style: AppTextStyles.buttonText
                          .copyWith(color: AppColors.primaryPurple)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(BuildContext c, String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.textSecondary(c))),
          Text(value,
              style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textPrimary(c),
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _confetti(Color color, double size) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}
