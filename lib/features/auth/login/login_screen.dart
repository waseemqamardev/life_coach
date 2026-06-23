import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_exception_mapper.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/custom_button.dart';
import '../shared/auth_ui.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _remember = true;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _navigateAfterAuth(User user) async {
    if (!mounted) return;
    if (AuthRepository.hasPasswordProvider(user) && !user.emailVerified) {
      context.go(AppRoutes.emailVerification);
    } else {
      context.go(AppRoutes.home);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _isSubmitting) return;

    setState(() => _isSubmitting = true);
    final l10n = context.l10n;
    try {
      final UserCredential credential =
          await ref.read(authProvider.notifier).signInWithEmailPassword(
                _emailCtrl.text.trim(),
                _passCtrl.text,
              );
      await _navigateAfterAuth(credential.user!);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AuthExceptionMapper.message(e, l10n))),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    if (_isSubmitting) return;

    setState(() => _isSubmitting = true);
    final l10n = context.l10n;
    try {
      final UserCredential? credential =
          await ref.read(authProvider.notifier).signInWithGoogle();
      if (credential?.user != null) {
        await _navigateAfterAuth(credential!.user!);
      }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AuthBackButton(
                  onTap: () => context.go(AppRoutes.onboarding),
                ),
                AuthSectionLabel(label: l10n.welcomeBack),
              ],
            ),
            const SizedBox(height: 8),
            const AuthBrandHeader(),
            const SizedBox(height: 28),
            TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              validator: (String? v) => Validators.email(v, l10n),
              decoration: InputDecoration(
                hintText: l10n.emailAddress,
                prefixIcon: const Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _passCtrl,
              obscureText: _obscure,
              validator: (String? v) => Validators.password(v, l10n),
              decoration: InputDecoration(
                hintText: l10n.password,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _remember,
                        onChanged: (bool? v) =>
                            setState(() => _remember = v ?? false),
                        activeColor: AppColors.primaryPurple,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.rememberMe,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary(context),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => context.push(AppRoutes.forgotPassword),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    l10n.forgotPassword,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomGradientButton(
              text: _isSubmitting ? l10n.verifying : l10n.login,
              onTap: _isSubmitting ? null : _submit,
              showArrow: false,
              showSparkle: true,
            ),
            const SizedBox(height: 24),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(color: AppColors.borderColor(context)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    l10n.orContinueWith,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary(context),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.borderColor(context)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AuthGoogleSignInButton(
              label: l10n.continueWithGoogle,
              isLoading: _isSubmitting,
              onTap: _signInWithGoogle,
            ),
            // Apple and Facebook sign-in are disabled for now.
            // AuthGoogleSignInButton(label: 'Apple', onTap: null),
            // AuthGoogleSignInButton(label: 'Facebook', onTap: null),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _isSubmitting
                  ? null
                  : () async {
                      setState(() => _isSubmitting = true);
                      try {
                        await ref.read(authProvider.notifier).continueAsGuest();
                        if (mounted) {
                          context.go(AppRoutes.home);
                        }
                      } catch (e) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      } finally {
                        if (mounted) setState(() => _isSubmitting = false);
                      }
                    },
              child: Text(
                'Continue as Guest',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primaryPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 28),
            AuthFooterLink(
              leading: '${l10n.dontHaveAccount} ',
              action: l10n.signUp,
              onTap: () => context.push(AppRoutes.signup),
            ),
          ],
        ),
      ),
    );
  }
}
