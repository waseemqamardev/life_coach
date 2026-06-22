import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/providers.dart';
import '../../../shared/widgets/rtl_aware.dart';
import '../../../core/l10n/rtl_layout.dart';

class ThemeScreen extends ConsumerStatefulWidget {
  const ThemeScreen({super.key});

  @override
  ConsumerState<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends ConsumerState<ThemeScreen> {
  late ThemeMode _selectedMode;

  @override
  void initState() {
    super.initState();
    _selectedMode = ref.read(themeModeProvider);
  }

  Future<void> _applyTheme() async {
    await ref.read(themeModeProvider.notifier).setMode(_selectedMode);
    if (mounted) context.pop();
  }

  bool _isDarkPreview(BuildContext context) {
    switch (_selectedMode) {
      case ThemeMode.dark:
        return true;
      case ThemeMode.light:
        return false;
      case ThemeMode.system:
        return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor(context),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _ThemeAppBar(l10n: l10n, onBack: () => context.pop()),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      l10n.themeCustomizeSubtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textMuted(context),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _ThemeOptionCard(
                      title: l10n.lightMode,
                      subtitle: l10n.lightModeSubtitle,
                      isSelected: _selectedMode == ThemeMode.light,
                      onTap: () =>
                          setState(() => _selectedMode = ThemeMode.light),
                    ),
                    const SizedBox(height: 16),
                    _ThemeOptionCard(
                      title: l10n.darkMode,
                      subtitle: l10n.darkModeSubtitle,
                      isSelected: _selectedMode == ThemeMode.dark,
                      onTap: () =>
                          setState(() => _selectedMode = ThemeMode.dark),
                    ),
                    const SizedBox(height: 16),
                    _ThemeOptionCard(
                      title: l10n.systemDefault,
                      subtitle: l10n.systemDefaultSubtitle,
                      isSelected: _selectedMode == ThemeMode.system,
                      onTap: () =>
                          setState(() => _selectedMode = ThemeMode.system),
                    ),
                    const SizedBox(height: 16),
                    _ThemePreviewSection(l10n: l10n, isDark: _isDarkPreview(context)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                      child: _ApplyThemeButton(
                        label: l10n.applyTheme,
                        onPressed: _applyTheme,
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

class _ThemeAppBar extends StatelessWidget {
  const _ThemeAppBar({required this.l10n, required this.onBack});

  final AppLocalizations l10n;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 4, 0),
      child: Row(
        children: <Widget>[
          RtlBackIconButton(onPressed: onBack, size: 22),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${l10n.appTheme.split(' ').first} ',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.appBarTitleColor(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return AppColors.primaryTwoGradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    );
                  },
                  blendMode: BlendMode.srcIn,
                  child: Text(
                    l10n.appTheme.split(' ').skip(1).join(' '),
                    style: AppTextStyles.h3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color: AppColors.appBarTitleColor(context),
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          ),
        ],
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  const _ThemeOptionCard({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.optionCardColor(context, selected: isSelected),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 2,
              color: Colors.black.withValues(alpha: 0.16),
              spreadRadius: 0
            )
          ]

        ),
        child: Row(
          children: <Widget>[
    Image.asset(Assets.imagesPurpleBulb,
    width: 44,
      height: 44,
      fit: BoxFit.contain,
    ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.textPrimary(context),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted(context),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            _ThemeRadio(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _ThemeRadio extends StatelessWidget {
  const _ThemeRadio({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryTwoGradient,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check_rounded,
          color: Colors.white,
          size: 15,
        ),
      );
    }

    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryPurple, width: 2),
      ),
    );
  }
}

class _ThemePreviewSection extends StatelessWidget {
  const _ThemePreviewSection({required this.l10n, required this.isDark});

  final AppLocalizations l10n;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.preview,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryPurple,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color(0xff8951FB),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                  ),

                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)
                    ),
                child: SizedBox(
                  width: 185,
                  height: 150,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: 375,
                      child: _MiniHomePreview(l10n: l10n, isDark: isDark),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniHomePreview extends StatelessWidget {
  const _MiniHomePreview({required this.l10n, required this.isDark});

  final AppLocalizations l10n;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final Color bg =
        isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final Color textPrimary =
        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary(context);
    final Color textMuted =
        isDark ? AppColors.darkTextSecondary : AppColors.textMuted(context);
    final Color greetingBg =
        isDark ? const Color(0xFF131A2E) : const Color(0xFFEEEDFD);

    return ColoredBox(
      color: bg,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, isDark ? 6 : 10, 16, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isDark) ...<Widget>[
              _MiniStatusBar(textColor: textPrimary),
              const SizedBox(height: 6),
            ],
            Row(
              children: <Widget>[
                const SizedBox(width: 48),
                Expanded(
                  child: Center(
                    child: isDark
                        ? Text(
                            l10n.aiNavigator,
                            style: AppTextStyles.h3.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '${l10n.life} ',
                                  style: AppTextStyles.h3.copyWith(
                                    fontSize: 22,
                                    color: textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: l10n.navigator,
                                  style: AppTextStyles.h3.copyWith(
                                    fontSize: 22,
                                    color: AppColors.primaryPurple,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                Image.asset(
                  Assets.iconsSettingIcon,
                  width: 22,
                  height: 22,
                  fit: BoxFit.contain,
                  color: isDark ? Colors.white : null,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.settings_outlined,
                    size: 22,
                    color: textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
              decoration: BoxDecoration(
                color: greetingBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          l10n.goodMorning(l10n.greetingFallbackName),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.h4.copyWith(
                            fontSize: 13,
                            color: textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          l10n.homeSubtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 10,
                            color: textMuted,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    Assets.imagesHomeScreenLogo,
                    width: 62,
                    height: 54,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const SizedBox(
                      width: 62,
                      height: 54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (isDark)
              _MiniGradientAnalysisCard(
                l10n: l10n,
                subtitle: l10n.startAnalysisSubtitle,
              )
            else
              _MiniLightAnalysisCard(
                l10n: l10n,
                subtitle: l10n.startAnalysisSubtitle,
                textPrimary: textPrimary,
                textMuted: textMuted,
              ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  l10n.decisionOverview,
                  style: AppTextStyles.h4.copyWith(
                    color: textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  l10n.viewAll,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: _MiniOverviewCard(
                    label: l10n.riskScore,
                    value: '0%',
                    sub: l10n.lowRisk,
                    color: AppColors.success,
                    icon: Assets.iconsRiskScore,
                    isDark: isDark,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: _MiniOverviewCard(
                    label: l10n.successChance,
                    value: '0%',
                    sub: l10n.poorChance,
                    color: AppColors.info,
                    icon: Assets.iconsSuccessIcon,
                    isDark: isDark,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: _MiniOverviewCard(
                    label: l10n.activePlans,
                    value: '0',
                    sub: l10n.inProgress,
                    color: AppColors.primaryPurple,
                    icon: Assets.iconsInProgress,
                    isDark: isDark,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniOverviewCard extends StatelessWidget {
  const _MiniOverviewCard({
    required this.label,
    required this.value,
    required this.sub,
    required this.color,
    required this.icon,
    required this.isDark,
  });

  final String label;
  final String value;
  final String sub;
  final Color color;
  final String icon;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isDark
            ? null
            : <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 2,
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption.copyWith(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.textPrimary(context),
              fontWeight: FontWeight.w500,
              fontSize: 8,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                value,
                style: AppTextStyles.h2.copyWith(
                  color: color,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    icon,
                    width: 7,
                    height: 7,
                    color: color,
                    errorBuilder: (_, __, ___) =>
                        Icon(Icons.circle, size: 5, color: color),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            sub,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.textMuted(context),
              fontSize: 7,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStatusBar extends StatelessWidget {
  const _MiniStatusBar({required this.textColor});

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: <Widget>[
          Text(
            '9:41',
            style: AppTextStyles.caption.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
          ),
          const Spacer(),
          Icon(Icons.signal_cellular_alt, size: 11, color: textColor),
          const SizedBox(width: 3),
          Icon(Icons.wifi, size: 11, color: textColor),
          const SizedBox(width: 3),
          Icon(Icons.battery_full_rounded, size: 12, color: textColor),
        ],
      ),
    );
  }
}

class _MiniGradientAnalysisCard extends StatelessWidget {
  const _MiniGradientAnalysisCard({required this.l10n, required this.subtitle});

  final AppLocalizations l10n;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: AppColors.primaryTwoGradient,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                Assets.iconsTripleSpark,
                width: 22,
                height: 22,
                color: Colors.white,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.auto_awesome_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.startNewAnalysis,
                  style: AppTextStyles.h4.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 9,
                    color: Colors.white.withValues(alpha: 0.82),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.22),
            ),
            child: Center(
              child: Image.asset(
                Assets.iconsForwardArrow,
                width: 12,
                height: 12,
                color: Colors.white,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniLightAnalysisCard extends StatelessWidget {
  const _MiniLightAnalysisCard({
    required this.l10n,
    required this.subtitle,
    required this.textPrimary,
    required this.textMuted,
  });

  final AppLocalizations l10n;
  final String subtitle;
  final Color textPrimary;
  final Color textMuted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: AppColors.primaryTwoGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                Assets.iconsTripleSpark,
                width: 22,
                height: 22,
                color: Colors.white,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.auto_awesome_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.startNewAnalysis,
                  style: AppTextStyles.h4.copyWith(
                    fontSize: 12,
                    color: textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 9,
                    color: textMuted,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryTwoGradient,
            ),
            child: Center(
              child: Image.asset(
                Assets.iconsForwardArrow,
                width: 12,
                height: 12,
                color: Colors.white,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplyThemeButton extends StatelessWidget {
  const _ApplyThemeButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: AppColors.primaryTwoGradient,
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
