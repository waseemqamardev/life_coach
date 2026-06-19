import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/ai/clarifying_question.dart';
import '../../../data/models/decision.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/selection_check_circle.dart';
import '../../../shared/widgets/step_indicator.dart';
import '../../../shared/widgets/widgets.dart';

class QuestionFlowScreen extends ConsumerStatefulWidget {
  const QuestionFlowScreen({super.key});

  @override
  ConsumerState<QuestionFlowScreen> createState() => _QuestionFlowScreenState();
}

class _QuestionFlowScreenState extends ConsumerState<QuestionFlowScreen> {
  static const Color _selectedFill = Color(0xFFEEEDFD);
  static const Color _optionFill = Color(0xFFffffff);

  int _step = 0;
  final Map<int, String> _answers = <int, String>{};

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
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadQuestions());
  }

  Future<void> _loadQuestions() async {
    final Decision? draft = ref.read(draftDecisionProvider);
    if (draft == null) {
      if (mounted) context.go(AppRoutes.home);
      return;
    }
    ref.read(clarifyingQuestionsProvider.notifier).reset();
    await ref
        .read(clarifyingQuestionsProvider.notifier)
        .load(draft, ref.read(localeProvider));
    if (mounted) {
      setState(() {
        _step = 0;
        _answers.clear();
      });
    }
  }

  List<ClarifyingQuestion> get _questions =>
      ref.watch(clarifyingQuestionsProvider).questions;

  void _back() {
    if (_questions.isEmpty) {
      Navigator.of(context).maybePop();
      return;
    }
    if (_step > 0) {
      setState(() => _step--);
      return;
    }
    Navigator.of(context).maybePop();
  }

  void _next() {
    if (_questions.isEmpty || _answers[_step] == null) return;
    if (_step < _questions.length - 1) {
      setState(() => _step++);
      return;
    }

    final List<String> qa = <String>[];
    for (int i = 0; i < _questions.length; i++) {
      final String? answer = _answers[i];
      if (answer != null) {
        qa.add('${_questions[i].question}: $answer');
      }
    }
    ref.read(draftDecisionProvider.notifier).update(
          (Decision d) => d..aiQuestionAnswers = qa,
        );
    context.push(AppRoutes.processing);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ClarifyingQuestionsState questionState =
        ref.watch(clarifyingQuestionsProvider);
    final Decision? draft = ref.watch(draftDecisionProvider);

    return AppScreen(
      titleLeading: l10n.aiQuestionsTitle,
      titleAccent: l10n.questionsWord,
      plainBackButton: true,
      onBack: _back,
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
      child: _buildBody(l10n, questionState, draft),
    );
  }

  Widget _buildBody(
    AppLocalizations l10n,
    ClarifyingQuestionsState questionState,
    Decision? draft,
  ) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final Animation<double> fade = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        final Animation<Offset> slide = Tween<Offset>(
          begin: const Offset(0, 0.04),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ));

        return FadeTransition(
          opacity: fade,
          child: SlideTransition(position: slide, child: child),
        );
      },
      child: _buildBodyContent(l10n, questionState, draft),
    );
  }

  Widget _buildBodyContent(
    AppLocalizations l10n,
    ClarifyingQuestionsState questionState,
    Decision? draft,
  ) {
    switch (questionState.status) {
      case ClarifyingQuestionsStatus.idle:
      case ClarifyingQuestionsStatus.loading:
        return _QuestionsLoadingView(
          key: const ValueKey<String>('questions-loading'),
          l10n: l10n,
          draft: draft,
        );
      case ClarifyingQuestionsStatus.error:
        return KeyedSubtree(
          key: ValueKey<String>('questions-error-${questionState.errorMessage}'),
          child: _errorBody(l10n, questionState.errorMessage),
        );
      case ClarifyingQuestionsStatus.success:
        return KeyedSubtree(
          key: const ValueKey<String>('questions-success'),
          child: _questionsBody(l10n, questionState, draft),
        );
    }
  }

  Widget _errorBody(AppLocalizations l10n, String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        StepIndicator(
          steps: l10n.wizardSteps,
          currentStep: 3,
        ),
        const SizedBox(height: 40),
        Icon(
          Icons.wifi_off_rounded,
          size: 48,
          color: AppColors.textMuted(context),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.couldNotLoadQuestions,
          textAlign: TextAlign.center,
          style: AppTextStyles.h4.copyWith(
            color: AppColors.textPrimary(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          message.isEmpty ? l10n.analysisFailed : message,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textMuted(context),
            height: 1.45,
          ),
        ),
        const SizedBox(height: 24),
        CustomGradientButton(
          text: l10n.tryAgain,
          onTap: _loadQuestions,
          showSparkle: false,
        ),
      ],
    );
  }

  Widget _questionsBody(
    AppLocalizations l10n,
    ClarifyingQuestionsState questionState,
    Decision? draft,
  ) {
    if (_questions.isEmpty) {
      return _errorBody(l10n, l10n.noQuestionsGenerated);
    }

    final ClarifyingQuestion current = _questions[_step];
    final double progress = (_step + 1) / _questions.length;
    final int percent = (progress * 100).round();
    final bool canContinue = _answers[_step] != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        StepIndicator(
          steps: l10n.wizardSteps,
          currentStep: 3,
        ),
        const SizedBox(height: 20),
        _aiNavigatorCard(l10n, draft, questionState.usedFallback),
        const SizedBox(height: 16),
        _questionCard(
          l10n: l10n,
          question: current.question,
          options: current.options,
          questionNumber: _step + 1,
          totalQuestions: _questions.length,
          percent: percent,
          progress: progress,
        ),
        const SizedBox(height: 16),
        _whyThisMattersBox(l10n),
        const SizedBox(height: 32),
        Opacity(
          opacity: canContinue ? 1 : 0.55,
          child: CustomGradientButton(
            text: _step == _questions.length - 1
                ? l10n.analyzeButton
                : l10n.nextButton,
            onTap: canContinue ? _next : null,
            showSparkle: false,
          ),
        ),
        const SizedBox(height: 12),
        SecureFooter(label: l10n.securePrivate),
      ],
    );
  }

  Widget _aiNavigatorCard(
    AppLocalizations l10n,
    Decision? draft,
    bool usedFallback,
  ) {
    final String subtitle;
    if (draft?.title.isNotEmpty == true) {
      subtitle = usedFallback
          ? l10n.basedOnDecision(draft!.title)
          : l10n.aiQuestionsPersonalized(draft!.title);
    } else {
      subtitle = usedFallback ? l10n.aiQuestionsHint : l10n.basedOnWizard;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              Assets.iconsAiImage,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 52,
                height: 52,
                color: AppColors.primaryBlue,
                child:
                    const Icon(Icons.smart_toy_outlined, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.aiNavigator,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontSize: 11,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _questionCard({
    required AppLocalizations l10n,
    required String question,
    required List<String> options,
    required int questionNumber,
    required int totalQuestions,
    required int percent,
    required double progress,
  }) {
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
            children: <Widget>[
              Text(
                l10n.questionOf(questionNumber, totalQuestions),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primaryPurple,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                '$percent%',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted(context),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 4,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(color: const Color(0xFFE5E7EB)),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress.clamp(0, 1),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryTwoGradient,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            question,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < options.length; i++) ...<Widget>[
            _optionRow(
              index: i + 1,
              label: options[i],
              selected: _answers[_step] == options[i],
              onTap: () => setState(() => _answers[_step] = options[i]),
            ),
            if (i < options.length - 1) const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }

  Widget _optionRow({
    required int index,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? _selectedFill : _optionFill,
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.selectedFillColor(context),
                shape: BoxShape.circle,
              ),
              child: Text(
                '$index',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textPrimary(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(
                  color: selected
                      ? AppColors.textPrimary(context)
                      : AppColors.textSecondary(context),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            SelectionCheckCircle(selected: selected),
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
                  l10n.whyQuestionsMatter,
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

class _QuestionsLoadingView extends StatefulWidget {
  const _QuestionsLoadingView({
    super.key,
    required this.l10n,
    this.draft,
  });

  final AppLocalizations l10n;
  final Decision? draft;

  @override
  State<_QuestionsLoadingView> createState() => _QuestionsLoadingViewState();
}

class _QuestionsLoadingViewState extends State<_QuestionsLoadingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;
  late final Animation<double> _ringRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _pulse = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.94, end: 1.06)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.06, end: 0.94)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(_controller);

    _ringRotation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = widget.l10n;
    final Decision? draft = widget.draft;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        StepIndicator(
          steps: l10n.wizardSteps,
          currentStep: 3,
        ),
        const SizedBox(height: 40),
        Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _pulse.value,
                child: SizedBox(
                  width: 108,
                  height: 108,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Transform.rotate(
                        angle: _ringRotation.value * 2 * math.pi,
                        child: Container(
                          width: 108,
                          height: 108,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: SweepGradient(
                              colors: <Color>[
                                AppColors.primaryPurple
                                    .withValues(alpha: 0.08),
                                AppColors.primaryPurple,
                                AppColors.primaryBlue,
                                AppColors.primaryPurple
                                    .withValues(alpha: 0.08),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.cardColor(context),
                          boxShadow: AppColors.cardShadowList(context),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            Assets.iconsAiImage,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: AppColors.primaryPurple
                                  .withValues(alpha: 0.12),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.psychology_rounded,
                                color: AppColors.primaryPurple,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        _AnimatedLoadingLabel(text: l10n.preparingQuestions),
        const SizedBox(height: 8),
        Text(
          draft?.title.isNotEmpty == true
              ? l10n.basedOnDecision(draft!.title)
              : l10n.basedOnWizard,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textMuted(context),
            height: 1.45,
          ),
        ),
        const SizedBox(height: 28),
        _LoadingDotsRow(color: AppColors.primaryPurple),
      ],
    );
  }
}

class _AnimatedLoadingLabel extends StatelessWidget {
  const _AnimatedLoadingLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.textPrimary(context),
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}

class _LoadingDotsRow extends StatefulWidget {
  const _LoadingDotsRow({required this.color});

  final Color color;

  @override
  State<_LoadingDotsRow> createState() => _LoadingDotsRowState();
}

class _LoadingDotsRowState extends State<_LoadingDotsRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(3, (int index) {
            final double phase = (_controller.value + index / 3) % 1.0;
            final double opacity = 0.25 + (math.sin(phase * math.pi) * 0.75);
            final double scale = 0.75 + (math.sin(phase * math.pi) * 0.25);

            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
              child: Transform.scale(
                scale: scale,
                child: Opacity(
                  opacity: opacity.clamp(0.2, 1.0),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
