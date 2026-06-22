import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_exception_mapper.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/utils/validators.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/custom_button.dart';
import '../shared/auth_ui.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _current = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _current.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);
    final l10n = context.l10n;
    try {
      await ref.read(authProvider.notifier).changePassword(
            _current.text,
            _password.text,
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.passwordUpdatedLogin)),
      );
      context.pop();
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
              alignment: Directionality.of(context) == TextDirection.rtl
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: AuthBackButton(onTap: () => context.pop()),
            ),

            const SizedBox(height: 4),
            AuthBrandHeader(
              heroHeight: 132,
              titleLeading: '${l10n.changePassword}\n',
              titleAccent: '',
              subtitle: l10n.changePasswordSubtitle,
              titleFontSize: 26,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _current,
              obscureText: _obscureCurrent,
              validator: (String? v) => Validators.password(v, l10n),
              decoration: InputDecoration(
                hintText: l10n.currentPassword,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureCurrent
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () =>
                      setState(() => _obscureCurrent = !_obscureCurrent),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _password,
              obscureText: _obscureNew,
              validator: (String? v) => Validators.password(v, l10n),
              decoration: InputDecoration(
                hintText: l10n.newPassword,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNew
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => setState(() => _obscureNew = !_obscureNew),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _confirm,
              obscureText: _obscureConfirm,
              validator: Validators.confirmPassword(_password.text, l10n),
              decoration: InputDecoration(
                hintText: l10n.confirmNewPassword,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirm
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () =>
                      setState(() => _obscureConfirm = !_obscureConfirm),
                ),
              ),
            ),
            const SizedBox(height: 14),
            AuthInfoCard(message: l10n.passwordHint),
            const SizedBox(height: 20),
            CustomGradientButton(
              text: _isSubmitting ? l10n.updating : l10n.changePassword,
              onTap: _isSubmitting ? null : _submit,
              showArrow: false,
              showSparkle: true,
            ),
          ],
        ),
      ),
    );
  }
}
