import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/custom_button.dart';
import '../shared/auth_ui.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({
    super.key,
    required this.email,
    required this.name,
    required this.flow,
  });

  final String email;
  final String name;
  final String flow;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  String _otp = '';
  bool _isSubmitting = false;
  int _secondsLeft = 60;
  Timer? _timer;

  bool get _isResetFlow => widget.flow == 'reset';

  String get _email => widget.email.isNotEmpty
      ? widget.email
      : ref.watch(authProvider).email;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!mounted) return;
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft -= 1);
      }
    });
  }

  Future<void> _resend() async {
    if (!mounted) return;
    context.go(AppRoutes.forgotPassword);
  }

  Future<void> _verify() async {
    if (!mounted) return;
    context.go(AppRoutes.emailVerification);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final String subtitle = _isResetFlow
        ? l10n.otpResetSubtitle(_email)
        : l10n.otpVerifySubtitle(_email);

    return AuthScreenShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Directionality.of(context) == TextDirection.rtl
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: AuthBackButton(onTap: () => context.pop()),
          ),
          const SizedBox(height: 4),
          AuthBrandHeader(
            heroHeight: 132,
            titleLeading: _isResetFlow
                ? '${l10n.verifyLeading} '
                : '${l10n.verifyEmailLeading}\n',
            titleAccent: _isResetFlow ? l10n.codeWord : l10n.emailWord,
            subtitle: subtitle,
            titleFontSize: 28,
          ),
          const SizedBox(height: 24),
          AuthEmailChip(email: _email),
          const SizedBox(height: 20),
          AuthOtpInput(
            onChanged: (String value) => setState(() => _otp = value),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              _secondsLeft > 0
                  ? l10n.resendCodeIn(_secondsLeft)
                  : l10n.didntReceiveCode,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary(context),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: _secondsLeft == 0 && !_isSubmitting ? _resend : null,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                l10n.resendCode,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: _secondsLeft == 0
                      ? AppColors.primaryPurple
                      : AppColors.textMuted(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomGradientButton(
            text: _isSubmitting
                ? l10n.verifying
                : _isResetFlow
                    ? l10n.verifyCode
                    : l10n.verifyAndContinue,
            onTap: _isSubmitting ? null : _verify,
            showArrow: false,
            showSparkle: true,
          ),
          const SizedBox(height: 28),
          AuthFooterLink(
            leading: _isResetFlow
                ? '${l10n.rememberPassword} '
                : '${l10n.wrongEmail} ',
            action: _isResetFlow ? l10n.login : l10n.goBack,
            onTap: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
