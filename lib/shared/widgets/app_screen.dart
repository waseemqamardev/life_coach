import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'rtl_aware.dart';

/// Standard screen scaffold: rounded back button, two-color gradient title
/// ("White White Purple"), optional trailing action, scrollable body.
class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.titleLeading,
    required this.titleAccent,
    required this.child,
    this.subtitle,
    this.trailing,
    this.bottomNavBar,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 24),
    this.showBack = true,
    this.plainBackButton = false,
    this.onBack,
    this.backgroundColor,
  });

  final String titleLeading;
  final String titleAccent;
  final String? subtitle;
  final Widget? trailing;
  final Widget child;
  final Widget? bottomNavBar;
  final EdgeInsetsGeometry padding;
  final bool showBack;
  final bool plainBackButton;
  final VoidCallback? onBack;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: bottomNavBar != null,
      backgroundColor: backgroundColor ?? AppColors.scaffoldColor(context),
      bottomNavigationBar: bottomNavBar,
      body: SafeArea(
        bottom: bottomNavBar == null,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Row(
                children: <Widget>[
                  if (showBack)
                    plainBackButton
                        ? RtlBackIconButton(
                            onPressed:
                                onBack ?? () => Navigator.of(context).maybePop(),
                            size: 24,
                          )
                        : _RoundedIconButton(
                            onTap: onBack ??
                                () => Navigator.of(context).maybePop(),
                          )
                  else
                    const SizedBox(width: 44),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: '$titleLeading ',
                                style: AppTextStyles.h3.copyWith(
                                  color: AppColors.appBarTitleColor(context),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: titleAccent,
                                style: AppTextStyles.h3.copyWith(
                                  color: AppColors.appBarAccentColor(context),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (subtitle != null) ...<Widget>[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary(context)),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null)
                    trailing!
                  else
                    const SizedBox(width: 44),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: padding,
                physics: const BouncingScrollPhysics(),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundedIconButton extends StatelessWidget {
  const _RoundedIconButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardColor(context),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor(context)),
          ),
          child: RtlBackArrowImage(size: 22),
        ),
      ),
    );
  }
}
