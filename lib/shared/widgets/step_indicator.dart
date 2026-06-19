import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// 3 or 4 step indicator at the top of every wizard screen.
///
/// `currentStep` is 1-based.
class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.steps,
    required this.currentStep,
    this.completedShowsNumber = false,
  });

  final List<String> steps;
  final int currentStep;
  final bool completedShowsNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(steps.length, (int i) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: i == 0
                        ? const SizedBox(height: 0)
                        : _DottedConnector(color: AppColors.textMuted(context)),
                  ),
                  _circle(context, i),
                  Expanded(
                    child: i == steps.length - 1
                        ? const SizedBox(height: 0)
                        : _DottedConnector(color: AppColors.textMuted(context)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                steps[i],
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.label.copyWith(
                  color: _labelColor(context, i),
                  fontWeight: i + 1 == currentStep
                      ? FontWeight.w600
                      : FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Color _labelColor(BuildContext context, int i) {
    if (i + 1 == currentStep) return AppColors.primaryPurple;
    if (i + 1 < currentStep) return AppColors.textMuted(context);
    return AppColors.textMuted(context);
  }

  Widget _circle(BuildContext context, int i) {
    final bool isCurrent = i + 1 == currentStep;
    final bool isDone = i + 1 < currentStep;

    if (isDone) {
      return Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
        ),
        child: completedShowsNumber
            ? Text(
                '${i + 1}',
                style: AppTextStyles.label.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
            : const Icon(Icons.check_rounded, color: Colors.white, size: 14),
      );
    }

    if (isCurrent) {
      return Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryTwoGradient,
          shape: BoxShape.circle,
        ),
        child: Text(
          '${i + 1}',
          style: AppTextStyles.label.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      );
    }

    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        shape: BoxShape.circle,
        border: AppColors.isLight(context)
            ? null
            : Border.all(color: AppColors.darkBorder),
        boxShadow: AppColors.isLight(context)
            ? <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 2,
                ),
              ]
            : null,
      ),
      child: Text(
        '${i + 1}',
        style: AppTextStyles.label.copyWith(
          color: AppColors.textMuted(context),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _DottedConnector extends StatelessWidget {
  const _DottedConnector({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const double dotWidth = 1.5;
        const double spacing = 1.5;
        final int count =
            (constraints.maxWidth / (dotWidth + spacing)).floor().clamp(2, 20);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            count,
            (_) => Container(
              width: dotWidth,
              height: 1.5,
              margin: EdgeInsets.symmetric(horizontal: spacing / 2),
              color: color,
            ),
          ),
        );
      },
    );
  }
}
