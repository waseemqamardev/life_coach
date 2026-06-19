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
import '../../../shared/widgets/widgets.dart';

class ExperienceScreen extends ConsumerStatefulWidget {
  const ExperienceScreen({super.key});

  @override
  ConsumerState<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends ConsumerState<ExperienceScreen> {
  static const Color _selectedFill = Color(0xFFEEEDFD);
  static const int _analyzeStep = 5;
  static const int _analyzeTotalSteps = 5;

  String _selected = 'Intermediate';

  static List<BoxShadow> get _cardShadow => <BoxShadow>[
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 2,
          offset: Offset.zero,
        ),
      ];

  static const List<({String name, String sub, String tag})> _options =
      <({String name, String sub, String tag})>[
    (
      name: 'Beginner',
      sub: 'New to this area; still building knowledge.',
      tag: 'Best for learning',
    ),
    (
      name: 'Intermediate',
      sub: 'Some relevant experience and context.',
      tag: 'Balanced options',
    ),
    (
      name: 'Advanced',
      sub: 'Strong background in this domain.',
      tag: 'Growth focused',
    ),
    (
      name: 'Expert',
      sub: 'Deep expertise and proven track record.',
      tag: 'Maximum outcomes',
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String? existing =
          ref.read(draftDecisionProvider)?.experienceLevel;
      if (existing != null &&
          existing.isNotEmpty &&
          _options.any((({String name, String sub, String tag}) o) =>
              o.name == existing)) {
        setState(() => _selected = existing);
      }
    });
  }

  void _continue() {
    ref.read(draftDecisionProvider.notifier).update(
          (d) => d..experienceLevel = _selected,
        );
    context.push(AppRoutes.timeAvailability);
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
                l10n.experienceLevel,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.primaryPurple,
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
            l10n.experienceSubtitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted(context),
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          for (final ({String name, String sub, String tag}) option
              in _options) ...<Widget>[
            _optionCard(option: option, selected: _selected == option.name),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 10),
          _whyThisMattersBox(l10n),
          const SizedBox(height: 32),
          CustomGradientButton(
            text: l10n.continueToAnalysis,
            onTap: _continue,
            showSparkle: false,
          ),
          const SizedBox(height: 12),
          SecureFooter(label: l10n.securePrivate),
        ],
      ),
    );
  }

  Widget _optionCard({
    required ({String name, String sub, String tag}) option,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () => setState(() => _selected = option.name),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.optionCardColor(context, selected: selected),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _cardShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFE5E7EB),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    option.name,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.textPrimary(context),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    option.sub,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Text(
                      option.tag,
                      style: AppTextStyles.caption.copyWith(
                        color: const Color(0xFF388E3C),
                        fontWeight: FontWeight.w500,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SelectionCheckCircle(
              selected: selected,
              borderColor: AppColors.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _whyThisMattersBox(AppLocalizations l10n) {
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
                  'Your experience level helps AI personalize the complexity and depth of recommendations.',
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
