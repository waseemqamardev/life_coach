import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/decision_text.dart';
import '../../data/models/decision.dart';
import '../../generated/assets.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/providers.dart';
import '../../shared/widgets/bottom_nav.dart';
import '../../shared/widgets/rtl_aware.dart';
import '../../shared/widgets/exit_alert_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime? _lastPressedAt;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(decisionsProvider.notifier).refresh();
        // _checkVersionUpdate();
      }
    });
  }

  // Future<void> _checkVersionUpdate() async {
  //   final VersionUpdateInfo updateInfo =
  //       await AppFirebaseService.instance.checkVersionUpdate();
  //   if (!mounted) return;
  //   if (updateInfo.type != UpdateType.none) {
  //     showDialog<void>(
  //       context: context,
  //       barrierDismissible: updateInfo.type != UpdateType.force,
  //       builder: (BuildContext dialogContext) => VersionUpdateDialog(
  //         latestVersion: updateInfo.latestVersion,
  //         updateUrl: updateInfo.updateUrl,
  //         releaseNotes: updateInfo.releaseNotes,
  //         forceUpdate: false,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final String name = ref.watch(authProvider).name;
    final String displayName =
        name.trim().isEmpty ? l10n.greetingFallbackName : name.trim();
    final List<Decision> decisions = ref.watch(decisionsProvider);
    final int avgRisk = decisions.isEmpty
        ? 0
        : (decisions
                    .map((Decision d) => d.riskScore)
                    .reduce((int a, int b) => a + b) /
                decisions.length)
            .round();
    final int avgSuccess = decisions.isEmpty
        ? 0
        : (decisions
                    .map((Decision d) => d.overallScore)
                    .reduce((int a, int b) => a + b) /
                decisions.length)
            .round();
    final int activePlans =
        decisions.where((Decision d) => d.actionPlan.isNotEmpty).length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        final DateTime now = DateTime.now();
        if (_lastPressedAt == null ||
            now.difference(_lastPressedAt!) > const Duration(seconds: 2)) {
          _lastPressedAt = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.pressBackAgainToExit),
              duration: const Duration(seconds: 2),
            ),
          );
          return;
        }
        final bool shouldExit = await showExitAlertDialog(context);
        if (shouldExit) {
          await SystemNavigator.pop();
        }
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.scaffoldColor(context),
        bottomNavigationBar: AppBottomNav.forScaffold(
          context,
          currentIndex: 0,
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: _HomeHeader(
                  isDark: Theme.of(context).brightness == Brightness.dark,
                  l10n: l10n,
                  appTitle: l10n.aiNavigator,
                  onSettings: () => context.push(AppRoutes.settings),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    8,
                    20,
                    AppBottomNav.contentBottomPadding(context),
                  ),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _GreetingCard(
                        greeting: l10n.goodMorning(displayName),
                        subtitle: l10n.homeSubtitle,
                      ),
                      const SizedBox(height: 16),
                      _StartAnalysisCard(
                        title: l10n.startNewAnalysis,
                        subtitle: l10n.startAnalysisSubtitle,
                        onTap: () => context.push(AppRoutes.startDecision),
                      ),
                      const SizedBox(height: 24),
                      _SectionHeader(
                        title: l10n.decisionOverview,
                        viewAllLabel: l10n.viewAll,
                        onViewAll: () => context.push(AppRoutes.history),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: _OverviewCard(
                              label: l10n.riskScore,
                              value: '$avgRisk%',
                              sub: l10n.riskLevelLabel(avgRisk),
                              color: AppColors.success,
                              icon: Assets.iconsRiskScore,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: _OverviewCard(
                              label: l10n.successChance,
                              value: '$avgSuccess%',
                              sub: l10n.successChanceLabel(avgSuccess),
                              color: AppColors.info,
                              icon: Assets.iconsSuccessIcon,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: _OverviewCard(
                              label: l10n.activePlans,
                              value: '$activePlans',
                              sub: l10n.inProgress,
                              color: AppColors.primaryPurple,
                              icon: Assets.iconsInProgress,
                            ),
                          ),
                        ],
                      ),
                      // ----- Quick access (hidden until assets / nav are finalized) -----
                      // const SizedBox(height: 24),
                      // Text('Quick Access',
                      //     style: AppTextStyles.h4
                      //         .copyWith(color: AppColors.textPrimary(context))),
                      // const SizedBox(height: 12),
                      // Row(
                      //   children: <Widget>[
                      //     _QuickAccessItem(
                      //         icon: Icons.chat_bubble_outline_rounded,
                      //         color: AppColors.primaryPurple,
                      //         label: 'AI Chat',
                      //         onTap: () => context.push(AppRoutes.aiQuestionFlow)),
                      //     _QuickAccessItem(
                      //         icon: Icons.assignment_outlined,
                      //         color: AppColors.accentPurple,
                      //         label: 'My Plans',
                      //         onTap: () => context.push(AppRoutes.actionPlan)),
                      //     _QuickAccessItem(
                      //         icon: Icons.history_rounded,
                      //         color: AppColors.info,
                      //         label: 'History',
                      //         onTap: () => context.push(AppRoutes.history)),
                      //     _QuickAccessItem(
                      //         icon: Icons.bookmark_border_rounded,
                      //         color: AppColors.accentPurple,
                      //         label: 'Saved',
                      //         onTap: () => context.push(AppRoutes.saved)),
                      //     _QuickAccessItem(
                      //         icon: Icons.settings_outlined,
                      //         color: AppColors.info,
                      //         label: 'Settings',
                      //         onTap: () => context.push(AppRoutes.settings)),
                      //   ],
                      // ),
                      const SizedBox(height: 24),
                      _SectionHeader(
                        title: l10n.recentInsights,
                        viewAllLabel: l10n.viewAll,
                        onViewAll: () => context.push(AppRoutes.history),
                      ),
                      const SizedBox(height: 16),
                      if (decisions.isEmpty)
                        _RecentInsightsEmptyState(
                          message: l10n.startFirstDecision,
                          actionLabel: l10n.startNewAnalysis,
                          onStart: () => context.push(AppRoutes.startDecision),
                        )
                      else
                        ...decisions.take(2).map((Decision d) {
                          final bool highRisk = d.riskScore >= 60;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _RecentInsightCard(
                              title: d.title,
                              description:
                                  DecisionText.insightDescription(d, l10n),
                              timeAgo: _timeAgo(d.createdAt),
                              riskLabel:
                                  highRisk ? l10n.highRisk : l10n.lowRisk,
                              riskColor: AppColors.riskBadgeForeground(
                                context,
                                highRisk: highRisk,
                              ),
                              riskBg: AppColors.riskBadgeBackground(
                                context,
                                highRisk: highRisk,
                              ),
                              onTap: () {
                                ref
                                    .read(draftDecisionProvider.notifier)
                                    .start(d);
                                context.push(AppRoutes.decisionResult);
                              },
                            ),
                          );
                        }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes.clamp(1, 59)} min ago';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    }
    return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader(
      {required this.appTitle,
      required this.onSettings,
      required this.isDark,
      required this.l10n});

  final String appTitle;
  final VoidCallback onSettings;
  final bool isDark;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 48),
        Expanded(
          child: Center(
            child: isDark
                ? Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: '${l10n.life} ',
                          style: AppTextStyles.h1.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                            color: Colors.white,
                            height: 1.15,
                          ),
                        ),
                        TextSpan(
                          text: l10n.navigator,
                          style: AppTextStyles.h1.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                            color: Colors.white,
                            height: 1.15,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: '${l10n.life} ',
                          style: AppTextStyles.h1.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                            color: const Color(0xFF022088),
                            height: 1.15,
                          ),
                        ),
                        TextSpan(
                          text: l10n.navigator,
                          style: AppTextStyles.h1.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                            color: AppColors.primaryPurple,
                            height: 1.15,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
        GestureDetector(
          onTap: onSettings,
          child: Image.asset(
            Assets.iconsSettingIcon,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
            color: isDark ? Colors.white : null,
          ),
        )
      ],
    );
  }
}

