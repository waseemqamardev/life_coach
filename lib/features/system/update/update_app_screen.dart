import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class UpdateAppScreen extends StatelessWidget {
  const UpdateAppScreen({super.key});

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
              const SizedBox(height: 32),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: <Color>[
                        AppColors.primaryPurple.withOpacity(0.18),
                        Colors.transparent,
                      ]),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 140,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.system_update_alt_rounded,
                        color: Colors.white, size: 60),
                  ),
                  Positioned(
                    top: 18,
                    right: 30,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                          color: AppColors.success, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_upward_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text.rich(
                TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: _titleLeading(l10n.updateAvailable),
                      style: AppTextStyles.h2.copyWith(
                          color: AppColors.textPrimary(context))),
                  TextSpan(
                      text: _titleAccent(l10n.updateAvailable),
                      style: AppTextStyles.h2
                          .copyWith(color: AppColors.primaryPurple)),
                ]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(l10n.updateVersionReady('1.1.0'),
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary(context))),
              const SizedBox(height: 24),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(l10n.whatsNew,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context))),
                    const SizedBox(height: 10),
                    for (final String t in <String>[
                      l10n.updateFeature1,
                      l10n.updateFeature2,
                      l10n.updateFeature3,
                      l10n.updateFeature4,
                    ])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.auto_awesome_rounded,
                                color: AppColors.warning, size: 18),
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
                  label: l10n.updateNow,
                  icon: Icons.download_rounded,
                  onPressed: () {}),
              const SizedBox(height: 10),
              OutlineSecondaryButton(
                  label: l10n.remindLater,
                  icon: Icons.schedule_rounded,
                  onPressed: () => context.pop()),
            ],
          ),
        ),
      ),
    );
  }
}
