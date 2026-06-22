import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/selection_check_circle.dart';
import '../../../shared/widgets/step_indicator.dart';
import '../../../shared/widgets/widgets.dart';

class BudgetScreen extends ConsumerStatefulWidget {
  const BudgetScreen({super.key});

  @override
  ConsumerState<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetRange {
  const _BudgetRange({
    required this.label,
    required this.amount,
  });

  final String label;
  final double amount;
}

class _BudgetScreenState extends ConsumerState<BudgetScreen> {
  static const Color _selectedFill = Color(0xFFEEEDFD);
  static const int _analyzeStep = 3;
  static const int _analyzeTotalSteps = 5;

  final TextEditingController _budget =
      TextEditingController(text: '10,000');
  String _currency = 'USD';
  String _impact = 'Medium';
  int? _selectedRangeIndex;

  List<_BudgetRange> _getBudgetRanges(AppLocalizations l10n) {
    return <_BudgetRange>[
      _BudgetRange(label: l10n.budgetRange1, amount: 5000),
      _BudgetRange(label: l10n.budgetRange2, amount: 20000),
      _BudgetRange(label: l10n.budgetRange3, amount: 50000),
      _BudgetRange(label: l10n.budgetRange4, amount: 75000),
    ];
  }

  static List<BoxShadow> get _cardShadow => <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double? existing = ref.read(draftDecisionProvider)?.budget;
      if (existing != null && existing > 0) {
        setState(() {
          _budget.text = _formatBudget(existing);
          _selectedRangeIndex = _indexForAmount(existing);
        });
      } else {
        setState(() => _selectedRangeIndex = _indexForAmount(_parseBudget(_budget.text)));
      }
    });
  }

  @override
  void dispose() {
    _budget.dispose();
    super.dispose();
  }

  String _formatBudget(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    }
    return value.toString();
  }

  double _parseBudget(String raw) {
    return double.tryParse(raw.replaceAll(',', '').trim()) ?? 0;
  }

  int? _indexForAmount(double amount) {
    const List<double> amounts = <double>[5000, 20000, 50000, 75000];
    for (int i = 0; i < amounts.length; i++) {
      if (amounts[i] == amount) {
        return i;
      }
    }
    return null;
  }

  void _selectRange(int index) {
    const List<double> amounts = <double>[5000, 20000, 50000, 75000];
    setState(() {
      _selectedRangeIndex = index;
      _budget.text = _formatBudget(amounts[index]);
    });
  }

  void _onBudgetChanged(String value) {
    final int? matchedIndex = _indexForAmount(_parseBudget(value));
    if (matchedIndex != _selectedRangeIndex) {
      setState(() => _selectedRangeIndex = matchedIndex);
    }
  }

  void _continue() {
    ref.read(draftDecisionProvider.notifier).update(
          (d) => d..budget = _parseBudget(_budget.text),
        );
    context.push(AppRoutes.riskTolerance);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.stepAnalyze,
      titleAccent: l10n.problemWord,
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StepIndicator(
            steps: l10n.wizardSteps,
            currentStep: 2,
          ),
          const SizedBox(height: 24),
          Row(
            children: <Widget>[
              Text(
                l10n.budgetInput,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                '$_analyzeStep/$_analyzeTotalSteps',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted(context),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n.budgetSubtitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          _budgetInputCard(l10n),
          const SizedBox(height: 24),
          CustomFormFieldLabel(
            icon: Assets.iconsRiskScore,
            label: l10n.budgetImpactLevel,
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _impactCard(
                l10n: l10n,
                value: 'Low',
                label: l10n.low,
                sub: l10n.budgetLessThan5k,
                icon: Assets.iconsLow,
              ),
              const SizedBox(width: 10),
              _impactCard(
                l10n: l10n,
                value: 'Medium',
                label: l10n.medium,
                sub: l10n.budgetLessThan5k,
                icon: Assets.iconsMedium,
              ),
              const SizedBox(width: 10),
              _impactCard(
                l10n: l10n,
                value: 'High',
                label: l10n.high,
                sub: l10n.budgetLessThan5k,
                icon: Assets.iconsHigh,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _whyThisMattersBox(l10n),
          const SizedBox(height: 32),
          CustomGradientButton(
            text: l10n.continueButton,
            onTap: _continue,
            showSparkle: false,
          ),
          const SizedBox(height: 12),
          SecureFooter(label: l10n.securePrivate),
        ],
      ),
    );
  }

  Widget _budgetInputCard(AppLocalizations l10n) {
    final List<_BudgetRange> ranges = _getBudgetRanges(l10n);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: _cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                Assets.iconsBudget,
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.enterYourBudget,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary(context),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          r'$ ',
                          style: AppTextStyles.h3.copyWith(
                            color: AppColors.textPrimary(context),
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            height: 1,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _budget,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9,]'),
                              ),
                            ],
                            onChanged: _onBudgetChanged,
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.textPrimary(context),
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              height: 1,
                            ),
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: _currency,
                          underline: const SizedBox.shrink(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.textMuted(context),
                            size: 18,
                          ),
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textPrimary(context),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          items: const <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              value: 'USD',
                              child: Text('USD'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'EUR',
                              child: Text('EUR'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'GBP',
                              child: Text('GBP'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'INR',
                              child: Text('INR'),
                            ),
                          ],
                          onChanged: (String? value) =>
                              setState(() => _currency = value ?? 'USD'),
                        ),
                      ],
                    ),

                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: AppColors.primaryPurple,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List<Widget>.generate(ranges.length, (int index) {
              final _BudgetRange range = ranges[index];
              final bool selected = _selectedRangeIndex == index;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == ranges.length - 1 ? 8 : 8,
                  ),
                  child: GestureDetector(
                    onTap: () => _selectRange(index),
                    child: Container(
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.optionCardColor(context, selected: selected),
                        borderRadius: BorderRadius.circular(12),
                        border: selected
                            ? null
                            : Border.all(color: AppColors.borderColor(context)),
                        boxShadow: selected ? null : _cardShadow,
                      ),
                      child: Text(
                        range.label,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption.copyWith(
                          color: selected
                              ? AppColors.primaryBlue
                              : AppColors.textMuted(context),
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _impactCard({
    required AppLocalizations l10n,
    required String value,
    required String label,
    required String sub,
    required String icon,
  }) {
    final bool selected = _impact == value;
    final bool isDark = !AppColors.isLight(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _impact = value),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: selected && isDark
                ? AppColors.primaryTwoGradient
                : null,
            color: selected && isDark
                ? null
                : AppColors.optionCardColor(context, selected: selected),
            borderRadius: BorderRadius.circular(12),
            boxShadow: _cardShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    icon,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                    color: selected && isDark ? Colors.white : null,
                  ),
                  SelectionCheckCircle(
                    selected: selected,
                    borderColor: selected && isDark
                        ? Colors.white
                        : AppColors.primaryBlue,
                  ),
                ],
              ),

              const Spacer(),

              Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(
                  color: selected && isDark
                      ? Colors.white
                      : AppColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                sub,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(
                  color: selected && isDark
                      ? Colors.white.withValues(alpha: 0.85)
                      : AppColors.textMuted(context),
                  fontSize: 9,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _whyThisMattersBox(AppLocalizations l10n) {
    final bool isDark = !AppColors.isLight(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.greetingCardColor(context),
        gradient: isDark
            ? LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            AppColors.primaryBlue.withValues(alpha: 0.10),
            AppColors.primaryPurple.withValues(alpha: 0.10),
          ],
        )
            : null,
        boxShadow: isDark ? AppColors.homeCardShadow(context) : null,
        borderRadius: BorderRadius.circular(12),

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            Assets.iconsMatter,
            width: 79,
            height: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  l10n.whyThisMatters,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.budgetWhyMattersDesc,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
