import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

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
                    AppColors.danger.withOpacity(0.18),
                    Colors.transparent,
                  ]),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.danger.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(Icons.warning_amber_rounded,
                      size: 50, color: AppColors.danger),
                ),
              ),
              const SizedBox(height: 24),
              Text.rich(
                TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: _titleLeading(l10n.errorTitle),
                      style: AppTextStyles.h2.copyWith(
                          color: AppColors.textPrimary(context))),
                  TextSpan(
                      text: _titleAccent(l10n.errorTitle),
                      style:
                          AppTextStyles.h2.copyWith(color: AppColors.danger)),
                ]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(l10n.errorSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary(context))),
              const SizedBox(height: 24),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(l10n.errorWhatYouCanDo,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context))),
                    const SizedBox(height: 10),
                    for (final String t in <String>[
                      l10n.errorTip1,
                      l10n.errorTip2,
                      l10n.errorTip3,
                      l10n.errorTip4,
                    ])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.check_circle_outline_rounded,
                                color: AppColors.primaryPurple, size: 18),
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
                  label: l10n.tryAgain,
                  icon: Icons.refresh_rounded,
                  onPressed: () => context.pop()),
              const SizedBox(height: 10),
              OutlineSecondaryButton(
                  label: l10n.contactSupport,
                  icon: Icons.support_agent_rounded,
                  onPressed: () {}),
              const SizedBox(height: 16),
              const SecureFooter(label: 'Error code: 500_AI_TIMEOUT'),
            ],
          ),
        ),
      ),
    );
  }
}
