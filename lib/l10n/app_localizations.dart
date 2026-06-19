import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('ur'),
    Locale('zh')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Life Coach'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navChatbot.
  ///
  /// In en, this message translates to:
  /// **'AI Chatbot'**
  String get navChatbot;

  /// No description provided for @navInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get navInsights;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @analyzeButton.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get analyzeButton;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectLanguage;

  /// No description provided for @languageWord.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageWord;

  /// No description provided for @searchLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'Search Language here...'**
  String get searchLanguageHint;

  /// No description provided for @noLanguagesFound.
  ///
  /// In en, this message translates to:
  /// **'No languages found'**
  String get noLanguagesFound;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Setting'**
  String get accountSettings;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name} 👋'**
  String goodMorning(String name);

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get AI-powered guidance for your next important decision.'**
  String get homeSubtitle;

  /// No description provided for @startNewAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Start New Analysis'**
  String get startNewAnalysis;

  /// No description provided for @startAnalysisSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start a guided analysis and receive a personalized recommendation.'**
  String get startAnalysisSubtitle;

  /// No description provided for @decisionOverview.
  ///
  /// In en, this message translates to:
  /// **'Decision Overview'**
  String get decisionOverview;

  /// No description provided for @riskScore.
  ///
  /// In en, this message translates to:
  /// **'Risk Score'**
  String get riskScore;

  /// No description provided for @successChance.
  ///
  /// In en, this message translates to:
  /// **'Success Chance'**
  String get successChance;

  /// No description provided for @activePlans.
  ///
  /// In en, this message translates to:
  /// **'Active Plans'**
  String get activePlans;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @recentInsights.
  ///
  /// In en, this message translates to:
  /// **'Recent Insights'**
  String get recentInsights;

  /// No description provided for @stepDefine.
  ///
  /// In en, this message translates to:
  /// **'Define'**
  String get stepDefine;

  /// No description provided for @stepAnalyze.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get stepAnalyze;

  /// No description provided for @stepQuestions.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get stepQuestions;

  /// No description provided for @stepResult.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get stepResult;

  /// No description provided for @defineYourProblem.
  ///
  /// In en, this message translates to:
  /// **'Define Your'**
  String get defineYourProblem;

  /// No description provided for @problemWord.
  ///
  /// In en, this message translates to:
  /// **'Problem'**
  String get problemWord;

  /// No description provided for @tellUsMore.
  ///
  /// In en, this message translates to:
  /// **'Tell us more about your decision'**
  String get tellUsMore;

  /// No description provided for @wizardHint.
  ///
  /// In en, this message translates to:
  /// **'The more details you provide, the better our AI can analyze & guide you.'**
  String get wizardHint;

  /// No description provided for @describeDecision.
  ///
  /// In en, this message translates to:
  /// **'Describe Your Decision'**
  String get describeDecision;

  /// No description provided for @quickTips.
  ///
  /// In en, this message translates to:
  /// **'Quick Tips'**
  String get quickTips;

  /// No description provided for @beSpecific.
  ///
  /// In en, this message translates to:
  /// **'Be Specific'**
  String get beSpecific;

  /// No description provided for @includeContext.
  ///
  /// In en, this message translates to:
  /// **'Include Context'**
  String get includeContext;

  /// No description provided for @mentionGoal.
  ///
  /// In en, this message translates to:
  /// **'Mention Goal'**
  String get mentionGoal;

  /// No description provided for @choosingBetween.
  ///
  /// In en, this message translates to:
  /// **'What are you choosing between?'**
  String get choosingBetween;

  /// No description provided for @optionsHint.
  ///
  /// In en, this message translates to:
  /// **'List up to 5 options. The AI will weigh each against your goals.'**
  String get optionsHint;

  /// No description provided for @addAnotherOption.
  ///
  /// In en, this message translates to:
  /// **'Add Another Option'**
  String get addAnotherOption;

  /// No description provided for @continueToAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Continue To Analysis'**
  String get continueToAnalysis;

  /// No description provided for @aiQuestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get aiQuestionsTitle;

  /// No description provided for @questionsWord.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get questionsWord;

  /// No description provided for @preparingQuestions.
  ///
  /// In en, this message translates to:
  /// **'Preparing personalized questions…'**
  String get preparingQuestions;

  /// No description provided for @basedOnDecision.
  ///
  /// In en, this message translates to:
  /// **'Based on your decision: {title}'**
  String basedOnDecision(String title);

  /// No description provided for @basedOnWizard.
  ///
  /// In en, this message translates to:
  /// **'Based on what you shared in the wizard'**
  String get basedOnWizard;

  /// No description provided for @aiNavigator.
  ///
  /// In en, this message translates to:
  /// **'Life Coach'**
  String get aiNavigator;

  /// No description provided for @aiQuestionsHint.
  ///
  /// In en, this message translates to:
  /// **'Answer honestly — your responses shape the AI analysis.'**
  String get aiQuestionsHint;

  /// No description provided for @aiQuestionsPersonalized.
  ///
  /// In en, this message translates to:
  /// **'AI generated these questions specifically for \"{title}\".'**
  String aiQuestionsPersonalized(String title);

  /// No description provided for @questionOf.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String questionOf(int current, int total);

  /// No description provided for @whyThisMatters.
  ///
  /// In en, this message translates to:
  /// **'Why this matters?'**
  String get whyThisMatters;

  /// No description provided for @whyQuestionsMatter.
  ///
  /// In en, this message translates to:
  /// **'Your answers help the AI focus on what is most relevant to your situation.'**
  String get whyQuestionsMatter;

  /// No description provided for @securePrivate.
  ///
  /// In en, this message translates to:
  /// **'Your data is secure & private'**
  String get securePrivate;

  /// No description provided for @processingAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your options...'**
  String get processingAnalyzing;

  /// No description provided for @processingRisk.
  ///
  /// In en, this message translates to:
  /// **'Calculating risk factors...'**
  String get processingRisk;

  /// No description provided for @processingOutcomes.
  ///
  /// In en, this message translates to:
  /// **'Predicting outcomes...'**
  String get processingOutcomes;

  /// No description provided for @processingPlan.
  ///
  /// In en, this message translates to:
  /// **'Building action plan...'**
  String get processingPlan;

  /// No description provided for @processingFinalizing.
  ///
  /// In en, this message translates to:
  /// **'Finalizing Result'**
  String get processingFinalizing;

  /// No description provided for @decisionResult.
  ///
  /// In en, this message translates to:
  /// **'Decision'**
  String get decisionResult;

  /// No description provided for @resultWord.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get resultWord;

  /// No description provided for @recommendedChoice.
  ///
  /// In en, this message translates to:
  /// **'Recommended Choice'**
  String get recommendedChoice;

  /// No description provided for @benefitScore.
  ///
  /// In en, this message translates to:
  /// **'Benefit Score'**
  String get benefitScore;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidence;

  /// No description provided for @fitScore.
  ///
  /// In en, this message translates to:
  /// **'Fit Score'**
  String get fitScore;

  /// No description provided for @resultBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Result Breakdown'**
  String get resultBreakdown;

  /// No description provided for @finalRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Final Recommendation'**
  String get finalRecommendation;

  /// No description provided for @outcomePrediction.
  ///
  /// In en, this message translates to:
  /// **'Outcome Prediction'**
  String get outcomePrediction;

  /// No description provided for @confidenceMeter.
  ///
  /// In en, this message translates to:
  /// **'Confidence Meter'**
  String get confidenceMeter;

  /// No description provided for @actionPlan.
  ///
  /// In en, this message translates to:
  /// **'Action Plan'**
  String get actionPlan;

  /// No description provided for @prosCons.
  ///
  /// In en, this message translates to:
  /// **'Pros & Cons'**
  String get prosCons;

  /// No description provided for @tipFromAi.
  ///
  /// In en, this message translates to:
  /// **'Tip from AI'**
  String get tipFromAi;

  /// No description provided for @saveReport.
  ///
  /// In en, this message translates to:
  /// **'Save Report'**
  String get saveReport;

  /// No description provided for @startNewDecision.
  ///
  /// In en, this message translates to:
  /// **'Start New Decision'**
  String get startNewDecision;

  /// No description provided for @decisionWord.
  ///
  /// In en, this message translates to:
  /// **'Decision'**
  String get decisionWord;

  /// No description provided for @comparisonWord.
  ///
  /// In en, this message translates to:
  /// **'Comparison'**
  String get comparisonWord;

  /// No description provided for @whyRecommended.
  ///
  /// In en, this message translates to:
  /// **'Why This Is Recommended?'**
  String get whyRecommended;

  /// No description provided for @riskBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Risk Breakdown'**
  String get riskBreakdown;

  /// No description provided for @riskInterpretation.
  ///
  /// In en, this message translates to:
  /// **'Risk Interpretation'**
  String get riskInterpretation;

  /// No description provided for @howToImprove.
  ///
  /// In en, this message translates to:
  /// **'How To Improve'**
  String get howToImprove;

  /// No description provided for @overallConfidence.
  ///
  /// In en, this message translates to:
  /// **'Overall Confidence'**
  String get overallConfidence;

  /// No description provided for @confidenceBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Confidence Breakdown'**
  String get confidenceBreakdown;

  /// No description provided for @successLikelihood.
  ///
  /// In en, this message translates to:
  /// **'Success Likelihood'**
  String get successLikelihood;

  /// No description provided for @outcomeBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Outcome Breakdown'**
  String get outcomeBreakdown;

  /// No description provided for @keyOutcomeFactors.
  ///
  /// In en, this message translates to:
  /// **'Key Outcome Factors'**
  String get keyOutcomeFactors;

  /// No description provided for @prosTitle.
  ///
  /// In en, this message translates to:
  /// **'Pros Of This Decision'**
  String get prosTitle;

  /// No description provided for @consTitle.
  ///
  /// In en, this message translates to:
  /// **'Cons Of This Decision'**
  String get consTitle;

  /// No description provided for @overallProsCons.
  ///
  /// In en, this message translates to:
  /// **'Overall Pros & Cons'**
  String get overallProsCons;

  /// No description provided for @bestOverallFit.
  ///
  /// In en, this message translates to:
  /// **'Best overall fit'**
  String get bestOverallFit;

  /// No description provided for @bestOverallChoice.
  ///
  /// In en, this message translates to:
  /// **'Best overall choice'**
  String get bestOverallChoice;

  /// No description provided for @recommendedChoiceLabel.
  ///
  /// In en, this message translates to:
  /// **'Recommended choice'**
  String get recommendedChoiceLabel;

  /// No description provided for @yourActionPlan.
  ///
  /// In en, this message translates to:
  /// **'Your Action Plan'**
  String get yourActionPlan;

  /// No description provided for @aiInsight.
  ///
  /// In en, this message translates to:
  /// **'AI Insight'**
  String get aiInsight;

  /// No description provided for @keyComparison.
  ///
  /// In en, this message translates to:
  /// **'Key Comparison'**
  String get keyComparison;

  /// No description provided for @overallScore.
  ///
  /// In en, this message translates to:
  /// **'Overall Score'**
  String get overallScore;

  /// No description provided for @keyPoints.
  ///
  /// In en, this message translates to:
  /// **'Key Points'**
  String get keyPoints;

  /// No description provided for @analysisFailed.
  ///
  /// In en, this message translates to:
  /// **'Analysis failed. Check your internet and API key.'**
  String get analysisFailed;

  /// No description provided for @missingApiKey.
  ///
  /// In en, this message translates to:
  /// **'GEMINI_API_KEY is missing. Add it to .env and restart the app.'**
  String get missingApiKey;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description provided.'**
  String get noDescription;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @lowRisk.
  ///
  /// In en, this message translates to:
  /// **'Low Risk'**
  String get lowRisk;

  /// No description provided for @mediumRisk.
  ///
  /// In en, this message translates to:
  /// **'Medium Risk'**
  String get mediumRisk;

  /// No description provided for @highRisk.
  ///
  /// In en, this message translates to:
  /// **'High Risk'**
  String get highRisk;

  /// No description provided for @notAssessed.
  ///
  /// In en, this message translates to:
  /// **'Not assessed'**
  String get notAssessed;

  /// No description provided for @couldNotLoadQuestions.
  ///
  /// In en, this message translates to:
  /// **'Could not load questions'**
  String get couldNotLoadQuestions;

  /// No description provided for @noQuestionsGenerated.
  ///
  /// In en, this message translates to:
  /// **'No questions were generated.'**
  String get noQuestionsGenerated;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Make smarter decisions with AI'**
  String get onboardingTitle1;

  /// No description provided for @onboardingSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Get personalized guidance for life\'s important choices.'**
  String get onboardingSubtitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Analyze risks and outcomes'**
  String get onboardingTitle2;

  /// No description provided for @onboardingSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Understand trade-offs before you commit.'**
  String get onboardingSubtitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Follow a clear action plan'**
  String get onboardingTitle3;

  /// No description provided for @onboardingSubtitle3.
  ///
  /// In en, this message translates to:
  /// **'Turn insights into practical next steps.'**
  String get onboardingSubtitle3;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @generalSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language updated'**
  String get languageChanged;

  /// No description provided for @yourOptions.
  ///
  /// In en, this message translates to:
  /// **'Your options'**
  String get yourOptions;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @compareOptions.
  ///
  /// In en, this message translates to:
  /// **'Compare options'**
  String get compareOptions;

  /// No description provided for @plan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get plan;

  /// No description provided for @prepare.
  ///
  /// In en, this message translates to:
  /// **'Prepare'**
  String get prepare;

  /// No description provided for @execute.
  ///
  /// In en, this message translates to:
  /// **'Execute'**
  String get execute;

  /// No description provided for @positiveOutcome.
  ///
  /// In en, this message translates to:
  /// **'Positive Outcome'**
  String get positiveOutcome;

  /// No description provided for @neutralOutcome.
  ///
  /// In en, this message translates to:
  /// **'Neutral Outcome'**
  String get neutralOutcome;

  /// No description provided for @negativeOutcome.
  ///
  /// In en, this message translates to:
  /// **'Negative Outcome'**
  String get negativeOutcome;

  /// No description provided for @overallRiskScore.
  ///
  /// In en, this message translates to:
  /// **'Overall Risk Score'**
  String get overallRiskScore;

  /// No description provided for @yourDecisionRiskLevel.
  ///
  /// In en, this message translates to:
  /// **'Your decision risk level'**
  String get yourDecisionRiskLevel;

  /// No description provided for @overallPrediction.
  ///
  /// In en, this message translates to:
  /// **'Overall Prediction'**
  String get overallPrediction;

  /// No description provided for @overallProsConsTitle.
  ///
  /// In en, this message translates to:
  /// **'Overall Pros & Cons'**
  String get overallProsConsTitle;

  /// No description provided for @emptyHistory.
  ///
  /// In en, this message translates to:
  /// **'No saved decisions yet'**
  String get emptyHistory;

  /// No description provided for @startFirstDecision.
  ///
  /// In en, this message translates to:
  /// **'Start your first decision analysis'**
  String get startFirstDecision;

  /// No description provided for @chatbotTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Chatbot'**
  String get chatbotTitle;

  /// No description provided for @insightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insightsTitle;

  /// No description provided for @dailySuggestion.
  ///
  /// In en, this message translates to:
  /// **'Daily Suggestion'**
  String get dailySuggestion;

  /// No description provided for @aboutTagline.
  ///
  /// In en, this message translates to:
  /// **'Smart decision support powered by AI — weigh options, risks, and next steps.'**
  String get aboutTagline;

  /// No description provided for @aboutBody.
  ///
  /// In en, this message translates to:
  /// **'Life Coach helps you set goals, build habits, and make smarter decisions with AI-powered planning and clear action steps.'**
  String get aboutBody;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @appSetting.
  ///
  /// In en, this message translates to:
  /// **'App Setting'**
  String get appSetting;

  /// No description provided for @securityPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Security & Privacy'**
  String get securityPrivacy;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @howToUse.
  ///
  /// In en, this message translates to:
  /// **'How To Use'**
  String get howToUse;

  /// No description provided for @appTheme.
  ///
  /// In en, this message translates to:
  /// **'App Theme'**
  String get appTheme;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareApp;

  /// No description provided for @rateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rateUs;

  /// No description provided for @pleaseAddOption.
  ///
  /// In en, this message translates to:
  /// **'Please add at least one option'**
  String get pleaseAddOption;

  /// No description provided for @noReportToSave.
  ///
  /// In en, this message translates to:
  /// **'No decision report to save.'**
  String get noReportToSave;

  /// No description provided for @reportSaved.
  ///
  /// In en, this message translates to:
  /// **'Report saved to History.'**
  String get reportSaved;

  /// No description provided for @pendingAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Pending analysis'**
  String get pendingAnalysis;

  /// No description provided for @untitledDecision.
  ///
  /// In en, this message translates to:
  /// **'Untitled decision'**
  String get untitledDecision;

  /// No description provided for @describeDecisionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your situation, constraints, and what success looks like.'**
  String get describeDecisionHint;

  /// No description provided for @optionLabel.
  ///
  /// In en, this message translates to:
  /// **'Option {letter}'**
  String optionLabel(String letter);

  /// No description provided for @goodChance.
  ///
  /// In en, this message translates to:
  /// **'Good Chance'**
  String get goodChance;

  /// No description provided for @fairChance.
  ///
  /// In en, this message translates to:
  /// **'Fair Chance'**
  String get fairChance;

  /// No description provided for @poorChance.
  ///
  /// In en, this message translates to:
  /// **'Poor Chance'**
  String get poorChance;

  /// No description provided for @couldNotPrepareQuestions.
  ///
  /// In en, this message translates to:
  /// **'Could not prepare questions. Please try again.'**
  String get couldNotPrepareQuestions;

  /// No description provided for @greetingFallbackName.
  ///
  /// In en, this message translates to:
  /// **'there'**
  String get greetingFallbackName;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get orContinueWith;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @life.
  ///
  /// In en, this message translates to:
  /// **'Life'**
  String get life;

  /// No description provided for @navigator.
  ///
  /// In en, this message translates to:
  /// **'Coach'**
  String get navigator;

  /// No description provided for @authTagline.
  ///
  /// In en, this message translates to:
  /// **'AI Goal Planner'**
  String get authTagline;

  /// No description provided for @chatbotReadySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to navigate your life'**
  String get chatbotReadySubtitle;

  /// No description provided for @chatbotInputHint.
  ///
  /// In en, this message translates to:
  /// **'Start your chat here...'**
  String get chatbotInputHint;

  /// No description provided for @chatbotErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, I could not reach the AI service. Please check your connection and try again.'**
  String get chatbotErrorMessage;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// No description provided for @deselectAll.
  ///
  /// In en, this message translates to:
  /// **'Deselect all'**
  String get deselectAll;

  /// No description provided for @selectDecisionsToDelete.
  ///
  /// In en, this message translates to:
  /// **'Select decisions to delete.'**
  String get selectDecisionsToDelete;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @highScore.
  ///
  /// In en, this message translates to:
  /// **'High Score'**
  String get highScore;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} min ago'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} hour ago'**
  String hoursAgo(int count);

  /// No description provided for @hoursAgoPlural.
  ///
  /// In en, this message translates to:
  /// **'{count} hours ago'**
  String hoursAgoPlural(int count);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} day ago'**
  String daysAgo(int count);

  /// No description provided for @daysAgoPlural.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgoPlural(int count);

  /// No description provided for @scoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Score {score}'**
  String scoreLabel(int score);

  /// No description provided for @themeCustomizeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize the look & feel of your app'**
  String get themeCustomizeSubtitle;

  /// No description provided for @lightModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clean & bright experience'**
  String get lightModeSubtitle;

  /// No description provided for @darkModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Easy on the eyes in low light'**
  String get darkModeSubtitle;

  /// No description provided for @systemDefaultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use device theme preference'**
  String get systemDefaultSubtitle;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @applyTheme.
  ///
  /// In en, this message translates to:
  /// **'Apply Theme'**
  String get applyTheme;

  /// No description provided for @shareAppMessage.
  ///
  /// In en, this message translates to:
  /// **'Share Life Coach with your friends.'**
  String get shareAppMessage;

  /// No description provided for @rateAppThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for rating Life Coach!'**
  String get rateAppThanks;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'{field} is required'**
  String fieldRequired(String field);

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @otpRequired.
  ///
  /// In en, this message translates to:
  /// **'OTP is required'**
  String get otpRequired;

  /// No description provided for @otpInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid {length}-digit code'**
  String otpInvalid(int length);

  /// No description provided for @fieldMinLength.
  ///
  /// In en, this message translates to:
  /// **'{field} must be at least {min} characters'**
  String fieldMinLength(String field, int min);

  /// No description provided for @fieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get fieldDescription;

  /// No description provided for @fieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get fieldTitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @acceptTermsRequired.
  ///
  /// In en, this message translates to:
  /// **'Please accept the Terms and Privacy Policy.'**
  String get acceptTermsRequired;

  /// No description provided for @signupTitleLeading.
  ///
  /// In en, this message translates to:
  /// **'Create Your'**
  String get signupTitleLeading;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @signupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join Life Coach and plan your goals with AI every day.'**
  String get signupSubtitle;

  /// No description provided for @iAgreeToThe.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get iAgreeToThe;

  /// No description provided for @forgotPasswordLeading.
  ///
  /// In en, this message translates to:
  /// **'Forgot'**
  String get forgotPasswordLeading;

  /// No description provided for @forgotPasswordAccent.
  ///
  /// In en, this message translates to:
  /// **'Password?'**
  String get forgotPasswordAccent;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we\'ll send you a link to reset your password.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @enterEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterEmailHint;

  /// No description provided for @forgotPasswordInfo.
  ///
  /// In en, this message translates to:
  /// **'We will send a password reset link to your email address.'**
  String get forgotPasswordInfo;

  /// No description provided for @sendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendVerificationCode;

  /// No description provided for @sendPasswordResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendPasswordResetLink;

  /// No description provided for @emailVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get emailVerificationTitle;

  /// No description provided for @emailVerificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification link to your email. Open it to activate your account.'**
  String get emailVerificationSubtitle;

  /// No description provided for @emailVerificationSpamHint.
  ///
  /// In en, this message translates to:
  /// **'Check your spam or junk folder if you do not see the email within a few minutes.'**
  String get emailVerificationSpamHint;

  /// No description provided for @emailVerificationWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for verification… we will check automatically.'**
  String get emailVerificationWaiting;

  /// No description provided for @emailVerificationResend.
  ///
  /// In en, this message translates to:
  /// **'Resend verification email'**
  String get emailVerificationResend;

  /// No description provided for @emailVerificationResent.
  ///
  /// In en, this message translates to:
  /// **'Verification email sent again.'**
  String get emailVerificationResent;

  /// No description provided for @authErrorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password. Please try again.'**
  String get authErrorWrongPassword;

  /// No description provided for @authErrorEmailInUse.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered. Try logging in instead.'**
  String get authErrorEmailInUse;

  /// No description provided for @authErrorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak. Use at least 6 characters.'**
  String get authErrorWeakPassword;

  /// No description provided for @authErrorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No account found with this email.'**
  String get authErrorUserNotFound;

  /// No description provided for @authErrorTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please wait and try again.'**
  String get authErrorTooManyRequests;

  /// No description provided for @authErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get authErrorGeneric;

  /// No description provided for @authErrorGoogleCancelled.
  ///
  /// In en, this message translates to:
  /// **'Google sign-in was cancelled.'**
  String get authErrorGoogleCancelled;

  /// No description provided for @passwordResetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent. Check your inbox.'**
  String get passwordResetEmailSent;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @changePasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password and choose a new one.'**
  String get changePasswordSubtitle;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your account and cannot be undone.'**
  String get deleteAccountConfirm;

  /// No description provided for @deleteAccountSuccess.
  ///
  /// In en, this message translates to:
  /// **'Also delete local decisions and chat stored on this device.'**
  String get deleteAccountSuccess;

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Your account has been deleted.'**
  String get accountDeleted;

  /// No description provided for @rememberPassword.
  ///
  /// In en, this message translates to:
  /// **'Remember your password?'**
  String get rememberPassword;

  /// No description provided for @passwordUpdatedLogin.
  ///
  /// In en, this message translates to:
  /// **'Password updated. Please log in.'**
  String get passwordUpdatedLogin;

  /// No description provided for @resetLeading.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetLeading;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new password for your account.'**
  String get resetPasswordSubtitle;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Use at least 6 characters with a mix you can remember.'**
  String get passwordHint;

  /// No description provided for @updating.
  ///
  /// In en, this message translates to:
  /// **'Updating...'**
  String get updating;

  /// No description provided for @updatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get updatePassword;

  /// No description provided for @backTo.
  ///
  /// In en, this message translates to:
  /// **'Back to'**
  String get backTo;

  /// No description provided for @newCodeSentTo.
  ///
  /// In en, this message translates to:
  /// **'New code sent to {email}'**
  String newCodeSentTo(String email);

  /// No description provided for @invalidVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code. Please try again.'**
  String get invalidVerificationCode;

  /// No description provided for @otpResetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit reset code sent to {email}'**
  String otpResetSubtitle(String email);

  /// No description provided for @otpVerifySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit verification code sent to {email}'**
  String otpVerifySubtitle(String email);

  /// No description provided for @verifyLeading.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verifyLeading;

  /// No description provided for @verifyEmailLeading.
  ///
  /// In en, this message translates to:
  /// **'Verify Your'**
  String get verifyEmailLeading;

  /// No description provided for @codeWord.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get codeWord;

  /// No description provided for @emailWord.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailWord;

  /// No description provided for @resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {seconds}s'**
  String resendCodeIn(int seconds);

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get didntReceiveCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @verifying.
  ///
  /// In en, this message translates to:
  /// **'Verifying...'**
  String get verifying;

  /// No description provided for @verifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCode;

  /// No description provided for @verifyAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Verify & Continue'**
  String get verifyAndContinue;

  /// No description provided for @wrongEmail.
  ///
  /// In en, this message translates to:
  /// **'Wrong email?'**
  String get wrongEmail;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout this app?'**
  String get logoutConfirmMessage;

  /// No description provided for @logoutConfirmYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, Log Out'**
  String get logoutConfirmYes;

  /// No description provided for @insightsHeroDescription.
  ///
  /// In en, this message translates to:
  /// **'Daily suggestions and insights tailored to your decisions.'**
  String get insightsHeroDescription;

  /// No description provided for @recommendedPrefix.
  ///
  /// In en, this message translates to:
  /// **'Recommended: {text}'**
  String recommendedPrefix(String text);

  /// No description provided for @riskInterpretationEmpty.
  ///
  /// In en, this message translates to:
  /// **'Complete an analysis to see a personalized risk interpretation.'**
  String get riskInterpretationEmpty;

  /// No description provided for @startDecisionQuestion.
  ///
  /// In en, this message translates to:
  /// **'What decision do you want help with?'**
  String get startDecisionQuestion;

  /// No description provided for @startDecisionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Describe your decision and get AI-powered insights & recommendations.'**
  String get startDecisionSubtitle;

  /// No description provided for @decisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Decision Title'**
  String get decisionTitle;

  /// No description provided for @decisionTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Should I change careers?'**
  String get decisionTitleHint;

  /// No description provided for @decisionCategory.
  ///
  /// In en, this message translates to:
  /// **'Decision Category'**
  String get decisionCategory;

  /// No description provided for @importanceLevel.
  ///
  /// In en, this message translates to:
  /// **'Importance Level'**
  String get importanceLevel;

  /// No description provided for @impactMinor.
  ///
  /// In en, this message translates to:
  /// **'Minor Impact'**
  String get impactMinor;

  /// No description provided for @impactModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate Impact'**
  String get impactModerate;

  /// No description provided for @impactHigh.
  ///
  /// In en, this message translates to:
  /// **'High Impact'**
  String get impactHigh;

  /// No description provided for @categoryCareer.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get categoryCareer;

  /// No description provided for @categoryFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get categoryFinance;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryRelations.
  ///
  /// In en, this message translates to:
  /// **'Relations'**
  String get categoryRelations;

  /// No description provided for @categoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryEducation;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @addYourOptionsLeading.
  ///
  /// In en, this message translates to:
  /// **'Add Your'**
  String get addYourOptionsLeading;

  /// No description provided for @optionsWord.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get optionsWord;

  /// No description provided for @describeOptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe this option'**
  String get describeOptionHint;

  /// No description provided for @goalSelection.
  ///
  /// In en, this message translates to:
  /// **'Goal Selection'**
  String get goalSelection;

  /// No description provided for @goalSelectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the options for your decision that matter most to you.'**
  String get goalSelectionSubtitle;

  /// No description provided for @selectAtLeastOneGoal.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one goal'**
  String get selectAtLeastOneGoal;

  /// No description provided for @goalTipBody.
  ///
  /// In en, this message translates to:
  /// **'You can always adjust your priorities later in your profile.'**
  String get goalTipBody;

  /// No description provided for @goalGrowth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get goalGrowth;

  /// No description provided for @goalFinancialGain.
  ///
  /// In en, this message translates to:
  /// **'Financial Gain'**
  String get goalFinancialGain;

  /// No description provided for @goalRiskReduction.
  ///
  /// In en, this message translates to:
  /// **'Risk Reduction'**
  String get goalRiskReduction;

  /// No description provided for @goalPersonalSatisfaction.
  ///
  /// In en, this message translates to:
  /// **'Personal Satisfaction'**
  String get goalPersonalSatisfaction;

  /// No description provided for @goalTimeEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Time Efficiency'**
  String get goalTimeEfficiency;

  /// No description provided for @goalWorkLifeBalance.
  ///
  /// In en, this message translates to:
  /// **'Work-Life Balance'**
  String get goalWorkLifeBalance;

  /// No description provided for @goalStability.
  ///
  /// In en, this message translates to:
  /// **'Stability'**
  String get goalStability;

  /// No description provided for @goalImpact.
  ///
  /// In en, this message translates to:
  /// **'Impact'**
  String get goalImpact;

  /// No description provided for @budgetInput.
  ///
  /// In en, this message translates to:
  /// **'Budget Input'**
  String get budgetInput;

  /// No description provided for @budgetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your estimated budget for this decision.'**
  String get budgetSubtitle;

  /// No description provided for @budgetImpactLevel.
  ///
  /// In en, this message translates to:
  /// **'Budget Impact Level'**
  String get budgetImpactLevel;

  /// No description provided for @budgetLessThan5k.
  ///
  /// In en, this message translates to:
  /// **'Less Than \$5K'**
  String get budgetLessThan5k;

  /// No description provided for @enterYourBudget.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Budget'**
  String get enterYourBudget;

  /// No description provided for @timeAvailability.
  ///
  /// In en, this message translates to:
  /// **'Time Availability'**
  String get timeAvailability;

  /// No description provided for @timeAvailabilitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your time availability for this decision.'**
  String get timeAvailabilitySubtitle;

  /// No description provided for @experienceLevel.
  ///
  /// In en, this message translates to:
  /// **'Experience Level'**
  String get experienceLevel;

  /// No description provided for @experienceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps our AI understand your background and expertise.'**
  String get experienceSubtitle;

  /// No description provided for @riskTolerance.
  ///
  /// In en, this message translates to:
  /// **'Risk Tolerance'**
  String get riskTolerance;

  /// No description provided for @riskToleranceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your risk tolerance level for this decision.'**
  String get riskToleranceSubtitle;

  /// No description provided for @timeUrgency.
  ///
  /// In en, this message translates to:
  /// **'Time Urgency'**
  String get timeUrgency;

  /// No description provided for @urgencySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the urgency for your decision.'**
  String get urgencySubtitle;

  /// No description provided for @financialRisk.
  ///
  /// In en, this message translates to:
  /// **'Financial Risk'**
  String get financialRisk;

  /// No description provided for @marketRisk.
  ///
  /// In en, this message translates to:
  /// **'Market Risk'**
  String get marketRisk;

  /// No description provided for @timeRisk.
  ///
  /// In en, this message translates to:
  /// **'Time Risk'**
  String get timeRisk;

  /// No description provided for @executionRisk.
  ///
  /// In en, this message translates to:
  /// **'Execution Risk'**
  String get executionRisk;

  /// No description provided for @personalRisk.
  ///
  /// In en, this message translates to:
  /// **'Personal Risk'**
  String get personalRisk;

  /// No description provided for @overallFit.
  ///
  /// In en, this message translates to:
  /// **'Overall Fit'**
  String get overallFit;

  /// No description provided for @firstOption.
  ///
  /// In en, this message translates to:
  /// **'First option'**
  String get firstOption;

  /// No description provided for @secondOption.
  ///
  /// In en, this message translates to:
  /// **'Second option'**
  String get secondOption;

  /// No description provided for @versus.
  ///
  /// In en, this message translates to:
  /// **'Vs'**
  String get versus;

  /// No description provided for @confidenceInterpretation.
  ///
  /// In en, this message translates to:
  /// **'Confidence Interpretation'**
  String get confidenceInterpretation;

  /// No description provided for @financialImpact.
  ///
  /// In en, this message translates to:
  /// **'Financial Impact'**
  String get financialImpact;

  /// No description provided for @riskLevel.
  ///
  /// In en, this message translates to:
  /// **'Risk Level'**
  String get riskLevel;

  /// No description provided for @timeInvestment.
  ///
  /// In en, this message translates to:
  /// **'Time Investment'**
  String get timeInvestment;

  /// No description provided for @longTermSustainability.
  ///
  /// In en, this message translates to:
  /// **'Long Term Sustainability'**
  String get longTermSustainability;

  /// No description provided for @personalGrowth.
  ///
  /// In en, this message translates to:
  /// **'Personal Growth'**
  String get personalGrowth;

  /// No description provided for @outcomeConsistency.
  ///
  /// In en, this message translates to:
  /// **'Outcome Consistency'**
  String get outcomeConsistency;

  /// No description provided for @riskAssessment.
  ///
  /// In en, this message translates to:
  /// **'Risk Assessment'**
  String get riskAssessment;

  /// No description provided for @historicalSimilarity.
  ///
  /// In en, this message translates to:
  /// **'Historical Similarity'**
  String get historicalSimilarity;

  /// No description provided for @relevanceMatch.
  ///
  /// In en, this message translates to:
  /// **'Relevance Match'**
  String get relevanceMatch;

  /// No description provided for @dataQuality.
  ///
  /// In en, this message translates to:
  /// **'Data Quality'**
  String get dataQuality;

  /// No description provided for @confidenceVeryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very High'**
  String get confidenceVeryHigh;

  /// No description provided for @confidenceModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get confidenceModerate;

  /// No description provided for @confidenceVeryLow.
  ///
  /// In en, this message translates to:
  /// **'Very Low'**
  String get confidenceVeryLow;

  /// No description provided for @onboardingAiPowered.
  ///
  /// In en, this message translates to:
  /// **'AI Powered'**
  String get onboardingAiPowered;

  /// No description provided for @onboardingSmartAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Smart analysis for better decisions'**
  String get onboardingSmartAnalysis;

  /// No description provided for @onboardingRiskAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Risk Analysis'**
  String get onboardingRiskAnalysis;

  /// No description provided for @onboardingActionablePlans.
  ///
  /// In en, this message translates to:
  /// **'Actionable Plans'**
  String get onboardingActionablePlans;

  /// No description provided for @onboardingTrustedGuidance.
  ///
  /// In en, this message translates to:
  /// **'Trusted Guidance'**
  String get onboardingTrustedGuidance;

  /// No description provided for @onboardingDefineGoalLeading.
  ///
  /// In en, this message translates to:
  /// **'Define Your'**
  String get onboardingDefineGoalLeading;

  /// No description provided for @goalWord.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goalWord;

  /// No description provided for @onboardingChooseJourney.
  ///
  /// In en, this message translates to:
  /// **'Choose the life journey you want guidance on'**
  String get onboardingChooseJourney;

  /// No description provided for @onboardingCareerPath.
  ///
  /// In en, this message translates to:
  /// **'Career Path'**
  String get onboardingCareerPath;

  /// No description provided for @onboardingCareerPathDesc.
  ///
  /// In en, this message translates to:
  /// **'Explore future markets & skills'**
  String get onboardingCareerPathDesc;

  /// No description provided for @onboardingMajorPurchase.
  ///
  /// In en, this message translates to:
  /// **'Major Purchase'**
  String get onboardingMajorPurchase;

  /// No description provided for @onboardingMajorPurchaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Compare options for a new purchase'**
  String get onboardingMajorPurchaseDesc;

  /// No description provided for @onboardingLifeChanges.
  ///
  /// In en, this message translates to:
  /// **'Life Changes'**
  String get onboardingLifeChanges;

  /// No description provided for @onboardingLifeChangesDesc.
  ///
  /// In en, this message translates to:
  /// **'Plan a relocation or new phase'**
  String get onboardingLifeChangesDesc;

  /// No description provided for @onboardingPersonalGrowth.
  ///
  /// In en, this message translates to:
  /// **'Personal Growth'**
  String get onboardingPersonalGrowth;

  /// No description provided for @onboardingPersonalGrowthDesc.
  ///
  /// In en, this message translates to:
  /// **'Identify skills & mindset shifts'**
  String get onboardingPersonalGrowthDesc;

  /// No description provided for @onboardingReadyLeading.
  ///
  /// In en, this message translates to:
  /// **'Ready To'**
  String get onboardingReadyLeading;

  /// No description provided for @navigateWord.
  ///
  /// In en, this message translates to:
  /// **'Navigate'**
  String get navigateWord;

  /// No description provided for @onboardingReadySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your personalized assistant is ready to help'**
  String get onboardingReadySubtitle;

  /// No description provided for @onboardingActionableGuidance.
  ///
  /// In en, this message translates to:
  /// **'Actionable Guidance'**
  String get onboardingActionableGuidance;

  /// No description provided for @onboardingActionableGuidanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Get guidance for your success'**
  String get onboardingActionableGuidanceDesc;

  /// No description provided for @onboardingProgressTracking.
  ///
  /// In en, this message translates to:
  /// **'Progress Tracking'**
  String get onboardingProgressTracking;

  /// No description provided for @onboardingProgressTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'Monitor milestones on your journey'**
  String get onboardingProgressTrackingDesc;

  /// No description provided for @onboardingAdjustOnTheFly.
  ///
  /// In en, this message translates to:
  /// **'Adjust On The Fly'**
  String get onboardingAdjustOnTheFly;

  /// No description provided for @onboardingAdjustDesc.
  ///
  /// In en, this message translates to:
  /// **'Re-evaluate plans as life happens'**
  String get onboardingAdjustDesc;

  /// No description provided for @onboardingShareLearn.
  ///
  /// In en, this message translates to:
  /// **'Share & Learn'**
  String get onboardingShareLearn;

  /// No description provided for @onboardingShareLearnDesc.
  ///
  /// In en, this message translates to:
  /// **'Share and learn from your paths'**
  String get onboardingShareLearnDesc;

  /// No description provided for @myProfileLeading.
  ///
  /// In en, this message translates to:
  /// **'My'**
  String get myProfileLeading;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @personalityPreferences.
  ///
  /// In en, this message translates to:
  /// **'Personality Preferences'**
  String get personalityPreferences;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @tapToChangePhoto.
  ///
  /// In en, this message translates to:
  /// **'Tap here to change photo'**
  String get tapToChangePhoto;

  /// No description provided for @photoPickerComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Photo picker coming soon.'**
  String get photoPickerComingSoon;

  /// No description provided for @pickImageSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Change profile photo'**
  String get pickImageSourceTitle;

  /// No description provided for @pickFromCamera.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get pickFromCamera;

  /// No description provided for @pickFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get pickFromGallery;

  /// No description provided for @removePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get removePhoto;

  /// No description provided for @cameraPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to take a photo.'**
  String get cameraPermissionDenied;

  /// No description provided for @galleryPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Photo library permission is required to choose a photo.'**
  String get galleryPermissionDenied;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @savePreferences.
  ///
  /// In en, this message translates to:
  /// **'Save Preferences'**
  String get savePreferences;

  /// No description provided for @preferencesSaved.
  ///
  /// In en, this message translates to:
  /// **'Preferences saved.'**
  String get preferencesSaved;

  /// No description provided for @personalitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help AI understand you better'**
  String get personalitySubtitle;

  /// No description provided for @focusAreas.
  ///
  /// In en, this message translates to:
  /// **'Focus Areas'**
  String get focusAreas;

  /// No description provided for @emptyTitleLeading.
  ///
  /// In en, this message translates to:
  /// **'Nothing'**
  String get emptyTitleLeading;

  /// No description provided for @emptyTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'Here Yet'**
  String get emptyTitleAccent;

  /// No description provided for @emptyQuietTitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s quiet in here'**
  String get emptyQuietTitle;

  /// No description provided for @emptyHistoryHint.
  ///
  /// In en, this message translates to:
  /// **'Start your first decision and your history will appear here.'**
  String get emptyHistoryHint;

  /// No description provided for @startADecision.
  ///
  /// In en, this message translates to:
  /// **'Start a Decision'**
  String get startADecision;

  /// No description provided for @helpHereToHelp.
  ///
  /// In en, this message translates to:
  /// **'We\'re here to help'**
  String get helpHereToHelp;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorTitle;

  /// No description provided for @errorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We hit an unexpected error. Please try again.'**
  String get errorSubtitle;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @noInternetTitle.
  ///
  /// In en, this message translates to:
  /// **'No Connection'**
  String get noInternetTitle;

  /// No description provided for @noInternetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get noInternetSubtitle;

  /// No description provided for @retryConnection.
  ///
  /// In en, this message translates to:
  /// **'Retry Connection'**
  String get retryConnection;

  /// No description provided for @offlineMode.
  ///
  /// In en, this message translates to:
  /// **'Go to Offline Mode'**
  String get offlineMode;

  /// No description provided for @permissionTitle.
  ///
  /// In en, this message translates to:
  /// **'App Permissions'**
  String get permissionTitle;

  /// No description provided for @permissionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Grant permissions for the best experience.'**
  String get permissionSubtitle;

  /// No description provided for @grantAll.
  ///
  /// In en, this message translates to:
  /// **'Grant All'**
  String get grantAll;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notNow;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// No description provided for @updateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A new version is available with improvements.'**
  String get updateSubtitle;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// No description provided for @remindLater.
  ///
  /// In en, this message translates to:
  /// **'Remind Me Later'**
  String get remindLater;

  /// No description provided for @loadingMessage.
  ///
  /// In en, this message translates to:
  /// **'Getting things ready...'**
  String get loadingMessage;

  /// No description provided for @decisionDetailLeading.
  ///
  /// In en, this message translates to:
  /// **'Decision'**
  String get decisionDetailLeading;

  /// No description provided for @detailWord.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detailWord;

  /// No description provided for @decisionNotFound.
  ///
  /// In en, this message translates to:
  /// **'Decision not found'**
  String get decisionNotFound;

  /// No description provided for @overall.
  ///
  /// In en, this message translates to:
  /// **'Overall'**
  String get overall;

  /// No description provided for @pros.
  ///
  /// In en, this message translates to:
  /// **'Pros'**
  String get pros;

  /// No description provided for @cons.
  ///
  /// In en, this message translates to:
  /// **'Cons'**
  String get cons;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @saveAtLeastTwoToCompare.
  ///
  /// In en, this message translates to:
  /// **'Save at least two decisions to compare.'**
  String get saveAtLeastTwoToCompare;

  /// No description provided for @selectExactlyTwoToCompare.
  ///
  /// In en, this message translates to:
  /// **'Select exactly 2 decisions to compare.'**
  String get selectExactlyTwoToCompare;

  /// No description provided for @selectOneDecisionToCompare.
  ///
  /// In en, this message translates to:
  /// **'Select one decision to compare its options.'**
  String get selectOneDecisionToCompare;

  /// No description provided for @decisionNeedsTwoOptionsToCompare.
  ///
  /// In en, this message translates to:
  /// **'This decision needs at least 2 options to compare.'**
  String get decisionNeedsTwoOptionsToCompare;

  /// No description provided for @moderate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get moderate;

  /// No description provided for @veryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very High'**
  String get veryHigh;

  /// No description provided for @veryLow.
  ///
  /// In en, this message translates to:
  /// **'Very Low'**
  String get veryLow;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @useWord.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get useWord;

  /// No description provided for @aboutUsLeading.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutUsLeading;

  /// No description provided for @aboutUsAccent.
  ///
  /// In en, this message translates to:
  /// **'Us'**
  String get aboutUsAccent;

  /// No description provided for @howToUseLeading.
  ///
  /// In en, this message translates to:
  /// **'How To'**
  String get howToUseLeading;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get versionLabel;

  /// No description provided for @dailyDecision.
  ///
  /// In en, this message translates to:
  /// **'Daily Decision'**
  String get dailyDecision;

  /// No description provided for @personalityDescription.
  ///
  /// In en, this message translates to:
  /// **'These settings personalize the tone and depth of recommendations.'**
  String get personalityDescription;

  /// No description provided for @traitOptimism.
  ///
  /// In en, this message translates to:
  /// **'Optimism'**
  String get traitOptimism;

  /// No description provided for @traitPatience.
  ///
  /// In en, this message translates to:
  /// **'Patience'**
  String get traitPatience;

  /// No description provided for @traitDetailFocus.
  ///
  /// In en, this message translates to:
  /// **'Detail Focus'**
  String get traitDetailFocus;

  /// No description provided for @categoryTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get categoryTravel;

  /// No description provided for @helpResponseTime.
  ///
  /// In en, this message translates to:
  /// **'Average response time: under 24 hours'**
  String get helpResponseTime;

  /// No description provided for @helpGetInTouch.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get helpGetInTouch;

  /// No description provided for @helpLiveChat.
  ///
  /// In en, this message translates to:
  /// **'Live Chat'**
  String get helpLiveChat;

  /// No description provided for @helpLiveChatSub.
  ///
  /// In en, this message translates to:
  /// **'Chat with our team in real time'**
  String get helpLiveChatSub;

  /// No description provided for @helpCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get helpCall;

  /// No description provided for @helpCallSub.
  ///
  /// In en, this message translates to:
  /// **'Mon–Fri 9am–5pm PT'**
  String get helpCallSub;

  /// No description provided for @helpSubmitTicket.
  ///
  /// In en, this message translates to:
  /// **'Submit a Ticket'**
  String get helpSubmitTicket;

  /// No description provided for @helpSubmitTicketSub.
  ///
  /// In en, this message translates to:
  /// **'Get a tracked support ticket'**
  String get helpSubmitTicketSub;

  /// No description provided for @helpQuickLinks.
  ///
  /// In en, this message translates to:
  /// **'Quick links'**
  String get helpQuickLinks;

  /// No description provided for @faqSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Common questions answered'**
  String get faqSubtitle;

  /// No description provided for @aboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Version, credits, and links'**
  String get aboutSubtitle;

  /// No description provided for @helpOpenLiveChat.
  ///
  /// In en, this message translates to:
  /// **'Open Live Chat'**
  String get helpOpenLiveChat;

  /// No description provided for @helpLiveChatSoon.
  ///
  /// In en, this message translates to:
  /// **'Live chat opening soon — we will email you back within 24 hours.'**
  String get helpLiveChatSoon;

  /// No description provided for @moreOptionsComingSoon.
  ///
  /// In en, this message translates to:
  /// **'More options coming soon'**
  String get moreOptionsComingSoon;

  /// No description provided for @insightCompoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Compound your decisions'**
  String get insightCompoundTitle;

  /// No description provided for @insightCompoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Decisions made today shape opportunities 6 months out. Pick the one that opens the most doors.'**
  String get insightCompoundMessage;

  /// No description provided for @insightParalysisTitle.
  ///
  /// In en, this message translates to:
  /// **'Beware analysis paralysis'**
  String get insightParalysisTitle;

  /// No description provided for @insightParalysisMessage.
  ///
  /// In en, this message translates to:
  /// **'If you\'ve been thinking about it for over a week with no new info, you have enough to decide.'**
  String get insightParalysisMessage;

  /// No description provided for @insightRiskStressTitle.
  ///
  /// In en, this message translates to:
  /// **'Risk does not equal stress'**
  String get insightRiskStressTitle;

  /// No description provided for @insightRiskStressMessage.
  ///
  /// In en, this message translates to:
  /// **'A high-risk decision can still be low-stress if you have a clear plan B. Always design your fallback.'**
  String get insightRiskStressMessage;

  /// No description provided for @insightFutureYouTitle.
  ///
  /// In en, this message translates to:
  /// **'Future-you votes too'**
  String get insightFutureYouTitle;

  /// No description provided for @insightFutureYouMessage.
  ///
  /// In en, this message translates to:
  /// **'Before deciding, ask: would future-you, 5 years from now, thank present-you for this?'**
  String get insightFutureYouMessage;

  /// No description provided for @streakDays.
  ///
  /// In en, this message translates to:
  /// **'{count}-day streak'**
  String streakDays(int count);

  /// No description provided for @streakKeepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep going - make today\'s decision count.'**
  String get streakKeepGoing;

  /// No description provided for @todaysDecisionPrompt.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Decision Prompt'**
  String get todaysDecisionPrompt;

  /// No description provided for @dailyDecisionExerciseSub.
  ///
  /// In en, this message translates to:
  /// **'A quick 60-second decision exercise'**
  String get dailyDecisionExerciseSub;

  /// No description provided for @dailyDecisionQuestion.
  ///
  /// In en, this message translates to:
  /// **'Should you say yes or no to this opportunity?'**
  String get dailyDecisionQuestion;

  /// No description provided for @dailyDecisionScenario.
  ///
  /// In en, this message translates to:
  /// **'A colleague invites you to a side project. It\'s exciting but takes 10 hours a week.'**
  String get dailyDecisionScenario;

  /// No description provided for @seeAiAnalysis.
  ///
  /// In en, this message translates to:
  /// **'See AI Analysis'**
  String get seeAiAnalysis;

  /// No description provided for @errorWhatYouCanDo.
  ///
  /// In en, this message translates to:
  /// **'What you can do'**
  String get errorWhatYouCanDo;

  /// No description provided for @errorTip1.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get errorTip1;

  /// No description provided for @errorTip2.
  ///
  /// In en, this message translates to:
  /// **'Try the action again in a moment'**
  String get errorTip2;

  /// No description provided for @errorTip3.
  ///
  /// In en, this message translates to:
  /// **'Restart the app'**
  String get errorTip3;

  /// No description provided for @errorTip4.
  ///
  /// In en, this message translates to:
  /// **'Contact support if it keeps happening'**
  String get errorTip4;

  /// No description provided for @noInternetYouCanStill.
  ///
  /// In en, this message translates to:
  /// **'You can still'**
  String get noInternetYouCanStill;

  /// No description provided for @offlineTip1.
  ///
  /// In en, this message translates to:
  /// **'View saved decisions and history'**
  String get offlineTip1;

  /// No description provided for @offlineTip2.
  ///
  /// In en, this message translates to:
  /// **'Read your notes and action plans'**
  String get offlineTip2;

  /// No description provided for @offlineTip3.
  ///
  /// In en, this message translates to:
  /// **'Browse FAQs and About'**
  String get offlineTip3;

  /// No description provided for @permissionNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Get reminders and daily decision prompts'**
  String get permissionNotificationsDesc;

  /// No description provided for @permissionLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get permissionLocation;

  /// No description provided for @permissionLocationDesc.
  ///
  /// In en, this message translates to:
  /// **'Used only for location-based suggestions'**
  String get permissionLocationDesc;

  /// No description provided for @permissionStorage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get permissionStorage;

  /// No description provided for @permissionStorageDesc.
  ///
  /// In en, this message translates to:
  /// **'Save your reports and exports locally'**
  String get permissionStorageDesc;

  /// No description provided for @permissionSettingsNote.
  ///
  /// In en, this message translates to:
  /// **'You can change permissions any time from Settings'**
  String get permissionSettingsNote;

  /// No description provided for @updateVersionReady.
  ///
  /// In en, this message translates to:
  /// **'Version {version} is ready to install'**
  String updateVersionReady(String version);

  /// No description provided for @whatsNew.
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get whatsNew;

  /// No description provided for @updateFeature1.
  ///
  /// In en, this message translates to:
  /// **'Faster AI analysis (2x speedup)'**
  String get updateFeature1;

  /// No description provided for @updateFeature2.
  ///
  /// In en, this message translates to:
  /// **'New Career Advisor module'**
  String get updateFeature2;

  /// No description provided for @updateFeature3.
  ///
  /// In en, this message translates to:
  /// **'Improved dark mode contrast'**
  String get updateFeature3;

  /// No description provided for @updateFeature4.
  ///
  /// In en, this message translates to:
  /// **'Bug fixes and stability improvements'**
  String get updateFeature4;

  /// No description provided for @loadingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This usually takes just a few seconds'**
  String get loadingSubtitle;

  /// No description provided for @howToUseStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Define your decision'**
  String get howToUseStep1Title;

  /// No description provided for @howToUseStep1Body.
  ///
  /// In en, this message translates to:
  /// **'Start by describing your decision, category, and what matters most to you.'**
  String get howToUseStep1Body;

  /// No description provided for @howToUseStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Analyze your options'**
  String get howToUseStep2Title;

  /// No description provided for @howToUseStep2Body.
  ///
  /// In en, this message translates to:
  /// **'Answer guided questions about goals, urgency, budget, and risk tolerance.'**
  String get howToUseStep2Body;

  /// No description provided for @howToUseStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Review AI results'**
  String get howToUseStep3Title;

  /// No description provided for @howToUseStep3Body.
  ///
  /// In en, this message translates to:
  /// **'See your recommendation, risk score, pros and cons, and a step-by-step action plan.'**
  String get howToUseStep3Body;

  /// No description provided for @howToUseStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Save and track progress'**
  String get howToUseStep4Title;

  /// No description provided for @howToUseStep4Body.
  ///
  /// In en, this message translates to:
  /// **'Save decisions to History and revisit insights whenever you need guidance.'**
  String get howToUseStep4Body;

  /// No description provided for @clientSelectionLeading.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get clientSelectionLeading;

  /// No description provided for @clientSelectionAccent.
  ///
  /// In en, this message translates to:
  /// **'Selection'**
  String get clientSelectionAccent;

  /// No description provided for @whichClientQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which client should you say yes to?'**
  String get whichClientQuestion;

  /// No description provided for @clientSelectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI scores client opportunities by fit, fee, and risk.'**
  String get clientSelectionSubtitle;

  /// No description provided for @freelancePricingLeading.
  ///
  /// In en, this message translates to:
  /// **'Freelance'**
  String get freelancePricingLeading;

  /// No description provided for @freelancePricingAccent.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get freelancePricingAccent;

  /// No description provided for @recommendedPrice.
  ///
  /// In en, this message translates to:
  /// **'Recommended Price'**
  String get recommendedPrice;

  /// No description provided for @pricingScore.
  ///
  /// In en, this message translates to:
  /// **'Pricing Score'**
  String get pricingScore;

  /// No description provided for @priceComparison.
  ///
  /// In en, this message translates to:
  /// **'Price Comparison'**
  String get priceComparison;

  /// No description provided for @priceDrivers.
  ///
  /// In en, this message translates to:
  /// **'Price Drivers'**
  String get priceDrivers;

  /// No description provided for @marketRate.
  ///
  /// In en, this message translates to:
  /// **'Market Rate'**
  String get marketRate;

  /// No description provided for @experienceLabel.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceLabel;

  /// No description provided for @timelineLabel.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timelineLabel;

  /// No description provided for @complexityLabel.
  ///
  /// In en, this message translates to:
  /// **'Complexity'**
  String get complexityLabel;

  /// No description provided for @projectValue.
  ///
  /// In en, this message translates to:
  /// **'Project Value'**
  String get projectValue;

  /// No description provided for @sendProposal.
  ///
  /// In en, this message translates to:
  /// **'Send Proposal'**
  String get sendProposal;

  /// No description provided for @proposalSent.
  ///
  /// In en, this message translates to:
  /// **'Proposal sent to client.'**
  String get proposalSent;

  /// No description provided for @productivityLeading.
  ///
  /// In en, this message translates to:
  /// **'Productivity'**
  String get productivityLeading;

  /// No description provided for @productivityAccent.
  ///
  /// In en, this message translates to:
  /// **'Planner'**
  String get productivityAccent;

  /// No description provided for @eisenhowerPriority.
  ///
  /// In en, this message translates to:
  /// **'Eisenhower priority'**
  String get eisenhowerPriority;

  /// No description provided for @startFocusBlock.
  ///
  /// In en, this message translates to:
  /// **'Start Focus Block'**
  String get startFocusBlock;

  /// No description provided for @focusBlockStarted.
  ///
  /// In en, this message translates to:
  /// **'Focus block started — good luck!'**
  String get focusBlockStarted;

  /// No description provided for @careerAdvisorLeading.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get careerAdvisorLeading;

  /// No description provided for @careerAdvisorAccent.
  ///
  /// In en, this message translates to:
  /// **'Advisor'**
  String get careerAdvisorAccent;

  /// No description provided for @careerFitScore.
  ///
  /// In en, this message translates to:
  /// **'Career Fit Score'**
  String get careerFitScore;

  /// No description provided for @topPathProductManager.
  ///
  /// In en, this message translates to:
  /// **'Top Path: Product Manager'**
  String get topPathProductManager;

  /// No description provided for @skillMatch.
  ///
  /// In en, this message translates to:
  /// **'Skill Match'**
  String get skillMatch;

  /// No description provided for @strategyLabel.
  ///
  /// In en, this message translates to:
  /// **'Strategy'**
  String get strategyLabel;

  /// No description provided for @communicationLabel.
  ///
  /// In en, this message translates to:
  /// **'Communication'**
  String get communicationLabel;

  /// No description provided for @analyticsLabel.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analyticsLabel;

  /// No description provided for @technicalLabel.
  ///
  /// In en, this message translates to:
  /// **'Technical'**
  String get technicalLabel;

  /// No description provided for @build90DayPlan.
  ///
  /// In en, this message translates to:
  /// **'Build 90-Day Plan'**
  String get build90DayPlan;

  /// No description provided for @businessIdeaLeading.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get businessIdeaLeading;

  /// No description provided for @businessIdeaAccent.
  ///
  /// In en, this message translates to:
  /// **'Idea'**
  String get businessIdeaAccent;

  /// No description provided for @describeBusinessIdea.
  ///
  /// In en, this message translates to:
  /// **'Describe your business idea'**
  String get describeBusinessIdea;

  /// No description provided for @businessIdeaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI will score viability, market fit, and risk.'**
  String get businessIdeaSubtitle;

  /// No description provided for @viabilityScore.
  ///
  /// In en, this message translates to:
  /// **'Viability Score'**
  String get viabilityScore;

  /// No description provided for @scoreBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Score Breakdown'**
  String get scoreBreakdown;

  /// No description provided for @aiVerdict.
  ///
  /// In en, this message translates to:
  /// **'AI Verdict'**
  String get aiVerdict;

  /// No description provided for @fullPlanGenerated.
  ///
  /// In en, this message translates to:
  /// **'Full plan generated and saved.'**
  String get fullPlanGenerated;

  /// No description provided for @financialCalcLeading.
  ///
  /// In en, this message translates to:
  /// **'Financial'**
  String get financialCalcLeading;

  /// No description provided for @financialCalcAccent.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get financialCalcAccent;

  /// No description provided for @compoundGrowth.
  ///
  /// In en, this message translates to:
  /// **'Compound Growth'**
  String get compoundGrowth;

  /// No description provided for @futureValue.
  ///
  /// In en, this message translates to:
  /// **'Future Value'**
  String get futureValue;

  /// No description provided for @saveToDecisions.
  ///
  /// In en, this message translates to:
  /// **'Save to Decisions'**
  String get saveToDecisions;

  /// No description provided for @saveDecisionLeading.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveDecisionLeading;

  /// No description provided for @saveDecisionAccent.
  ///
  /// In en, this message translates to:
  /// **'Decision'**
  String get saveDecisionAccent;

  /// No description provided for @decisionSaved.
  ///
  /// In en, this message translates to:
  /// **'Decision saved.'**
  String get decisionSaved;

  /// No description provided for @folderLabel.
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get folderLabel;

  /// No description provided for @folderDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get folderDefault;

  /// No description provided for @folderCareer.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get folderCareer;

  /// No description provided for @folderFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get folderFinance;

  /// No description provided for @folderHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get folderHealth;

  /// No description provided for @folderPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get folderPersonal;

  /// No description provided for @reportExportLeading.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get reportExportLeading;

  /// No description provided for @reportExportAccent.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get reportExportAccent;

  /// No description provided for @exportReport.
  ///
  /// In en, this message translates to:
  /// **'Export Report'**
  String get exportReport;

  /// No description provided for @shareReport.
  ///
  /// In en, this message translates to:
  /// **'Share Report'**
  String get shareReport;

  /// No description provided for @subscriptionLeading.
  ///
  /// In en, this message translates to:
  /// **'Choose Your'**
  String get subscriptionLeading;

  /// No description provided for @subscriptionAccent.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get subscriptionAccent;

  /// No description provided for @mostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// No description provided for @freeTrial.
  ///
  /// In en, this message translates to:
  /// **'7-Day Free Trial'**
  String get freeTrial;

  /// No description provided for @upgradePremium.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get upgradePremium;

  /// No description provided for @choosePlan.
  ///
  /// In en, this message translates to:
  /// **'Choose a Plan'**
  String get choosePlan;

  /// No description provided for @paymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful!'**
  String get paymentSuccessful;

  /// No description provided for @thankYouUpgrade.
  ///
  /// In en, this message translates to:
  /// **'Thank you for upgrading to Premium.'**
  String get thankYouUpgrade;

  /// No description provided for @goToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Go to Dashboard'**
  String get goToDashboard;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumber;

  /// No description provided for @nameOnCard.
  ///
  /// In en, this message translates to:
  /// **'Name on Card'**
  String get nameOnCard;

  /// No description provided for @premiumFeatures.
  ///
  /// In en, this message translates to:
  /// **'Premium Features'**
  String get premiumFeatures;

  /// No description provided for @faqSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search FAQs'**
  String get faqSearchHint;

  /// No description provided for @topicAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get topicAll;

  /// No description provided for @topicGettingStarted.
  ///
  /// In en, this message translates to:
  /// **'Getting Started'**
  String get topicGettingStarted;

  /// No description provided for @topicAi.
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get topicAi;

  /// No description provided for @topicBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get topicBilling;

  /// No description provided for @topicAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get topicAccount;

  /// No description provided for @tabAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get tabAll;

  /// No description provided for @tabUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get tabUnread;

  /// No description provided for @tabArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get tabArchived;

  /// No description provided for @noArchivedItems.
  ///
  /// In en, this message translates to:
  /// **'No archived items'**
  String get noArchivedItems;

  /// No description provided for @traitRiskTolerance.
  ///
  /// In en, this message translates to:
  /// **'Risk Tolerance'**
  String get traitRiskTolerance;

  /// No description provided for @budgetWhyMatters.
  ///
  /// In en, this message translates to:
  /// **'Budget helps the AI weigh financial trade-offs in your recommendation.'**
  String get budgetWhyMatters;

  /// No description provided for @timeWhyMatters.
  ///
  /// In en, this message translates to:
  /// **'Time availability shapes how ambitious your action plan should be.'**
  String get timeWhyMatters;

  /// No description provided for @experienceWhyMatters.
  ///
  /// In en, this message translates to:
  /// **'Experience level helps the AI calibrate advice to your background.'**
  String get experienceWhyMatters;

  /// No description provided for @riskWhyMatters.
  ///
  /// In en, this message translates to:
  /// **'Risk tolerance determines how conservative or bold your recommendation will be.'**
  String get riskWhyMatters;

  /// No description provided for @urgencyWhyMatters.
  ///
  /// In en, this message translates to:
  /// **'Urgency affects how quickly you should act on the recommendation.'**
  String get urgencyWhyMatters;

  /// No description provided for @confidenceReliableRecommend.
  ///
  /// In en, this message translates to:
  /// **'Generally reliable recommendation'**
  String get confidenceReliableRecommend;

  /// No description provided for @confidenceReliableSomeRisks.
  ///
  /// In en, this message translates to:
  /// **'Generally reliable with some risks'**
  String get confidenceReliableSomeRisks;

  /// No description provided for @confidenceConsiderRisks.
  ///
  /// In en, this message translates to:
  /// **'Consider risks carefully'**
  String get confidenceConsiderRisks;

  /// No description provided for @confidenceHighUncertainty.
  ///
  /// In en, this message translates to:
  /// **'High uncertainty — proceed cautiously'**
  String get confidenceHighUncertainty;

  /// No description provided for @stepResults.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get stepResults;

  /// No description provided for @urgencyNoRush.
  ///
  /// In en, this message translates to:
  /// **'No Rush'**
  String get urgencyNoRush;

  /// No description provided for @urgencyModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get urgencyModerate;

  /// No description provided for @urgencyUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get urgencyUrgent;

  /// No description provided for @urgencyCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get urgencyCritical;

  /// No description provided for @experienceBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get experienceBeginner;

  /// No description provided for @experienceIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get experienceIntermediate;

  /// No description provided for @experienceAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get experienceAdvanced;

  /// No description provided for @experienceExpert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get experienceExpert;

  /// No description provided for @timeVeryLimited.
  ///
  /// In en, this message translates to:
  /// **'Very Limited'**
  String get timeVeryLimited;

  /// No description provided for @timeLimited.
  ///
  /// In en, this message translates to:
  /// **'Limited'**
  String get timeLimited;

  /// No description provided for @timeModerateAvail.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get timeModerateAvail;

  /// No description provided for @timeHighAvail.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get timeHighAvail;

  /// No description provided for @timeVeryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very High'**
  String get timeVeryHigh;

  /// No description provided for @riskToleranceLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get riskToleranceLow;

  /// No description provided for @riskToleranceModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get riskToleranceModerate;

  /// No description provided for @riskToleranceHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get riskToleranceHigh;

  /// No description provided for @riskToleranceVeryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very High'**
  String get riskToleranceVeryHigh;

  /// No description provided for @doNow.
  ///
  /// In en, this message translates to:
  /// **'Do now'**
  String get doNow;

  /// No description provided for @doToday.
  ///
  /// In en, this message translates to:
  /// **'Do today'**
  String get doToday;

  /// No description provided for @scheduleLabel.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get scheduleLabel;

  /// No description provided for @deleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteLabel;

  /// No description provided for @tipLabel.
  ///
  /// In en, this message translates to:
  /// **'Tip'**
  String get tipLabel;

  /// No description provided for @aiRecommendation.
  ///
  /// In en, this message translates to:
  /// **'AI Recommendation'**
  String get aiRecommendation;

  /// No description provided for @comparisonMenu.
  ///
  /// In en, this message translates to:
  /// **'Comparison'**
  String get comparisonMenu;

  /// No description provided for @clientSelectionVerdictBody.
  ///
  /// In en, this message translates to:
  /// **'Acme is the strongest fit — say yes. Mystery Client: politely decline; vague briefs predict scope creep.'**
  String get clientSelectionVerdictBody;

  /// No description provided for @freelancePricingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI-powered rate recommendations'**
  String get freelancePricingSubtitle;

  /// No description provided for @priceLower.
  ///
  /// In en, this message translates to:
  /// **'Lower'**
  String get priceLower;

  /// No description provided for @priceRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get priceRecommended;

  /// No description provided for @priceHigher.
  ///
  /// In en, this message translates to:
  /// **'Higher'**
  String get priceHigher;

  /// No description provided for @freelancePricingRecommendationBody.
  ///
  /// In en, this message translates to:
  /// **'Price at \$2,800 to win this client at a healthy margin. If they push back, anchor on scope rather than dropping price.'**
  String get freelancePricingRecommendationBody;

  /// No description provided for @productivitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI sorts what to do now, what to schedule, and what to drop.'**
  String get productivitySubtitle;

  /// No description provided for @productivityTipBody.
  ///
  /// In en, this message translates to:
  /// **'If everything is urgent, nothing is. Pick 1–2 do-now items and protect them like meetings.'**
  String get productivityTipBody;

  /// No description provided for @careerAdvisorDescription.
  ///
  /// In en, this message translates to:
  /// **'Strong fit based on your skills, communication style, and growth interest.'**
  String get careerAdvisorDescription;

  /// No description provided for @nextSteps.
  ///
  /// In en, this message translates to:
  /// **'Next steps'**
  String get nextSteps;

  /// No description provided for @careerAdvisorNextStepsBody.
  ///
  /// In en, this message translates to:
  /// **'Lead a small cross-functional initiative this quarter to build PM-style track record.'**
  String get careerAdvisorNextStepsBody;

  /// No description provided for @excellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get excellent;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @businessIdeaHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., A subscription box for indoor plants with AI care reminders'**
  String get businessIdeaHint;

  /// No description provided for @marketSize.
  ///
  /// In en, this message translates to:
  /// **'Market Size'**
  String get marketSize;

  /// No description provided for @competition.
  ///
  /// In en, this message translates to:
  /// **'Competition'**
  String get competition;

  /// No description provided for @profitability.
  ///
  /// In en, this message translates to:
  /// **'Profitability'**
  String get profitability;

  /// No description provided for @executionEase.
  ///
  /// In en, this message translates to:
  /// **'Execution Ease'**
  String get executionEase;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @businessIdeaVerdictBody.
  ///
  /// In en, this message translates to:
  /// **'Strong concept with a clear audience. Focus the first 90 days on landing 20 paying customers before scaling marketing.'**
  String get businessIdeaVerdictBody;

  /// No description provided for @generateFullPlan.
  ///
  /// In en, this message translates to:
  /// **'Generate Full Plan'**
  String get generateFullPlan;

  /// No description provided for @financialCalcSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See what your money grows to over time.'**
  String get financialCalcSubtitle;

  /// No description provided for @financialInitialAmount.
  ///
  /// In en, this message translates to:
  /// **'Initial Amount (\$)'**
  String get financialInitialAmount;

  /// No description provided for @financialAnnualRate.
  ///
  /// In en, this message translates to:
  /// **'Annual Rate (%)'**
  String get financialAnnualRate;

  /// No description provided for @financialDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration (years)'**
  String get financialDuration;

  /// No description provided for @financialCalcTipBody.
  ///
  /// In en, this message translates to:
  /// **'Even small monthly contributions beat large one-off deposits over a 10+ year horizon.'**
  String get financialCalcTipBody;

  /// No description provided for @saveDecisionNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Anything you want to remember about this decision'**
  String get saveDecisionNotesHint;

  /// No description provided for @reportExportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Save or share your decision report'**
  String get reportExportSubtitle;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @goAhead.
  ///
  /// In en, this message translates to:
  /// **'Go Ahead'**
  String get goAhead;

  /// No description provided for @includeInReport.
  ///
  /// In en, this message translates to:
  /// **'Include in Report'**
  String get includeInReport;

  /// No description provided for @executiveSummary.
  ///
  /// In en, this message translates to:
  /// **'Executive Summary'**
  String get executiveSummary;

  /// No description provided for @analysisDetails.
  ///
  /// In en, this message translates to:
  /// **'Analysis Details'**
  String get analysisDetails;

  /// No description provided for @notesAndInputs.
  ///
  /// In en, this message translates to:
  /// **'Notes & Inputs'**
  String get notesAndInputs;

  /// No description provided for @exportFormat.
  ///
  /// In en, this message translates to:
  /// **'Export Format'**
  String get exportFormat;

  /// No description provided for @pdfBestForSharing.
  ///
  /// In en, this message translates to:
  /// **'Best for sharing'**
  String get pdfBestForSharing;

  /// No description provided for @excelDataScores.
  ///
  /// In en, this message translates to:
  /// **'Data & Scores'**
  String get excelDataScores;

  /// No description provided for @wordDocument.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get wordDocument;

  /// No description provided for @imageJpgPng.
  ///
  /// In en, this message translates to:
  /// **'JPG / PNG'**
  String get imageJpgPng;

  /// No description provided for @shareOrSave.
  ///
  /// In en, this message translates to:
  /// **'Share or Save'**
  String get shareOrSave;

  /// No description provided for @shareLink.
  ///
  /// In en, this message translates to:
  /// **'Share Link'**
  String get shareLink;

  /// No description provided for @createShareableLink.
  ///
  /// In en, this message translates to:
  /// **'Create a shareable link'**
  String get createShareableLink;

  /// No description provided for @emailReport.
  ///
  /// In en, this message translates to:
  /// **'Email Report'**
  String get emailReport;

  /// No description provided for @sendViaEmail.
  ///
  /// In en, this message translates to:
  /// **'Send via email'**
  String get sendViaEmail;

  /// No description provided for @saveToDevice.
  ///
  /// In en, this message translates to:
  /// **'Save to Device'**
  String get saveToDevice;

  /// No description provided for @downloadToDevice.
  ///
  /// In en, this message translates to:
  /// **'Download to device'**
  String get downloadToDevice;

  /// No description provided for @scheduleAutoReports.
  ///
  /// In en, this message translates to:
  /// **'Schedule Auto Reports'**
  String get scheduleAutoReports;

  /// No description provided for @exportedAs.
  ///
  /// In en, this message translates to:
  /// **'Exported as {format}'**
  String exportedAs(String format);

  /// No description provided for @subscriptionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Make smarter decisions with the right plan for you'**
  String get subscriptionSubtitle;

  /// No description provided for @makeSmarterDecisions.
  ///
  /// In en, this message translates to:
  /// **'Make Smarter Decisions'**
  String get makeSmarterDecisions;

  /// No description provided for @subscriptionHeroBody.
  ///
  /// In en, this message translates to:
  /// **'Unlock unlimited AI analysis, deep insights, and personalized recommendations.'**
  String get subscriptionHeroBody;

  /// No description provided for @planBasic.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get planBasic;

  /// No description provided for @planPremium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get planPremium;

  /// No description provided for @planPro.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get planPro;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get perMonth;

  /// No description provided for @allPlansInclude.
  ///
  /// In en, this message translates to:
  /// **'All Plans Include'**
  String get allPlansInclude;

  /// No description provided for @moneyBackGuarantee.
  ///
  /// In en, this message translates to:
  /// **'7-Day Money-Back Guarantee'**
  String get moneyBackGuarantee;

  /// No description provided for @moneyBackGuaranteeBody.
  ///
  /// In en, this message translates to:
  /// **'Not satisfied? Get a full refund within 7 days.'**
  String get moneyBackGuaranteeBody;

  /// No description provided for @subscribeTermsNote.
  ///
  /// In en, this message translates to:
  /// **'By subscribing you agree to our Terms and Privacy Policy.'**
  String get subscribeTermsNote;

  /// No description provided for @securePaymentEncryption.
  ///
  /// In en, this message translates to:
  /// **'Secure payment with industry-standard encryption'**
  String get securePaymentEncryption;

  /// No description provided for @paymentLeading.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentLeading;

  /// No description provided for @paymentAccent.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get paymentAccent;

  /// No description provided for @premiumMonthly.
  ///
  /// In en, this message translates to:
  /// **'Premium • Monthly'**
  String get premiumMonthly;

  /// No description provided for @taxEstimate.
  ///
  /// In en, this message translates to:
  /// **'Tax estimate'**
  String get taxEstimate;

  /// No description provided for @totalToday.
  ///
  /// In en, this message translates to:
  /// **'Total today'**
  String get totalToday;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @paymentCard.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get paymentCard;

  /// No description provided for @paymentPayPal.
  ///
  /// In en, this message translates to:
  /// **'PayPal'**
  String get paymentPayPal;

  /// No description provided for @paymentGooglePay.
  ///
  /// In en, this message translates to:
  /// **'Google Pay'**
  String get paymentGooglePay;

  /// No description provided for @paymentApplePay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get paymentApplePay;

  /// No description provided for @cardExpiryHint.
  ///
  /// In en, this message translates to:
  /// **'MM/YY'**
  String get cardExpiryHint;

  /// No description provided for @cardCvvHint.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cardCvvHint;

  /// No description provided for @encryptedPaymentFooter.
  ///
  /// In en, this message translates to:
  /// **'Encrypted end-to-end. We never store your card.'**
  String get encryptedPaymentFooter;

  /// No description provided for @premiumFeaturesLeading.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumFeaturesLeading;

  /// No description provided for @premiumFeaturesAccent.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get premiumFeaturesAccent;

  /// No description provided for @premiumUnlockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock the full power of Life Coach'**
  String get premiumUnlockSubtitle;

  /// No description provided for @premiumFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'Unlimited AI Analysis'**
  String get premiumFeature1Title;

  /// No description provided for @premiumFeature1Body.
  ///
  /// In en, this message translates to:
  /// **'Run as many decisions as you need.'**
  String get premiumFeature1Body;

  /// No description provided for @premiumFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'Deep Insights'**
  String get premiumFeature2Title;

  /// No description provided for @premiumFeature2Body.
  ///
  /// In en, this message translates to:
  /// **'Risk, confidence, outcome and impact charts.'**
  String get premiumFeature2Body;

  /// No description provided for @premiumFeature3Title.
  ///
  /// In en, this message translates to:
  /// **'Compare Decisions'**
  String get premiumFeature3Title;

  /// No description provided for @premiumFeature3Body.
  ///
  /// In en, this message translates to:
  /// **'See decisions side-by-side.'**
  String get premiumFeature3Body;

  /// No description provided for @premiumFeature4Title.
  ///
  /// In en, this message translates to:
  /// **'Export Reports'**
  String get premiumFeature4Title;

  /// No description provided for @premiumFeature4Body.
  ///
  /// In en, this message translates to:
  /// **'PDF, Word, Excel and image exports.'**
  String get premiumFeature4Body;

  /// No description provided for @premiumFeature5Title.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync'**
  String get premiumFeature5Title;

  /// No description provided for @premiumFeature5Body.
  ///
  /// In en, this message translates to:
  /// **'Securely backed up to the cloud.'**
  String get premiumFeature5Body;

  /// No description provided for @premiumFeature6Title.
  ///
  /// In en, this message translates to:
  /// **'Priority Support'**
  String get premiumFeature6Title;

  /// No description provided for @premiumFeature6Body.
  ///
  /// In en, this message translates to:
  /// **'Reply within 24 hours.'**
  String get premiumFeature6Body;

  /// No description provided for @paymentSuccessLeading.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentSuccessLeading;

  /// No description provided for @paymentSuccessAccent.
  ///
  /// In en, this message translates to:
  /// **'Successful!'**
  String get paymentSuccessAccent;

  /// No description provided for @youNowHaveAccessTo.
  ///
  /// In en, this message translates to:
  /// **'You Now Have Access To'**
  String get youNowHaveAccessTo;

  /// No description provided for @planLabel.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get planLabel;

  /// No description provided for @amountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// No description provided for @methodLabel.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get methodLabel;

  /// No description provided for @transactionIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get transactionIdLabel;

  /// No description provided for @unlimitedAi.
  ///
  /// In en, this message translates to:
  /// **'Unlimited AI'**
  String get unlimitedAi;

  /// No description provided for @deepInsightsShort.
  ///
  /// In en, this message translates to:
  /// **'Deep Insights'**
  String get deepInsightsShort;

  /// No description provided for @compareShort.
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get compareShort;

  /// No description provided for @exportsShort.
  ///
  /// In en, this message translates to:
  /// **'Exports'**
  String get exportsShort;

  /// No description provided for @cloudSyncShort.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync'**
  String get cloudSyncShort;

  /// No description provided for @prioritySupportShort.
  ///
  /// In en, this message translates to:
  /// **'Priority Support'**
  String get prioritySupportShort;

  /// No description provided for @privacyLeading.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyLeading;

  /// No description provided for @privacyAccent.
  ///
  /// In en, this message translates to:
  /// **'Policy'**
  String get privacyAccent;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: May 18, 2026'**
  String get privacyLastUpdated;

  /// No description provided for @privacySection1Title.
  ///
  /// In en, this message translates to:
  /// **'What we collect'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Body.
  ///
  /// In en, this message translates to:
  /// **'We collect only what you give us — the decisions you save, your account details (name + email), and your preferences. Everything else stays on your device.'**
  String get privacySection1Body;

  /// No description provided for @privacySection2Title.
  ///
  /// In en, this message translates to:
  /// **'How we use it'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Body.
  ///
  /// In en, this message translates to:
  /// **'To personalize AI recommendations, sync your data if you choose, and improve the app. We never sell your data to third parties.'**
  String get privacySection2Body;

  /// No description provided for @privacySection3Title.
  ///
  /// In en, this message translates to:
  /// **'Local-first storage'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Body.
  ///
  /// In en, this message translates to:
  /// **'Your decisions are stored on your device by default. Cloud sync is opt-in and encrypted in transit and at rest.'**
  String get privacySection3Body;

  /// No description provided for @privacySection4Title.
  ///
  /// In en, this message translates to:
  /// **'Your rights'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Body.
  ///
  /// In en, this message translates to:
  /// **'You can export or delete all your data at any time from Settings. We respond to data requests within 7 days.'**
  String get privacySection4Body;

  /// No description provided for @privacySection5Title.
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Body.
  ///
  /// In en, this message translates to:
  /// **'Life Coach is not intended for children under 13. We do not knowingly collect data from children.'**
  String get privacySection5Body;

  /// No description provided for @privacySection6Title.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Body.
  ///
  /// In en, this message translates to:
  /// **'Questions or concerns? Email privacy@lifecoach.app and we will get back to you within two business days.'**
  String get privacySection6Body;

  /// No description provided for @termsLeading.
  ///
  /// In en, this message translates to:
  /// **'Terms of'**
  String get termsLeading;

  /// No description provided for @termsAccent.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get termsAccent;

  /// No description provided for @termsLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: May 18, 2026'**
  String get termsLastUpdated;

  /// No description provided for @termsSection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance'**
  String get termsSection1Title;

  /// No description provided for @termsSection1Body.
  ///
  /// In en, this message translates to:
  /// **'By using Life Coach you agree to these Terms. If you do not agree, please do not use the app.'**
  String get termsSection1Body;

  /// No description provided for @termsSection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Account'**
  String get termsSection2Title;

  /// No description provided for @termsSection2Body.
  ///
  /// In en, this message translates to:
  /// **'You are responsible for keeping your account secure. Do not share your credentials.'**
  String get termsSection2Body;

  /// No description provided for @termsSection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. AI recommendations'**
  String get termsSection3Title;

  /// No description provided for @termsSection3Body.
  ///
  /// In en, this message translates to:
  /// **'AI outputs are guidance, not professional advice. You are responsible for decisions you make based on them.'**
  String get termsSection3Body;

  /// No description provided for @termsSection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Subscriptions'**
  String get termsSection4Title;

  /// No description provided for @termsSection4Body.
  ///
  /// In en, this message translates to:
  /// **'Premium plans auto-renew until cancelled. You may cancel anytime from your store account.'**
  String get termsSection4Body;

  /// No description provided for @termsSection5Title.
  ///
  /// In en, this message translates to:
  /// **'5. Acceptable use'**
  String get termsSection5Title;

  /// No description provided for @termsSection5Body.
  ///
  /// In en, this message translates to:
  /// **'No abusive content, no reverse-engineering, no scraping. Violations may result in account suspension.'**
  String get termsSection5Body;

  /// No description provided for @termsSection6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Limitation of liability'**
  String get termsSection6Title;

  /// No description provided for @termsSection6Body.
  ///
  /// In en, this message translates to:
  /// **'To the maximum extent allowed by law, our liability is limited to the amount you paid us in the prior 12 months.'**
  String get termsSection6Body;

  /// No description provided for @termsSection7Title.
  ///
  /// In en, this message translates to:
  /// **'7. Changes'**
  String get termsSection7Title;

  /// No description provided for @termsSection7Body.
  ///
  /// In en, this message translates to:
  /// **'We may update these Terms. We will notify you of material changes via in-app notice or email.'**
  String get termsSection7Body;

  /// No description provided for @faqQ1.
  ///
  /// In en, this message translates to:
  /// **'How do I start a new decision?'**
  String get faqQ1;

  /// No description provided for @faqA1.
  ///
  /// In en, this message translates to:
  /// **'Tap the \"Start New Analysis\" card on the Home screen, give your decision a title, and follow the guided steps.'**
  String get faqA1;

  /// No description provided for @faqQ2.
  ///
  /// In en, this message translates to:
  /// **'Is my data private?'**
  String get faqQ2;

  /// No description provided for @faqA2.
  ///
  /// In en, this message translates to:
  /// **'Yes. Decisions are stored locally on your device by default. Cloud sync is opt-in and encrypted.'**
  String get faqA2;

  /// No description provided for @faqQ3.
  ///
  /// In en, this message translates to:
  /// **'How accurate is the AI?'**
  String get faqQ3;

  /// No description provided for @faqA3.
  ///
  /// In en, this message translates to:
  /// **'The AI provides structured guidance, not professional advice. Use it as a thinking aid alongside your own judgment.'**
  String get faqA3;

  /// No description provided for @faqQ4.
  ///
  /// In en, this message translates to:
  /// **'Can the AI access my conversations?'**
  String get faqQ4;

  /// No description provided for @faqA4.
  ///
  /// In en, this message translates to:
  /// **'No. Only the inputs you submit in the decision flow are used. Nothing else from your device is read.'**
  String get faqA4;

  /// No description provided for @faqQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I cancel my subscription?'**
  String get faqQ5;

  /// No description provided for @faqA5.
  ///
  /// In en, this message translates to:
  /// **'Cancel anytime from the App Store / Google Play subscription page. Access continues until the period ends.'**
  String get faqA5;

  /// No description provided for @faqQ6.
  ///
  /// In en, this message translates to:
  /// **'Do you offer refunds?'**
  String get faqQ6;

  /// No description provided for @faqA6.
  ///
  /// In en, this message translates to:
  /// **'Yes — within 7 days of your first purchase. Email support@lifecoach.app.'**
  String get faqA6;

  /// No description provided for @faqQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I delete my account?'**
  String get faqQ7;

  /// No description provided for @faqA7.
  ///
  /// In en, this message translates to:
  /// **'Settings → Account → Delete Account. All your data is removed within 30 days.'**
  String get faqA7;

  /// No description provided for @faqQ8.
  ///
  /// In en, this message translates to:
  /// **'Can I export my decisions?'**
  String get faqQ8;

  /// No description provided for @faqA8.
  ///
  /// In en, this message translates to:
  /// **'Yes. Open any saved decision and tap Export Report to download as PDF, Word, Excel or image.'**
  String get faqA8;

  /// No description provided for @notificationsLeading.
  ///
  /// In en, this message translates to:
  /// **'Notifi'**
  String get notificationsLeading;

  /// No description provided for @notificationsAccent.
  ///
  /// In en, this message translates to:
  /// **'cations'**
  String get notificationsAccent;

  /// No description provided for @decisionTextRiskFallback.
  ///
  /// In en, this message translates to:
  /// **'Run a full analysis to get tailored risk-reduction tips.'**
  String get decisionTextRiskFallback;

  /// No description provided for @decisionTextRiskInterpretation.
  ///
  /// In en, this message translates to:
  /// **'Your overall risk level is {label} ({score}%). Review the breakdown below to understand what drives this score.'**
  String decisionTextRiskInterpretation(String label, int score);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bn',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'it',
        'ja',
        'ko',
        'pt',
        'ru',
        'tr',
        'ur',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
