import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../l10n/app_localizations.dart';
import '../../core/services/storage_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../generated/assets.dart';
import '../../shared/widgets/custom_button.dart';
import '../splash/splash_screen.dart';

abstract final class OnboardingAssets {
  static const String page1HeroLight = Assets.imagesOnboardingImage;
  static const String page2HeroLight = Assets.imagesDefineGoal;
  static const String page3HeroLight = Assets.imagesReadyTo;

  static const String page1HeroDark = Assets.imagesOnboardingImage;
  static const String page2HeroDark = Assets.imagesDefineGoal;
  static const String page3HeroDark = Assets.imagesReadyTo;
}

/// Responsive spacing and sizing derived from the current viewport.
class _OnboardingMetrics {
  _OnboardingMetrics({
    required Size size,
    required double textScaleFactor,
  })  : width = size.width,
        height = size.height,
        isCompactHeight = size.height < 680,
        isVeryCompactHeight = size.height < 600 {
    final double referenceWidth = width.clamp(320.0, 430.0);
    final double compactFactor = isVeryCompactHeight
        ? 0.72
        : isCompactHeight
            ? 0.86
            : 1.0;

    horizontalInset = (referenceWidth * 0.055).clamp(16.0, 28.0);
    skipTopPadding = (8 * compactFactor).clamp(4.0, 8.0);
    skipTrailingPadding = horizontalInset;

    heroSize = (referenceWidth * 0.37 * compactFactor).clamp(108.0, 168.0);
    heroTopSpacing = (12 * compactFactor).clamp(4.0, 12.0);
    titleSpacing = (24 * compactFactor).clamp(12.0, 24.0);
    subtitleSpacing = (4 * compactFactor).clamp(2.0, 6.0);
    featuresTopSpacing = (40 * compactFactor).clamp(20.0, 40.0);
    featureGap = (12 * compactFactor).clamp(8.0, 14.0);

    titleFontSize =
        ((referenceWidth * 0.082) / textScaleFactor.clamp(1.0, 1.3))
            .clamp(24.0, 32.0);
    subtitleFontSize =
        ((referenceWidth * 0.036) / textScaleFactor.clamp(1.0, 1.25))
            .clamp(12.0, 14.0);
    featureTitleFontSize =
        ((referenceWidth * 0.056) / textScaleFactor.clamp(1.0, 1.2))
            .clamp(13.0, 14.0);
    featureDescFontSize =
        ((referenceWidth * 0.041) / textScaleFactor.clamp(1.0, 1.2))
            .clamp(11.0, 12.0);

    featureMaxWidth = (referenceWidth * 0.72).clamp(248.0, 340.0);
    iconBoxSize = (referenceWidth * 0.123).clamp(44.0, 52.0);
    iconSize = (iconBoxSize * 0.5).clamp(22.0, 26.0);
    iconTextGap = (referenceWidth * 0.031).clamp(10.0, 14.0);

    dotsTopSpacing = (24 * compactFactor).clamp(12.0, 28.0);
    dotsBottomSpacing = (28 * compactFactor).clamp(16.0, 40.0);
    activeDotSize = (referenceWidth * 0.041).clamp(10.0, 16.0);
    inactiveDotSize = (referenceWidth * 0.031).clamp(8.0, 12.0);
    dotGap = (referenceWidth * 0.01).clamp(3.0, 5.0);

    buttonHorizontalPadding =
        (referenceWidth * 0.108).clamp(24.0, 48.0);
    buttonBottomSpacing =
        (32 + waveHeight * 0.35).clamp(28.0, 72.0);
    buttonHeight = (54 / textScaleFactor.clamp(1.0, 1.2)).clamp(48.0, 54.0);

    pageBottomPadding = (8 * compactFactor).clamp(4.0, 12.0);
  }

  final double width;
  final double height;
  final bool isCompactHeight;
  final bool isVeryCompactHeight;

  late final double horizontalInset;
  late final double skipTopPadding;
  late final double skipTrailingPadding;

  late final double heroSize;
  late final double heroTopSpacing;
  late final double titleSpacing;
  late final double subtitleSpacing;
  late final double featuresTopSpacing;
  late final double featureGap;

  late final double titleFontSize;
  late final double subtitleFontSize;
  late final double featureTitleFontSize;
  late final double featureDescFontSize;

