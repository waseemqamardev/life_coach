import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static String _messageLeading(String message) {
    final String trimmed = message.replaceAll(RegExp(r'[.…]+$'), '');
    final int space = trimmed.lastIndexOf(' ');
    if (space < 0) return trimmed;
    return '${trimmed.substring(0, space)} ';
  }

  static String _messageAccent(String message) {
    final String trimmed = message.replaceAll(RegExp(r'[.…]+$'), '');
    final int space = trimmed.lastIndexOf(' ');
    if (space < 0) return '';
    return trimmed.substring(space + 1);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              SizedBox(
                width: 160,
                height: 160,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: CircularProgressIndicator(
                        value: 0.72,
                        strokeWidth: 10,
                        backgroundColor: AppColors.borderColor(context),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primaryPurple),
                      ),
                    ),
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(22)),
                      child: const Icon(Icons.rocket_launch_rounded,
                          color: Colors.white, size: 42),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('72%',
                  style: AppTextStyles.h1
                      .copyWith(color: AppColors.primaryPurple)),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: _messageLeading(l10n.loadingMessage),
                      style: AppTextStyles.h3.copyWith(
                          color: AppColors.textPrimary(context))),
                  TextSpan(
                      text: _messageAccent(l10n.loadingMessage),
                      style: AppTextStyles.h3
                          .copyWith(color: AppColors.primaryPurple)),
                ]),
              ),
              const SizedBox(height: 8),
              Text(l10n.loadingSubtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary(context))),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
