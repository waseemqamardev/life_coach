import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/l10n/rtl_layout.dart';
import 'app_card.dart';

/// A selectable option card with leading tinted icon, title, subtitle and a
/// trailing radio circle.
class SelectableOptionCard extends StatelessWidget {
  const SelectableOptionCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    this.tag,
    this.tagColor,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;
  final String? tag;
  final Color? tagColor;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      borderColor: selected
          ? AppColors.primaryPurple
          : AppColors.borderColor(context),
      child: Row(
        textDirection: Directionality.of(context),
        children: <Widget>[
          TintedIcon(icon: icon, color: iconColor),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.h4
                      .copyWith(color: AppColors.textPrimary(context)),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.bodySmall
                      .copyWith(color: AppColors.textSecondary(context)),
                ),
                if (tag != null) ...<Widget>[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: (tagColor ?? AppColors.success).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.shield_outlined,
                            size: 12, color: tagColor ?? AppColors.success),
                        const SizedBox(width: 4),
                        Text(
                          tag!,
                          style: AppTextStyles.caption.copyWith(
                              color: tagColor ?? AppColors.success,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          RtlRadioIndicator(
            selected: selected,
            accentColor: selected
                ? AppColors.primaryPurple
                : AppColors.borderColor(context),
            selectedInnerColor: AppColors.primaryPurple,
            selectedRingColor: AppColors.primaryPurple,
          ),
        ],
      ),
    );
  }
}

/// Horizontal labelled bar used on Key Factors / Career Breakdown screens.
class LabelledBar extends StatelessWidget {
  const LabelledBar({
    super.key,
    required this.icon,
    required this.label,
    required this.value, // 0..100
    required this.valueLabel,
    required this.color,
  });

  final IconData icon;
  final String label;
  final int value;
  final String valueLabel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: <Widget>[
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          SizedBox(
            width: 110,
            child: Text(label,
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.textPrimary(context))),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: (value / 100).clamp(0, 1).toDouble(),
                minHeight: 6,
                backgroundColor: AppColors.borderColor(context),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(valueLabel,
              style: AppTextStyles.bodySmall
                  .copyWith(color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// Quick-stat card with a tinted leading icon, big value, label.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
    this.bottomLabel,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;
  final String? bottomLabel;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TintedIcon(icon: icon, color: iconColor, size: 36, iconSize: 18),
          const SizedBox(height: 10),
          Text(label,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.textSecondary(context))),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.h3
                .copyWith(color: iconColor, fontWeight: FontWeight.w700),
          ),
          if (bottomLabel != null) ...<Widget>[
            const SizedBox(height: 4),
            Text(bottomLabel!,
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textMuted(context))),
          ],
        ],
      ),
    );
  }
}

/// "Why this matters" boxed callout - lightbulb on left, title+body.
class WhyThisMatters extends StatelessWidget {
  const WhyThisMatters({
    super.key,
    required this.title,
    required this.body,
    this.icon = Icons.lightbulb_outline_rounded,
  });
  final String title;
  final String body;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.softPrimary(context),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0x33FFFFFF),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primaryPurple, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: AppTextStyles.h4
                        .copyWith(color: AppColors.primaryPurple, fontSize: 14)),
                const SizedBox(height: 4),
                Text(body,
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textSecondary(context))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Footer used on every Continue screen: "🔒 Your data is secure and private".
class SecureFooter extends StatelessWidget {
  const SecureFooter({super.key, this.label = 'Your data is secure and private'});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.lock_outline_rounded,
              size: 14, color: AppColors.textMuted(context)),
          const SizedBox(width: 6),
          Text(label,
              style: AppTextStyles.caption
                  .copyWith(color: AppColors.textMuted(context))),
        ],
      ),
    );
  }
}