class _GreetingCard extends StatelessWidget {
  const _GreetingCard({required this.greeting, required this.subtitle});

  final String greeting;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 5, 6, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.greetingCardColor(context),
        boxShadow: isDark ? AppColors.homeCardShadow(context) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  greeting,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.h4.copyWith(
                    fontSize: 14,
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary(context),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            isDark ? Assets.imagesDarkHomeLogo : Assets.imagesHomeScreenLogo,
            width: 79,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, size: 50);
            },
          ),
        ],
      ),
    );
  }
}

class _StartAnalysisCard extends StatelessWidget {
  const _StartAnalysisCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xff211C75) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isDark ? null : AppColors.homeCardShadow(context),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: AppColors.primaryTwoGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  height: 32,
                  width: 32,
                  Assets.iconsTripleSpark,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.auto_awesome_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTextStyles.h4.copyWith(
                      fontSize: 14,
                      color: isDark
                          ? Colors.white
                          : AppColors.textPrimary(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 195,
                    child: Text(
                      subtitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 12,
                        color: isDark
                            ? const Color(0xffD9D9D9)
                            : AppColors.textMuted(context),
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Directionality.of(context) == TextDirection.rtl
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryTwoGradient,
                ),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(
                      Directionality.of(context) == TextDirection.rtl
                          ? -1.0
                          : 1.0,
                      1.0,
                    ),
                  child: Image.asset(
                    Assets.iconsForwardArrow,
                    width: 16,
                    height: 16,
                    color: Colors.white,
                    errorBuilder: (_, __, ___) => Icon(
                      Directionality.of(context) == TextDirection.rtl
                          ? Icons.arrow_back_rounded
                          : Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.viewAllLabel,
    required this.onViewAll,
  });

  final String title;
  final String viewAllLabel;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: AppTextStyles.h4.copyWith(
              color: AppColors.textPrimary(context),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        GestureDetector(
          onTap: onViewAll,
          child: Text(
            viewAllLabel,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.lightPurple,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _OverviewCard extends StatelessWidget {
  const _OverviewCard({
    required this.label,
    required this.value,
    required this.sub,
    required this.color,
    required this.icon,
  });

  final String label;
  final String value;
  final String sub;
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 14),
      decoration: BoxDecoration(
        color: AppColors.homeCardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.homeStatCardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppTextStyles.h2.copyWith(
                  color: color,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.20),
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child:
                        Image.asset(icon, width: 10, height: 10, color: color)),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            sub,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted(context),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentInsightsEmptyState extends StatelessWidget {
  const _RecentInsightsEmptyState({
    required this.message,
    required this.actionLabel,
    required this.onStart,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final bool isDark = !AppColors.isLight(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              Assets.imagesPurpleBulb,
              width: 44,
              height: 44,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryTwoGradient,
                ),
                child: const Icon(
                  Icons.lightbulb_outline_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12,
                color: isDark
                    ? const Color(0xffD9D9D9)
                    : AppColors.textMuted(context),
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: onStart,
              child: Text(
                actionLabel,
                style: AppTextStyles.h4.copyWith(
                  color:
                      isDark ? const Color(0xffD9D9D9) : AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentInsightCard extends StatelessWidget {
  const _RecentInsightCard({
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.riskLabel,
    required this.riskColor,
    required this.riskBg,
    required this.onTap,
  });

  final String title;
  final String description;
  final String timeAgo;
  final String riskLabel;
  final Color riskColor;
  final Color riskBg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.homeCardColor(context),
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.homeCardShadow(context),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                Assets.imagesPurpleBulb,
                width: 44,
                fit: BoxFit.contain,
                height: 44,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text(
                          title,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary(context),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: riskBg,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Text(
                            riskLabel,
                            style: AppTextStyles.caption.copyWith(
                              color: riskColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary(context),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            AppColors.textMuted(context),
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            Assets.iconsMageCalendar,
                            width: 16,
                            height: 16,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          timeAgo,
                          style: AppTextStyles.caption.copyWith(
                              color: AppColors.textMuted(context),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: RtlChevronIcon(
                  size: 24,
                  color: AppColors.textMuted(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _QuickAccessItem extends StatelessWidget {
//   const _QuickAccessItem({
//     required this.icon,
//     required this.color,
//     required this.label,
//     required this.onTap,
//   });
//   final IconData icon;
//   final Color color;
//   final String label;
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: 52,
//               height: 52,
//               decoration: BoxDecoration(
//                 color: color.withValues(alpha: 0.15),
//                 borderRadius: BorderRadius.circular(14),
//               ),
//               child: Icon(icon, color: color),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               label,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: AppTextStyles.caption
//                   .copyWith(color: AppColors.textPrimary(context)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
