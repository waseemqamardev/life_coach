/// Asset paths. Drop the matching PNG/SVG files into assets/images/.
/// If a file is missing the UI falls back to icon placeholders gracefully.
class AppAssets {
  AppAssets._();

  static const String _img = 'assets/images';

  // Splash screen assets (export from Figma at 3x).
  static const String splashImage = '$_img/splash_image.png';
  static const String splashHeroLight = '$_img/splash_hero_light.png';
  static const String splashHeroDark = '$_img/splash_hero_dark.png';
  static const String splashHero = '$_img/splash_hero.png';
  static const String brainHologram = '$_img/brain_hologram.png';
  static const String aiBot = '$_img/ai_bot.png';
  static const String envelopeLock = '$_img/envelope_lock.png';
  static const String trophy = '$_img/trophy.png';
  static const String target = '$_img/target.png';
  static const String safe = '$_img/safe.png';
  static const String emptyState = '$_img/empty_state.png';
  static const String waveLight = '$_img/wave_light.png';
  static const String waveDark = '$_img/wave_dark.png';
  static const String userAvatar = '$_img/user_avatar.png';
}

/// Named routes for go_router. Centralised so we never typo a path.
class AppRoutes {
  AppRoutes._();

  // Auth + intro
  static const String splash = '/';
  static const String language = '/language';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String emailVerification = '/email-verification';
  static const String changePassword = '/change-password';
  static const String deleteAccount = '/delete-account';
  static const String otp = '/otp';
  static const String resetPassword = '/reset-password';

  // Main
  static const String home = '/home';

  // Decision flow
  static const String startDecision = '/decision/start';
  static const String   enterProblem = '/decision/problem';
  static const String addOptions = '/decision/options';
  static const String goalSelection = '/decision/goal';
  static const String timeUrgency = '/decision/urgency';
  static const String budgetInput = '/decision/budget';
  static const String riskTolerance = '/decision/risk';
  static const String experienceLevel = '/decision/experience';
  static const String timeAvailability = '/decision/time';

  // AI flow
  static const String aiQuestionFlow = '/ai/questions';
  static const String chatbot = '/ai/chatbot';
  static const String processing = '/ai/processing';

  // Results
  static const String decisionResult = '/result';
  static const String finalRecommendation = '/result/final';
  static const String riskScore = '/result/risk';
  static const String prosCons = '/result/pros-cons';
  static const String outcomePrediction = '/result/outcome';
  static const String actionPlan = '/result/action-plan';
  static const String confidenceMeter = '/result/confidence';
  static const String saveDecision = '/result/save';

  // History
  static const String saved = '/saved';
  static const String history = '/history';
  static const String decisionDetail = '/history/detail';
  static const String compareDecisions = '/history/compare';

  // Engagement
  static const String dailyDecision = '/engagement/daily-decision';
  static const String dailySuggestion = '/engagement/daily-suggestion';

  // Advanced features
  static const String businessIdea = '/advanced/business-idea';
  static const String financialCalc = '/advanced/financial-calc';
  static const String careerAdvisor = '/advanced/career-advisor';
  static const String freelancePricing = '/advanced/freelance-pricing';
  static const String clientSelection = '/advanced/client-selection';
  static const String productivity = '/advanced/productivity';

  // Subscription
  static const String reportExport = '/report-export';
  static const String subscription = '/subscription';
  static const String premiumFeatures = '/subscription/premium';
  static const String payment = '/subscription/payment';
  static const String paymentSuccess = '/subscription/success';

  // Profile
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String personality = '/profile/personality';
  static const String notifications = '/profile/notifications';

  // Settings
  static const String settings = '/settings';
  static const String themeSettings = '/settings/theme';
  static const String languageSettings = '/settings/language';
  static const String privacyPolicy = '/settings/privacy';
  static const String terms = '/settings/terms';
  static const String howToUse = '/settings/how-to-use';

  // Support
  static const String help = '/support/help';
  static const String faq = '/support/faq';
  static const String about = '/support/about';
  static const String emptyState = '/support/empty';

  // System
  static const String loading = '/system/loading';
  static const String error = '/system/error';
  static const String noInternet = '/system/no-internet';
  static const String updateApp = '/system/update';
  static const String permission = '/system/permission';
}

/// Shared timing for the AI processing screen and result reveal animations.
class ProcessingTiming {
  ProcessingTiming._();

  /// Minimum dwell time before navigating to the result screen.
  static const Duration minDisplayDuration = Duration(milliseconds: 4500);

  /// UI tick interval for progress + phase updates.
  static const Duration tickInterval = Duration(milliseconds: 50);

  /// Brief finish animation once analysis completes.
  static const Duration completeAnimation = Duration(milliseconds: 350);

  /// Cap progress while analysis is still running (finishes at 1.0 when done).
  static const double maxProgressWhileLoading = 0.95;
}
