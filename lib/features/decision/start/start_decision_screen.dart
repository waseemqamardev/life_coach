import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../data/models/decision.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/step_indicator.dart';

class StartDecisionScreen extends ConsumerStatefulWidget {
  const StartDecisionScreen({super.key});

  @override
  ConsumerState<StartDecisionScreen> createState() =>
      _StartDecisionScreenState();
}

class _StartDecisionScreenState extends ConsumerState<StartDecisionScreen> {
  static const double _sectionGap = 24;
  static const double _labelGap = 12;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  String _category = 'Career';
  String _importance = 'Medium';

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    super.dispose();
  }

  void _continue() {
    if (!_formKey.currentState!.validate()) return;
    final Decision d = Decision(
      id: const Uuid().v4(),
      title: _title.text.trim(),
      description: _desc.text.trim(),
      category: _category,
      importance: _importance,
      createdAt: DateTime.now(),
    );
    ref.read(draftDecisionProvider.notifier).start(d);
    context.push(AppRoutes.enterProblem);
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
              l10n.startDecisionQuestion,
              textAlign: TextAlign.center,
              style: AppTextStyles.h4.copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                l10n.startDecisionSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted(context),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: _sectionGap),
            CustomFormFieldLabel(
              icon: Assets.iconsTitleIcon,
              label: l10n.decisionTitle,
            ),
            const SizedBox(height: _labelGap),
            CustomTextField(
              controller: _title,
              hintText: l10n.decisionTitleHint,
              maxLength: 80,
              validator: (String? v) =>
                  Validators.required(v, l10n, field: l10n.fieldTitle),
            ),
            const SizedBox(height: _sectionGap),
            CustomFormFieldLabel(
              icon: Assets.iconsDescribleDecision,
              label: l10n.describeDecision,
            ),
            const SizedBox(height: _labelGap),
            CustomTextField(
              controller: _desc,
              hintText: l10n.describeDecisionHint,
              maxLength: 500,
              validator: (String? v) =>
                  Validators.required(v, l10n, field: l10n.fieldDescription),
              minLines: 4,
              maxLines: 4,
            ),
            const SizedBox(height: _sectionGap),
            CustomFormFieldLabel(
              icon: Assets.iconsDescribleCategory,
              label: l10n.decisionCategory,
            ),
            const SizedBox(height: _labelGap),
            _categoryGrid(l10n),
            const SizedBox(height: _sectionGap),
            CustomFormFieldLabel(
              icon: Assets.iconsImportantLevel,
              label: l10n.importanceLevel,
            ),
            const SizedBox(height: _labelGap),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _importanceChip(
                  l10n,
                  'Low',
                  l10n.low,
                  l10n.impactMinor,
                  AppColors.primaryBlue,
                ),
                const SizedBox(width: 10),
                _importanceChip(
                  l10n,
                  'Medium',
                  l10n.medium,
                  l10n.impactModerate,
                  AppColors.success,
                ),
                const SizedBox(width: 10),
                _importanceChip(
                  l10n,
                  'High',
                  l10n.high,
                  l10n.impactHigh,
                  AppColors.danger,
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomGradientButton(
              text: l10n.continueButton,
              onTap: _continue,
              showSparkle: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryGrid(AppLocalizations l10n) {
    final List<({String name, String label, String icon, Color color})> cats =
        <({String name, String label, String icon, Color color})>[
      (
        name: 'Career',
        label: l10n.categoryCareer,
        icon: Assets.iconsCareerIcon,
        color: AppColors.primaryPurple
      ),
      (
        name: 'Finance',
        label: l10n.categoryFinance,
        icon: Assets.iconsFinance,
        color: AppColors.success
      ),
      (
        name: 'Health',
        label: l10n.categoryHealth,
        icon: Assets.iconsHealth,
        color: AppColors.danger
      ),
      (
        name: 'Relations',
        label: l10n.categoryRelations,
        icon: Assets.iconsRelationIcon,
        color: const Color(0xFF14B8A6)
      ),
      (
        name: 'Education',
        label: l10n.categoryEducation,
        icon: Assets.iconsEducationIcon,
        color: AppColors.primaryPurple
      ),
      (
        name: 'Other',
        label: l10n.categoryOther,
        icon: Assets.iconsOtherMenu,
        color: AppColors.warning
      ),
    ];

    return GridView.builder(
      itemCount: cats.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 10,
        mainAxisExtent: 40,
      ),
      itemBuilder: (BuildContext context, int i) {
        final ({String name, String label, String icon, Color color}) cat =
            cats[i];
        final bool selected = _category == cat.name;
        return GestureDetector(
          onTap: () => setState(() => _category = cat.name),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              // gradient: Theme.of(context).brightness == Brightness.dark?AppColors.primaryTwoGradient:null,
              color: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : AppColors.optionCardColor(context, selected: selected),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Colors.black.withValues(alpha: 0.10),
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  cat.icon,
                  color: cat.color,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    cat.label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: selected
                          ? AppColors.textPrimary(context)
                          : AppColors.textSecondary(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _importanceChip(
    AppLocalizations l10n,
    String value,
    String label,
    String sub,
    Color color,
  ) {
    final bool selected = _importance == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _importance = value),
        child: Container(
          height: 60,
          padding: const EdgeInsets.fromLTRB(6, 12, 8, 10),
          decoration: BoxDecoration(
            color: AppColors.optionCardColor(context, selected: selected),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0,
                color: Colors.black.withValues(alpha: 0.10),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary(context),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                sub,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textMuted(context),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
