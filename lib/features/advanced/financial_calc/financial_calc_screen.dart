import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class FinancialCalcScreen extends StatefulWidget {
  const FinancialCalcScreen({super.key});

  @override
  State<FinancialCalcScreen> createState() => _FinancialCalcScreenState();
}

class _FinancialCalcScreenState extends State<FinancialCalcScreen> {
  final TextEditingController _amount = TextEditingController(text: '10000');
  final TextEditingController _rate = TextEditingController(text: '8');
  final TextEditingController _years = TextEditingController(text: '5');

  double get _future {
    final double a = double.tryParse(_amount.text) ?? 0;
    final double r = (double.tryParse(_rate.text) ?? 0) / 100;
    final double y = double.tryParse(_years.text) ?? 0;
    double result = a;
    for (int i = 0; i < y.toInt(); i++) {
      result *= (1 + r);
    }
    return result;
  }

  @override
  void dispose() {
    _amount.dispose();
    _rate.dispose();
    _years.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.financialCalcLeading,
      titleAccent: l10n.financialCalcAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.compoundGrowth,
              style: AppTextStyles.h3
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 6),
          Text(l10n.financialCalcSubtitle,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.textSecondary(context))),
          const SizedBox(height: 14),
          _field(context, l10n.financialInitialAmount, _amount),
          const SizedBox(height: 10),
          _field(context, l10n.financialAnnualRate, _rate),
          const SizedBox(height: 10),
          _field(context, l10n.financialDuration, _years),
          const SizedBox(height: 14),
          AppCard(
            color: AppColors.softSuccess(context),
            borderColor: Colors.transparent,
            child: Column(
              children: <Widget>[
                Text(l10n.futureValue,
                    style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(
                    '\$${_future.toStringAsFixed(2)}',
                    style: AppTextStyles.h1
                        .copyWith(color: AppColors.success)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          WhyThisMatters(
              title: l10n.tipLabel,
              body: l10n.financialCalcTipBody),
          const SizedBox(height: 18),
          GradientButton(
              label: l10n.saveToDecisions,
              icon: Icons.bookmark_outline_rounded,
              onPressed: () => setState(() {})),
        ],
      ),
    );
  }

  Widget _field(BuildContext c, String label, TextEditingController ctrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
            style: AppTextStyles.label
                .copyWith(color: AppColors.textPrimary(c))),
        const SizedBox(height: 6),
        TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          onChanged: (_) => setState(() {}),
        ),
      ],
    );
  }
}
