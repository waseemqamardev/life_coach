import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_exception_mapper.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/custom_button.dart';
import '../shared/auth_ui.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _agreed = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = context.l10n;
    if (!_formKey.currentState!.validate()) return;
    if (!_agreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.acceptTermsRequired)),
      );
      return;
    }
    if (_isSubmitting) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(authProvider.notifier).signUpWithEmailPassword(
            _email.text.trim(),
            _pass.text,
            displayName: _name.text.trim(),
          );
      if (!mounted) return;
      context.go(AppRoutes.emailVerification);
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
              titleLeading: '${l10n.signupTitleLeading}\n',
              titleAccent: l10n.account,
              subtitle: l10n.signupSubtitle,
              titleFontSize: 28,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _name,
              validator: (String? v) =>
                  Validators.required(v, l10n, field: l10n.fullName),
              decoration: InputDecoration(
                hintText: l10n.fullName,
                prefixIcon: const Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              validator: (String? v) => Validators.email(v, l10n),
              decoration: InputDecoration(
                hintText: l10n.emailAddress,
                prefixIcon: const Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _pass,
              obscureText: _obscure1,
              validator: (String? v) => Validators.password(v, l10n),
              decoration: InputDecoration(
                hintText: l10n.password,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure1
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => setState(() => _obscure1 = !_obscure1),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _confirm,
              obscureText: _obscure2,
              validator: Validators.confirmPassword(_pass.text, l10n),
              decoration: InputDecoration(
                hintText: l10n.confirmPassword,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure2
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => setState(() => _obscure2 = !_obscure2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _agreed,
                    onChanged: (bool? v) =>
                        setState(() => _agreed = v ?? false),
                    activeColor: AppColors.primaryPurple,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: l10n.iAgreeToThe,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context),
                            ),
                          ),
                          TextSpan(
                            text: l10n.termsOfService,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primaryPurple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context),
                            ),
                          ),
                          TextSpan(
                            text: l10n.privacyPolicy,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primaryPurple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomGradientButton(
              text: _isSubmitting ? l10n.verifying : l10n.createAccount,
              onTap: _isSubmitting ? null : _submit,
              showArrow: false,
              showSparkle: true,
            ),
            const SizedBox(height: 28),
            AuthFooterLink(
              leading: '${l10n.alreadyHaveAccount} ',
              action: l10n.login,
              onTap: () => context.go(AppRoutes.login),
            ),
          ],
        ),
      ),
    );
  }
}
