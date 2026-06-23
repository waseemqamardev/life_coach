import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_guard.dart';
import '../constants/app_constants.dart';
import '../services/screen_tracker_widget.dart';
import '../../features/advanced/business_idea/business_idea_screen.dart';
import '../../features/advanced/career_advisor/career_advisor_screen.dart';
import '../../features/advanced/client_selection/client_selection_screen.dart';
import '../../features/advanced/financial_calc/financial_calc_screen.dart';
import '../../features/advanced/freelance_pricing/freelance_pricing_screen.dart';
import '../../features/advanced/productivity/productivity_screen.dart';
import '../../features/ai/chatbot/chatbot_screen.dart';
import '../../features/ai/processing/processing_screen.dart';
import '../../features/ai/question_flow/question_flow_screen.dart';
import '../../features/auth/change_password/change_password_screen.dart';
import '../../features/auth/delete_account/delete_account_screen.dart';
import '../../features/auth/email_verification/email_verification_screen.dart';
import '../../features/auth/forgot_password/forgot_password_screen.dart';
import '../../features/auth/login/login_screen.dart';
import '../../features/auth/otp/otp_screen.dart';
import '../../features/auth/reset_password/reset_password_screen.dart';
import '../../features/auth/signup/signup_screen.dart';
import '../../features/decision/budget/budget_screen.dart';
import '../../features/decision/experience/experience_screen.dart';
import '../../features/decision/goal/goal_screen.dart';
import '../../features/decision/options/options_screen.dart';
import '../../features/decision/problem/problem_screen.dart';
import '../../features/decision/risk/risk_screen.dart';
import '../../features/decision/start/start_decision_screen.dart';
import '../../features/decision/time_availability/time_availability_screen.dart';
import '../../features/decision/urgency/urgency_screen.dart';
import '../../features/engagement/daily_decision/daily_decision_screen.dart';
import '../../features/engagement/daily_suggestion/daily_suggestion_screen.dart';
import '../../features/history/compare/compare_screen.dart';
import '../../features/history/detail/decision_detail_screen.dart';
import '../../features/history/list/history_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/profile/edit/edit_profile_screen.dart';
import '../../features/profile/notifications/notifications_screen.dart';
import '../../features/profile/personality/personality_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/results/action_plan/action_plan_screen.dart';
import '../../features/results/confidence_meter/confidence_meter_screen.dart';
import '../../features/results/decision_result/decision_result_screen.dart';
import '../../features/results/final_recommendation/final_recommendation_screen.dart';
import '../../features/results/outcome_prediction/outcome_prediction_screen.dart';
import '../../features/results/pros_cons/pros_cons_screen.dart';
import '../../features/results/risk_score/risk_score_screen.dart';
import '../../features/results/save_decision/save_decision_screen.dart';
import '../../features/settings/how_to_use/how_to_use_screen.dart';
import '../../features/settings/language/language_screen.dart';
import '../../features/settings/main/settings_screen.dart';
import '../../features/settings/privacy/privacy_screen.dart';
import '../../features/settings/terms/terms_screen.dart';
import '../../features/settings/theme/theme_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/subscription/payment/payment_screen.dart';
import '../../features/subscription/plans/subscription_screen.dart';
import '../../features/subscription/premium/premium_features_screen.dart';
import '../../features/subscription/success/payment_success_screen.dart';
import '../../features/support/about/about_screen.dart';
import '../../features/support/empty/empty_screen.dart';
import '../../features/support/faq/faq_screen.dart';
import '../../features/support/help/help_screen.dart';
import '../../features/system/error/error_screen.dart';
import '../../features/system/loading/loading_screen.dart';
import '../../features/system/no_internet/no_internet_screen.dart';
import '../../features/system/permission/permission_screen.dart';
import '../../features/system/update/update_app_screen.dart';
import '../../features/results/report_export/report_export_screen.dart';