  late final double featureMaxWidth;
  late final double iconBoxSize;
  late final double iconSize;
  late final double iconTextGap;

  late final double dotsTopSpacing;
  late final double dotsBottomSpacing;
  late final double activeDotSize;
  late final double inactiveDotSize;
  late final double dotGap;

  late final double buttonHorizontalPadding;
  late final double buttonBottomSpacing;
  late final double buttonHeight;

  late final double pageBottomPadding;

  double get waveHeight =>
      (width * 0.303).clamp(90.0, math.min(130.0, height * 0.16));
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  List<_OnboardingPageData> _pages(AppLocalizations l10n) =>
      <_OnboardingPageData>[
        _OnboardingPageData(
          heroAssetLight: OnboardingAssets.page1HeroLight,
          heroAssetDark: OnboardingAssets.page1HeroDark,
          fallbackIcon: Icons.gps_fixed_rounded,
          titleLeading: '${l10n.life} ',
          titleAccent: l10n.navigator,
          subtitle: l10n.authTagline,
          features: <_OnboardingFeature>[
            _OnboardingFeature(
              icon: Assets.iconsAiPowered,
              title: l10n.onboardingAiPowered,
              description: l10n.onboardingSmartAnalysis,
            ),
            _OnboardingFeature(
              icon: Assets.iconsRiskAnalysisi,
              title: l10n.onboardingRiskAnalysis,
              description: l10n.onboardingSmartAnalysis,
            ),
            _OnboardingFeature(
              icon: Assets.iconsAccountPlan,
              title: l10n.onboardingActionablePlans,
              description: l10n.onboardingSmartAnalysis,
            ),
            _OnboardingFeature(
              icon: Assets.iconsTrustedGuidance,
              title: l10n.onboardingTrustedGuidance,
              description: l10n.onboardingSmartAnalysis,
            ),
          ],
        ),
        _OnboardingPageData(
          heroAssetLight: OnboardingAssets.page2HeroLight,
          heroAssetDark: OnboardingAssets.page2HeroDark,
          fallbackIcon: Icons.gps_fixed_rounded,
          titleLeading: '${l10n.onboardingDefineGoalLeading} ',
          titleAccent: l10n.goalWord,
          subtitle: l10n.onboardingChooseJourney,
          features: <_OnboardingFeature>[
            _OnboardingFeature(
              icon: Assets.iconsCareerPath,
              title: l10n.onboardingCareerPath,
              description: l10n.onboardingCareerPathDesc,
            ),
            _OnboardingFeature(
              icon: Assets.iconsMajorPurchase,
              title: l10n.onboardingMajorPurchase,
              description: l10n.onboardingMajorPurchaseDesc,
            ),
            _OnboardingFeature(
              icon: Assets.iconsLifeChanges,
              title: l10n.onboardingLifeChanges,
              description: l10n.onboardingLifeChangesDesc,
            ),
            _OnboardingFeature(
              icon: Assets.iconsPersonelGrowth,
              title: l10n.onboardingPersonalGrowth,
              description: l10n.onboardingPersonalGrowthDesc,
            ),
          ],
        ),
        _OnboardingPageData(
          heroAssetLight: OnboardingAssets.page3HeroLight,
          heroAssetDark: OnboardingAssets.page3HeroDark,
          fallbackIcon: Icons.explore_rounded,
          titleLeading: '${l10n.onboardingReadyLeading} ',
          titleAccent: l10n.navigateWord,
          subtitle: l10n.onboardingReadySubtitle,
          features: <_OnboardingFeature>[
            _OnboardingFeature(
              icon: Assets.iconsActionable,
              title: l10n.onboardingActionableGuidance,
              description: l10n.onboardingActionableGuidanceDesc,
            ),
            _OnboardingFeature(
              icon: Assets.iconsProgressTracking,
              title: l10n.onboardingProgressTracking,
              description: l10n.onboardingProgressTrackingDesc,
            ),
            _OnboardingFeature(
              icon: Assets.iconsAdjust,
              title: l10n.onboardingAdjustOnTheFly,
              description: l10n.onboardingAdjustDesc,
            ),
            _OnboardingFeature(
              icon: Assets.iconsShareLearn,
              title: l10n.onboardingShareLearn,
              description: l10n.onboardingShareLearnDesc,
            ),
          ],
        ),
      ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    await StorageService.instance.setBool(
      StorageService.kOnboardingSeen,
      true,
    );

    if (!mounted) return;
    context.go(AppRoutes.login);
  }

