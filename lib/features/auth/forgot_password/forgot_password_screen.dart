import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_exception_mapper.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/utils/validators.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/custom_button.dart';
import '../shared/auth_ui.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  bool _isSubmitting = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _isSubmitting) return;

    setState(() => _isSubmitting = true);
    final l10n = context.l10n;
    try {
      await ref
          .read(authProvider.notifier)
          .sendPasswordResetEmail(_email.text.trim());
      if (!mounted) return;
      setState(() => _emailSent = true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.passwordResetEmailSent)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AuthExceptionMapper.message(e, l10n))),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AuthScreenShell(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: AuthBackButton(onTap: () => context.pop()),
            ),
            const SizedBox(height: 4),
            AuthBrandHeader(
              heroHeight: 132,
              titleLeading: '${l10n.forgotPasswordLeading} ',
              titleAccent: l10n.forgotPasswordAccent,
              subtitle: l10n.forgotPasswordSubtitle,
              titleFontSize: 28,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _email,
              validator: (String? v) => Validators.email(v, l10n),
              keyboardType: TextInputType.emailAddress,
              enabled: !_emailSent,
              decoration: InputDecoration(
                hintText: l10n.enterEmailHint,
                prefixIcon: const Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            AuthInfoCard(
              message: _emailSent
                  ? l10n.passwordResetEmailSent
                  : l10n.forgotPasswordInfo,
            ),
            const SizedBox(height: 20),
            CustomGradientButton(
              text: _isSubmitting
                  ? l10n.verifying
                  : l10n.sendPasswordResetLink,
              onTap: _isSubmitting || _emailSent ? null : _submit,
              showArrow: false,
              showSparkle: true,
            ),
            const SizedBox(height: 28),
            AuthFooterLink(
              leading: '${l10n.rememberPassword} ',
              action: l10n.login,
              onTap: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
