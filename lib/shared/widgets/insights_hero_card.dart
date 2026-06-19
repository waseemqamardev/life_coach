import 'package:flutter/material.dart';

import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../generated/assets.dart';

/// Lavender hero card shown at the top of the Insights screen.
class InsightsHeroCard extends StatelessWidget {
  const InsightsHeroCard({super.key, this.description});

  final String? description;

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
    final bool isDark = !AppColors.isLight(context);
    final String resolvedDescription =
        description ?? l10n.insightsHeroDescription;
    final String titleLeading = _titleLeading(l10n.aiNavigator);
    final String titleAccent = _titleAccent(l10n.aiNavigator);

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 16, 14),
      decoration: BoxDecoration(
        color: AppColors.greetingCardColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark ? AppColors.cardShadowList(context) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryTwoGradient,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.primaryPurple.withValues(alpha: 0.28),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(2),
            child: ClipOval(
              child: Image.asset(
                Assets.iconsAiImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.primaryPurple.withValues(alpha: 0.15),
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.iconsAiChat,
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: titleLeading,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.accentTitleColor(context),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          height: 1.2,
                        ),
                      ),
                      TextSpan(
                        text: titleAccent,
                        style: AppTextStyles.h4.copyWith(
                          color: isDark
                              ? AppColors.textPrimary(context)
                              : AppColors.primaryPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  resolvedDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    height: 1.45,
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
