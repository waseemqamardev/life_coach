import 'package:flutter/material.dart';
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
import '../../../shared/widgets/selection_check_circle.dart';
import '../../../shared/widgets/step_indicator.dart';

class GoalScreen extends ConsumerStatefulWidget {
  const GoalScreen({super.key});

  @override
  ConsumerState<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends ConsumerState<GoalScreen> {
  static const int _maxSelections = 5;

  final Set<String> _selectedGoals = <String>{'Growth'};

  static List<BoxShadow> get _cardShadow => <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];

  static const List<String> _goalKeys = <String>[
    'Growth',
    'Financial Gain',
    'Risk Reduction',
    'Personal Satisfaction',
    'Time Efficiency',
    'Work-Life Balance',
    'Stability',
    'Impact',
  ];

  String _goalLabel(AppLocalizations l10n, String name) {
    switch (name) {
      case 'Growth':
        return l10n.goalGrowth;
      case 'Financial Gain':
        return l10n.goalFinancialGain;
      case 'Risk Reduction':
        return l10n.goalRiskReduction;
      case 'Personal Satisfaction':
        return l10n.goalPersonalSatisfaction;
      case 'Time Efficiency':
        return l10n.goalTimeEfficiency;
      case 'Work-Life Balance':
        return l10n.goalWorkLifeBalance;
      case 'Stability':
        return l10n.goalStability;
      case 'Impact':
        return l10n.goalImpact;
      default:
        return name;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String? existing = ref.read(draftDecisionProvider)?.goal;
      if (existing == null || existing.isEmpty) return;
      setState(() {
        _selectedGoals
          ..clear()
          ..addAll(
            existing.split(',').map((String s) => s.trim()).where((String s) {
              return s.isNotEmpty && _goalKeys.contains(s);
            }),
          );
        if (_selectedGoals.isEmpty) {
          _selectedGoals.add('Growth');
        }
      });
    });
  }

  void _toggleGoal(String name) {
    setState(() {
      if (_selectedGoals.contains(name)) {
        _selectedGoals.remove(name);
      } else if (_selectedGoals.length < _maxSelections) {
        _selectedGoals.add(name);
      }
    });
  }

  void _continue(AppLocalizations l10n) {
    if (_selectedGoals.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.selectAtLeastOneGoal)),
      );
      return;
    }

    ref.read(draftDecisionProvider.notifier).update(
          (d) => d..goal = _selectedGoals.join(', '),
        );
    context.push(AppRoutes.timeUrgency);
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
                l10n.goalSelection,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.primaryPurple,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                '${_selectedGoals.length}/$_maxSelections',
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
            l10n.goalSelectionSubtitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _goalKeys.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 132,
            ),
            itemBuilder: (BuildContext context, int index) {
              final String goalKey = _goalKeys[index];
              final bool selected = _selectedGoals.contains(goalKey);
              return _goalCard(
                l10n: l10n,
                goalKey: goalKey,
                selected: selected,
              );
            },
          ),
          const SizedBox(height: 20),
          _tipBox(l10n),
          const SizedBox(height: 32),
          CustomGradientButton(
            text: l10n.continueButton,
            onTap: () => _continue(l10n),
            showSparkle: false,
          ),
        ],
      ),
    );
  }

  Widget _goalCard({
    required AppLocalizations l10n,
    required String goalKey,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () => _toggleGoal(goalKey),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.optionCardColor(context, selected: selected),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE5E7EB),
                    shape: BoxShape.circle,
                  ),
                ),
                SelectionCheckCircle(selected: selected),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _goalLabel(l10n, goalKey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.h4.copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tipBox(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Assets.imagesHomeScreenLogo,
            fit: BoxFit.contain,
            width: 79,
            height: 70,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted(context),
                  fontSize: 10,
                  height: 1.5,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '${l10n.tipFromAi}: \n',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary(context),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(text: l10n.goalTipBody),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
