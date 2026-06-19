import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/step_indicator.dart';

class ProblemScreen extends ConsumerStatefulWidget {
  const ProblemScreen({super.key});

  @override
  ConsumerState<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends ConsumerState<ProblemScreen> {
  static const Color _selectedFill = Color(0xFFEEEDFD);
  static const double _sectionGap = 24;
  static const double _labelGap = 12;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _description = TextEditingController();
  final List<TextEditingController> _optionControllers =
      <TextEditingController>[TextEditingController()];

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
      final String? existing = ref.read(draftDecisionProvider)?.description;
      if (existing != null && existing.isNotEmpty && _description.text.isEmpty) {
        _description.text = existing;
      }
    });
  }

  @override
  void dispose() {
    _description.dispose();
    for (final TextEditingController controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addOption() {
    if (_optionControllers.length >= 5) return;
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  void _removeOption(int index) {
    if (_optionControllers.length <= 1) return;
    setState(() {
      _optionControllers[index].dispose();
      _optionControllers.removeAt(index);
    });
  }

  void _continue() {
    if (!_formKey.currentState!.validate()) return;

    final List<String> options = _optionControllers
        .map((TextEditingController c) => c.text.trim())
        .where((String value) => value.isNotEmpty)
        .toList();

    if (options.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.pleaseAddOption)),
      );
      return;
    }

    ref.read(draftDecisionProvider.notifier).update((d) => d
      ..description = _description.text.trim()
      ..options = options);
    context.push(AppRoutes.goalSelection);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScreen(
      titleLeading: l10n.defineYourProblem,
      titleAccent: l10n.problemWord,
      plainBackButton: true,
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepIndicator(
              steps: l10n.wizardSteps,
              currentStep: 1,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.tellUsMore,
              textAlign: TextAlign.center,
              style: AppTextStyles.h4.copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.wizardHint,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted(context),
                fontSize: 12,
                height: 1.5,
              ),
            ),
            const SizedBox(height: _sectionGap),
            CustomFormFieldLabel(
              icon: Assets.iconsDescribleDecision,
              label: l10n.describeDecision,
            ),
            const SizedBox(height: _labelGap),
            CustomTextField(
              controller: _description,
              hintText: l10n.describeDecisionHint,
              maxLength: 1000,
              minLines: 5,
              maxLines: 5,
              validator: (String? value) => Validators.required(
                    value,
                    l10n,
                    field: l10n.fieldDescription,
                  ),
            ),
            const SizedBox(height: _sectionGap),
            CustomFormFieldLabel(
              icon: Assets.iconsQuickTips,
              label: l10n.quickTips,
            ),
            const SizedBox(height: _labelGap),
            Row(
              children: <Widget>[
                Expanded(child: _tipChip(l10n.beSpecific)),
                const SizedBox(width: 8),
                Expanded(child: _tipChip(l10n.includeContext)),
                const SizedBox(width: 8),
                Expanded(child: _tipChip(l10n.mentionGoal)),
              ],
            ),
            const SizedBox(height: _sectionGap),
            Text(
              l10n.choosingBetween,
              style: AppTextStyles.h4.copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.optionsHint,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted(context),
                fontSize: 12,
                height: 1.5,
              ),
            ),
            const SizedBox(height: _labelGap),
            for (int i = 0; i < _optionControllers.length; i++) ...<Widget>[
              _optionField(i, l10n),
              const SizedBox(height: 10),
            ],
            if (_optionControllers.length < 5) _addOptionButton(l10n),
            const SizedBox(height: 32),
            CustomGradientButton(
              text: l10n.continueToAnalysis,
              onTap: _continue,
              showSparkle: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tipChip(String label) {
    return Container(
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: _cardShadow,
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textSecondary(context),
          fontWeight: FontWeight.w500,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _optionField(int index, AppLocalizations l10n) {
    final String letter = String.fromCharCode(65 + index);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: _cardShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: <Widget>[
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.selectedFillColor(context),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${index + 1}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: _optionControllers[index],
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary(context),
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    hintText: l10n.optionLabel(letter),
                    hintStyle: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontSize: 12,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                ),
              ),
              if (_optionControllers.length > 1)
                IconButton(
                  icon: Icon(Icons.close_rounded,
                      color: AppColors.textMuted(context), size: 18),
                  onPressed: () => _removeOption(index),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addOptionButton(AppLocalizations l10n) {
    return GestureDetector(
      onTap: _addOption,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
        color: AppColors.cardColor(context),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _cardShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_rounded,
                color: AppColors.primaryPurple,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              l10n.addAnotherOption,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primaryPurple,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
