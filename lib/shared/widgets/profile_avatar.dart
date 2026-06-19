import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../generated/assets.dart';

/// Circular avatar that shows a local profile photo or the default placeholder.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.photoPath,
    required this.size,
    this.onTap,
    this.showCameraBadge = false,
  });

  final String? photoPath;
  final double size;
  final VoidCallback? onTap;
  final bool showCameraBadge;

  @override
  Widget build(BuildContext context) {
    final Widget avatar = ClipOval(
      child: _buildImage(context),
    );

    Widget content = avatar;
    if (showCameraBadge && onTap != null) {
      content = Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          avatar,
          Positioned(
            right: -2,
            bottom: -2,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: size * 0.4,
                height: size * 0.4,
                decoration: BoxDecoration(
                  color: AppColors.cardColor(context),
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    Assets.iconsAiCamera,
                    width: size * 0.25,
                    height: size * 0.25,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (onTap == null) return content;

    return GestureDetector(
      onTap: onTap,
      child: content,
    );
  }

  Widget _buildImage(BuildContext context) {
    final String? path = photoPath;
    if (path != null &&
        path.isNotEmpty &&
        File(path).existsSync()) {
      return Image.file(
        File(path),
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholder(context),
      );
    }
    return _placeholder(context);
  }

  Widget _placeholder(BuildContext context) {
    return Image.asset(
      Assets.iconsAiImage,
      width: size,
      height: size,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        width: size,
        height: size,
        color: AppColors.selectedFillColor(context),
        child: Icon(
          Icons.smart_toy_outlined,
          color: AppColors.primaryPurple,
          size: size * 0.5,
        ),
      ),
    );
  }
}
