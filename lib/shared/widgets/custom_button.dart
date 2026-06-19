import 'package:ai_life_navigator/core/l10n/rtl_layout.dart';
import 'package:ai_life_navigator/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import 'rtl_aware.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.text,
    this.onTap,
    this.showArrow = true,
    this.showSparkle = true,
    this.borderRadius = 12,
    this.height = 54,
  });

  final String text;
  final VoidCallback? onTap;
  final bool showArrow;
  final bool showSparkle;
  final double borderRadius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            begin: context.gradientStart,
            end: context.gradientEnd,
            colors: const <Color>[
              Color(0xFF012EED),
              Color(0xFF8951FB),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: Directionality.of(context),
              children: <Widget>[
                Text(
                  text,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (showArrow) ...<Widget>[
                  const SizedBox(width: 4),
                  RtlForwardImage(size: 16),
                ],
              ],
            ),
            if (showSparkle)
              PositionedDirectional(
                end: 12,
                child: Image.asset(
                  Assets.iconsSparkle,
                  width: 47,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
