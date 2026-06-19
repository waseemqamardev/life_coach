import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_exception_mapper.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/custom_button.dart';
import '../shared/auth_ui.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  Timer? _pollTimer;
  bool _isResending = false;

  @override
  void initState() {
    super.initState();
    _pollTimer = Timer.periodic(const Duration(seconds: 6), (_) => _checkVerified());
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkVerified() async {
    final bool verified =
        await ref.read(authProvider.notifier).reloadUser();
    if (!mounted || !verified) return;
    context.go(AppRoutes.home);
  }

  Future<void> _resend() async {
    if (_isResending) return;
    setState(() => _isResending = true);
    final l10n = context.l10n;
    try {
      await ref.read(authProvider.notifier).sendEmailVerification();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.emailVerificationResent)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AuthExceptionMapper.message(e, l10n))),
      );
    } finally {
      if (mounted) setState(() => _isResending = false);
    }
  }

  Future<void> _signOut() async {
    await ref.read(authProvider.notifier).signOut();
    if (mounted) context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final String email = ref.watch(authProvider).email;

    return AuthScreenShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AuthBackButton(onTap: _signOut),
              AuthSectionLabel(label: l10n.emailVerificationTitle),
            ],
          ),
          const SizedBox(height: 8),
          AuthBrandHeader(
            heroHeight: 132,
            titleLeading: '${l10n.verifyEmailLeading}\n',
            titleAccent: l10n.emailWord,
            subtitle: l10n.emailVerificationSubtitle,
            titleFontSize: 28,
          ),
          const SizedBox(height: 24),
          if (email.isNotEmpty) AuthEmailChip(email: email),
          const SizedBox(height: 16),
          AuthInfoCard(message: l10n.emailVerificationSpamHint),
          const SizedBox(height: 16),
          Center(
            child: Text(
              l10n.emailVerificationWaiting,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary(context),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomGradientButton(
            text: _isResending
                ? l10n.verifying
                : l10n.emailVerificationResend,
            onTap: _isResending ? null : _resend,
            showArrow: false,
            showSparkle: true,
          ),
          const SizedBox(height: 28),
          AuthFooterLink(
            leading: '${l10n.wrongEmail} ',
            action: l10n.login,
            onTap: _signOut,
          ),
        ],
      ),
    );
  }
}
