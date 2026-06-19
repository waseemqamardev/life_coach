import 'package:flutter/material.dart';

import '../../core/l10n/rtl_layout.dart';
import '../../core/theme/app_colors.dart';
import '../../generated/assets.dart';

/// Gradient back arrow in light theme; solid white in dark theme.
class RtlBackArrowImage extends StatelessWidget {
  const RtlBackArrowImage({super.key, this.size = 22, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color? tint = color ??
        (!AppColors.isLight(context) ? AppColors.appBarIconColor(context) : null);

    Widget image = RtlMirror(
      child: Image.asset(
        Assets.iconsArrowBack,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => Icon(
          Icons.arrow_back_rounded,
          size: size,
          color: tint ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );

    if (tint != null) {
      image = ColorFiltered(
        colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
        child: image,
      );
    }

    return image;
  }
}

/// Back navigation control — auto-mirrors in RTL.
class RtlBackIconButton extends StatelessWidget {
  const RtlBackIconButton({
    super.key,
    required this.onPressed,
    this.size = 22,
    this.color,
  });

  final VoidCallback onPressed;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: RtlBackArrowImage(size: size, color: color),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minWidth: size + 22, minHeight: size + 22),
    );
  }
}

/// List/disclosure chevron — auto-mirrors in RTL via Material icon.
class RtlChevronIcon extends StatelessWidget {
  const RtlChevronIcon({super.key, this.color, this.size = 22});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.chevron_right_rounded, color: color, size: size);
  }
}

/// Forward/continue arrow — auto-mirrors in RTL via Material icon.
class RtlForwardArrowIcon extends StatelessWidget {
  const RtlForwardArrowIcon({super.key, this.color, this.size = 20});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_rounded,
      color: color ?? Colors.white,
      size: size,
    );
  }
}

/// PNG forward arrow mirrored for legacy asset buttons.
class RtlForwardImage extends StatelessWidget {
  const RtlForwardImage({super.key, this.size = 16});

  final double size;

  @override
  Widget build(BuildContext context) {
    return RtlMirror(
      child: Image.asset(
        Assets.iconsForwardArrow,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            RtlForwardArrowIcon(size: size, color: Colors.white),
      ),
    );
  }
}