  void _next() {
    final int pageCount = _pages(context.l10n).length;
    if (_page < pageCount - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List<_OnboardingPageData> pages = _pages(l10n);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double textScaleFactor =
        MediaQuery.textScalerOf(context).scale(14) / 14;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final _OnboardingMetrics metrics = _OnboardingMetrics(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          textScaleFactor: textScaleFactor,
        );

        return Scaffold(
          backgroundColor: isDark
              ? AppColors.scaffoldColor(context)
              : const Color(0xFFFFFFFF),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (isDark) const DarkTopGlow() else const LightTopGlow(),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: IgnorePointer(
                  child: _OnboardingWaveFooter(
                    isDark: isDark,
                    height: metrics.waveHeight,
                  ),
                ),
              ),
              SafeArea(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        metrics.skipTopPadding,
                        metrics.skipTrailingPadding,
                        0,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: _finishOnboarding,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            l10n.skip,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.textMuted(context),
                              fontWeight: FontWeight.w500,
                              fontSize: metrics.subtitleFontSize + 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: _controller,
                        itemCount: pages.length,
                        onPageChanged: (int index) {
                          setState(() => _page = index);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return _OnboardingPageView(
                            page: pages[index],
                            isDark: isDark,
                            metrics: metrics,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: metrics.dotsTopSpacing),
                    _PageDots(
                      count: pages.length,
                      activeIndex: _page,
                      isDark: isDark,
                      metrics: metrics,
                    ),
                    SizedBox(height: metrics.dotsBottomSpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: metrics.buttonHorizontalPadding,
                      ),
                      child: CustomGradientButton(
                        text: _page == pages.length - 1
                            ? l10n.getStarted
                            : l10n.nextButton,
                        onTap: _next,
                        showArrow: true,
                        showSparkle: true,
                        borderRadius: 12,
                        height: metrics.buttonHeight,
                      ),
                    ),
                    SizedBox(height: metrics.buttonBottomSpacing),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OnboardingPageView extends StatelessWidget {
  const _OnboardingPageView({
    required this.page,
    required this.isDark,
    required this.metrics,
  });

  final _OnboardingPageData page;
  final bool isDark;
  final _OnboardingMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            metrics.horizontalInset,
            metrics.heroTopSpacing,
            metrics.horizontalInset,
            metrics.pageBottomPadding,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: metrics.isCompactHeight
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: _OnboardingHero(
                    assetPath:
                        isDark ? page.heroAssetDark : page.heroAssetLight,
                    fallbackIcon: page.fallbackIcon,
                    isDark: isDark,
                    size: metrics.heroSize,
                  ),
                ),
                SizedBox(height: metrics.titleSpacing),
                _OnboardingTitle(
                  titleLeading: page.titleLeading,
                  titleAccent: page.titleAccent,
                  isDark: isDark,
                  fontSize: metrics.titleFontSize,
                ),
                SizedBox(height: metrics.subtitleSpacing),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: metrics.horizontalInset * 0.25,
                  ),
                  child: Text(
                    page.subtitle,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: metrics.subtitleFontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textMuted(context),
                      height: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: metrics.featuresTopSpacing),
                Align(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: metrics.featureMaxWidth,
                    ),
                    child: Column(
                      children: <Widget>[
                        for (int i = 0; i < page.features.length; i++) ...<Widget>[
                          _OnboardingFeatureRow(
                            feature: page.features[i],
                            isDark: isDark,
                            metrics: metrics,
                          ),
                          if (i < page.features.length - 1)
                            SizedBox(height: metrics.featureGap),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OnboardingTitle extends StatelessWidget {
  const _OnboardingTitle({
    required this.titleLeading,
    required this.titleAccent,
    required this.isDark,
    required this.fontSize,
  });

  final String titleLeading;
  final String titleAccent;
  final bool isDark;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final TextStyle baseStyle = AppTextStyles.h2.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3,
      height: 1.15,
    );

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            titleLeading,
            style: baseStyle.copyWith(

              color: isDark ? Colors.white : const Color(0xFF022088),
            ),
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return AppColors.primaryTwoGradient.createShader(bounds);
            },
            child: Text(
              titleAccent,
              style: baseStyle.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingHero extends StatelessWidget {
  const _OnboardingHero({
    required this.assetPath,
    required this.fallbackIcon,
    required this.isDark,
    required this.size,
  });

  final String assetPath;
  final IconData fallbackIcon;
  final bool isDark;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (assetPath.isNotEmpty) {
      return Image.asset(
        assetPath,
        height: size,
        width: size,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        errorBuilder: (_, __, ___) => _HeroPlaceholder(
          icon: fallbackIcon,
          isDark: isDark,
          size: size,
        ),
      );
    }

    return _HeroPlaceholder(icon: fallbackIcon, isDark: isDark, size: size);
  }
}

class _HeroPlaceholder extends StatelessWidget {
  const _HeroPlaceholder({
    required this.icon,
    required this.isDark,
    required this.size,
  });

  final IconData icon;
  final bool isDark;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            AppColors.primaryBlue.withValues(alpha: isDark ? 0.22 : 0.12),
            AppColors.primaryPurple.withValues(alpha: isDark ? 0.28 : 0.16),
          ],
        ),
        borderRadius: BorderRadius.circular(size * 0.2),
        border: Border.all(
          color: AppColors.primaryPurple.withValues(
            alpha: isDark ? 0.35 : 0.12,
          ),
        ),
      ),
      child: Icon(icon, size: size * 0.36, color: AppColors.primaryPurple),
    );
  }
}

