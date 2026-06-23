import 'dart:async';
import 'dart:math' as math;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/services/screen_tracker_mixin.dart';
import '../../l10n/app_localizations.dart';
import '../../core/services/storage_service.dart';
import '../../core/theme/app_colors.dart';
import '../../data/repositories/auth_repository.dart';
import '../../core/theme/app_text_styles.dart';
import '../../generated/assets.dart';
import '../../shared/widgets/custom_button.dart';

/// Splash screen matching the light/dark Figma frames.
///
/// Drop assets into [assets/images/]:
/// - [AppAssets.splashImage] or [AppAssets.splashHeroDark] — dark hero
/// - [AppAssets.splashHeroLight] — light hero (transparent/light bg export)
/// - [AppAssets.waveLight] / [AppAssets.waveDark] — bottom footer graphics
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin, ScreenTrackerMixin {
  @override
  String get screenName => 'SplashScreen';
  static const Duration _entranceDuration = Duration(milliseconds: 2400);
  static const Duration _ambientDuration = Duration(milliseconds: 3200);

  late final AnimationController _entranceController;
  late final AnimationController _ambientController;

  late final Animation<double> _welcomeFade;
  late final Animation<Offset> _welcomeSlide;
  late final Animation<double> _heroFade;
  late final Animation<double> _heroScale;
  late final Animation<double> _titleFade;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _buttonFade;
  late final Animation<Offset> _buttonSlide;
  late final Animation<double> _footerFade;
  late final Animation<Offset> _footerSlide;

  Timer? _navTimer;
  bool _navCompleted = false;
  bool _navScheduled = false;

  Animation<double> _intervalFade(double begin, double end) {
    return CurvedAnimation(
      parent: _entranceController,
      curve: Interval(begin, end, curve: Curves.easeOut),
    );
  }

  Animation<Offset> _intervalSlide(
    double begin,
    double end, {
    Offset from = const Offset(0, 0.18),
  }) {
    return Tween<Offset>(begin: from, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: Interval(begin, end, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: _entranceDuration,
    );
    _ambientController = AnimationController(
      vsync: this,
      duration: _ambientDuration,
    )..repeat(reverse: true);

    _welcomeFade = _intervalFade(0.0, 0.35);
    _welcomeSlide = _intervalSlide(0.0, 0.35, from: const Offset(0, 0.22));
    _heroFade = _intervalFade(0.12, 0.52);
    _heroScale = Tween<double>(begin: 0.86, end: 1.0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.12, 0.52, curve: Curves.easeOutBack),
      ),
    );
    _titleFade = _intervalFade(0.30, 0.68);
    _titleSlide = _intervalSlide(0.30, 0.68);
    _buttonFade = _intervalFade(0.55, 1.0);
    _buttonSlide = _intervalSlide(0.55, 1.0, from: const Offset(0, 0.28));
    _footerFade = _intervalFade(0.0, 0.45);
    _footerSlide = Tween<Offset>(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutCubic),
      ),
    );

    _entranceController.forward();
    _entranceController.addStatusListener(_onEntranceStatusChanged);
  }

  void _onEntranceStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _scheduleAutoNavigation();
    }
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _entranceController.removeStatusListener(_onEntranceStatusChanged);
    _entranceController.dispose();
    _ambientController.dispose();
    super.dispose();
  }

  void _navigateNext() {
    if (_navCompleted || !mounted) return;
    _navCompleted = true;
    _navTimer?.cancel();

    final bool onboarded =
        StorageService.instance.getBool(StorageService.kOnboardingSeen);
    final bool languageChosen =
        StorageService.instance.getBool(StorageService.kLanguageChosen);
    final User? user = FirebaseAuth.instance.currentUser;
    final bool loggedIn = user != null;
    final bool needsEmailVerification = loggedIn &&
        AuthRepository.hasPasswordProvider(user) &&
        !user.emailVerified;

    final String route;
    if (!onboarded) {
      route = languageChosen ? AppRoutes.onboarding : AppRoutes.language;
    } else if (!loggedIn) {
      route = AppRoutes.login;
    } else if (needsEmailVerification) {
      route = AppRoutes.emailVerification;
    } else {
      route = AppRoutes.home;
    }

    context.go(route);
  }

  void _scheduleAutoNavigation() {
    if (_navScheduled || _navCompleted || !mounted) return;
    if (_entranceController.status != AnimationStatus.completed) return;

    _navScheduled = true;
    _navTimer?.cancel();
    _navTimer = Timer(const Duration(milliseconds: 800), () {
      if (mounted) _navigateNext();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scheduleAutoNavigation();
  }

  double _ambientOffset(double amplitude) {
    return math.sin(_ambientController.value * math.pi * 2) * amplitude;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor(context),
      body: AnimatedBuilder(
        animation: Listenable.merge(<Listenable>[
          _entranceController,
          _ambientController,
        ]),
        builder: (BuildContext context, Widget? child) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (isDark)
                _AnimatedTopGlow(
                  isDark: true,
                  drift: _ambientOffset(5),
                )
              else
                _AnimatedTopGlow(
                  isDark: false,
                  drift: _ambientOffset(5),
                ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: FadeTransition(
                  opacity: _footerFade,
                  child: SlideTransition(
                    position: _footerSlide,
                    child: _SplashBottomFooter(isDark: isDark),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * 0.15),
                  FadeTransition(
                    opacity: _welcomeFade,
                    child: SlideTransition(
                      position: _welcomeSlide,
                      child: Text(
                        l10n.welcome,
                        style: AppTextStyles.h3.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.2,
                          color:
                              isDark ? Colors.white : AppColors.primaryPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  FadeTransition(
                    opacity: _heroFade,
                    child: Transform.translate(
                      offset: Offset(0, _ambientOffset(6)),
                      child: ScaleTransition(
                        scale: _heroScale,
                        child: _SplashHeroImage(
                          isDark: isDark,
                          width: 390,
                          height: 205,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  FadeTransition(
                    opacity: _titleFade,
                    child: SlideTransition(
                      position: _titleSlide,
                      child: _SplashTitle(isDark: isDark, l10n: l10n),
                    ),
                  ),
                  if (isDark) ...<Widget>[
                    SizedBox(height: height * 0.06),
                  ] else ...<Widget>[
                    const Spacer(),
                    FadeTransition(
                      opacity: _buttonFade,
                      child: SlideTransition(
                        position: _buttonSlide,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45.0),
                          child: CustomGradientButton(
                            text: l10n.continueButton,
                            onTap: _navigateNext,
                            showArrow: false,
                            showSparkle: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SplashTitle extends StatelessWidget {
  const _SplashTitle({required this.isDark, required this.l10n});

  final bool isDark;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    if (isDark) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: Text(
          l10n.appTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.h1.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: Colors.white,
            height: 1.15,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text.rich(
        TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: '${l10n.life} ',
              style: AppTextStyles.h1.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
                color: const Color(0xFF022088),
                height: 1.15,
              ),
            ),
            TextSpan(
              text: l10n.navigator,
              style: AppTextStyles.h1.copyWith(
                fontSize: 30,
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
    );
  }
}

class _SplashHeroImage extends StatelessWidget {
  const _SplashHeroImage({
    required this.isDark,
    required this.width,
    required this.height,
  });

  final bool isDark;
  final double width;
  final double height;

  List<String> get _candidates => isDark
      ? <String>[
          Assets.imagesSplashImageLight,
        ]
      : <String>[
          Assets.imagesSplashImageLight,
        ];

  @override
  Widget build(BuildContext context) {
    return _AssetChain(
      paths: _candidates,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}

/// Tries asset paths in order; shows nothing if all fail (no fake placeholder).
class _AssetChain extends StatelessWidget {
  const _AssetChain({
    required this.paths,
    required this.width,
    required this.height,
    this.fit = BoxFit.contain,
  });

  final List<String> paths;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return _AssetAt(
      paths: paths,
      index: 0,
      width: width,
      height: height,
      fit: fit,
    );
  }
}

class _AssetAt extends StatelessWidget {
  const _AssetAt({
    required this.paths,
    required this.index,
    required this.width,
    required this.height,
    required this.fit,
  });

  final List<String> paths;
  final int index;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (index >= paths.length) {
      return SizedBox(width: width, height: height);
    }

    return Image.asset(
      paths[index],
      width: width,
      height: height,
      fit: fit,
      filterQuality: FilterQuality.high,
      errorBuilder: (_, __, ___) => _AssetAt(
        paths: paths,
        index: index + 1,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}

class _AnimatedTopGlow extends StatelessWidget {
  const _AnimatedTopGlow({
    required this.isDark,
    required this.drift,
  });

  final bool isDark;
  final double drift;

  @override
  Widget build(BuildContext context) {
    final String leftOrb =
        isDark ? Assets.iconsLeftCircleDark : Assets.iconsLeftCircleLight;
    final String rightOrb =
        isDark ? Assets.imagesDarkCircle : Assets.imagesCircleLight;

    return Stack(
      children: <Widget>[
        Positioned(
          top: -43 + drift,
          left: -40 - drift * 0.4,
          child: SoftOrb(
            size: 115,
            circleImage: leftOrb,
          ),
        ),
        Positioned(
          top: -28 - drift * 0.6,
          right: -40 + drift * 0.4,
          child: SoftOrb(
            size: 115,
            circleImage: rightOrb,
          ),
        ),
      ],
    );
  }
}

class LightTopGlow extends StatelessWidget {
  const LightTopGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AnimatedTopGlow(isDark: false, drift: 0);
  }
}

class DarkTopGlow extends StatelessWidget {
  const DarkTopGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AnimatedTopGlow(isDark: true, drift: 0);
  }
}

class SoftOrb extends StatelessWidget {
  const SoftOrb({
    super.key,
    required this.size,
    required this.circleImage,
  });

  final double size;
  final String circleImage;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      circleImage,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}

class _SplashBottomFooter extends StatelessWidget {
  const _SplashBottomFooter({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final String asset = isDark
        ? Assets.imagesBackGroundWaveDark
        : Assets.imagesBackGroundWaveLight;
    const double height = 120;

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
