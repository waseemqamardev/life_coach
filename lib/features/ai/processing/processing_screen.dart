import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_env.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/errors/ai_exception.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/services/decision_analysis_service.dart';
import '../../../data/models/decision.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../../providers/providers.dart';

class ProcessingScreen extends ConsumerStatefulWidget {
  const ProcessingScreen({super.key});

  @override
  ConsumerState<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends ConsumerState<ProcessingScreen> {
  List<String> _phases = <String>[];
  int _phaseIndex = 0;
  double _progress = 0;

  Timer? _tickTimer;
  Stopwatch? _stopwatch;

  bool _analysisComplete = false;
  Duration _analysisElapsed = Duration.zero;
  AnalysisResult? _analysisResult;
  String? _analysisError;
  AiException? _aiException;
  bool _hasFinished = false;

  List<String> _buildPhases(AppLocalizations l10n) => <String>[
        l10n.processingAnalyzing,
        l10n.processingRisk,
        l10n.processingOutcomes,
        l10n.processingPlan,
        l10n.processingFinalizing,
      ];

  @override
  void initState() {
    super.initState();
    _phases = _buildPhases(lookupAppLocalizations(ref.read(localeProvider)));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _run();
    });
  }

  Future<void> _run() async {
    final AppLocalizations l10n =
        lookupAppLocalizations(ref.read(localeProvider));
    _phases = _buildPhases(l10n);
    if (mounted) {
      setState(() {
        _phaseIndex = 0;
        _progress = 0;
      });
    }

    final Decision? draft = ref.read(draftDecisionProvider);
    if (draft == null) {
      if (mounted) context.go(AppRoutes.home);
      return;
    }

    if (!AppEnv.hasGeminiKey) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.missingApiKey)),
      );
      context.pop();
      return;
    }

    _stopwatch = Stopwatch()..start();
    _startProgressTicker();

    await _runAnalysis(draft, l10n);
  }

  Future<void> _runAnalysis(Decision draft, AppLocalizations l10n) async {
    AnalysisRunOutcome outcome = AnalysisRunOutcome.failure(
      message: l10n.analysisFailed,
    );

    try {
      outcome = await ref
          .read(analysisWorkflowProvider.notifier)
          .run(draft, ref.read(localeProvider));
    } catch (e) {
      outcome = AnalysisRunOutcome.failure(
        message: e is AiException ? e.userMessage : l10n.analysisFailed,
        exception: e is AiException ? e : null,
      );
    }

    if (!mounted) return;

    _analysisElapsed = _stopwatch?.elapsed ?? Duration.zero;
    if (outcome.isSuccess) {
      _analysisResult = outcome.result;
      _analysisError = null;
      _aiException = null;
    } else {
      _analysisResult = null;
      _analysisError = outcome.errorMessage;
      _aiException = outcome.exception;
    }
    _analysisComplete = true;

    await _waitForProgressCompletion();
    if (!mounted) return;

    await _finish(l10n: lookupAppLocalizations(ref.read(localeProvider)));
  }

  Future<void> _waitForProgressCompletion() async {
    while (mounted) {
      final Duration elapsed = _stopwatch?.elapsed ?? Duration.zero;
      final double progress = _computeProgress(elapsed);
      final int phaseIndex =
      (progress * _phases.length).floor().clamp(0, _phases.length - 1);

      setState(() {
        _progress = progress;
        _phaseIndex = phaseIndex;
      });

      if (_analysisComplete && progress >= 1.0) {
        break;
      }

      await Future<void>.delayed(ProcessingTiming.tickInterval);
    }
  }

  void _startProgressTicker() {
    _tickTimer?.cancel();
    _tickTimer = Timer.periodic(ProcessingTiming.tickInterval, (_) {
      if (!mounted || _stopwatch == null || _analysisComplete) return;

      final Duration elapsed = _stopwatch!.elapsed;
      final double progress = _computeProgress(elapsed);
      final int phaseIndex =
      (progress * _phases.length).floor().clamp(0, _phases.length - 1);

      setState(() {
        _progress = progress;
        _phaseIndex = phaseIndex;
      });
    });
  }

  double _computeProgress(Duration elapsed) {
    if (!_analysisComplete) {
      final double ratio = elapsed.inMilliseconds /
          ProcessingTiming.minDisplayDuration.inMilliseconds;
      return (ratio * ProcessingTiming.maxProgressWhileLoading)
          .clamp(0.0, ProcessingTiming.maxProgressWhileLoading);
    }

    final int totalMs = [
      ProcessingTiming.minDisplayDuration.inMilliseconds,
      _analysisElapsed.inMilliseconds,
      elapsed.inMilliseconds,
    ].reduce((int a, int b) => a > b ? a : b);

    return (elapsed.inMilliseconds / totalMs).clamp(0.0, 1.0);
  }

  String _resolveErrorMessage(AppLocalizations l10n) {
    final AiException? exception = _aiException;
    if (exception is AiMissingApiKeyException) {
      return l10n.missingApiKey;
    }
    if (exception is AiNetworkException) {
      return l10n.noInternetSubtitle;
    }
    if (exception != null && exception.userMessage.isNotEmpty) {
      return exception.userMessage;
    }
    final String message = _analysisError?.trim() ?? '';
    return message.isEmpty ? l10n.analysisFailed : message;
  }

  Future<void> _finish({required AppLocalizations l10n}) async {
    if (_hasFinished) return;
    _hasFinished = true;
    _tickTimer?.cancel();
    await Future<void>.delayed(ProcessingTiming.completeAnimation);
    if (!mounted) return;

    if (_analysisResult == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_resolveErrorMessage(l10n))),
      );
      context.pop();
      return;
    }

    ref.read(decisionsProvider.notifier).refresh();
    ref.read(draftDecisionProvider.notifier).start(_analysisResult!.decision);
    if (mounted) context.go(AppRoutes.decisionResult);
  }

  @override
  void dispose() {
    _tickTimer?.cancel();
    _stopwatch?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> phases = _phases.isEmpty
        ? _buildPhases(lookupAppLocalizations(ref.watch(localeProvider)))
        : _phases;
    final String phaseText = phases.isEmpty
        ? ''
        : phases[_phaseIndex.clamp(0, phases.length - 1)];

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              const Spacer(flex: 1),
              const _ProcessingIllustration(),
              Text(
                phaseText,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textMuted(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              _GradientProgressBar(value: _progress),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProcessingIllustration extends StatelessWidget {
  const _ProcessingIllustration();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.iconsProcessing,
      width: 314,
      height: 165,
      fit: BoxFit.contain,
    );
  }
}

class _GradientProgressBar extends StatelessWidget {
  const _GradientProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double fillWidth = width * value.clamp(0.0, 1.0);

        return SizedBox(
          height: 6,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              AnimatedContainer(
                duration: ProcessingTiming.tickInterval,
                width: fillWidth,
                height: 6,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}