class _OnboardingFeatureRow extends StatelessWidget {
  const _OnboardingFeatureRow({
    required this.feature,
    required this.isDark,
    required this.metrics,
  });

  final _OnboardingFeature feature;
  final bool isDark;
  final _OnboardingMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: metrics.iconBoxSize,
          height: metrics.iconBoxSize,
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardColor(context) : Colors.white,
            borderRadius: BorderRadius.circular(metrics.iconBoxSize * 0.25),
            boxShadow: isDark
                ? null
                : <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
            border: isDark
                ? Border.all(color: AppColors.borderColor(context))
                : null,
          ),
          child: Center(
            child: Image.asset(
              feature.icon,
              width: metrics.iconSize,
              height: metrics.iconSize,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(width: metrics.iconTextGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                feature.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: metrics.featureTitleFontSize,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.textPrimary(context)
                      : const Color(0xFF022088),
                  height: 1.25,
                ),
              ),
              SizedBox(height: metrics.featureDescFontSize * 0.15),
              Text(
                feature.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: metrics.featureDescFontSize,
                  color: AppColors.textSecondary(context),
                  fontWeight: FontWeight.w400,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({
    required this.count,
    required this.activeIndex,
    required this.isDark,
    required this.metrics,
  });

  final int count;
  final int activeIndex;
  final bool isDark;
  final _OnboardingMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final Color inactiveColor = isDark
        ? AppColors.primaryPurple.withValues(alpha: 0.28)
        : const Color(0xFFD4CCF5);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < count; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: metrics.dotGap),
            width: i == activeIndex
                ? metrics.activeDotSize
                : metrics.inactiveDotSize,
            height: i == activeIndex
                ? metrics.activeDotSize
                : metrics.inactiveDotSize,
            decoration: BoxDecoration(
              color: i == activeIndex
                  ? AppColors.primaryPurple
                  : inactiveColor,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

class _OnboardingWaveFooter extends StatelessWidget {
  const _OnboardingWaveFooter({
    required this.isDark,
    required this.height,
  });

  final bool isDark;
  final double height;

  @override
  Widget build(BuildContext context) {
    final String asset = isDark
        ? Assets.imagesBackGroundWaveDark
        : Assets.imagesBackGroundWaveLight;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Image.asset(
        asset,
        fit: BoxFit.fill,
        alignment: Alignment.bottomCenter,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class _OnboardingPageData {
  const _OnboardingPageData({
    required this.heroAssetLight,
    required this.heroAssetDark,
    required this.fallbackIcon,
    required this.titleLeading,
    required this.titleAccent,
    required this.subtitle,
    required this.features,
  });

  final String heroAssetLight;
  final String heroAssetDark;
  final IconData fallbackIcon;
  final String titleLeading;
  final String titleAccent;
  final String subtitle;
  final List<_OnboardingFeature> features;
}

class _OnboardingFeature {
  const _OnboardingFeature({
    required this.icon,
    required this.title,
    required this.description,
  });

  final String icon;
  final String title;
  final String description;
}
