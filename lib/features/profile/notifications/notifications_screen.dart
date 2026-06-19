import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DefaultTabController(
      length: 3,
      child: AppScreen(
        titleLeading: l10n.notificationsLeading,
        titleAccent: l10n.notificationsAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.softPrimary(context),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: AppColors.primaryPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.textSecondary(context),
                dividerColor: Colors.transparent,
                tabs: <Widget>[
                  Tab(text: l10n.tabAll),
                  Tab(text: l10n.tabUnread),
                  Tab(text: l10n.tabArchived),
                ],
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 540,
              child: TabBarView(
                children: <Widget>[
                  _list(context),
                  _list(context, unreadOnly: true),
                  _empty(context, l10n),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _list(BuildContext c, {bool unreadOnly = false}) {
    final List<({String t, String b, IconData icon, Color color, bool read})>
        items = <({String t, String b, IconData icon, Color color, bool read})>[
      (t: 'Career Change Decision analyzed', b: 'Your latest analysis is ready.', icon: Icons.auto_awesome_rounded, color: AppColors.primaryPurple, read: false),
      (t: 'Daily insight available', b: "Today's tip: 60-second decision exercise.", icon: Icons.lightbulb_outline_rounded, color: AppColors.warning, read: false),
      (t: 'Subscription renewed', b: 'Premium plan renewed for another month.', icon: Icons.workspace_premium_rounded, color: AppColors.success, read: true),
      (t: 'Welcome to Life Coach', b: 'Get started with your first goal.', icon: Icons.celebration_outlined, color: AppColors.info, read: true),
    ];
    final filtered = unreadOnly ? items.where((e) => !e.read).toList() : items;
    return ListView.separated(
      itemCount: filtered.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (BuildContext c, int i) {
        final n = filtered[i];
        return AppCard(
          child: Row(
            children: <Widget>[
              TintedIcon(icon: n.icon, color: n.color),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(n.t,
                        style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(c),
                            fontSize: 14,
                            fontWeight:
                                n.read ? FontWeight.w500 : FontWeight.w700)),
                    Text(n.b,
                        style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary(c))),
                  ],
                ),
              ),
              if (!n.read)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryPurple, shape: BoxShape.circle),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _empty(BuildContext c, AppLocalizations l10n) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.inbox_outlined,
                size: 64, color: AppColors.textMuted(c)),
            const SizedBox(height: 12),
            Text(l10n.noArchivedItems,
                style: AppTextStyles.h4.copyWith(
                    color: AppColors.textSecondary(c))),
          ],
        ),
      );
}