GoRouter buildRouter({Listenable? refreshListenable}) {
  GoRoute r(String path, Widget Function(BuildContext, GoRouterState) builder) =>
      GoRoute(
        path: path,
        pageBuilder: (BuildContext c, GoRouterState s) =>
            NoTransitionPage<void>(
          child: path == AppRoutes.splash
              ? builder(c, s)
              : TrackedScreen(
                  key: ValueKey<String>(path),
                  screenName: path.replaceAll('/', '').isEmpty
                      ? 'Home'
                      : path.replaceAll('/', ''),
                  child: builder(c, s),
                ),
        ),
      );

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshListenable,
    redirect: (BuildContext _, GoRouterState state) => authGuardRedirect(state),
    routes: <RouteBase>[
      r(AppRoutes.splash, (_, __) => const SplashScreen()),
      r(AppRoutes.language,
          (_, __) => const LanguageScreen(flow: LanguageFlow.onboarding)),
      r(AppRoutes.onboarding, (_, __) => const OnboardingScreen()),
      r(AppRoutes.login, (_, __) => const LoginScreen()),
      r(AppRoutes.signup, (_, __) => const SignupScreen()),
      r(AppRoutes.forgotPassword, (_, __) => const ForgotPasswordScreen()),
      r(AppRoutes.emailVerification, (_, __) => const EmailVerificationScreen()),
      r(AppRoutes.changePassword, (_, __) => const ChangePasswordScreen()),
      r(AppRoutes.deleteAccount, (_, __) => const DeleteAccountScreen()),
      r(AppRoutes.otp, (BuildContext _, GoRouterState s) {
        return OtpScreen(
          email: s.uri.queryParameters['email'] ?? '',
          name: s.uri.queryParameters['name'] ?? '',
          flow: s.uri.queryParameters['flow'] ?? 'signup',
        );
      }),
      r(AppRoutes.resetPassword, (_, __) => const ResetPasswordScreen()),

      r(AppRoutes.home, (_, __) => const HomeScreen()),

      r(AppRoutes.startDecision, (_, __) => const StartDecisionScreen()),
      r(AppRoutes.enterProblem, (_, __) => const ProblemScreen()),
      r(AppRoutes.addOptions, (_, __) => const OptionsScreen()),
      r(AppRoutes.goalSelection, (_, __) => const GoalScreen()),
      r(AppRoutes.timeUrgency, (_, __) => const UrgencyScreen()),
      r(AppRoutes.budgetInput, (_, __) => const BudgetScreen()),
      r(AppRoutes.riskTolerance, (_, __) => const RiskScreen()),
      r(AppRoutes.experienceLevel, (_, __) => const ExperienceScreen()),
      r(AppRoutes.timeAvailability, (_, __) => const TimeAvailabilityScreen()),

      r(AppRoutes.aiQuestionFlow, (_, __) => const QuestionFlowScreen()),
      r(AppRoutes.chatbot, (_, __) => const ChatbotScreen()),
      r(AppRoutes.processing, (_, __) => const ProcessingScreen()),

      r(AppRoutes.decisionResult, (_, __) => const DecisionResultScreen()),
      r(AppRoutes.finalRecommendation,
          (_, __) => const FinalRecommendationScreen()),
      r(AppRoutes.riskScore, (_, __) => const RiskScoreScreen()),
      r(AppRoutes.prosCons, (_, __) => const ProsConsScreen()),
      r(AppRoutes.outcomePrediction,
          (_, __) => const OutcomePredictionScreen()),
      r(AppRoutes.actionPlan, (_, __) => const ActionPlanScreen()),
      r(AppRoutes.confidenceMeter, (_, __) => const ConfidenceMeterScreen()),
      r(AppRoutes.saveDecision, (_, __) => const SaveDecisionScreen()),

      r(AppRoutes.history, (_, __) => const HistoryScreen()),
      r(AppRoutes.saved,
          (_, __) => const HistoryScreen(navIndex: 3)),
      GoRoute(
        path: '${AppRoutes.decisionDetail}/:id',
        pageBuilder: (BuildContext c, GoRouterState s) =>
            NoTransitionPage<void>(
          child: TrackedScreen(
            key: ValueKey<String>('${AppRoutes.decisionDetail}/${s.pathParameters['id']}'),
            screenName: 'decisionDetail',
            child: DecisionDetailScreen(id: s.pathParameters['id']!),
          ),
        ),
      ),
      r(AppRoutes.compareDecisions, (_, __) => const CompareScreen()),

      r(AppRoutes.dailyDecision, (_, __) => const DailyDecisionScreen()),
      r(AppRoutes.dailySuggestion, (_, __) => const DailySuggestionScreen()),

      r(AppRoutes.businessIdea, (_, __) => const BusinessIdeaScreen()),
      r(AppRoutes.financialCalc, (_, __) => const FinancialCalcScreen()),
      r(AppRoutes.careerAdvisor, (_, __) => const CareerAdvisorScreen()),
      r(AppRoutes.freelancePricing, (_, __) => const FreelancePricingScreen()),
      r(AppRoutes.clientSelection, (_, __) => const ClientSelectionScreen()),
      r(AppRoutes.productivity, (_, __) => const ProductivityScreen()),

      r(AppRoutes.reportExport, (_, __) => const ReportExportScreen()),
      r(AppRoutes.subscription, (_, __) => const SubscriptionScreen()),
      r(AppRoutes.premiumFeatures, (_, __) => const PremiumFeaturesScreen()),
      r(AppRoutes.payment, (_, __) => const PaymentScreen()),
      r(AppRoutes.paymentSuccess, (_, __) => const PaymentSuccessScreen()),

      r(AppRoutes.profile, (_, __) => const ProfileScreen()),
      r(AppRoutes.editProfile, (_, __) => const EditProfileScreen()),
      r(AppRoutes.personality, (_, __) => const PersonalityScreen()),
      r(AppRoutes.notifications, (_, __) => const NotificationsScreen()),

      r(AppRoutes.settings, (_, __) => const SettingsScreen()),
      r(AppRoutes.themeSettings, (_, __) => const ThemeScreen()),
      r(AppRoutes.languageSettings,
          (_, __) => const LanguageScreen(flow: LanguageFlow.settings)),
      r(AppRoutes.privacyPolicy, (_, __) => const PrivacyScreen()),
      r(AppRoutes.terms, (_, __) => const TermsScreen()),
      r(AppRoutes.howToUse, (_, __) => const HowToUseScreen()),

      r(AppRoutes.help, (_, __) => const HelpScreen()),
      r(AppRoutes.faq, (_, __) => const FaqScreen()),
      r(AppRoutes.about, (_, __) => const AboutScreen()),
      r(AppRoutes.emptyState, (_, __) => const EmptyScreen()),

      r(AppRoutes.loading, (_, __) => const LoadingScreen()),
      r(AppRoutes.error, (_, __) => const ErrorScreen()),
      r(AppRoutes.noInternet, (_, __) => const NoInternetScreen()),
      r(AppRoutes.updateApp, (_, __) => const UpdateAppScreen()),
      r(AppRoutes.permission, (_, __) => const PermissionScreen()),
    ],
  );
}
