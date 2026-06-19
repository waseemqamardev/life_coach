import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _method = 'Card';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.paymentLeading,
      titleAccent: l10n.paymentAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCard(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(l10n.premiumMonthly,
                        style: AppTextStyles.h4
                            .copyWith(color: AppColors.textPrimary(context))),
                    Text(r'$9.99',
                        style: AppTextStyles.h3
                            .copyWith(color: AppColors.primaryPurple)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(l10n.taxEstimate,
                        style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary(context))),
                    Text(r'$0.80',
                        style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary(context))),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(l10n.totalToday,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context))),
                    Text(r'$10.79',
                        style: AppTextStyles.h3
                            .copyWith(color: AppColors.success)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(l10n.paymentMethod,
              style: AppTextStyles.h4
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 10),
          for (final ({String id, String label, IconData icon, Color color}) m
              in <({String id, String label, IconData icon, Color color})>[
            (id: 'Card', label: l10n.paymentCard, icon: Icons.credit_card_rounded, color: AppColors.primaryPurple),
            (id: 'PayPal', label: l10n.paymentPayPal, icon: Icons.account_balance_wallet_outlined, color: AppColors.info),
            (id: 'Google Pay', label: l10n.paymentGooglePay, icon: Icons.payments_outlined, color: AppColors.success),
            (id: 'Apple Pay', label: l10n.paymentApplePay, icon: Icons.phone_iphone_rounded, color: AppColors.textPrimary(context)),
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                onTap: () => setState(() => _method = m.id),
                borderColor: _method == m.id
                    ? AppColors.primaryPurple
                    : AppColors.borderColor(context),
                child: Row(
                  children: <Widget>[
                    TintedIcon(icon: m.icon, color: m.color),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(m.label,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context),
                              fontSize: 14)),
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _method == m.id
                              ? AppColors.primaryPurple
                              : AppColors.borderColor(context),
                          width: 2,
                        ),
                      ),
                      child: _method == m.id
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
                  ],
                ),
              ),
            ),
          if (_method == 'Card') ...<Widget>[
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: l10n.cardNumber)),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(hintText: l10n.cardExpiryHint))),
                const SizedBox(width: 10),
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(hintText: l10n.cardCvvHint))),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
                decoration: InputDecoration(hintText: l10n.nameOnCard)),
          ],
          const SizedBox(height: 20),
          GradientButton(
              label: l10n.payNow,
              icon: Icons.lock_outline_rounded,
              onPressed: () => context.push(AppRoutes.paymentSuccess)),
          const SizedBox(height: 12),
          SecureFooter(label: l10n.encryptedPaymentFooter),
        ],
      ),
    );
  }
}
