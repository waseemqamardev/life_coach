import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Circular score gauge with gradient stroke and big number in centre.
///
/// Used on Home, Outcome Prediction, Final Recommendation, Risk Score, etc.
class ScoreGauge extends StatelessWidget {
  const ScoreGauge({
    super.key,
    required this.value,
    this.size = 110,
    this.suffix = '/100',
    this.strokeWidth = 10,
    this.colors,
  });

  final int value; // 0..100
  final double size;
  final String suffix;
  final double strokeWidth;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GaugePainter(
          progress: (value / 100).clamp(0, 1).toDouble(),
          strokeWidth: strokeWidth,
          colors: colors ??
              <Color>[AppColors.success, AppColors.primaryPurple],
          trackColor: AppColors.borderColor(context),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                value.toString(),
                style: AppTextStyles.bigScore
                    .copyWith(color: AppColors.success, fontSize: size * 0.3),
              ),
              const SizedBox(height: 2),
              Text(
                suffix,
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.textMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({
    required this.progress,
    required this.strokeWidth,
    required this.colors,
    required this.trackColor,
  });

  final double progress;
  final double strokeWidth;
  final List<Color> colors;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Rect innerRect =
        rect.deflate(strokeWidth / 2);
    final double startAngle = math.pi * 0.75; // 135°
    final double sweepFull = math.pi * 1.5; // 270°
    final double sweep = sweepFull * progress;

    final Paint trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(innerRect, startAngle, sweepFull, false, trackPaint);

    final Paint progressPaint = Paint()
      ..shader = SweepGradient(
        startAngle: startAngle,
        endAngle: startAngle + sweepFull,
        colors: colors,
      ).createShader(innerRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(innerRect, startAngle, sweep, false, progressPaint);
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.progress != progress || old.colors != colors;
}
