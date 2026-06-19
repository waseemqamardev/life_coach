import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/logout_alert_dialog.dart';
import '../../../shared/widgets/profile_avatar.dart';
import '../../../shared/widgets/rtl_aware.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static const Color _titleBlue = Color(0xFF022088);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final auth = ref.watch(authProvider);
    final String name = auth.name.isEmpty ? 'Elif Mashal' : auth.name;
    final String email = auth.email.isEmpty ? 'elif@gmail.com' : auth.email;
    final String? photoPath =
        auth.photoPath.isEmpty ? null : auth.photoPath;

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${l10n.myProfileLeading} ',
                          style: AppTextStyles.h3.copyWith(
                            color: _titleBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return AppColors.primaryTwoGradient.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            );
                          },
                          blendMode: BlendMode.srcIn,
                          child: Text(
                            l10n.profile,
                            style: AppTextStyles.h3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 44),
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
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => context.push(AppRoutes.editProfile),
                        borderRadius: BorderRadius.circular(16),
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.selectedFillColor(context),
                            borderRadius: BorderRadius.circular(16),
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
                              const RtlChevronIcon(
                                color: Color(0xFF010E39),
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    _ProfileGroup(
                      title: l10n.account,
                      children: <Widget>[
                        _ProfileRow(
                          icon: Assets.iconsAiPersonal,
                          label: l10n.personalInformation,
                          onTap: () => context.push(AppRoutes.editProfile),
                        ),
                        _ProfileRow(
                          icon: Assets.iconsAiNotification,
                          label: l10n.notifications,
                          onTap: () => context.push(AppRoutes.notifications),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _ProfileGroup(
                      title: l10n.preferences,
                      children: <Widget>[
                        _ProfileRow(
                          icon: Assets.iconsAiTheme,
                          label: l10n.personalityPreferences,
                          onTap: () => context.push(AppRoutes.personality),
                        ),
                        _ProfileRow(
                          icon: Assets.iconsAiTheme,
                          label: l10n.settings,
                          onTap: () => context.push(AppRoutes.settings),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _ProfileGroup(
                      title: l10n.support,
                      children: <Widget>[
                        _ProfileRow(
                          icon: Assets.iconsAiHowToUse,
                          label: l10n.helpSupport,
                          onTap: () => context.push(AppRoutes.help),
                        ),
                        _ProfileRow(
                          icon: Assets.iconsAiAboutUs,
                          label: l10n.aboutUs,
                          onTap: () => context.push(AppRoutes.about),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _LogoutCard(
                      label: l10n.logOut,
                      onTap: () async {
                        final bool confirmed =
                            await showLogoutAlertDialog(context);
                        if (!confirmed || !context.mounted) return;

                        await ref.read(authProvider.notifier).logout();
                        if (context.mounted) context.go(AppRoutes.login);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileGroup extends StatelessWidget {
  const _ProfileGroup({
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
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderColor(context).withValues(alpha: 0.9),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
            child: Text(
              title,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primaryPurple,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;

  static const Color _chevronColor = Color(0xFF010E39);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
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
              const RtlChevronIcon(
                color: _chevronColor,
                size: 22,
              ),
            ],
          ),
        ),
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
            borderRadius: BorderRadius.circular(16),
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
