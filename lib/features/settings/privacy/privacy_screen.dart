import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/app_screen.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<({String h, String b})> sections = _sections(l10n);
    return AppScreen(
      titleLeading: l10n.privacyLeading,
      titleAccent: l10n.privacyAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.privacyLastUpdated,
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
        (h: l10n.privacySection1Title, b: l10n.privacySection1Body),
        (h: l10n.privacySection2Title, b: l10n.privacySection2Body),
        (h: l10n.privacySection3Title, b: l10n.privacySection3Body),
        (h: l10n.privacySection4Title, b: l10n.privacySection4Body),
        (h: l10n.privacySection5Title, b: l10n.privacySection5Body),
        (h: l10n.privacySection6Title, b: l10n.privacySection6Body),
      ];
}
