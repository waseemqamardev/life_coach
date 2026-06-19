import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: <Color>[
                    AppColors.info.withOpacity(0.18),
                    Colors.transparent,
                  ]),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.info.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(Icons.wifi_off_rounded,
                      size: 50, color: AppColors.info),
                ),
              ),
              const SizedBox(height: 24),
              Text.rich(
                TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: _titleLeading(l10n.noInternetTitle),
                      style: AppTextStyles.h2.copyWith(
                          color: AppColors.textPrimary(context))),
                  TextSpan(
                      text: _titleAccent(l10n.noInternetTitle),
                      style: AppTextStyles.h2.copyWith(color: AppColors.info)),
                ]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(l10n.noInternetSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary(context))),
              const SizedBox(height: 24),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(l10n.noInternetYouCanStill,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context))),
                    const SizedBox(height: 10),
                    for (final String t in <String>[
                      l10n.offlineTip1,
                      l10n.offlineTip2,
                      l10n.offlineTip3,
                    ])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.check_circle_rounded,
                                color: AppColors.success, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(t,
                                  style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textPrimary(context))),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              GradientButton(
                  label: l10n.retryConnection,
                  icon: Icons.refresh_rounded,
                  onPressed: () => context.pop()),
              const SizedBox(height: 10),
              OutlineSecondaryButton(
                  label: l10n.offlineMode,
                  icon: Icons.offline_bolt_outlined,
                  onPressed: () => context.pop()),
            ],
          ),
        ),
      ),
    );
  }
}
