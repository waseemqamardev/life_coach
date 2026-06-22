import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/profile_avatar.dart';
import '../../../shared/widgets/logout_alert_dialog.dart';
import '../../../shared/widgets/rtl_aware.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true;

  static const Color _screenBg = Color(0xFFF7F8FA);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final auth = ref.watch(authProvider);
    final String name = auth.name.isEmpty ? 'Elif Mashal' : auth.name;
    final String email = auth.email.isEmpty ? 'elif@gmail.com' : auth.email;
    final bool showPasswordActions = auth.hasPasswordProvider;

    return Scaffold(
      backgroundColor: AppColors.surfaceBackground(context),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 4, 0),
              child: Row(
                children: <Widget>[
                  RtlBackIconButton(
                    onPressed: () => context.pop(),
                    size: 22,
                  ),
                  Expanded(
                    child: Text(
                      l10n.settings,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.appBarTitleColor(context),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.more_vert_rounded,
                  //     color: AppColors.primaryPurple,
                  //     size: 20,
                  //   ),
                  //   padding: EdgeInsets.zero,
                  //   constraints: const BoxConstraints(
                  //     minWidth: 44,
                  //     minHeight: 44,
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _ProfileCard(
                      name: name,
                      email: email,
                      photoPath: auth.photoPath.isEmpty ? null : auth.photoPath,
                    ),
                    const SizedBox(height: 14),
                    _SettingsGroup(
                      title: l10n.accountSettings,
                      children: <Widget>[
                        _SettingsRow(
                          icon: Assets.iconsAiPersonal,
                          label: l10n.personalInformation,
                          onTap: () => context.push(AppRoutes.editProfile),
                        ),
                        if (showPasswordActions)
                          _SettingsRow(
                            icon: Assets.iconsAiPrivacy,
                            label: l10n.changePassword,
                            onTap: () => context.push(AppRoutes.changePassword),
                          ),
                        _SettingsRow(
                          icon: Assets.iconsAiLogout,
                          label: l10n.deleteAccount,
                          onTap: () => context.push(AppRoutes.deleteAccount),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _SettingsGroup(
                      title: l10n.appSetting,
                      children: <Widget>[
                        _SettingsRow(
                          icon: Assets.iconsAiLanguages,
                          label: l10n.languages,
                          onTap: () =>
                              context.push(AppRoutes.languageSettings),
                        ),
                        _SettingsRow(
                          icon: Assets.iconsAiNotification,
                          label: l10n.notifications,
                          trailing: _GradientSwitch(
                            value: _notificationsEnabled,
                            onChanged: (bool value) {
                              setState(() => _notificationsEnabled = value);
                            },
                          ),
                        ),
                        _SettingsRow(
                          icon: Assets.iconsAiTheme,
                          label: l10n.appTheme,
                          onTap: () => context.push(AppRoutes.themeSettings),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _SettingsGroup(
                      title: l10n.securityPrivacy,
                      children: <Widget>[
                        _SettingsRow(
                          icon: Assets.iconsAiAboutUs,
                          label: l10n.aboutUs,
                          onTap: () => context.push(AppRoutes.about),
                        ),
                        _SettingsRow(
                          icon: Assets.iconsAiHowToUse,
                          label: l10n.howToUse,
                          onTap: () => context.push(AppRoutes.howToUse),
                        ),
                        _SettingsRow(
                          icon: Assets.iconsAiPrivacy,
                          label: l10n.privacyPolicy,
                          onTap: () => context.push(AppRoutes.privacyPolicy),
                        ),
                        _SettingsRow(
                          icon: Assets.iconsAiShare,
                          label: l10n.shareApp,
                          onTap: _shareApp,
                        ),
                        _SettingsRow(
                          icon: Assets.iconsAiRateUs,
                          label: l10n.rateUs,
                          onTap: _rateApp,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _LogoutCard(label: l10n.logout, onTap: _confirmLogout),

                    // ---- Not in Settings mockup (kept for later) ----
                    // _SettingsGroup(
                    //   title: 'Appearance',
                    //   children: <Widget>[
                    //     _SettingsRow(
                    //       icon: Assets.iconsAiTheme,
                    //       label: 'Theme',
                    //       onTap: () => context.push(AppRoutes.themeSettings),
                    //     ),
                    //   ],
                    // ),
                    // _SettingsGroup(
                    //   title: 'Account',
                    //   children: <Widget>[
                    //     _SettingsRow(
                    //       icon: Assets.iconsAiPersonal,
                    //       label: 'Profile',
                    //       onTap: () => context.push(AppRoutes.profile),
                    //     ),
                    //     _SettingsRow(
                    //       icon: Assets.iconsAiPersonal,
                    //       label: 'Premium',
                    //       onTap: () => context.push(AppRoutes.subscription),
                    //     ),
                    //   ],
                    // ),
                    // _SettingsGroup(
                    //   title: 'Legal',
                    //   children: <Widget>[
                    //     _SettingsRow(
                    //       icon: Assets.iconsAiPrivacy,
                    //       label: 'Terms of Service',
                    //       onTap: () => context.push(AppRoutes.terms),
                    //     ),
                    //   ],
                    // ),
                    // _SettingsGroup(
                    //   title: 'Support',
                    //   children: <Widget>[
                    //     _SettingsRow(
                    //       icon: Assets.iconsAiHowTouse,
                    //       label: 'Help & Support',
                    //       onTap: () => context.push(AppRoutes.help),
                    //     ),
                    //     _SettingsRow(
                    //       icon: Assets.iconsAiHowTouse,
                    //       label: 'FAQ',
                    //       onTap: () => context.push(AppRoutes.faq),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareApp() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.shareAppMessage)),
    );
  }

  void _rateApp() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.rateAppThanks)),
    );
  }

  Future<void> _confirmLogout() async {
    final bool confirmed = await showLogoutAlertDialog(context);
    if (!confirmed || !mounted) return;

    await ref.read(authProvider.notifier).logout();
    if (mounted) context.go(AppRoutes.login);
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.name,
    required this.email,
    this.photoPath,
  });

  final String name;
  final String email;
  final String? photoPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.selectedFillColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          ProfileAvatar(
            photoPath: photoPath,
            size: 56,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderColor(context).withValues(alpha: 0.9),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return AppColors.primaryTwoGradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              blendMode: BlendMode.srcIn,
              child: Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    required this.icon,
    required this.label,
    this.onTap,
    this.trailing,
  });

  final String icon;
  final String label;
  final VoidCallback? onTap;
  final Widget? trailing;

  static const Color _chevronColor = Color(0xFF010E39);

  @override
  Widget build(BuildContext context) {
    final Widget row = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: <Widget>[
          Image.asset(
            icon,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.circle_outlined,
              size: 24,
              color: AppColors.primaryPurple,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.h4.copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          trailing ??
              const RtlChevronIcon(
                color: _chevronColor,
                size: 22,
              ),
        ],
      ),
    );

    if (onTap == null) {
      return row;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: row,
      ),
    );
  }
}

class _LogoutCard extends StatelessWidget {
  const _LogoutCard({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  static const Color _logoutRed = Color(0xFFEF4444);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
        color: AppColors.cardColor(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderColor(context).withValues(alpha: 0.9),
            ),
          ),
          child: Row(
            children: <Widget>[
              Image.asset(
                Assets.iconsAiLogout,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.logout_rounded,
                  color: _logoutRed,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.h4.copyWith(
                    color: _logoutRed,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const RtlChevronIcon(
                color: _logoutRed,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradientSwitch extends StatelessWidget {
  const _GradientSwitch({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  static const double _width = 32;
  static const double _height = 18;
  static const double _padding = 3;

  @override
  Widget build(BuildContext context) {
    const double thumbSize = _height - (_padding * 2);

    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: _width,
        height: _height,
        padding: const EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_height / 2),
          gradient: value ? AppColors.primaryTwoGradient : null,
          color: value ? null : const Color(0xFFE5E7EB),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: value ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
        color: AppColors.lightCard,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
