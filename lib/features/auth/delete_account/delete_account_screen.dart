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

class DeleteAccountScreen extends ConsumerStatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  ConsumerState<DeleteAccountScreen> createState() =>
      _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends ConsumerState<DeleteAccountScreen> {
  final TextEditingController _password = TextEditingController();
  bool _obscure = true;
  bool _wipeLocalData = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  Future<void> _confirmDelete() async {
    final l10n = context.l10n;
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(l10n.deleteAccount),
        content: Text(l10n.deleteAccountConfirm),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.backButton),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              l10n.deleteAccount,
              style: const TextStyle(color: Color(0xFFEF4444)),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    await _deleteAccount();
  }

  Future<void> _deleteAccount() async {
    final l10n = context.l10n;
    final bool needsPassword = ref.read(authProvider).hasPasswordProvider;
    if (needsPassword && _password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.passwordRequired)),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      await ref.read(authProvider.notifier).deleteAccount(
            password: needsPassword ? _password.text : null,
            wipeLocalData: _wipeLocalData,
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.accountDeleted)),
      );
      context.go(AppRoutes.login);
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
    final bool needsPassword = ref.watch(authProvider).hasPasswordProvider;

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
            titleLeading: '${l10n.deleteAccount}\n',
            titleAccent: '',
            subtitle: l10n.deleteAccountConfirm,
            titleFontSize: 26,
          ),
          const SizedBox(height: 24),
          AuthInfoCard(message: l10n.deleteAccountConfirm),
          const SizedBox(height: 16),
          if (needsPassword)
            TextFormField(
              controller: _password,
              obscureText: _obscure,
              validator: (String? v) => Validators.password(v, l10n),
              decoration: InputDecoration(
                hintText: l10n.currentPassword,
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
          if (needsPassword) const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: _wipeLocalData,
                  onChanged: (bool? value) =>
                      setState(() => _wipeLocalData = value ?? false),
                  activeColor: AppColors.primaryPurple,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    l10n.deleteAccountSuccess,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomGradientButton(
            text: _isSubmitting ? l10n.updating : l10n.deleteAccount,
            onTap: _isSubmitting ? null : _confirmDelete,
            showArrow: false,
            showSparkle: false,
          ),
        ],
      ),
    );
  }
}
