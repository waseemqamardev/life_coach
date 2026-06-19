import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SelectionCheckCircle extends StatelessWidget {
  const SelectionCheckCircle({
    super.key,
    required this.selected,
    this.size = 20,
    this.borderColor = AppColors.primaryPurple,
    this.borderWidth = 1.5,
    this.checkSize = 12,
  });

  final bool selected;
  final double size;
  final Color borderColor;
  final double borderWidth;
  final double checkSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: selected ? AppColors.primaryTwoGradient : null,
        color: selected ? null : AppColors.cardColor(context),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: selected
          ? Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: checkSize,
            )
          : null,
    );
  }
}
