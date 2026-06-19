import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/app_screen.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<({String h, String b})> sections = _sections(l10n);
    return AppScreen(
      titleLeading: l10n.termsLeading,
      titleAccent: l10n.termsAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.termsLastUpdated,
              style: AppTextStyles.caption
                  .copyWith(color: AppColors.textMuted(context))),
          const SizedBox(height: 16),
          for (final ({String h, String b}) s in sections)
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(s.h,
                      style: AppTextStyles.h4.copyWith(
                          color: AppColors.primaryPurple)),
                  const SizedBox(height: 6),
                  Text(s.b,
                      style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary(context),
                          height: 1.6)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<({String h, String b})> _sections(AppLocalizations l10n) =>
      <({String h, String b})>[
        (h: l10n.termsSection1Title, b: l10n.termsSection1Body),
        (h: l10n.termsSection2Title, b: l10n.termsSection2Body),
        (h: l10n.termsSection3Title, b: l10n.termsSection3Body),
        (h: l10n.termsSection4Title, b: l10n.termsSection4Body),
        (h: l10n.termsSection5Title, b: l10n.termsSection5Body),
        (h: l10n.termsSection6Title, b: l10n.termsSection6Body),
        (h: l10n.termsSection7Title, b: l10n.termsSection7Body),
      ];
}
