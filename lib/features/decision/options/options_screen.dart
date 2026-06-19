import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/step_indicator.dart';
import '../../../shared/widgets/widgets.dart';

class OptionsScreen extends ConsumerStatefulWidget {
  const OptionsScreen({super.key});

  @override
  ConsumerState<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends ConsumerState<OptionsScreen> {
  final List<TextEditingController> _ctrls = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    for (final TextEditingController c in _ctrls) {
      c.dispose();
    }
    super.dispose();
  }

  void _add() {
    if (_ctrls.length >= 5) return;
    setState(() {
      _ctrls.add(TextEditingController());
    });
  }

  void _remove(int i) {
    if (_ctrls.length <= 2) return;
    setState(() {
      _ctrls[i].dispose();
      _ctrls.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.addYourOptionsLeading,
      titleAccent: l10n.optionsWord,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StepIndicator(steps: l10n.wizardSteps, currentStep: 1),
          const SizedBox(height: 22),
          Text(
            l10n.choosingBetween,
            style: AppTextStyles.h3
                .copyWith(color: AppColors.textPrimary(context)),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.optionsHint,
            style: AppTextStyles.bodySmall
                .copyWith(color: AppColors.textSecondary(context)),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < _ctrls.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.softPrimary(context),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        String.fromCharCode(65 + i),
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.primaryPurple,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _ctrls[i],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          hintText: l10n.describeOptionHint,
                        ),
                      ),
                    ),
                    if (_ctrls.length > 2)
                      IconButton(
                        icon: const Icon(Icons.close_rounded,
                            color: AppColors.danger),
                        onPressed: () => _remove(i),
                      ),
                  ],
                ),
              ),
            ),
          if (_ctrls.length < 5)
            GestureDetector(
              onTap: _add,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.primaryPurple.withOpacity(0.5),
                    style: BorderStyle.solid,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+ ${l10n.addAnotherOption}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 18),
          GradientButton(
            label: l10n.continueButton,
            trailingArrow: true,
            onPressed: () {
              ref.read(draftDecisionProvider.notifier).update((d) => d
                ..options = _ctrls
                    .map((TextEditingController c) => c.text.trim())
                    .where((String s) => s.isNotEmpty)
                    .toList());
              context.push(AppRoutes.goalSelection);
            },
          ),
          const SizedBox(height: 12),
          SecureFooter(label: l10n.securePrivate),
        ],
      ),
    );
  }
}
