import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../generated/assets.dart';

/// Floating bottom nav: Home, AI Chatbot, Insights, History.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.currentIndex});

  final int currentIndex;

  static const double _iconSize = 24;
  static const double _outerBottomMargin = 24;
  static const double _barVerticalPadding = 12;
  static const double _itemVerticalPadding = 4;
  static const double _iconLabelGap = 4;

  /// Use with [Scaffold.extendBody] so content scrolls under the floating bar.
  static Widget forScaffold(
    BuildContext context, {
    required int currentIndex,
  }) {
    return ColoredBox(
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: AppBottomNav(currentIndex: currentIndex),
      ),
    );
  }

  /// Extra bottom padding for scroll views on screens that show this nav.
  static double contentBottomPadding(BuildContext context) {
    const double labelHeight = 16;
    const double barHeight = _barVerticalPadding * 2 +
        _itemVerticalPadding * 2 +
        _iconSize +
        _iconLabelGap +
        labelHeight;
    return barHeight + _outerBottomMargin + 12;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final Color activeColor =
        isLight ? AppColors.primaryBlue : AppColors.primaryPurple;
    final Color inactiveColor = isLight
        ? AppColors.textMuted(context)
        : AppColors.darkTextSecondary;

    final List<_NavItem> items = <_NavItem>[
      _NavItem(
        Assets.iconsAiHomeSelected,
        Assets.iconsAiHome,
        l10n.navHome,
        AppRoutes.home,
      ),
      _NavItem(
        Assets.iconsAiChatSelected,
        Assets.iconsAiChat,
        l10n.navChatbot,
        AppRoutes.chatbot,
      ),
      _NavItem(
        Assets.iconsAiHistorySelected,
        Assets.iconsInsight,
        l10n.navInsights,
        AppRoutes.dailySuggestion,
      ),
      _NavItem(
        Assets.iconsAiInsightSelected,
        Assets.iconsHistory,
        l10n.navHistory,
        AppRoutes.history,
      ),
    ];

    return Container(
      margin: const EdgeInsets.only(
        bottom: _outerBottomMargin,
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: isLight ? Colors.white : AppColors.darkSurface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isLight
            ? <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.16),
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ]
            : <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: _barVerticalPadding,
          horizontal:6,
        ),
        child: Row(
          children: <Widget>[
            for (int i = 0; i < items.length; i++)
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    if (i == currentIndex) return;
                    GoRouter.of(context).go(items[i].route);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        i == currentIndex
                            ? items[i].activeIcon
                            : items[i].inactiveIcon,
                        width: _iconSize,
                        height: _iconSize,
                      ),
                      const SizedBox(height: _iconLabelGap),
                      Text(
                        items[i].label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption.copyWith(
                          color: i == currentIndex
                              ? activeColor
                              : inactiveColor,
                          fontWeight: i == currentIndex
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  _NavItem(
    this.activeIcon,
    this.inactiveIcon,
    this.label,
    this.route,
  );

  final String activeIcon;
  final String inactiveIcon;
  final String label;
  final String route;
}
