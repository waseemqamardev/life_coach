// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Life Coach';

  @override
  String get navHome => 'Home';

  @override
  String get navChatbot => 'AI Chatbot';

  @override
  String get navInsights => 'Insights';

  @override
  String get navHistory => 'History';

  @override
  String get continueButton => 'Continue';

  @override
  String get nextButton => 'Next';

  @override
  String get backButton => 'Back';

  @override
  String get saveButton => 'Save';

  @override
  String get analyzeButton => 'Analyze';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get viewAll => 'View All';

  @override
  String get searchHint => 'Search...';

  @override
  String get selectLanguage => 'Select';

  @override
  String get languageWord => 'Language';

  @override
  String get searchLanguageHint => 'Search Language here...';

  @override
  String get noLanguagesFound => 'No languages found';

  @override
  String get settings => 'Settings';

  @override
  String get accountSettings => 'Account Setting';

  @override
  String get languages => 'Languages';

  @override
  String get theme => 'Theme';

  @override
  String get notifications => 'Notifications';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get helpSupport => 'Help & Support';

  @override
  String get logout => 'Logout';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get signUp => 'Sign Up';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get rememberMe => 'Remember me';

  @override
  String goodMorning(String name) {
    return 'Good morning, $name 👋';
  }

  @override
  String get homeSubtitle =>
      'Get AI-powered guidance for your next important decision.';

  @override
  String get startNewAnalysis => 'Start New Analysis';

  @override
  String get startAnalysisSubtitle =>
      'Start a guided analysis and receive a personalized recommendation.';

  @override
  String get decisionOverview => 'Decision Overview';

  @override
  String get riskScore => 'Risk Score';

  @override
  String get successChance => 'Success Chance';

  @override
  String get activePlans => 'Active Plans';

  @override
  String get inProgress => 'In Progress';

  @override
  String get recentInsights => 'Recent Insights';

  @override
  String get stepDefine => 'Define';

  @override
  String get stepAnalyze => 'Analyze';

  @override
  String get stepQuestions => 'Questions';

  @override
  String get stepResult => 'Result';

  @override
  String get defineYourProblem => 'Define Your';

  @override
  String get problemWord => 'Problem';

  @override
  String get tellUsMore => 'Tell us more about your decision';

  @override
  String get wizardHint =>
      'The more details you provide, the better our AI can analyze & guide you.';

  @override
  String get describeDecision => 'Describe Your Decision';

  @override
  String get quickTips => 'Quick Tips';

  @override
  String get beSpecific => 'Be Specific';

  @override
  String get includeContext => 'Include Context';

  @override
  String get mentionGoal => 'Mention Goal';

  @override
  String get choosingBetween => 'What are you choosing between?';

  @override
  String get optionsHint =>
      'List up to 5 options. The AI will weigh each against your goals.';

  @override
  String get addAnotherOption => 'Add Another Option';

  @override
  String get continueToAnalysis => 'Continue To Analysis';

  @override
  String get aiQuestionsTitle => 'AI';

  @override
  String get questionsWord => 'Questions';

  @override
  String get preparingQuestions => 'Preparing personalized questions…';

  @override
  String basedOnDecision(String title) {
    return 'Based on your decision: $title';
  }

  @override
  String get basedOnWizard => 'Based on what you shared in the wizard';

  @override
  String get aiNavigator => 'Life Coach';

  @override
  String get aiQuestionsHint =>
      'Answer honestly — your responses shape the AI analysis.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'AI generated these questions specifically for \"$title\".';
  }

  @override
  String questionOf(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get whyThisMatters => 'Why this matters?';

  @override
  String get whyQuestionsMatter =>
      'Your answers help the AI focus on what is most relevant to your situation.';

  @override
  String get securePrivate => 'Your data is secure & private';

  @override
  String get processingAnalyzing => 'Analyzing your options...';

  @override
  String get processingRisk => 'Calculating risk factors...';

  @override
  String get processingOutcomes => 'Predicting outcomes...';

  @override
  String get processingPlan => 'Building action plan...';

  @override
  String get processingFinalizing => 'Finalizing Result';

  @override
  String get decisionResult => 'Decision';

  @override
  String get resultWord => 'Result';

  @override
  String get recommendedChoice => 'Recommended Choice';

  @override
  String get benefitScore => 'Benefit Score';

  @override
  String get confidence => 'Confidence';

  @override
  String get fitScore => 'Fit Score';

  @override
  String get resultBreakdown => 'Result Breakdown';

  @override
  String get finalRecommendation => 'Final Recommendation';

  @override
  String get outcomePrediction => 'Outcome Prediction';

  @override
  String get confidenceMeter => 'Confidence Meter';

  @override
  String get actionPlan => 'Action Plan';

  @override
  String get prosCons => 'Pros & Cons';

  @override
  String get tipFromAi => 'Tip from AI';

  @override
  String get saveReport => 'Save Report';

  @override
  String get startNewDecision => 'Start New Decision';

  @override
  String get decisionWord => 'Decision';

  @override
  String get comparisonWord => 'Comparison';

  @override
  String get whyRecommended => 'Why This Is Recommended?';

  @override
  String get riskBreakdown => 'Risk Breakdown';

  @override
  String get riskInterpretation => 'Risk Interpretation';

  @override
  String get howToImprove => 'How To Improve';

  @override
  String get overallConfidence => 'Overall Confidence';

  @override
  String get confidenceBreakdown => 'Confidence Breakdown';

  @override
  String get successLikelihood => 'Success Likelihood';

  @override
  String get outcomeBreakdown => 'Outcome Breakdown';

  @override
  String get keyOutcomeFactors => 'Key Outcome Factors';

  @override
  String get prosTitle => 'Pros Of This Decision';

  @override
  String get consTitle => 'Cons Of This Decision';

  @override
  String get overallProsCons => 'Overall Pros & Cons';

  @override
  String get bestOverallFit => 'Best overall fit';

  @override
  String get bestOverallChoice => 'Best overall choice';

  @override
  String get recommendedChoiceLabel => 'Recommended choice';

  @override
  String get yourActionPlan => 'Your Action Plan';

  @override
  String get aiInsight => 'AI Insight';

  @override
  String get keyComparison => 'Key Comparison';

  @override
  String get overallScore => 'Overall Score';

  @override
  String get keyPoints => 'Key Points';

  @override
  String get analysisFailed =>
      'Analysis failed. Check your internet and API key.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY is missing. Add it to .env and restart the app.';

  @override
  String get noDescription => 'No description provided.';

  @override
  String get history => 'History';

  @override
  String get about => 'About';

  @override
  String get profile => 'Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get lowRisk => 'Low Risk';

  @override
  String get mediumRisk => 'Medium Risk';

  @override
  String get highRisk => 'High Risk';

  @override
  String get notAssessed => 'Not assessed';

  @override
  String get couldNotLoadQuestions => 'Could not load questions';

  @override
  String get noQuestionsGenerated => 'No questions were generated.';

  @override
  String get onboardingTitle1 => 'Make smarter decisions with AI';

  @override
  String get onboardingSubtitle1 =>
      'Get personalized guidance for life\'s important choices.';

  @override
  String get onboardingTitle2 => 'Analyze risks and outcomes';

  @override
  String get onboardingSubtitle2 => 'Understand trade-offs before you commit.';

  @override
  String get onboardingTitle3 => 'Follow a clear action plan';

  @override
  String get onboardingSubtitle3 => 'Turn insights into practical next steps.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get skip => 'Skip';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get systemDefault => 'System Default';

  @override
  String get generalSettings => 'General Settings';

  @override
  String get support => 'Support';

  @override
  String get legal => 'Legal';

  @override
  String get languageChanged => 'Language updated';

  @override
  String get yourOptions => 'Your options';

  @override
  String get recommended => 'Recommended';

  @override
  String get compareOptions => 'Compare options';

  @override
  String get plan => 'Plan';

  @override
  String get prepare => 'Prepare';

  @override
  String get execute => 'Execute';

  @override
  String get positiveOutcome => 'Positive Outcome';

  @override
  String get neutralOutcome => 'Neutral Outcome';

  @override
  String get negativeOutcome => 'Negative Outcome';

  @override
  String get overallRiskScore => 'Overall Risk Score';

  @override
  String get yourDecisionRiskLevel => 'Your decision risk level';

  @override
  String get overallPrediction => 'Overall Prediction';

  @override
  String get overallProsConsTitle => 'Overall Pros & Cons';

  @override
  String get emptyHistory => 'No saved decisions yet';

  @override
  String get startFirstDecision => 'Start your first decision analysis';

  @override
  String get chatbotTitle => 'AI Chatbot';

  @override
  String get insightsTitle => 'Insights';

  @override
  String get dailySuggestion => 'Daily Suggestion';

  @override
  String get aboutTagline =>
      'Smart decision support powered by AI — weigh options, risks, and next steps.';

  @override
  String get aboutBody =>
      'Life Coach helps you set goals, build habits, and make smarter decisions with AI-powered planning and clear action steps. By analyzing your problems, preferences, and goals, the app constructs custom advice, detailed outcome predictions, risk scores, and pros-and-cons sheets. Our mission is to guide you step-by-step through life\'s most complex challenges, providing clarity, confidence, and structure whenever you need to make critical choices.';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get appSetting => 'App Setting';

  @override
  String get securityPrivacy => 'Security & Privacy';

  @override
  String get aboutUs => 'About Us';

  @override
  String get howToUse => 'How To Use';

  @override
  String get appTheme => 'App Theme';

  @override
  String get shareApp => 'Share';

  @override
  String get rateUs => 'Rate Us';

  @override
  String get pleaseAddOption => 'Please add at least one option';

  @override
  String get noReportToSave => 'No decision report to save.';

  @override
  String get reportSaved => 'Report saved to History.';

  @override
  String get pendingAnalysis => 'Pending analysis';

  @override
  String get untitledDecision => 'Untitled decision';

  @override
  String get describeDecisionHint =>
      'Describe your situation, constraints, and what success looks like.';

  @override
  String optionLabel(String letter) {
    return 'Option $letter';
  }

  @override
  String get goodChance => 'Good Chance';

  @override
  String get fairChance => 'Fair Chance';

  @override
  String get poorChance => 'Poor Chance';

  @override
  String get couldNotPrepareQuestions =>
      'Could not prepare questions. Please try again.';

  @override
  String get greetingFallbackName => 'there';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get welcome => 'Welcome!';

  @override
  String get orContinueWith => 'or continue with';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'Life';

  @override
  String get navigator => 'Coach';

  @override
  String get authTagline => 'AI Goal Planner';

  @override
  String get chatbotReadySubtitle => 'Ready to navigate your life';

  @override
  String get chatbotInputHint => 'Start your chat here...';

  @override
  String get chatbotErrorMessage =>
      'Sorry, I could not reach the AI service. Please check your connection and try again.';

  @override
  String get selectAll => 'Select all';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => 'Select decisions to delete.';

  @override
  String get total => 'Total';

  @override
  String get highScore => 'High Score';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int count) {
    return '$count min ago';
  }

  @override
  String hoursAgo(int count) {
    return '$count hour ago';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count hours ago';
  }

  @override
  String daysAgo(int count) {
    return '$count day ago';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count days ago';
  }

  @override
  String scoreLabel(int score) {
    return 'Score $score';
  }

  @override
  String get themeCustomizeSubtitle => 'Customize the look & feel of your app';

  @override
  String get lightModeSubtitle => 'Clean & bright experience';

  @override
  String get darkModeSubtitle => 'Easy on the eyes in low light';

  @override
  String get systemDefaultSubtitle => 'Use device theme preference';

  @override
  String get preview => 'Preview';

  @override
  String get applyTheme => 'Apply Theme';

  @override
  String get shareAppMessage => 'Share Life Coach with your friends.';

  @override
  String get rateAppThanks => 'Thanks for rating Life Coach!';

  @override
  String fieldRequired(String field) {
    return '$field is required';
  }

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Please enter a valid email';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get otpRequired => 'OTP is required';

  @override
  String otpInvalid(int length) {
    return 'Please enter a valid $length-digit code';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field must be at least $min characters';
  }

  @override
  String get fieldDescription => 'Description';

  @override
  String get fieldTitle => 'Title';

  @override
  String get fullName => 'Full Name';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get createAccount => 'Create Account';

  @override
  String get acceptTermsRequired =>
      'Please accept the Terms and Privacy Policy.';

  @override
  String get signupTitleLeading => 'Create Your';

  @override
  String get account => 'Account';

  @override
  String get signupSubtitle =>
      'Join Life Coach and plan your goals with AI every day.';

  @override
  String get iAgreeToThe => 'I agree to the';

  @override
  String get forgotPasswordLeading => 'Forgot';

  @override
  String get forgotPasswordAccent => 'Password?';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email and we\'ll send you a link to reset your password.';

  @override
  String get enterEmailHint => 'Enter your email address';

  @override
  String get forgotPasswordInfo =>
      'We will send a password reset link to your email address.';

  @override
  String get sendVerificationCode => 'Send Verification Code';

  @override
  String get sendPasswordResetLink => 'Send Reset Link';

  @override
  String get emailVerificationTitle => 'Verify Email';

  @override
  String get emailVerificationSubtitle =>
      'We sent a verification link to your email. Open it to activate your account.';

  @override
  String get emailVerificationSpamHint =>
      'Check your spam or junk folder if you do not see the email within a few minutes.';

  @override
  String get emailVerificationWaiting =>
      'Waiting for verification… we will check automatically.';

  @override
  String get emailVerificationResend => 'Resend verification email';

  @override
  String get emailVerificationResent => 'Verification email sent again.';

  @override
  String get authErrorWrongPassword =>
      'Incorrect email or password. Please try again.';

  @override
  String get authErrorEmailInUse =>
      'This email is already registered. Try logging in instead.';

  @override
  String get authErrorWeakPassword =>
      'Password is too weak. Use at least 6 characters.';

  @override
  String get authErrorUserNotFound => 'No account found with this email.';

  @override
  String get authErrorTooManyRequests =>
      'Too many attempts. Please wait and try again.';

  @override
  String get authErrorGeneric => 'Something went wrong. Please try again.';

  @override
  String get authErrorGoogleCancelled => 'Google sign-in was cancelled.';

  @override
  String get passwordResetEmailSent =>
      'Password reset email sent. Check your inbox.';

  @override
  String get changePassword => 'Change Password';

  @override
  String get changePasswordSubtitle =>
      'Enter your current password and choose a new one.';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountConfirm =>
      'This permanently deletes your account and cannot be undone.';

  @override
  String get deleteAccountSuccess =>
      'Also delete local decisions and chat stored on this device.';

  @override
  String get accountDeleted => 'Your account has been deleted.';

  @override
  String get rememberPassword => 'Remember your password?';

  @override
  String get passwordUpdatedLogin => 'Password updated. Please log in.';

  @override
  String get resetLeading => 'Reset';

  @override
  String get resetPasswordSubtitle => 'Create a new password for your account.';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get passwordHint =>
      'Use at least 6 characters with a mix you can remember.';

  @override
  String get updating => 'Updating...';

  @override
  String get updatePassword => 'Update Password';

  @override
  String get backTo => 'Back to';

  @override
  String newCodeSentTo(String email) {
    return 'New code sent to $email';
  }

  @override
  String get invalidVerificationCode =>
      'Invalid verification code. Please try again.';

  @override
  String otpResetSubtitle(String email) {
    return 'Enter the 6-digit reset code sent to $email';
  }

  @override
  String otpVerifySubtitle(String email) {
    return 'Enter the 6-digit verification code sent to $email';
  }

  @override
  String get verifyLeading => 'Verify';

  @override
  String get verifyEmailLeading => 'Verify Your';

  @override
  String get codeWord => 'Code';

  @override
  String get emailWord => 'Email';

  @override
  String resendCodeIn(int seconds) {
    return 'Resend code in ${seconds}s';
  }

  @override
  String get didntReceiveCode => 'Didn\'t receive the code?';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get verifying => 'Verifying...';

  @override
  String get verifyCode => 'Verify Code';

  @override
  String get verifyAndContinue => 'Verify & Continue';

  @override
  String get wrongEmail => 'Wrong email?';

  @override
  String get goBack => 'Go Back';

  @override
  String get logOut => 'Log Out';

  @override
  String get logoutConfirmMessage =>
      'Are you sure you want to logout this app?';

  @override
  String get logoutConfirmYes => 'Yes, Log Out';

  @override
  String get insightsHeroDescription =>
      'Daily suggestions and insights tailored to your decisions.';

  @override
  String recommendedPrefix(String text) {
    return 'Recommended: $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'Complete an analysis to see a personalized risk interpretation.';

  @override
  String get startDecisionQuestion => 'What decision do you want help with?';

  @override
  String get startDecisionSubtitle =>
      'Describe your decision and get AI-powered insights & recommendations.';

  @override
  String get decisionTitle => 'Decision Title';

  @override
  String get decisionTitleHint => 'e.g. Should I change careers?';

  @override
  String get decisionCategory => 'Decision Category';

  @override
  String get importanceLevel => 'Importance Level';

  @override
  String get impactMinor => 'Minor Impact';

  @override
  String get impactModerate => 'Moderate Impact';

  @override
  String get impactHigh => 'High Impact';

  @override
  String get categoryCareer => 'Career';

  @override
  String get categoryFinance => 'Finance';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryRelations => 'Relations';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryOther => 'Other';

  @override
  String get addYourOptionsLeading => 'Add Your';

  @override
  String get optionsWord => 'Options';

  @override
  String get describeOptionHint => 'Describe this option';

  @override
  String get goalSelection => 'Goal Selection';

  @override
  String get goalSelectionSubtitle =>
      'Select the options for your decision that matter most to you.';

  @override
  String get selectAtLeastOneGoal => 'Please select at least one goal';

  @override
  String get goalTipBody =>
      'You can always adjust your priorities later in your profile.';

  @override
  String get goalGrowth => 'Growth';

  @override
  String get goalFinancialGain => 'Financial Gain';

  @override
  String get goalRiskReduction => 'Risk Reduction';

  @override
  String get goalPersonalSatisfaction => 'Personal Satisfaction';

  @override
  String get goalTimeEfficiency => 'Time Efficiency';

  @override
  String get goalWorkLifeBalance => 'Work-Life Balance';

  @override
  String get goalStability => 'Stability';

  @override
  String get goalImpact => 'Impact';

  @override
  String get budgetInput => 'Budget Input';

  @override
  String get budgetSubtitle =>
      'Select your estimated budget for this decision.';

  @override
  String get budgetImpactLevel => 'Budget Impact Level';

  @override
  String get budgetLessThan5k => 'Less Than \$5K';

  @override
  String get enterYourBudget => 'Enter Your Budget';

  @override
  String get timeAvailability => 'Time Availability';

  @override
  String get timeAvailabilitySubtitle =>
      'Select your time availability for this decision.';

  @override
  String get experienceLevel => 'Experience Level';

  @override
  String get experienceSubtitle =>
      'This helps our AI understand your background and expertise.';

  @override
  String get riskTolerance => 'Risk Tolerance';

  @override
  String get riskToleranceSubtitle =>
      'Select your risk tolerance level for this decision.';

  @override
  String get timeUrgency => 'Time Urgency';

  @override
  String get urgencySubtitle => 'Select the urgency for your decision.';

  @override
  String get financialRisk => 'Financial Risk';

  @override
  String get marketRisk => 'Market Risk';

  @override
  String get timeRisk => 'Time Risk';

  @override
  String get executionRisk => 'Execution Risk';

  @override
  String get personalRisk => 'Personal Risk';

  @override
  String get overallFit => 'Overall Fit';

  @override
  String get firstOption => 'First option';

  @override
  String get secondOption => 'Second option';

  @override
  String get versus => 'Vs';

  @override
  String get confidenceInterpretation => 'Confidence Interpretation';

  @override
  String get financialImpact => 'Financial Impact';

  @override
  String get riskLevel => 'Risk Level';

  @override
  String get timeInvestment => 'Time Investment';

  @override
  String get longTermSustainability => 'Long Term Sustainability';

  @override
  String get personalGrowth => 'Personal Growth';

  @override
  String get outcomeConsistency => 'Outcome Consistency';

  @override
  String get riskAssessment => 'Risk Assessment';

  @override
  String get historicalSimilarity => 'Historical Similarity';

  @override
  String get relevanceMatch => 'Relevance Match';

  @override
  String get dataQuality => 'Data Quality';

  @override
  String get confidenceVeryHigh => 'Very High';

  @override
  String get confidenceModerate => 'Moderate';

  @override
  String get confidenceVeryLow => 'Very Low';

  @override
  String get onboardingAiPowered => 'AI Powered';

  @override
  String get onboardingSmartAnalysis => 'Smart analysis for better decisions';

  @override
  String get onboardingRiskAnalysis => 'Risk Analysis';

  @override
  String get onboardingActionablePlans => 'Actionable Plans';

  @override
  String get onboardingTrustedGuidance => 'Trusted Guidance';

  @override
  String get onboardingDefineGoalLeading => 'Define Your';

  @override
  String get goalWord => 'Goal';

  @override
  String get onboardingChooseJourney =>
      'Choose the life journey you want guidance on';

  @override
  String get onboardingCareerPath => 'Career Path';

  @override
  String get onboardingCareerPathDesc => 'Explore future markets & skills';

  @override
  String get onboardingMajorPurchase => 'Major Purchase';

  @override
  String get onboardingMajorPurchaseDesc =>
      'Compare options for a new purchase';

  @override
  String get onboardingLifeChanges => 'Life Changes';

  @override
  String get onboardingLifeChangesDesc => 'Plan a relocation or new phase';

  @override
  String get onboardingPersonalGrowth => 'Personal Growth';

  @override
  String get onboardingPersonalGrowthDesc => 'Identify skills & mindset shifts';

  @override
  String get onboardingReadyLeading => 'Ready To';

  @override
  String get navigateWord => 'Navigate';

  @override
  String get onboardingReadySubtitle =>
      'Your personalized assistant is ready to help';

  @override
  String get onboardingActionableGuidance => 'Actionable Guidance';

  @override
  String get onboardingActionableGuidanceDesc =>
      'Get guidance for your success';

  @override
  String get onboardingProgressTracking => 'Progress Tracking';

  @override
  String get onboardingProgressTrackingDesc =>
      'Monitor milestones on your journey';

  @override
  String get onboardingAdjustOnTheFly => 'Adjust On The Fly';

  @override
  String get onboardingAdjustDesc => 'Re-evaluate plans as life happens';

  @override
  String get onboardingShareLearn => 'Share & Learn';

  @override
  String get onboardingShareLearnDesc => 'Share and learn from your paths';

  @override
  String get myProfileLeading => 'My';

  @override
  String get preferences => 'Preferences';

  @override
  String get personalityPreferences => 'Personality Preferences';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get tapToChangePhoto => 'Tap here to change photo';

  @override
  String get photoPickerComingSoon => 'Photo picker coming soon.';

  @override
  String get pickImageSourceTitle => 'Change profile photo';

  @override
  String get pickFromCamera => 'Take photo';

  @override
  String get pickFromGallery => 'Choose from gallery';

  @override
  String get removePhoto => 'Remove photo';

  @override
  String get cameraPermissionDenied =>
      'Camera permission is required to take a photo.';

  @override
  String get galleryPermissionDenied =>
      'Photo library permission is required to choose a photo.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get savePreferences => 'Save Preferences';

  @override
  String get preferencesSaved => 'Preferences saved.';

  @override
  String get personalitySubtitle => 'Help AI understand you better';

  @override
  String get focusAreas => 'Focus Areas';

  @override
  String get emptyTitleLeading => 'Nothing';

  @override
  String get emptyTitleAccent => 'Here Yet';

  @override
  String get emptyQuietTitle => 'It\'s quiet in here';

  @override
  String get emptyHistoryHint =>
      'Start your first decision and your history will appear here.';

  @override
  String get startADecision => 'Start a Decision';

  @override
  String get helpHereToHelp => 'We\'re here to help';

  @override
  String get faq => 'FAQ';

  @override
  String get noResults => 'No results';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorSubtitle => 'We hit an unexpected error. Please try again.';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get noInternetTitle => 'No Connection';

  @override
  String get noInternetSubtitle =>
      'Please check your internet connection and try again.';

  @override
  String get retryConnection => 'Retry Connection';

  @override
  String get offlineMode => 'Go to Offline Mode';

  @override
  String get permissionTitle => 'App Permissions';

  @override
  String get permissionSubtitle => 'Grant permissions for the best experience.';

  @override
  String get grantAll => 'Grant All';

  @override
  String get notNow => 'Not Now';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get updateSubtitle => 'A new version is available with improvements.';

  @override
  String get updateNow => 'Update Now';

  @override
  String get remindLater => 'Remind Me Later';

  @override
  String get loadingMessage => 'Getting things ready...';

  @override
  String get decisionDetailLeading => 'Decision';

  @override
  String get detailWord => 'Detail';

  @override
  String get decisionNotFound => 'Decision not found';

  @override
  String get overall => 'Overall';

  @override
  String get pros => 'Pros';

  @override
  String get cons => 'Cons';

  @override
  String get notes => 'Notes';

  @override
  String get saveAtLeastTwoToCompare =>
      'Save at least two decisions to compare.';

  @override
  String get selectExactlyTwoToCompare =>
      'Select exactly 2 decisions to compare.';

  @override
  String get selectOneDecisionToCompare =>
      'Select one decision to compare its options.';

  @override
  String get decisionNeedsTwoOptionsToCompare =>
      'This decision needs at least 2 options to compare.';

  @override
  String get moderate => 'Moderate';

  @override
  String get veryHigh => 'Very High';

  @override
  String get veryLow => 'Very Low';

  @override
  String get next => 'Next';

  @override
  String get later => 'Later';

  @override
  String get useWord => 'Use';

  @override
  String get aboutUsLeading => 'About';

  @override
  String get aboutUsAccent => 'Us';

  @override
  String get howToUseLeading => 'How To';

  @override
  String get versionLabel => 'Version 1.0.0';

  @override
  String get dailyDecision => 'Daily Decision';

  @override
  String get personalityDescription =>
      'These settings personalize the tone and depth of recommendations.';

  @override
  String get traitOptimism => 'Optimism';

  @override
  String get traitPatience => 'Patience';

  @override
  String get traitDetailFocus => 'Detail Focus';

  @override
  String get categoryTravel => 'Travel';

  @override
  String get helpResponseTime => 'Average response time: under 24 hours';

  @override
  String get helpGetInTouch => 'Get in touch';

  @override
  String get helpLiveChat => 'Live Chat';

  @override
  String get helpLiveChatSub => 'Chat with our team in real time';

  @override
  String get helpCall => 'Call';

  @override
  String get helpCallSub => 'Mon–Fri 9am–5pm PT';

  @override
  String get helpSubmitTicket => 'Submit a Ticket';

  @override
  String get helpSubmitTicketSub => 'Get a tracked support ticket';

  @override
  String get helpQuickLinks => 'Quick links';

  @override
  String get faqSubtitle => 'Common questions answered';

  @override
  String get aboutSubtitle => 'Version, credits, and links';

  @override
  String get helpOpenLiveChat => 'Open Live Chat';

  @override
  String get helpLiveChatSoon =>
      'Live chat opening soon — we will email you back within 24 hours.';

  @override
  String get moreOptionsComingSoon => 'More options coming soon';

  @override
  String get insightCompoundTitle => 'Compound your decisions';

  @override
  String get insightCompoundMessage =>
      'Decisions made today shape opportunities 6 months out. Pick the one that opens the most doors.';

  @override
  String get insightParalysisTitle => 'Beware analysis paralysis';

  @override
  String get insightParalysisMessage =>
      'If you\'ve been thinking about it for over a week with no new info, you have enough to decide.';

  @override
  String get insightRiskStressTitle => 'Risk does not equal stress';

  @override
  String get insightRiskStressMessage =>
      'A high-risk decision can still be low-stress if you have a clear plan B. Always design your fallback.';

  @override
  String get insightFutureYouTitle => 'Future-you votes too';

  @override
  String get insightFutureYouMessage =>
      'Before deciding, ask: would future-you, 5 years from now, thank present-you for this?';

  @override
  String streakDays(int count) {
    return '$count-day streak';
  }

  @override
  String get streakKeepGoing => 'Keep going - make today\'s decision count.';

  @override
  String get todaysDecisionPrompt => 'Today\'s Decision Prompt';

  @override
  String get dailyDecisionExerciseSub => 'A quick 60-second decision exercise';

  @override
  String get dailyDecisionQuestion =>
      'Should you say yes or no to this opportunity?';

  @override
  String get dailyDecisionScenario =>
      'A colleague invites you to a side project. It\'s exciting but takes 10 hours a week.';

  @override
  String get seeAiAnalysis => 'See AI Analysis';

  @override
  String get errorWhatYouCanDo => 'What you can do';

  @override
  String get errorTip1 => 'Check your internet connection';

  @override
  String get errorTip2 => 'Try the action again in a moment';

  @override
  String get errorTip3 => 'Restart the app';

  @override
  String get errorTip4 => 'Contact support if it keeps happening';

  @override
  String get noInternetYouCanStill => 'You can still';

  @override
  String get offlineTip1 => 'View saved decisions and history';

  @override
  String get offlineTip2 => 'Read your notes and action plans';

  @override
  String get offlineTip3 => 'Browse FAQs and About';

  @override
  String get permissionNotificationsDesc =>
      'Get reminders and daily decision prompts';

  @override
  String get permissionLocation => 'Location';

  @override
  String get permissionLocationDesc =>
      'Used only for location-based suggestions';

  @override
  String get permissionStorage => 'Storage';

  @override
  String get permissionStorageDesc => 'Save your reports and exports locally';

  @override
  String get permissionSettingsNote =>
      'You can change permissions any time from Settings';

  @override
  String updateVersionReady(String version) {
    return 'Version $version is ready to install';
  }

  @override
  String get whatsNew => 'What\'s new';

  @override
  String get updateFeature1 => 'Faster AI analysis (2x speedup)';

  @override
  String get updateFeature2 => 'New Career Advisor module';

  @override
  String get updateFeature3 => 'Improved dark mode contrast';

  @override
  String get updateFeature4 => 'Bug fixes and stability improvements';

  @override
  String get loadingSubtitle => 'This usually takes just a few seconds';

  @override
  String get howToUseStep1Title => 'Define your decision';

  @override
  String get howToUseStep1Body =>
      'Start by describing your decision, category, and what matters most to you.';

  @override
  String get howToUseStep2Title => 'Analyze your options';

  @override
  String get howToUseStep2Body =>
      'Answer guided questions about goals, urgency, budget, and risk tolerance.';

  @override
  String get howToUseStep3Title => 'Review AI results';

  @override
  String get howToUseStep3Body =>
      'See your recommendation, risk score, pros and cons, and a step-by-step action plan.';

  @override
  String get howToUseStep4Title => 'Save and track progress';

  @override
  String get howToUseStep4Body =>
      'Save decisions to History and revisit insights whenever you need guidance.';

  @override
  String get clientSelectionLeading => 'Client';

  @override
  String get clientSelectionAccent => 'Selection';

  @override
  String get whichClientQuestion => 'Which client should you say yes to?';

  @override
  String get clientSelectionSubtitle =>
      'AI scores client opportunities by fit, fee, and risk.';

  @override
  String get freelancePricingLeading => 'Freelance';

  @override
  String get freelancePricingAccent => 'Pricing';

  @override
  String get recommendedPrice => 'Recommended Price';

  @override
  String get pricingScore => 'Pricing Score';

  @override
  String get priceComparison => 'Price Comparison';

  @override
  String get priceDrivers => 'Price Drivers';

  @override
  String get marketRate => 'Market Rate';

  @override
  String get experienceLabel => 'Experience';

  @override
  String get timelineLabel => 'Timeline';

  @override
  String get complexityLabel => 'Complexity';

  @override
  String get projectValue => 'Project Value';

  @override
  String get sendProposal => 'Send Proposal';

  @override
  String get proposalSent => 'Proposal sent to client.';

  @override
  String get productivityLeading => 'Productivity';

  @override
  String get productivityAccent => 'Planner';

  @override
  String get eisenhowerPriority => 'Eisenhower priority';

  @override
  String get startFocusBlock => 'Start Focus Block';

  @override
  String get focusBlockStarted => 'Focus block started — good luck!';

  @override
  String get careerAdvisorLeading => 'Career';

  @override
  String get careerAdvisorAccent => 'Advisor';

  @override
  String get careerFitScore => 'Career Fit Score';

  @override
  String get topPathProductManager => 'Top Path: Product Manager';

  @override
  String get skillMatch => 'Skill Match';

  @override
  String get strategyLabel => 'Strategy';

  @override
  String get communicationLabel => 'Communication';

  @override
  String get analyticsLabel => 'Analytics';

  @override
  String get technicalLabel => 'Technical';

  @override
  String get build90DayPlan => 'Build 90-Day Plan';

  @override
  String get businessIdeaLeading => 'Business';

  @override
  String get businessIdeaAccent => 'Idea';

  @override
  String get describeBusinessIdea => 'Describe your business idea';

  @override
  String get businessIdeaSubtitle =>
      'AI will score viability, market fit, and risk.';

  @override
  String get viabilityScore => 'Viability Score';

  @override
  String get scoreBreakdown => 'Score Breakdown';

  @override
  String get aiVerdict => 'AI Verdict';

  @override
  String get fullPlanGenerated => 'Full plan generated and saved.';

  @override
  String get financialCalcLeading => 'Financial';

  @override
  String get financialCalcAccent => 'Calculator';

  @override
  String get compoundGrowth => 'Compound Growth';

  @override
  String get futureValue => 'Future Value';

  @override
  String get saveToDecisions => 'Save to Decisions';

  @override
  String get saveDecisionLeading => 'Save';

  @override
  String get saveDecisionAccent => 'Decision';

  @override
  String get decisionSaved => 'Decision saved.';

  @override
  String get folderLabel => 'Folder';

  @override
  String get folderDefault => 'Default';

  @override
  String get folderCareer => 'Career';

  @override
  String get folderFinance => 'Finance';

  @override
  String get folderHealth => 'Health';

  @override
  String get folderPersonal => 'Personal';

  @override
  String get reportExportLeading => 'Export';

  @override
  String get reportExportAccent => 'Report';

  @override
  String get exportReport => 'Export Report';

  @override
  String get shareReport => 'Share Report';

  @override
  String get subscriptionLeading => 'Choose Your';

  @override
  String get subscriptionAccent => 'Plan';

  @override
  String get mostPopular => 'Most Popular';

  @override
  String get freeTrial => '7-Day Free Trial';

  @override
  String get upgradePremium => 'Upgrade to Premium';

  @override
  String get choosePlan => 'Choose a Plan';

  @override
  String get paymentSuccessful => 'Payment Successful!';

  @override
  String get thankYouUpgrade => 'Thank you for upgrading to Premium.';

  @override
  String get goToDashboard => 'Go to Dashboard';

  @override
  String get paymentDetails => 'Payment Details';

  @override
  String get payNow => 'Pay Now';

  @override
  String get cardNumber => 'Card Number';

  @override
  String get nameOnCard => 'Name on Card';

  @override
  String get premiumFeatures => 'Premium Features';

  @override
  String get faqSearchHint => 'Search FAQs';

  @override
  String get topicAll => 'All';

  @override
  String get topicGettingStarted => 'Getting Started';

  @override
  String get topicAi => 'AI';

  @override
  String get topicBilling => 'Billing';

  @override
  String get topicAccount => 'Account';

  @override
  String get tabAll => 'All';

  @override
  String get tabUnread => 'Unread';

  @override
  String get tabArchived => 'Archived';

  @override
  String get noArchivedItems => 'No archived items';

  @override
  String get traitRiskTolerance => 'Risk Tolerance';

  @override
  String get budgetWhyMatters =>
      'Budget helps the AI weigh financial trade-offs in your recommendation.';

  @override
  String get timeWhyMatters =>
      'Time availability shapes how ambitious your action plan should be.';

  @override
  String get experienceWhyMatters =>
      'Experience level helps the AI calibrate advice to your background.';

  @override
  String get riskWhyMatters =>
      'Risk tolerance determines how conservative or bold your recommendation will be.';

  @override
  String get urgencyWhyMatters =>
      'Urgency affects how quickly you should act on the recommendation.';

  @override
  String get confidenceReliableRecommend => 'Generally reliable recommendation';

  @override
  String get confidenceReliableSomeRisks =>
      'Generally reliable with some risks';

  @override
  String get confidenceConsiderRisks => 'Consider risks carefully';

  @override
  String get confidenceHighUncertainty =>
      'High uncertainty — proceed cautiously';

  @override
  String get stepResults => 'Results';

  @override
  String get urgencyNoRush => 'No Rush';

  @override
  String get urgencyModerate => 'Moderate';

  @override
  String get urgencyUrgent => 'Urgent';

  @override
  String get urgencyCritical => 'Critical';

  @override
  String get experienceBeginner => 'Beginner';

  @override
  String get experienceIntermediate => 'Intermediate';

  @override
  String get experienceAdvanced => 'Advanced';

  @override
  String get experienceExpert => 'Expert';

  @override
  String get timeVeryLimited => 'Very Limited';

  @override
  String get timeLimited => 'Limited';

  @override
  String get timeModerateAvail => 'Moderate';

  @override
  String get timeHighAvail => 'High';

  @override
  String get timeVeryHigh => 'Very High';

  @override
  String get riskToleranceLow => 'Low';

  @override
  String get riskToleranceModerate => 'Moderate';

  @override
  String get riskToleranceHigh => 'High';

  @override
  String get riskToleranceVeryHigh => 'Very High';

  @override
  String get doNow => 'Do now';

  @override
  String get doToday => 'Do today';

  @override
  String get scheduleLabel => 'Schedule';

  @override
  String get deleteLabel => 'Delete';

  @override
  String get tipLabel => 'Tip';

  @override
  String get aiRecommendation => 'AI Recommendation';

  @override
  String get comparisonMenu => 'Comparison';

  @override
  String get clientSelectionVerdictBody =>
      'Acme is the strongest fit — say yes. Mystery Client: politely decline; vague briefs predict scope creep.';

  @override
  String get freelancePricingSubtitle => 'AI-powered rate recommendations';

  @override
  String get priceLower => 'Lower';

  @override
  String get priceRecommended => 'Recommended';

  @override
  String get priceHigher => 'Higher';

  @override
  String get freelancePricingRecommendationBody =>
      'Price at \$2,800 to win this client at a healthy margin. If they push back, anchor on scope rather than dropping price.';

  @override
  String get productivitySubtitle =>
      'AI sorts what to do now, what to schedule, and what to drop.';

  @override
  String get productivityTipBody =>
      'If everything is urgent, nothing is. Pick 1–2 do-now items and protect them like meetings.';

  @override
  String get careerAdvisorDescription =>
      'Strong fit based on your skills, communication style, and growth interest.';

  @override
  String get nextSteps => 'Next steps';

  @override
  String get careerAdvisorNextStepsBody =>
      'Lead a small cross-functional initiative this quarter to build PM-style track record.';

  @override
  String get excellent => 'Excellent';

  @override
  String get good => 'Good';

  @override
  String get businessIdeaHint =>
      'e.g., A subscription box for indoor plants with AI care reminders';

  @override
  String get marketSize => 'Market Size';

  @override
  String get competition => 'Competition';

  @override
  String get profitability => 'Profitability';

  @override
  String get executionEase => 'Execution Ease';

  @override
  String get large => 'Large';

  @override
  String get businessIdeaVerdictBody =>
      'Strong concept with a clear audience. Focus the first 90 days on landing 20 paying customers before scaling marketing.';

  @override
  String get generateFullPlan => 'Generate Full Plan';

  @override
  String get financialCalcSubtitle => 'See what your money grows to over time.';

  @override
  String get financialInitialAmount => 'Initial Amount (\$)';

  @override
  String get financialAnnualRate => 'Annual Rate (%)';

  @override
  String get financialDuration => 'Duration (years)';

  @override
  String get financialCalcTipBody =>
      'Even small monthly contributions beat large one-off deposits over a 10+ year horizon.';

  @override
  String get saveDecisionNotesHint =>
      'Anything you want to remember about this decision';

  @override
  String get reportExportSubtitle => 'Save or share your decision report';

  @override
  String get completed => 'Completed';

  @override
  String get goAhead => 'Go Ahead';

  @override
  String get includeInReport => 'Include in Report';

  @override
  String get executiveSummary => 'Executive Summary';

  @override
  String get analysisDetails => 'Analysis Details';

  @override
  String get notesAndInputs => 'Notes & Inputs';

  @override
  String get exportFormat => 'Export Format';

  @override
  String get pdfBestForSharing => 'Best for sharing';

  @override
  String get excelDataScores => 'Data & Scores';

  @override
  String get wordDocument => 'Document';

  @override
  String get imageJpgPng => 'JPG / PNG';

  @override
  String get shareOrSave => 'Share or Save';

  @override
  String get shareLink => 'Share Link';

  @override
  String get createShareableLink => 'Create a shareable link';

  @override
  String get emailReport => 'Email Report';

  @override
  String get sendViaEmail => 'Send via email';

  @override
  String get saveToDevice => 'Save to Device';

  @override
  String get downloadToDevice => 'Download to device';

  @override
  String get scheduleAutoReports => 'Schedule Auto Reports';

  @override
  String exportedAs(String format) {
    return 'Exported as $format';
  }

  @override
  String get subscriptionSubtitle =>
      'Make smarter decisions with the right plan for you';

  @override
  String get makeSmarterDecisions => 'Make Smarter Decisions';

  @override
  String get subscriptionHeroBody =>
      'Unlock unlimited AI analysis, deep insights, and personalized recommendations.';

  @override
  String get planBasic => 'Basic';

  @override
  String get planPremium => 'Premium';

  @override
  String get planPro => 'Pro';

  @override
  String get perMonth => '/month';

  @override
  String get allPlansInclude => 'All Plans Include';

  @override
  String get moneyBackGuarantee => '7-Day Money-Back Guarantee';

  @override
  String get moneyBackGuaranteeBody =>
      'Not satisfied? Get a full refund within 7 days.';

  @override
  String get subscribeTermsNote =>
      'By subscribing you agree to our Terms and Privacy Policy.';

  @override
  String get securePaymentEncryption =>
      'Secure payment with industry-standard encryption';

  @override
  String get paymentLeading => 'Payment';

  @override
  String get paymentAccent => 'Details';

  @override
  String get premiumMonthly => 'Premium • Monthly';

  @override
  String get taxEstimate => 'Tax estimate';

  @override
  String get totalToday => 'Total today';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get paymentCard => 'Card';

  @override
  String get paymentPayPal => 'PayPal';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get cardExpiryHint => 'MM/YY';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'Encrypted end-to-end. We never store your card.';

  @override
  String get premiumFeaturesLeading => 'Premium';

  @override
  String get premiumFeaturesAccent => 'Features';

  @override
  String get premiumUnlockSubtitle => 'Unlock the full power of Life Coach';

  @override
  String get premiumFeature1Title => 'Unlimited AI Analysis';

  @override
  String get premiumFeature1Body => 'Run as many decisions as you need.';

  @override
  String get premiumFeature2Title => 'Deep Insights';

  @override
  String get premiumFeature2Body =>
      'Risk, confidence, outcome and impact charts.';

  @override
  String get premiumFeature3Title => 'Compare Decisions';

  @override
  String get premiumFeature3Body => 'See decisions side-by-side.';

  @override
  String get premiumFeature4Title => 'Export Reports';

  @override
  String get premiumFeature4Body => 'PDF, Word, Excel and image exports.';

  @override
  String get premiumFeature5Title => 'Cloud Sync';

  @override
  String get premiumFeature5Body => 'Securely backed up to the cloud.';

  @override
  String get premiumFeature6Title => 'Priority Support';

  @override
  String get premiumFeature6Body => 'Reply within 24 hours.';

  @override
  String get paymentSuccessLeading => 'Payment';

  @override
  String get paymentSuccessAccent => 'Successful!';

  @override
  String get youNowHaveAccessTo => 'You Now Have Access To';

  @override
  String get planLabel => 'Plan';

  @override
  String get amountLabel => 'Amount';

  @override
  String get methodLabel => 'Method';

  @override
  String get transactionIdLabel => 'Transaction ID';

  @override
  String get unlimitedAi => 'Unlimited AI';

  @override
  String get deepInsightsShort => 'Deep Insights';

  @override
  String get compareShort => 'Compare';

  @override
  String get exportsShort => 'Exports';

  @override
  String get cloudSyncShort => 'Cloud Sync';

  @override
  String get prioritySupportShort => 'Priority Support';

  @override
  String get privacyLeading => 'Privacy';

  @override
  String get privacyAccent => 'Policy';

  @override
  String get privacyLastUpdated => 'Last updated: May 18, 2026';

  @override
  String get privacySection1Title => 'What we collect';

  @override
  String get privacySection1Body =>
      'We collect only what you give us — the decisions you save, your account details (name + email), and your preferences. Everything else stays on your device.';

  @override
  String get privacySection2Title => 'How we use it';

  @override
  String get privacySection2Body =>
      'To personalize AI recommendations, sync your data if you choose, and improve the app. We never sell your data to third parties.';

  @override
  String get privacySection3Title => 'Local-first storage';

  @override
  String get privacySection3Body =>
      'Your decisions are stored on your device by default. Cloud sync is opt-in and encrypted in transit and at rest.';

  @override
  String get privacySection4Title => 'Your rights';

  @override
  String get privacySection4Body =>
      'You can export or delete all your data at any time from Settings. We respond to data requests within 7 days.';

  @override
  String get privacySection5Title => 'Children';

  @override
  String get privacySection5Body =>
      'Life Coach is not intended for children under 13. We do not knowingly collect data from children.';

  @override
  String get privacySection6Title => 'Contact us';

  @override
  String get privacySection6Body =>
      'Questions or concerns? Email privacy@lifecoach.app and we will get back to you within two business days.';

  @override
  String get termsLeading => 'Terms of';

  @override
  String get termsAccent => 'Service';

  @override
  String get termsLastUpdated => 'Last updated: May 18, 2026';

  @override
  String get termsSection1Title => '1. Acceptance';

  @override
  String get termsSection1Body =>
      'By using Life Coach you agree to these Terms. If you do not agree, please do not use the app.';

  @override
  String get termsSection2Title => '2. Account';

  @override
  String get termsSection2Body =>
      'You are responsible for keeping your account secure. Do not share your credentials.';

  @override
  String get termsSection3Title => '3. AI recommendations';

  @override
  String get termsSection3Body =>
      'AI outputs are guidance, not professional advice. You are responsible for decisions you make based on them.';

  @override
  String get termsSection4Title => '4. Subscriptions';

  @override
  String get termsSection4Body =>
      'Premium plans auto-renew until cancelled. You may cancel anytime from your store account.';

  @override
  String get termsSection5Title => '5. Acceptable use';

  @override
  String get termsSection5Body =>
      'No abusive content, no reverse-engineering, no scraping. Violations may result in account suspension.';

  @override
  String get termsSection6Title => '6. Limitation of liability';

  @override
  String get termsSection6Body =>
      'To the maximum extent allowed by law, our liability is limited to the amount you paid us in the prior 12 months.';

  @override
  String get termsSection7Title => '7. Changes';

  @override
  String get termsSection7Body =>
      'We may update these Terms. We will notify you of material changes via in-app notice or email.';

  @override
  String get faqQ1 => 'How do I start a new decision?';

  @override
  String get faqA1 =>
      'Tap the \"Start New Analysis\" card on the Home screen, give your decision a title, and follow the guided steps.';

  @override
  String get faqQ2 => 'Is my data private?';

  @override
  String get faqA2 =>
      'Yes. Decisions are stored locally on your device by default. Cloud sync is opt-in and encrypted.';

  @override
  String get faqQ3 => 'How accurate is the AI?';

  @override
  String get faqA3 =>
      'The AI provides structured guidance, not professional advice. Use it as a thinking aid alongside your own judgment.';

  @override
  String get faqQ4 => 'Can the AI access my conversations?';

  @override
  String get faqA4 =>
      'No. Only the inputs you submit in the decision flow are used. Nothing else from your device is read.';

  @override
  String get faqQ5 => 'How do I cancel my subscription?';

  @override
  String get faqA5 =>
      'Cancel anytime from the App Store / Google Play subscription page. Access continues until the period ends.';

  @override
  String get faqQ6 => 'Do you offer refunds?';

  @override
  String get faqA6 =>
      'Yes — within 7 days of your first purchase. Email support@lifecoach.app.';

  @override
  String get faqQ7 => 'How do I delete my account?';

  @override
  String get faqA7 =>
      'Settings → Account → Delete Account. All your data is removed within 30 days.';

  @override
  String get faqQ8 => 'Can I export my decisions?';

  @override
  String get faqA8 =>
      'Yes. Open any saved decision and tap Export Report to download as PDF, Word, Excel or image.';

  @override
  String get notificationsLeading => 'Notifi';

  @override
  String get notificationsAccent => 'cations';

  @override
  String get decisionTextRiskFallback =>
      'Run a full analysis to get tailored risk-reduction tips.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'Your overall risk level is $label ($score%). Review the breakdown below to understand what drives this score.';
  }

  @override
  String get urgencyNoRushSub => 'Take time to research and compare options.';

  @override
  String get urgencyNoRushTag => 'Flexible timeline';

  @override
  String get urgencyModerateSub => 'Decide within the next few weeks.';

  @override
  String get urgencyModerateTag => 'Few Weeks';

  @override
  String get urgencyUrgentSub => 'You need a decision within days.';

  @override
  String get urgencyUrgentTag => 'Within days';

  @override
  String get urgencyCriticalSub => 'Immediate action is required.';

  @override
  String get urgencyCriticalTag => 'Immediate';

  @override
  String get urgencyWhyMattersDesc =>
      'Urgency affects which factors AI weights more heavily-quick decisions and clearer signals.';

  @override
  String get budgetRange1 => '\$1K-\$5K';

  @override
  String get budgetRange2 => '\$5K-\$20K';

  @override
  String get budgetRange3 => '\$20K-\$50K';

  @override
  String get budgetRange4 => '\$50K+';

  @override
  String get budgetWhyMattersDesc =>
      'Your budget helps AI evaluate options & recommend cost-effective solutions for you.';

  @override
  String get riskToleranceLowSub => 'Prefer stable, predictable outcomes.';

  @override
  String get riskToleranceLowTag => 'Stable & safe';

  @override
  String get riskToleranceModerateSub => 'Accept balanced trade-offs.';

  @override
  String get riskToleranceModerateTag => 'Balanced risk';

  @override
  String get riskToleranceHighSub => 'Open to bigger swings for upside.';

  @override
  String get riskToleranceHighTag => 'Growth focused';

  @override
  String get riskToleranceVeryHighSub => 'Comfortable with major uncertainty.';

  @override
  String get riskToleranceVeryHighTag => 'Maximum upside';

  @override
  String get riskWhyMattersDesc =>
      'Risk tolerance helps AI balance potential rewards against possible downsides.';

  @override
  String get experienceBeginnerSub =>
      'New to this area; still building knowledge.';

  @override
  String get experienceBeginnerTag => 'Best for learning';

  @override
  String get experienceIntermediateSub =>
      'Some relevant experience and context.';

  @override
  String get experienceIntermediateTag => 'Balanced options';

  @override
  String get experienceAdvancedSub => 'Strong background in this domain.';

  @override
  String get experienceAdvancedTag => 'Growth focused';

  @override
  String get experienceExpertSub => 'Deep expertise and proven track record.';

  @override
  String get experienceExpertTag => 'Maximum outcomes';

  @override
  String get experienceWhyMattersDesc =>
      'Your experience level helps AI personalize the complexity and depth of recommendations.';

  @override
  String get timeVeryLimitedSub => 'Only a few hours per week available.';

  @override
  String get timeVeryLimitedTag => 'Minimal hours';

  @override
  String get timeLimitedSub => 'Some evenings or weekends free.';

  @override
  String get timeLimitedTag => 'Part-time focus';

  @override
  String get timeModerateAvailSub => 'A steady amount of time each week.';

  @override
  String get timeModerateAvailTag => 'Regular commitment';

  @override
  String get timeHighAvailSub => 'Can dedicate significant weekly hours.';

  @override
  String get timeHighAvailTag => 'Strong availability';

  @override
  String get timeVeryHighSub => 'This can be your primary focus now.';

  @override
  String get timeVeryHighTag => 'Full focus';

  @override
  String get timeWhyMattersDesc =>
      'Your time availability helps AI recommend realistic plans you can stick to.';
}
