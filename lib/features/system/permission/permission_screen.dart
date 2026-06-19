import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  Map<String, bool>? _granted;

  static String _titleLeading(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return title;
    return '${title.substring(0, space)} ';
  }

  static String _titleAccent(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return '';
    return title.substring(space + 1);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    _granted ??= <String, bool>{
      l10n.notifications: false,
      l10n.permissionLocation: false,
      l10n.permissionStorage: true,
    };

    final Map<String, bool> granted = _granted!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: <Color>[
                    AppColors.success.withOpacity(0.18),
                    Colors.transparent,
                  ]),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(Icons.shield_outlined,
                      size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              Text.rich(
                TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: _titleLeading(l10n.permissionTitle),
                      style: AppTextStyles.h2.copyWith(
                          color: AppColors.textPrimary(context))),
                  TextSpan(
                      text: _titleAccent(l10n.permissionTitle),
                      style: AppTextStyles.h2
                          .copyWith(color: AppColors.primaryPurple)),
                ]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(l10n.permissionSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary(context))),
              const SizedBox(height: 24),
              _perm(context, Icons.notifications_none_rounded,
                  AppColors.warning, l10n.notifications,
                  l10n.permissionNotificationsDesc, granted),
              _perm(context, Icons.location_on_outlined, AppColors.info,
                  l10n.permissionLocation, l10n.permissionLocationDesc, granted),
              _perm(context, Icons.folder_outlined, AppColors.success,
                  l10n.permissionStorage, l10n.permissionStorageDesc, granted),
              const SizedBox(height: 18),
              GradientButton(
                  label: l10n.grantAll,
                  icon: Icons.check_rounded,
                  onPressed: () {
                    setState(() {
                      for (final String k in granted.keys.toList()) {
                        granted[k] = true;
                      }
                    });
                  }),
              const SizedBox(height: 10),
              OutlineSecondaryButton(
                  label: l10n.notNow,
                  onPressed: () => context.pop()),
              const SizedBox(height: 12),
              SecureFooter(label: l10n.permissionSettingsNote),
            ],
          ),
        ),
      ),
    );
  }

  Widget _perm(BuildContext c, IconData icon, Color color, String title,
      String body, Map<String, bool> granted) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        child: Row(
          children: <Widget>[
            TintedIcon(icon: icon, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: AppTextStyles.h4.copyWith(
                          color: AppColors.textPrimary(c), fontSize: 14)),
                  Text(body,
                      style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary(c))),
                ],
              ),
            ),
            Switch(
              value: granted[title]!,
              onChanged: (bool v) => setState(() => granted[title] = v),
              activeTrackColor: AppColors.primaryPurple,
            ),
          ],
        ),
      ),
    );
  }
}
