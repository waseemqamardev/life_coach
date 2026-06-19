import 'package:flutter/material.dart';

import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../generated/assets.dart';

Future<bool> showLogoutAlertDialog(BuildContext context) async {
  final bool? confirmed = await showDialog<bool>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    builder: (BuildContext context) => const _LogoutAlertDialog(),
  );

  return confirmed ?? false;
}

class _LogoutAlertDialog extends StatelessWidget {
  const _LogoutAlertDialog();

  static const Color _titleBlue = Color(0xFF022088);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bool isDark = !AppColors.isLight(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        padding: const EdgeInsets.fromLTRB(21, 24, 21, 20),
        decoration: BoxDecoration(
        color: AppColors.cardColor(context),
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.selectedFillColor(context),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  Assets.iconsAiLogout,
                  width: 26,
                  height: 26,
                  fit: BoxFit.contain,
                  color: AppColors.primaryPurple,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.logout_rounded,
                    color: AppColors.primaryPurple,
                    size: 26,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.logOut,
              textAlign: TextAlign.center,
              style: AppTextStyles.h3.copyWith(
                color: isDark
                    ? AppColors.textPrimary(context)
                    : _titleBlue,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.logoutConfirmMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted(context),
                fontWeight: FontWeight.w500,
                fontSize: 13,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 22),
            _LogoutConfirmButton(
              label: l10n.logoutConfirmYes,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            const SizedBox(height: 10),
            _LogoutCancelButton(
              label: l10n.cancel,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutConfirmButton extends StatelessWidget {
  const _LogoutConfirmButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: AppColors.primaryTwoGradient,
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoutCancelButton extends StatelessWidget {
  const _LogoutCancelButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.selectedFillColor(context),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return AppColors.primaryTwoGradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              blendMode: BlendMode.srcIn,
              child: Text(
                label,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
