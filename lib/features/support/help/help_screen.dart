import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/widgets/rtl_aware.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  static String _titleLeading(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return title;
    return title.substring(0, space);
  }

  static String _titleAccent(String title) {
    final int space = title.lastIndexOf(' ');
    if (space < 0) return '';
    return title.substring(space + 1);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppScreen(
      titleLeading: _titleLeading(l10n.helpSupport),
      titleAccent: _titleAccent(l10n.helpSupport),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCard(
            color: AppColors.softPrimary(context),
            borderColor: Colors.transparent,
            child: Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Icon(Icons.support_agent_rounded,
                      color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.helpHereToHelp,
                          style: AppTextStyles.h4.copyWith(
                              color: AppColors.textPrimary(context))),
                      Text(l10n.helpResponseTime,
                          style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary(context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(l10n.helpGetInTouch,
              style: AppTextStyles.h4
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 10),
          _tile(context, Icons.chat_bubble_outline_rounded,
              AppColors.primaryPurple, l10n.helpLiveChat, l10n.helpLiveChatSub),
          _tile(context, Icons.mail_outline_rounded, AppColors.info,
              l10n.emailAddress, 'support@lifecoach.app'),
          _tile(context, Icons.phone_outlined, AppColors.success, l10n.helpCall,
              l10n.helpCallSub),
          _tile(context, Icons.confirmation_number_outlined, AppColors.warning,
              l10n.helpSubmitTicket, l10n.helpSubmitTicketSub),
          const SizedBox(height: 14),
          Text(l10n.helpQuickLinks,
              style: AppTextStyles.h4
                  .copyWith(color: AppColors.textPrimary(context))),
          const SizedBox(height: 10),
          _tile(context, Icons.live_help_outlined, AppColors.danger, l10n.faq,
              l10n.faqSubtitle,
              onTap: () => context.push(AppRoutes.faq)),
          _tile(context, Icons.info_outline_rounded, AppColors.accentPurple,
              l10n.about, l10n.aboutSubtitle,
              onTap: () => context.push(AppRoutes.about)),
          const SizedBox(height: 18),
          GradientButton(
              label: l10n.helpOpenLiveChat,
              icon: Icons.chat_bubble_outline_rounded,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(l10n.helpLiveChatSoon),
                ));
              }),
        ],
      ),
    );
  }

  Widget _tile(BuildContext c, IconData icon, Color color, String title,
      String sub,
      {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        onTap: onTap,
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
                  Text(sub,
                      style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary(c))),
                ],
              ),
            ),
            RtlChevronIcon(color: AppColors.textMuted(c)),
          ],
        ),
      ),
    );
  }
}
