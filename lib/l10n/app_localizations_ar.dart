// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ملاح الحياة بالذكاء الاصطناعي';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navChatbot => 'دردشة AI';

  @override
  String get navInsights => 'رؤى';

  @override
  String get navHistory => 'السجل';

  @override
  String get continueButton => 'متابعة';

  @override
  String get nextButton => 'التالي';

  @override
  String get backButton => 'رجوع';

  @override
  String get saveButton => 'حفظ';

  @override
  String get analyzeButton => 'التحليل';

  @override
  String get tryAgain => 'حاول مجدداً';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get searchHint => 'جاري البحث...';

  @override
  String get selectLanguage => '[ترجمة المصطلح: Select]';

  @override
  String get languageWord => 'اللغة';

  @override
  String get searchLanguageHint => '‫البحث في اللغات‬';

  @override
  String get noLanguagesFound => 'لم يتم العثور على لغات.';

  @override
  String get settings => 'الإعدادات';

  @override
  String get accountSettings => 'إعدادات الحساب';

  @override
  String get languages => 'اللغات';

  @override
  String get theme => 'المحور';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get helpSupport => 'المساعدة والدعم';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get welcomeBack => 'مرحباً بعودتك!';

  @override
  String get emailAddress => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String goodMorning(String name) {
    return 'صباح الخير، $name 👋';
  }

  @override
  String get homeSubtitle =>
      'احصل على إرشاد مدعوم بالذكاء الاصطناعي لقرارك المهم القادم.';

  @override
  String get startNewAnalysis => 'بدء تحليل جديد';

  @override
  String get startAnalysisSubtitle =>
      'ابدأ تحليلًا موجهًا واحصل على توصية مخصصة.';

  @override
  String get decisionOverview => 'نظرة عامة على القرار';

  @override
  String get riskScore => 'درجة المخاطر';

  @override
  String get successChance => 'فرصة النجاح';

  @override
  String get activePlans => 'الخطط النشطة';

  @override
  String get inProgress => 'في انتظار التأكيد';

  @override
  String get recentInsights => 'الرؤى الحديثة';

  @override
  String get stepDefine => 'تحديد';

  @override
  String get stepAnalyze => 'تحليل';

  @override
  String get stepQuestions => 'أسئلة';

  @override
  String get stepResult => 'النتيجة';

  @override
  String get defineYourProblem => 'حدد هدفك';

  @override
  String get problemWord => 'المشكلة';

  @override
  String get tellUsMore => 'أخبرنا المزيد عن قرارك';

  @override
  String get wizardHint =>
      'كلما قدمت المزيد من التفاصيل، كلما كان بإمكان الذكاء الاصطناعي لدينا تحليلها وإرشادك بشكل أفضل.';

  @override
  String get describeDecision => 'صف قرارك';

  @override
  String get quickTips => 'نصائح سريعة';

  @override
  String get beSpecific => 'كن محدداً';

  @override
  String get includeContext => 'تضمين السياق';

  @override
  String get mentionGoal => 'اذكر الهدف';

  @override
  String get choosingBetween => 'ما الذي تختاره ؟';

  @override
  String get optionsHint =>
      'أدرج ما يصل إلى 5 خيارات. سوف يزن الذكاء الاصطناعي كل واحد مقابل أهدافك.';

  @override
  String get addAnotherOption => 'اضافة خيار جديد';

  @override
  String get continueToAnalysis => 'المتابعة إلى التحليل';

  @override
  String get aiQuestionsTitle => 'الذكاء الاصطناعي';

  @override
  String get questionsWord => 'أسئلة';

  @override
  String get preparingQuestions => 'تحضير أسئلة مخصصة...';

  @override
  String basedOnDecision(String title) {
    return 'بناءً على قرارك: $title';
  }

  @override
  String get basedOnWizard => 'بناءً على ما شاركته في المعالج';

  @override
  String get aiNavigator => 'ملاح الحياة بالذكاء الاصطناعي';

  @override
  String get aiQuestionsHint =>
      'أجب بصدق — تشكل إجاباتك تحليل الذكاء الاصطناعي.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'أنتج الذكاء الاصطناعي هذه الأسئلة خصيصًا لـ \"$title\".';
  }

  @override
  String questionOf(int current, int total) {
    return 'السؤال $current من $total';
  }

  @override
  String get whyThisMatters => 'أهمية هذه اللحظة';

  @override
  String get whyQuestionsMatter =>
      'تساعد إجاباتك الذكاء الاصطناعي على التركيز على ما هو أكثر ملاءمة لموقفك.';

  @override
  String get securePrivate => 'بياناتك آمنة وخاصة';

  @override
  String get processingAnalyzing => 'جارٍ تحليل خياراتك...';

  @override
  String get processingRisk => 'جارٍ حساب عوامل الخطر...';

  @override
  String get processingOutcomes => 'التنبؤ بالنتائج:';

  @override
  String get processingPlan => 'بناء خطة العمل...';

  @override
  String get processingFinalizing => 'إنهاء النتيجة';

  @override
  String get decisionResult => 'القرار';

  @override
  String get resultWord => 'النتيجة';

  @override
  String get recommendedChoice => 'الاختيار الموصى به';

  @override
  String get benefitScore => 'درجة الفائدة';

  @override
  String get confidence => 'الثقة';

  @override
  String get fitScore => 'درجة الملاءمة';

  @override
  String get resultBreakdown => 'تفاصيل النتيجة';

  @override
  String get finalRecommendation => 'التوصية النهائية';

  @override
  String get outcomePrediction => 'التنبؤ بالنتائج';

  @override
  String get confidenceMeter => 'مقياس الثقة';

  @override
  String get actionPlan => 'خطة العمل';

  @override
  String get prosCons => 'المميزات والعيوب';

  @override
  String get tipFromAi => 'نصيحة من منظمة العفو الدولية';

  @override
  String get saveReport => 'حفظ التقرير';

  @override
  String get startNewDecision => 'ابدأ قرارًا جديدًا';

  @override
  String get decisionWord => 'القرار';

  @override
  String get comparisonWord => 'المقارنة';

  @override
  String get whyRecommended => 'لماذا يوصى بهذا ؟';

  @override
  String get riskBreakdown => 'تفصيل المخاطر';

  @override
  String get riskInterpretation => 'تفسيــــــــــر المخاطر';

  @override
  String get howToImprove => 'كيفية تحسين';

  @override
  String get overallConfidence => 'الثقة العامة';

  @override
  String get confidenceBreakdown => 'انهيار الثقة';

  @override
  String get successLikelihood => 'احتمالية النجاح';

  @override
  String get outcomeBreakdown => 'تفصيل النتائج';

  @override
  String get keyOutcomeFactors => 'عوامل النتائج الرئيسية';

  @override
  String get prosTitle => 'إيجابيات هذا القرار';

  @override
  String get consTitle => 'سلبيات هذا القرار';

  @override
  String get overallProsCons => 'الإيجابيات والسلبيات العامة';

  @override
  String get bestOverallFit => 'أفضل تناسب عام';

  @override
  String get bestOverallChoice => 'أفضل خيار عام';

  @override
  String get recommendedChoiceLabel => 'الاختيار الموصى به';

  @override
  String get yourActionPlan => 'خطة العمل الخاصة بك';

  @override
  String get aiInsight => 'انسايت الذكاء الاصطناعي';

  @override
  String get keyComparison => 'المقارنة الرئيسية';

  @override
  String get overallScore => 'الدرجة الإجمالية';

  @override
  String get keyPoints => 'النقاط الرئيسية';

  @override
  String get analysisFailed =>
      'فشل التحليل. تحقق من مفتاح الإنترنت وواجهة برمجة التطبيقات.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY مفقود. أضفه إلى .env وأعد تشغيل التطبيق.';

  @override
  String get noDescription => 'لم يتم إدخال أي وصف';

  @override
  String get history => 'تاريخ';

  @override
  String get about => 'من نحن';

  @override
  String get profile => 'ملف تعريفي';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get low => 'منخفض';

  @override
  String get medium => 'متوسط';

  @override
  String get high => 'مرتفع';

  @override
  String get lowRisk => 'مخاطر منخفضة';

  @override
  String get mediumRisk => 'مخاطر متوسطة';

  @override
  String get highRisk => 'مخاطر مرتفعة';

  @override
  String get notAssessed => 'لم يتم التقييم';

  @override
  String get couldNotLoadQuestions => 'تعذر تحميل الأسئلة';

  @override
  String get noQuestionsGenerated => 'لم يتم إنشاء أي أسئلة.';

  @override
  String get onboardingTitle1 => 'اتخاذ قرارات أكثر ذكاءً مع الذكاء الاصطناعي';

  @override
  String get onboardingSubtitle1 =>
      'احصل على إرشادات مخصصة لخيارات الحياة المهمة.';

  @override
  String get onboardingTitle2 => 'تحليل المخاطر والنتائج';

  @override
  String get onboardingSubtitle2 => 'فهم المقايضات قبل الالتزام.';

  @override
  String get onboardingTitle3 => 'اتبع خطة عمل واضحة';

  @override
  String get onboardingSubtitle3 => 'حول الرؤى إلى خطوات عملية تالية.';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get skip => 'تخطي';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get systemDefault => 'تقصير النظام';

  @override
  String get generalSettings => 'بيانات عامة';

  @override
  String get support => 'الدعم';

  @override
  String get legal => 'القدرات القانونية';

  @override
  String get languageChanged => 'تم تحديث اللغة';

  @override
  String get yourOptions => 'خياراتك';

  @override
  String get recommended => 'الخيار المقترح';

  @override
  String get compareOptions => 'خيارات المقارنة';

  @override
  String get plan => 'خطة';

  @override
  String get prepare => 'اعداد';

  @override
  String get execute => 'التنفيذ';

  @override
  String get positiveOutcome => 'نتيجة إيجابية؟';

  @override
  String get neutralOutcome => 'نتيجة محايدة';

  @override
  String get negativeOutcome => 'حصيلة سلبية, نتائج سيئة, نتيجة ضعيفة';

  @override
  String get overallRiskScore => 'درجة المخاطر الإجمالية';

  @override
  String get yourDecisionRiskLevel => 'مستوى مخاطر قرارك';

  @override
  String get overallPrediction => 'التنبؤ العام';

  @override
  String get overallProsConsTitle => 'الإيجابيات والسلبيات العامة';

  @override
  String get emptyHistory => 'لا توجد قرارات محفوظة حتى الآن';

  @override
  String get startFirstDecision => 'ابدأ أول تحليل للقرار';

  @override
  String get chatbotTitle => 'دردشة AI';

  @override
  String get insightsTitle => 'الاستنتاجات';

  @override
  String get dailySuggestion => 'اقتراح يومي';

  @override
  String get aboutTagline =>
      'دعم القرار الذكي المدعوم بالذكاء الاصطناعي — وزن الخيارات والمخاطر والخطوات التالية.';

  @override
  String get aboutBody =>
      'يساعدك AI Life Navigator على العمل من خلال القرارات الحياتية والمهنية من خلال الأسئلة المنظمة وتحليل المخاطر وخطط العمل الواضحة.';

  @override
  String get personalInformation => 'البيانات الشخصية';

  @override
  String get appSetting => 'إعدادات التطبيق';

  @override
  String get securityPrivacy => 'الأمن والخصوصية';

  @override
  String get aboutUs => 'من نحن';

  @override
  String get howToUse => 'كيفية الاستخدام';

  @override
  String get appTheme => '‫مظهر التطبيق‬';

  @override
  String get shareApp => '--';

  @override
  String get rateUs => 'التقييم';

  @override
  String get pleaseAddOption => 'يرجى إضافة خيار واحد على الأقل';

  @override
  String get noReportToSave => 'لا يوجد تقرير قرار للحفظ.';

  @override
  String get reportSaved => 'تم حفظ التقرير في السجل.';

  @override
  String get pendingAnalysis => 'في انتظار التحليل';

  @override
  String get untitledDecision => 'قرار بدون عنوان';

  @override
  String get describeDecisionHint => 'صف موقفك وقيودك وكيف يبدو النجاح.';

  @override
  String optionLabel(String letter) {
    return 'الخيار $letter';
  }

  @override
  String get goodChance => 'Good chance';

  @override
  String get fairChance => 'فرصة عادلة';

  @override
  String get poorChance => 'فرصة ضعيفة';

  @override
  String get couldNotPrepareQuestions =>
      'تعذر إعداد الأسئلة. يُرجى إعادة المحاولة.';

  @override
  String get greetingFallbackName => 'هناك, هنالك, يوجد هنا, هذا';

  @override
  String get dontHaveAccount => 'لا تملك حسابًا؟';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get welcome => 'مرحباً!';

  @override
  String get orContinueWith => 'أو تابع باستخدام';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'الحياة';

  @override
  String get navigator => 'ملاح, ربان, الملاح المستكشف, بحار';

  @override
  String get authTagline => 'مساعد اتخاذ القرار بالذكاء الاصطناعي';

  @override
  String get chatbotReadySubtitle => 'مستعد للتنقل في حياتك';

  @override
  String get chatbotInputHint => 'ابدأ دردشتك هنا...';

  @override
  String get chatbotErrorMessage =>
      'عذرًا، لم أتمكن من الوصول إلى خدمة الذكاء الاصطناعي. يرجى التحقق من اتصالك والمحاولة مرة أخرى.';

  @override
  String get selectAll => 'تحديد الكل';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => 'اختر القرارات المراد حذفها.';

  @override
  String get total => 'الإجمالي';

  @override
  String get highScore => 'درجة عالية';

  @override
  String get justNow => 'حالًا';

  @override
  String minutesAgo(int count) {
    return 'قبل __PH0 __ دقيقة';
  }

  @override
  String hoursAgo(int count) {
    return '$count قبل ساعة';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count قبل ساعات';
  }

  @override
  String daysAgo(int count) {
    return '$count قبل يوم';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count أيام مضت';
  }

  @override
  String scoreLabel(int score) {
    return 'النتيجة $score';
  }

  @override
  String get themeCustomizeSubtitle => 'تخصيص شكل ومظهر تطبيقك';

  @override
  String get lightModeSubtitle => 'تجربة نظيفة ومشرقة';

  @override
  String get darkModeSubtitle => 'سهل على العينين في الإضاءة الخافتة';

  @override
  String get systemDefaultSubtitle => 'استخدام تفضيلات سمة الجهاز';

  @override
  String get preview => 'معاينة';

  @override
  String get applyTheme => 'تطبيق السمة';

  @override
  String get shareAppMessage => 'شارك Life Navigator مع أصدقائك.';

  @override
  String get rateAppThanks => 'شكرًا لك على تقييم Life Navigator!';

  @override
  String fieldRequired(String field) {
    return '$field مطلوب';
  }

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get emailInvalid => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMinLength => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get confirmPasswordRequired => 'الرجاء تأكيد كلمة المرور الخاصة بك';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get otpRequired => 'رمز التحقق مطلوب';

  @override
  String otpInvalid(int length) {
    return 'يرجى إدخال رمز $lengthرقمي صالح';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field يجب أن يكون __ PH1 __حرفًا على الأقل';
  }

  @override
  String get fieldDescription => 'الوصف';

  @override
  String get fieldTitle => 'اللقب';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get acceptTermsRequired => 'يرجى قبول الشروط والسياسات.';

  @override
  String get signupTitleLeading => 'أنشئ حساب';

  @override
  String get account => 'الحساب';

  @override
  String get signupSubtitle =>
      'انضم إلى Life Navigator واتخذ قرارات أكثر ذكاءً كل يوم.';

  @override
  String get iAgreeToThe => 'أنا أوافق على ';

  @override
  String get forgotPasswordLeading => 'هل نسيت كلمة السر ؟';

  @override
  String get forgotPasswordAccent => 'كلمة السر؟';

  @override
  String get forgotPasswordSubtitle =>
      'أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.';

  @override
  String get enterEmailHint => 'أدخل عنوان البريد الإلكتروني';

  @override
  String get forgotPasswordInfo =>
      'سنرسل رابط إعادة تعيين كلمة المرور إلى عنوان بريدك الإلكتروني.';

  @override
  String get sendVerificationCode => 'أرسل رمز التفعيل';

  @override
  String get sendPasswordResetLink => 'أرسل رابط إعادة الضبط';

  @override
  String get emailVerificationTitle => 'التحقق من البريد الإلكتروني';

  @override
  String get emailVerificationSubtitle =>
      'لقد أرسلنا رابط التحقق إلى بريدك الإلكتروني. افتحه لتفعيل حسابك.';

  @override
  String get emailVerificationSpamHint =>
      'تحقق من مجلد البريد العشوائي أو البريد غير المرغوب فيه إذا لم تشاهد البريد الإلكتروني خلال بضع دقائق.';

  @override
  String get emailVerificationWaiting =>
      'في انتظار التحقق... سوف نقوم بالتحقق تلقائيًا.';

  @override
  String get emailVerificationResend => 'إعادة إرسال البريد الإلكتروني للتحقق';

  @override
  String get emailVerificationResent => 'تم إرسال بريد التحقق مرة أخرى.';

  @override
  String get authErrorWrongPassword =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.';

  @override
  String get authErrorEmailInUse =>
      'عنوان البريد الإلكترونى هذا مسجل بالفعل. حاول تسجيل الدخول بدلاً من ذلك.';

  @override
  String get authErrorWeakPassword =>
      'كلمة المرور ضعيفة جدًا. استخدم 6 أحرف على الأقل.';

  @override
  String get authErrorUserNotFound =>
      'لم يتم العثور على حساب مع هذا البريد الإلكتروني.';

  @override
  String get authErrorTooManyRequests =>
      'محاولات كثيرة جدًا. يرجى الانتظار والمحاولة مرة أخرى.';

  @override
  String get authErrorGeneric => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get authErrorGoogleCancelled => 'تم إلغاء تسجيل الدخول إلى Google.';

  @override
  String get passwordResetEmailSent =>
      'تم إرسال البريد الإلكتروني لإعادة تعيين كلمة المرور. تحقق من البريد الوارد الخاص بك.';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get changePasswordSubtitle =>
      'أدخل كلمة المرور الحالية واختر كلمة مرور جديدة.';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get deleteAccountConfirm =>
      'يؤدي هذا إلى حذف حسابك نهائيًا ولا يمكن التراجع عنه.';

  @override
  String get deleteAccountSuccess =>
      'قم أيضًا بحذف القرارات المحلية والدردشة المخزنة على هذا الجهاز.';

  @override
  String get accountDeleted => 'لقد تم حذف حسابك.';

  @override
  String get rememberPassword => 'هل تذكرت كلمة مرورك؟';

  @override
  String get passwordUpdatedLogin => 'تم تحديث كلمة المرور. يرجى تسجيل الدخول.';

  @override
  String get resetLeading => 'إعادة ضبط';

  @override
  String get resetPasswordSubtitle => 'أنشاء كلمة مرور لحسابك.';

  @override
  String get newPassword => 'New Password (كلمة المرور الجديدة)';

  @override
  String get confirmNewPassword =>
      'Cconfirm New Password (تأكيد كلمة المرور الجديدة)';

  @override
  String get passwordHint => 'استخدم 6 أحرف على الأقل مع مزيج يمكنك تذكره.';

  @override
  String get updating => 'جارٍ التحديث...';

  @override
  String get updatePassword => 'تحديث كلمة المرور';

  @override
  String get backTo => 'رجوع إلى';

  @override
  String newCodeSentTo(String email) {
    return 'تم إرسال الرمز الجديد إلى $email';
  }

  @override
  String get invalidVerificationCode =>
      'رمز التأكيد غير صالح، يرجى المحاولة مرة أخرى.';

  @override
  String otpResetSubtitle(String email) {
    return 'أدخل رمز إعادة التعيين المكون من 6 أرقام المرسل إلى $email';
  }

  @override
  String otpVerifySubtitle(String email) {
    return 'أدخل رمز التحقق المكون من 6 أرقام المرسل إلى $email';
  }

  @override
  String get verifyLeading => 'التحقق';

  @override
  String get verifyEmailLeading => 'تحقق من';

  @override
  String get codeWord => 'الكود';

  @override
  String get emailWord => 'البريد الإلكتروني:';

  @override
  String resendCodeIn(int seconds) {
    return 'إعادة إرسال الرمز في ${seconds}s';
  }

  @override
  String get didntReceiveCode => 'لم تتلق الرمز؟';

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String get verifying => 'يتم الآن التحقق...';

  @override
  String get verifyCode => 'التحقق من الرمز';

  @override
  String get verifyAndContinue => 'التحقق والمتابعة';

  @override
  String get wrongEmail => 'بريد إلكتروني خاطئ.';

  @override
  String get goBack => 'العودة إلى الوراء';

  @override
  String get logOut => 'تسجيل الخروج';

  @override
  String get logoutConfirmMessage => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get logoutConfirmYes => 'نعم، تسجيل الخروج';

  @override
  String get insightsHeroDescription =>
      'الاقتراحات والرؤى اليومية المصممة خصيصًا لقراراتك.';

  @override
  String recommendedPrefix(String text) {
    return 'موصى به: $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'أكمل تحليلًا للاطلاع على تفسير شخصي للمخاطر.';

  @override
  String get startDecisionQuestion => 'ما القرار الذي تريد المساعدة بشأنه ؟';

  @override
  String get startDecisionSubtitle =>
      'صف قرارك واحصل على رؤى وتوصيات مدعومة بالذكاء الاصطناعي.';

  @override
  String get decisionTitle => 'رقم المقرر';

  @override
  String get decisionTitleHint => 'على سبيل المثال، هل يجب أن أغير مهنتي ؟';

  @override
  String get decisionCategory => 'فئة القرار';

  @override
  String get importanceLevel => 'مستوى الأهمية';

  @override
  String get impactMinor => 'تأثير ضئيل';

  @override
  String get impactModerate => 'تأثير معتدل';

  @override
  String get impactHigh => 'أثر عالي';

  @override
  String get categoryCareer => 'الوظائف';

  @override
  String get categoryFinance => 'مالية';

  @override
  String get categoryHealth => 'الصحة';

  @override
  String get categoryRelations => 'العلاقات';

  @override
  String get categoryEducation => '<g id=\"Bold\">التعليم</g>';

  @override
  String get categoryOther => 'أخرى';

  @override
  String get addYourOptionsLeading => 'أضف ';

  @override
  String get optionsWord => '[ترجمة المصطلح: Options]';

  @override
  String get describeOptionHint => 'صف هذا الخيار';

  @override
  String get goalSelection => 'اختيار الهدف';

  @override
  String get goalSelectionSubtitle => 'حدد خيارات قرارك التي تهمك أكثر.';

  @override
  String get selectAtLeastOneGoal => 'يُرجى تحديد خيار واحد على الأقل';

  @override
  String get goalTipBody =>
      'يمكنك دائمًا تعديل أولوياتك لاحقًا في ملفك الشخصي.';

  @override
  String get goalGrowth => 'النمو';

  @override
  String get goalFinancialGain => 'المكسب المالي ';

  @override
  String get goalRiskReduction => 'تخفيض المخاطر';

  @override
  String get goalPersonalSatisfaction => 'رضا ذاتي';

  @override
  String get goalTimeEfficiency => 'استغلال الوقت على النحو الأمثل';

  @override
  String get goalWorkLifeBalance => 'الموازنة بين العمل والحياة الشخصية';

  @override
  String get goalStability => 'استقرار';

  @override
  String get goalImpact => 'التأثير';

  @override
  String get budgetInput => 'مدخلات الميزانية';

  @override
  String get budgetSubtitle => 'اختر ميزانيتك المقدرة لهذا القرار.';

  @override
  String get budgetImpactLevel => 'مستوى تأثير الميزانية';

  @override
  String get budgetLessThan5k => 'أقل من 5 آلاف';

  @override
  String get enterYourBudget => 'أدخل الميزانية الخاصة بك';

  @override
  String get timeAvailability => 'الوقت المتاح.';

  @override
  String get timeAvailabilitySubtitle => 'حدد إتاحتك للوقت لهذا القرار.';

  @override
  String get experienceLevel => 'مستوي الخبرة';

  @override
  String get experienceSubtitle =>
      'يساعد هذا الذكاء الاصطناعي لدينا على فهم خلفيتك وخبرتك.';

  @override
  String get riskTolerance => 'درجة تحمل المخاطر';

  @override
  String get riskToleranceSubtitle => 'حدد مستوى تحملك للمخاطر لهذا القرار.';

  @override
  String get timeUrgency => 'ضيق الوقت';

  @override
  String get urgencySubtitle => 'حدد مدى إلحاح قرارك.';

  @override
  String get financialRisk => 'مخاطر مالية';

  @override
  String get marketRisk => 'مخاطر السوق';

  @override
  String get timeRisk => 'مخاطر الوقت';

  @override
  String get executionRisk => 'مخاطر التنفيذ';

  @override
  String get personalRisk => 'مخاطر شخصية';

  @override
  String get overallFit => 'الملاءمة العامة';

  @override
  String get firstOption => 'الخيار الأول';

  @override
  String get secondOption => 'الخيار الثاني';

  @override
  String get versus => 'مقابل';

  @override
  String get confidenceInterpretation => 'تفسير الثقة';

  @override
  String get financialImpact => 'الأثر المالي';

  @override
  String get riskLevel => 'مستوى المخاطر';

  @override
  String get timeInvestment => 'استثمار الوقت';

  @override
  String get longTermSustainability => 'الاستدامة على المدى الطويل';

  @override
  String get personalGrowth => 'النمو الشخصي';

  @override
  String get outcomeConsistency => 'اتساق النتائج';

  @override
  String get riskAssessment => 'تقييم المخاطر';

  @override
  String get historicalSimilarity => 'التشابه التاريخي';

  @override
  String get relevanceMatch => 'مطابقة الملاءمة';

  @override
  String get dataQuality => 'جودة البيانات';

  @override
  String get confidenceVeryHigh => 'مرتفع جدًا';

  @override
  String get confidenceModerate => 'متوسط الخطورة';

  @override
  String get confidenceVeryLow => 'منخفض للغاية';

  @override
  String get onboardingAiPowered => 'قائم على تكنولوجيا الذكاء الصناعي.';

  @override
  String get onboardingSmartAnalysis => 'التحليل الذكي لاتخاذ قرارات أفضل';

  @override
  String get onboardingRiskAnalysis => 'تحليل المخاطر';

  @override
  String get onboardingActionablePlans => '-خطط قابلة للتنفيذ';

  @override
  String get onboardingTrustedGuidance => 'التوجيه الموثوق به';

  @override
  String get onboardingDefineGoalLeading => 'حدد هدفك';

  @override
  String get goalWord => 'الهدف';

  @override
  String get onboardingChooseJourney =>
      'اختر رحلة الحياة التي تريد التوجيه بشأنها';

  @override
  String get onboardingCareerPath => 'المسار الوظيفي';

  @override
  String get onboardingCareerPathDesc => 'استكشف الأسواق والمهارات المستقبلية';

  @override
  String get onboardingMajorPurchase => 'الشراء الرئيسي';

  @override
  String get onboardingMajorPurchaseDesc => 'مقارنة خيارات عملية شراء جديدة';

  @override
  String get onboardingLifeChanges => 'الحياة تتغير';

  @override
  String get onboardingLifeChangesDesc => 'التخطيط لعملية نقل أو مرحلة جديدة';

  @override
  String get onboardingPersonalGrowth => 'النمو الشخصي';

  @override
  String get onboardingPersonalGrowthDesc => 'تحديد المهارات وتحولات العقلية';

  @override
  String get onboardingReadyLeading => 'جاهز لـ';

  @override
  String get navigateWord => '[ترجمة المصطلح: Navigate]';

  @override
  String get onboardingReadySubtitle => 'مساعدك الشخصي جاهز للمساعدة';

  @override
  String get onboardingActionableGuidance => 'إرشادات قابلة للتنفيذ';

  @override
  String get onboardingActionableGuidanceDesc => 'احصل على إرشادات لنجاحك';

  @override
  String get onboardingProgressTracking => 'متابعة تقدم الأعمال';

  @override
  String get onboardingProgressTrackingDesc => 'راقب المعالم الرئيسية في رحلتك';

  @override
  String get onboardingAdjustOnTheFly => 'ضبط على الطاير';

  @override
  String get onboardingAdjustDesc => 'إعادة تقييم الخطط مع حدوث الحياة';

  @override
  String get onboardingShareLearn => 'المشاركة والتعلم';

  @override
  String get onboardingShareLearnDesc => 'شارك وتعلم من مساراتك';

  @override
  String get myProfileLeading => 'شعوري';

  @override
  String get preferences => 'التفضيلات';

  @override
  String get personalityPreferences => 'تفضيلات الشخصية';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get tapToChangePhoto => 'اضغط هنا لتغيير الصورة';

  @override
  String get photoPickerComingSoon => 'سيأتي منتقي الصور قريبًا.';

  @override
  String get pickImageSourceTitle => 'تغيير الصورة الشخصية';

  @override
  String get pickFromCamera => 'التقط صورة';

  @override
  String get pickFromGallery => 'اختر من المعرض';

  @override
  String get removePhoto => 'إزالة الصورة';

  @override
  String get cameraPermissionDenied => 'مطلوب إذن الكاميرا لالتقاط صورة.';

  @override
  String get galleryPermissionDenied => 'مطلوب إذن مكتبة الصور لاختيار صورة.';

  @override
  String get openSettings => 'افتح الإعدادات';

  @override
  String get savePreferences => 'حفظ التفضيلات';

  @override
  String get preferencesSaved => 'تم حفظ الإعدادات.';

  @override
  String get personalitySubtitle => 'ساعد الذكاء الاصطناعي على فهمك بشكل أفضل';

  @override
  String get focusAreas => 'مجالات التركيز';

  @override
  String get emptyTitleLeading => 'لا شيء';

  @override
  String get emptyTitleAccent => 'هذا بعد.';

  @override
  String get emptyQuietTitle => 'أنه هادئ هنا';

  @override
  String get emptyHistoryHint => 'ابدأ قرارك الأول وسيظهر سجلك هنا.';

  @override
  String get startADecision => 'بدء اتخاذ قرار';

  @override
  String get helpHereToHelp => 'لقد لخصّنا لك أهم ما فيها.';

  @override
  String get faq => 'الأسئلة الشائعة';

  @override
  String get noResults => 'لا يوجد نتائج';

  @override
  String get errorTitle => '‫حدث خطأ ما‬';

  @override
  String get errorSubtitle => 'لقد واجهنا خطأ غير متوقع. يُرجى إعادة المحاولة.';

  @override
  String get contactSupport => 'الاتصال بالدعم';

  @override
  String get noInternetTitle => 'لا يوجد إتصال';

  @override
  String get noInternetSubtitle =>
      'يُرجى التحقق من اتصالك بالإنترنت وإعادة المحاولة.';

  @override
  String get retryConnection => 'إعادة محاولة الاتصال';

  @override
  String get offlineMode => 'الانتقال إلى وضع عدم الاتصال';

  @override
  String get permissionTitle => 'أذونات التطبيق';

  @override
  String get permissionSubtitle => 'منح الأذونات للحصول على أفضل تجربة سفر.';

  @override
  String get grantAll => 'امنح الكل';

  @override
  String get notNow => '‫ليس الآن‬';

  @override
  String get updateAvailable => 'يتوفر تحديث';

  @override
  String get updateSubtitle => 'يتوفر إصدار جديد مع تحسينات.';

  @override
  String get updateNow => 'قم بالتحديث الآن';

  @override
  String get remindLater => 'ذكرني لاحقاً';

  @override
  String get loadingMessage => 'جهز الأشياء...';

  @override
  String get decisionDetailLeading => 'القرار';

  @override
  String get detailWord => 'التفصيل';

  @override
  String get decisionNotFound => 'لم يتم العثور على القرار';

  @override
  String get overall => 'الإجمالي';

  @override
  String get pros => 'المميزات';

  @override
  String get cons => 'العيوب';

  @override
  String get notes => 'الملاحظات';

  @override
  String get saveAtLeastTwoToCompare => 'وفر قرارين على الأقل للمقارنة.';

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
  String get moderate => 'متوسط الخطورة';

  @override
  String get veryHigh => 'مرتفع جدًا';

  @override
  String get veryLow => 'منخفض للغاية';

  @override
  String get next => 'التالي';

  @override
  String get later => '[ترجمة المصطلح: Later]';

  @override
  String get useWord => 'الاستخدام';

  @override
  String get aboutUsLeading => 'من نحن';

  @override
  String get aboutUsAccent => 'نحن';

  @override
  String get howToUseLeading => 'دليل الاستخدام';

  @override
  String get versionLabel => 'الإصدار 1.0.0';

  @override
  String get dailyDecision => 'القرار اليومي';

  @override
  String get personalityDescription =>
      'تضفي هذه الإعدادات طابعًا شخصيًا على نغمة التوصيات وعمقها.';

  @override
  String get traitOptimism => 'التفاؤل';

  @override
  String get traitPatience => 'الصبر';

  @override
  String get traitDetailFocus => 'التركيز على التفاصيل';

  @override
  String get categoryTravel => 'السياحة';

  @override
  String get helpResponseTime => 'متوسط وقت الاستجابة: أقل من 24 ساعة';

  @override
  String get helpGetInTouch => 'تواصل معنا';

  @override
  String get helpLiveChat => 'الدردشة المباشرة';

  @override
  String get helpLiveChatSub => 'دردش مع فريقنا في الوقت الفعلي';

  @override
  String get helpCall => 'اتصل';

  @override
  String get helpCallSub =>
      'من الإثنين إلى الجمعة 9 صباحًا - 5 مساءً بتوقيت المحيط الهادئ';

  @override
  String get helpSubmitTicket => 'فتح تذكرة';

  @override
  String get helpSubmitTicketSub => 'احصل على بطاقة دعم تم تتبعها';

  @override
  String get helpQuickLinks => 'روابط سريعة';

  @override
  String get faqSubtitle => 'الأسئلة الشائعة التي تمت الإجابة عليها';

  @override
  String get aboutSubtitle => 'الإصدار والاعتمادات والروابط';

  @override
  String get helpOpenLiveChat => 'فتح دردشة حية';

  @override
  String get helpLiveChatSoon =>
      'سيتم فتح الدردشة المباشرة قريبًا — سنرسل إليك بريدًا إلكترونيًا في غضون 24 ساعة.';

  @override
  String get moreOptionsComingSoon => 'ستتوفر المزيد من الخيارات قريباً';

  @override
  String get insightCompoundTitle => 'قم بتعقيد قراراتك';

  @override
  String get insightCompoundMessage =>
      'القرارات المتخذة اليوم تشكل الفرص بعد 6 أشهر. اختر الباب الذي يفتح معظم الأبواب.';

  @override
  String get insightParalysisTitle => 'احذر شلل التحليل';

  @override
  String get insightParalysisMessage =>
      'إذا كنت تفكر في الأمر لأكثر من أسبوع دون معلومات جديدة، فلديك ما يكفي لتقرر.';

  @override
  String get insightRiskStressTitle => 'الخطر لا يساوي الضغط';

  @override
  String get insightRiskStressMessage =>
      'يمكن أن يظل القرار عالي المخاطر منخفض التوتر إذا كان لديك خطة واضحة ب. قم دائمًا بتصميم احتياطك.';

  @override
  String get insightFutureYouTitle => 'المستقبل - أنت تصوت أيضًا';

  @override
  String get insightFutureYouMessage =>
      'قبل أن تقرر، اسأل: هل ستقدم في المستقبل - بعد 5 سنوات من الآن - هدية لك على هذا ؟';

  @override
  String streakDays(int count) {
    return '$count- سلسلة أيام';
  }

  @override
  String get streakKeepGoing => 'استمر - اجعل قرار اليوم محسوبًا.';

  @override
  String get todaysDecisionPrompt => 'قرار اليوم موجه';

  @override
  String get dailyDecisionExerciseSub => 'تمرين قرار سريع لمدة 60 ثانية';

  @override
  String get dailyDecisionQuestion => 'هل يجب أن تقول نعم أو لا لهذه الفرصة ؟';

  @override
  String get dailyDecisionScenario =>
      'يدعوك أحد الزملاء إلى مشروع جانبي. إنه أمر مثير ولكنه يستغرق 10 ساعات في الأسبوع.';

  @override
  String get seeAiAnalysis => 'تحليل الذكاء الاصطناعي';

  @override
  String get errorWhatYouCanDo => 'كيفية الوقاية منه';

  @override
  String get errorTip1 => 'يُرجى التحقُّق من الاتصال بالإنترنت.';

  @override
  String get errorTip2 => 'جرب الحركة مرة أخرى بعد لحظات';

  @override
  String get errorTip3 => 'أعِد تشغيل التطبيق.';

  @override
  String get errorTip4 => 'تواصل مع فريق الدعم إذا استمر حدوث ذلك';

  @override
  String get noInternetYouCanStill => 'ولكنك لا تزالين';

  @override
  String get offlineTip1 => 'عرض القرارات والسجل المحفوظ';

  @override
  String get offlineTip2 => 'اقرأ ملاحظاتك وخطط العمل الخاصة بك';

  @override
  String get offlineTip3 => 'تصفح الأسئلة الشائعة وحول';

  @override
  String get permissionNotificationsDesc =>
      'احصل على تذكيرات ومطالبات يومية لاتخاذ القرار';

  @override
  String get permissionLocation => 'الموقع';

  @override
  String get permissionLocationDesc =>
      'تستخدم فقط للاقتراحات القائمة على الموقع';

  @override
  String get permissionStorage => '--';

  @override
  String get permissionStorageDesc => 'احفظ تقاريرك وصادراتك محليًا';

  @override
  String get permissionSettingsNote =>
      'يمكنك تغيير الأذونات في أي وقت من الإعدادات';

  @override
  String updateVersionReady(String version) {
    return 'الإصدار __PH0 __ جاهز للتثبيت';
  }

  @override
  String get whatsNew => 'ما الجديد؟';

  @override
  String get updateFeature1 => 'تحليل أسرع للذكاء الاصطناعي (2x تسريع)';

  @override
  String get updateFeature2 => 'وحدة جديدة للمستشار الوظيفي';

  @override
  String get updateFeature3 => 'تباين محسّن في الوضع المظلم';

  @override
  String get updateFeature4 => 'إصلاحات الأخطاء وتحسينات الاستقرار';

  @override
  String get loadingSubtitle => 'عادة ما يستغرق هذا بضع ثوانٍ فقط';

  @override
  String get howToUseStep1Title => 'حدد قرارك';

  @override
  String get howToUseStep1Body => 'ابدأ بوصف قرارك وفئتك وما يهمك أكثر.';

  @override
  String get howToUseStep2Title => 'تحليل خياراتك';

  @override
  String get howToUseStep2Body =>
      'الإجابة على الأسئلة الموجهة حول الأهداف والإلحاح والميزانية وتحمل المخاطر.';

  @override
  String get howToUseStep3Title => 'مراجعة نتائج الذكاء الاصطناعي';

  @override
  String get howToUseStep3Body =>
      'انظر توصياتك، ودرجة المخاطر، والإيجابيات والسلبيات، وخطة العمل خطوة بخطوة.';

  @override
  String get howToUseStep4Title => 'حفظ وتتبع التقدم';

  @override
  String get howToUseStep4Body =>
      'احفظ القرارات في السجل وأعد النظر في الرؤى كلما احتجت إلى إرشادات.';

  @override
  String get clientSelectionLeading => 'العميل';

  @override
  String get clientSelectionAccent => 'الاختيار';

  @override
  String get whichClientQuestion => 'من العميل الذي يجب أن تقول له نعم ؟';

  @override
  String get clientSelectionSubtitle =>
      'يسجل الذكاء الاصطناعي فرص العميل حسب الملاءمة والرسوم والمخاطر.';

  @override
  String get freelancePricingLeading => 'عمل حر';

  @override
  String get freelancePricingAccent => 'التسعيرة';

  @override
  String get recommendedPrice => 'السعر الموصى به ';

  @override
  String get pricingScore => 'درجة التسعير';

  @override
  String get priceComparison => 'مقارنة الأسعار';

  @override
  String get priceDrivers => 'محركات الأسعار | الرصاص';

  @override
  String get marketRate => 'سعر السوق ، - خارج المصارف';

  @override
  String get experienceLabel => 'عدد سنوات الخبرة';

  @override
  String get timelineLabel => 'الجدول الزمني';

  @override
  String get complexityLabel => 'التعقيد';

  @override
  String get projectValue => 'قيمة المشروع';

  @override
  String get sendProposal => 'ارسال عرض السعر';

  @override
  String get proposalSent => 'تم إرسال الاقتراح إلى العميل.';

  @override
  String get productivityLeading => 'الإنتاجية';

  @override
  String get productivityAccent => 'المخطِّط';

  @override
  String get eisenhowerPriority => 'أولوية أيزنهاور';

  @override
  String get startFocusBlock => 'بدء كتلة التركيز';

  @override
  String get focusBlockStarted => 'بدأت كتلة التركيز — حظًا سعيدًا!';

  @override
  String get careerAdvisorLeading => 'الوظائف';

  @override
  String get careerAdvisorAccent => 'مستشار ';

  @override
  String get careerFitScore => 'درجة الملاءمة المهنية';

  @override
  String get topPathProductManager => 'المسار الأعلى: مدير المنتج';

  @override
  String get skillMatch => 'تطابق المهارات';

  @override
  String get strategyLabel => 'إعداد الاستراتيجيات';

  @override
  String get communicationLabel => 'المواد الإعلامية';

  @override
  String get analyticsLabel => 'التحليلات';

  @override
  String get technicalLabel => 'الفني';

  @override
  String get build90DayPlan => 'بناء خطة لمدة 90 يومًا';

  @override
  String get businessIdeaLeading => 'بنية الأعمال';

  @override
  String get businessIdeaAccent => 'الفكرة';

  @override
  String get describeBusinessIdea => 'صف فكرة مشروعك';

  @override
  String get businessIdeaSubtitle =>
      'سيسجل الذكاء الاصطناعي الجدوى وملاءمة السوق والمخاطر.';

  @override
  String get viabilityScore => 'درجة الجدوى';

  @override
  String get scoreBreakdown => 'تفصيل الدرجات';

  @override
  String get aiVerdict => 'قرار منظمة العفو الدولية';

  @override
  String get fullPlanGenerated => 'تم إنشاء الخطة الكاملة وحفظها.';

  @override
  String get financialCalcLeading => 'ماليًا';

  @override
  String get financialCalcAccent => '[ترجمة المصطلح: Calculator]';

  @override
  String get compoundGrowth =>
      'معدل النمو المتراكم (التراكمي)/نمو الفائدة المركبة';

  @override
  String get futureValue => 'القيمة المستقبلية';

  @override
  String get saveToDecisions => 'الحفظ إلى القرارات';

  @override
  String get saveDecisionLeading => '[ترجمة المصطلح: Save]';

  @override
  String get saveDecisionAccent => 'القرار';

  @override
  String get decisionSaved => 'تم حفظ القرار.';

  @override
  String get folderLabel => 'حافظة أوراق';

  @override
  String get folderDefault => 'تقصير';

  @override
  String get folderCareer => 'الوظائف';

  @override
  String get folderFinance => 'مالية';

  @override
  String get folderHealth => 'الصحة';

  @override
  String get folderPersonal => 'شخصي';

  @override
  String get reportExportLeading => 'تصدير';

  @override
  String get reportExportAccent => 'تقرير';

  @override
  String get exportReport => 'تصدير التقرير';

  @override
  String get shareReport => 'مشاركة التقرير';

  @override
  String get subscriptionLeading => 'اختر';

  @override
  String get subscriptionAccent => 'خطة';

  @override
  String get mostPopular => 'الأكثر شعبية';

  @override
  String get freeTrial => 'تجربة مجانية لمدة 7 أيام';

  @override
  String get upgradePremium => 'الترقية إلى النسخة المميزة';

  @override
  String get choosePlan => 'اختر باقة';

  @override
  String get paymentSuccessful => 'تم الدفع بنجاح!';

  @override
  String get thankYouUpgrade => 'شكرًا لك على الترقية إلى الإصدار المميز.';

  @override
  String get goToDashboard => 'الانتقال إلى لوحة المعلومات';

  @override
  String get paymentDetails => 'تفاصيل الدفع';

  @override
  String get payNow => 'إدفع الآن';

  @override
  String get cardNumber => 'رقم البطاقة';

  @override
  String get nameOnCard => 'الاسم على البطاقة';

  @override
  String get premiumFeatures => 'المميزات الاحترافية';

  @override
  String get faqSearchHint => 'البحث في تعديل الأسئلة والأجوبة';

  @override
  String get topicAll => 'الكل';

  @override
  String get topicGettingStarted => 'بدء الاستخدام';

  @override
  String get topicAi => 'الذكاء الاصطناعي';

  @override
  String get topicBilling => 'إصدار الفواتير';

  @override
  String get topicAccount => 'الحساب';

  @override
  String get tabAll => 'الكل';

  @override
  String get tabUnread => 'غير مقروء';

  @override
  String get tabArchived => 'مؤرشف';

  @override
  String get noArchivedItems => 'لا توجد عناصر مؤرشفة';

  @override
  String get traitRiskTolerance => 'درجة تحمل المخاطر';

  @override
  String get budgetWhyMatters =>
      'تساعد الميزانية الذكاء الاصطناعي على الموازنة بين المقايضات المالية في توصيتك.';

  @override
  String get timeWhyMatters =>
      'يحدد توفر الوقت مدى الطموح الذي يجب أن تكون عليه خطة عملك.';

  @override
  String get experienceWhyMatters =>
      'يساعد مستوى الخبرة الذكاء الاصطناعي على معايرة النصيحة لخلفيتك.';

  @override
  String get riskWhyMatters => 'يحدد مدى تحمل المخاطر مدى تحفظ أو جرأة توصيتك.';

  @override
  String get urgencyWhyMatters =>
      'يؤثر الإلحاح على مدى السرعة التي يجب أن تتصرف بها بناءً على التوصية.';

  @override
  String get confidenceReliableRecommend => 'توصية موثوقة بشكل عام';

  @override
  String get confidenceReliableSomeRisks => 'موثوقة بشكل عام مع بعض المخاطر';

  @override
  String get confidenceConsiderRisks => 'ضع في اعتبارك المخاطر بعناية';

  @override
  String get confidenceHighUncertainty => 'عدم يقين كبير — تابع بحذر';

  @override
  String get stepResults => 'النتائج';

  @override
  String get urgencyNoRush => 'لا داعي للعجلة';

  @override
  String get urgencyModerate => 'متوسط الخطورة';

  @override
  String get urgencyUrgent => 'عاجل';

  @override
  String get urgencyCritical => 'عالي الخطورة';

  @override
  String get experienceBeginner => 'مبتدئ';

  @override
  String get experienceIntermediate => 'متقن';

  @override
  String get experienceAdvanced => 'متقدّم';

  @override
  String get experienceExpert => 'متمكّن';

  @override
  String get timeVeryLimited => 'محدود جداً';

  @override
  String get timeLimited => 'محدود';

  @override
  String get timeModerateAvail => 'متوسط الخطورة';

  @override
  String get timeHighAvail => 'مرتفع';

  @override
  String get timeVeryHigh => 'مرتفع جدًا';

  @override
  String get riskToleranceLow => 'منخفضة';

  @override
  String get riskToleranceModerate => 'متوسط الخطورة';

  @override
  String get riskToleranceHigh => 'مرتفع';

  @override
  String get riskToleranceVeryHigh => 'مرتفع جدًا';

  @override
  String get doNow => 'للتنفيذ الآن';

  @override
  String get doToday => 'افعل اليوم';

  @override
  String get scheduleLabel => 'الجدول';

  @override
  String get deleteLabel => 'حذف';

  @override
  String get tipLabel => 'معلومة';

  @override
  String get aiRecommendation => '[توصيات AI]';

  @override
  String get comparisonMenu => 'المقارنة';

  @override
  String get clientSelectionVerdictBody =>
      'أكمي هو الخيار الأقوى — قل نعم. العميل الغامض: رفض بأدب ؛ تتنبأ الملخصات الغامضة بزحف النطاق.';

  @override
  String get freelancePricingSubtitle => 'توصيات مدعومة بالذكاء الاصطناعي';

  @override
  String get priceLower => 'اط ا ئ';

  @override
  String get priceRecommended => 'الخيار المقترح';

  @override
  String get priceHigher => 'مرتفعة';

  @override
  String get freelancePricingRecommendationBody =>
      'السعر عند 2,800 \$ للفوز بهذا العميل بهامش جيد. إذا رفضوا، فقم بالارتكاز على النطاق بدلاً من انخفاض السعر.';

  @override
  String get productivitySubtitle =>
      'يقوم الذكاء الاصطناعي بترتيب ما يجب القيام به الآن، وما يجب جدولته، وما يجب تركه.';

  @override
  String get productivityTipBody =>
      'إذا كان كل شيء عاجلًا، فلا شيء كذلك. اختر من عنصر إلى عنصرين الآن وقم بحمايتهما مثل الاجتماعات.';

  @override
  String get careerAdvisorDescription =>
      'تناسب قوي بناءً على مهاراتك وأسلوب التواصل واهتمامك بالنمو.';

  @override
  String get nextSteps => 'الخطوات المقبلة';

  @override
  String get careerAdvisorNextStepsBody =>
      'قيادة مبادرة صغيرة متعددة الوظائف هذا الربع لبناء سجل حافل على غرار PM.';

  @override
  String get excellent => 'ممتاز';

  @override
  String get good => 'جيد';

  @override
  String get businessIdeaHint =>
      'على سبيل المثال، صندوق اشتراك للنباتات الداخلية مع تذكيرات العناية بالذكاء الاصطناعي';

  @override
  String get marketSize => 'حجم السوق';

  @override
  String get competition => 'مسابقة';

  @override
  String get profitability => 'الربحية';

  @override
  String get executionEase => 'سهولة التنفيذ';

  @override
  String get large => 'الأوقاف الكبيرة';

  @override
  String get businessIdeaVerdictBody =>
      'مفهوم قوي مع جمهور واضح. ركز في أول 90 يومًا على الحصول على 20 عميلًا يدفعون قبل توسيع نطاق التسويق.';

  @override
  String get generateFullPlan => 'إنشاء خطة كاملة';

  @override
  String get financialCalcSubtitle =>
      'تعرف على ما تنمو إليه أموالك بمرور الوقت.';

  @override
  String get financialInitialAmount => 'الدفعة الأولي';

  @override
  String get financialAnnualRate => 'المعدل السنوي';

  @override
  String get financialDuration => 'المدة (بالأعوام)';

  @override
  String get financialCalcTipBody =>
      'حتى المساهمات الشهرية الصغيرة تتفوق على الودائع الكبيرة لمرة واحدة على مدار أكثر من 10 سنوات.';

  @override
  String get saveDecisionNotesHint => 'أي شيء تريد أن تتذكره عن هذا القرار';

  @override
  String get reportExportSubtitle => 'احفظ أو شارك تقرير قرارك';

  @override
  String get completed => 'مكتمل';

  @override
  String get goAhead => 'تفضل';

  @override
  String get includeInReport => 'تضمين في التقرير';

  @override
  String get executiveSummary => 'ملخص تنفيذي';

  @override
  String get analysisDetails => 'تفاصيل التحليل';

  @override
  String get notesAndInputs => 'الملاحظات والمدخلات';

  @override
  String get exportFormat => 'تنسيق التصدير';

  @override
  String get pdfBestForSharing => 'الأفضل للمشاركة';

  @override
  String get excelDataScores => 'البيانات والنتائج';

  @override
  String get wordDocument => 'وثيقة';

  @override
  String get imageJpgPng => 'جبغ / بابوا نيو غينيا';

  @override
  String get shareOrSave => 'شارك أو احفظ';

  @override
  String get shareLink => 'مشاركة الرابط';

  @override
  String get createShareableLink => 'قم بإنشاء رابط قابل للمشاركة';

  @override
  String get emailReport => 'تقرير البريد الإلكتروني';

  @override
  String get sendViaEmail => 'إرسال عبر البريد الإلكتروني';

  @override
  String get saveToDevice => 'حفظ إلى الجهاز';

  @override
  String get downloadToDevice => 'تحميل على الجهاز';

  @override
  String get scheduleAutoReports => 'جدولة التقارير التلقائية';

  @override
  String exportedAs(String format) {
    return 'تم التصدير بتنسيق $format';
  }

  @override
  String get subscriptionSubtitle =>
      'اتخذ قرارات أكثر ذكاءً باستخدام الخطة المناسبة لك';

  @override
  String get makeSmarterDecisions => 'اتخذ قرارات أكثر ذكاءً';

  @override
  String get subscriptionHeroBody =>
      'أطلق العنان لتحليلات الذكاء الاصطناعي غير المحدودة والرؤى العميقة والتوصيات المخصصة.';

  @override
  String get planBasic => 'أساسي';

  @override
  String get planPremium => 'غالي';

  @override
  String get planPro => 'برو';

  @override
  String get perMonth => '/شهر';

  @override
  String get allPlansInclude => 'تشمل جميع الخطط';

  @override
  String get moneyBackGuarantee => 'ضمان استعادة الأموال لمدة 7 أيام';

  @override
  String get moneyBackGuaranteeBody =>
      'غير راض؟ احصل على كامل المبلغ خلال 7 أيام.';

  @override
  String get subscribeTermsNote =>
      'بالاشتراك فإنك توافق على الشروط وسياسة الخصوصية الخاصة بنا.';

  @override
  String get securePaymentEncryption =>
      'الدفع الآمن باستخدام التشفير المتوافق مع معايير الصناعة';

  @override
  String get paymentLeading => 'قسط';

  @override
  String get paymentAccent => 'تفاصيل';

  @override
  String get premiumMonthly => 'قسط • شهري';

  @override
  String get taxEstimate => 'تقدير الضريبة';

  @override
  String get totalToday => 'المجموع اليوم';

  @override
  String get paymentMethod => 'طريقة الدفع';

  @override
  String get paymentCard => 'بطاقة';

  @override
  String get paymentPayPal => 'باي بال';

  @override
  String get paymentGooglePay => 'جوجل الدفع';

  @override
  String get paymentApplePay => 'أبل الدفع';

  @override
  String get cardExpiryHint => 'مم / سنة';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'مشفرة من النهاية إلى النهاية. نحن لا نقوم بتخزين بطاقتك أبدًا.';

  @override
  String get premiumFeaturesLeading => 'غالي';

  @override
  String get premiumFeaturesAccent => 'سمات';

  @override
  String get premiumUnlockSubtitle =>
      'أطلق العنان للقوة الكاملة لـ Life Navigator';

  @override
  String get premiumFeature1Title => 'تحليل الذكاء الاصطناعي غير المحدود';

  @override
  String get premiumFeature1Body =>
      'تنفيذ العديد من القرارات التي تحتاج إليها.';

  @override
  String get premiumFeature2Title => 'رؤى عميقة';

  @override
  String get premiumFeature2Body =>
      'الرسوم البيانية للمخاطر والثقة والنتائج والتأثير.';

  @override
  String get premiumFeature3Title => 'مقارنة القرارات';

  @override
  String get premiumFeature3Body => 'انظر القرارات جنبا إلى جنب.';

  @override
  String get premiumFeature4Title => 'تصدير التقارير';

  @override
  String get premiumFeature4Body => 'تصدير ملفات PDF وWord وExcel والصور.';

  @override
  String get premiumFeature5Title => 'مزامنة السحابة';

  @override
  String get premiumFeature5Body => 'تم نسخها احتياطيًا بشكل آمن إلى السحابة.';

  @override
  String get premiumFeature6Title => 'دعم الأولوية';

  @override
  String get premiumFeature6Body => 'الرد خلال 24 ساعة.';

  @override
  String get paymentSuccessLeading => 'قسط';

  @override
  String get paymentSuccessAccent => 'ناجح!';

  @override
  String get youNowHaveAccessTo => 'لديك الآن إمكانية الوصول إلى';

  @override
  String get planLabel => 'يخطط';

  @override
  String get amountLabel => 'كمية';

  @override
  String get methodLabel => 'طريقة';

  @override
  String get transactionIdLabel => 'معرف المعاملة';

  @override
  String get unlimitedAi => 'ذكاء اصطناعي غير محدود';

  @override
  String get deepInsightsShort => 'رؤى عميقة';

  @override
  String get compareShort => 'يقارن';

  @override
  String get exportsShort => 'صادرات';

  @override
  String get cloudSyncShort => 'مزامنة السحابة';

  @override
  String get prioritySupportShort => 'دعم الأولوية';

  @override
  String get privacyLeading => 'خصوصية';

  @override
  String get privacyAccent => 'سياسة';

  @override
  String get privacyLastUpdated => 'آخر تحديث: 18 مايو 2026';

  @override
  String get privacySection1Title => 'ما نجمعه';

  @override
  String get privacySection1Body =>
      'نحن نجمع فقط ما تقدمه لنا - القرارات التي تحفظها، وتفاصيل حسابك (الاسم + البريد الإلكتروني)، وتفضيلاتك. كل شيء آخر يبقى على جهازك.';

  @override
  String get privacySection2Title => 'كيف نستخدمها';

  @override
  String get privacySection2Body =>
      'لتخصيص توصيات الذكاء الاصطناعي، قم بمزامنة بياناتك إذا اخترت ذلك، وقم بتحسين التطبيق. نحن لا نبيع بياناتك أبدًا لأطراف ثالثة.';

  @override
  String get privacySection3Title => 'التخزين المحلي الأول';

  @override
  String get privacySection3Body =>
      'يتم تخزين قراراتك على جهازك بشكل افتراضي. يتم تمكين المزامنة السحابية وتشفيرها أثناء النقل وأثناء الراحة.';

  @override
  String get privacySection4Title => 'حقوقك';

  @override
  String get privacySection4Body =>
      'يمكنك تصدير جميع بياناتك أو حذفها في أي وقت من الإعدادات. نرد على طلبات البيانات في غضون 7 أيام.';

  @override
  String get privacySection5Title => 'أطفال';

  @override
  String get privacySection5Body =>
      'AI Life Navigator غير مخصص للأطفال دون سن 13 عامًا. نحن لا نجمع بيانات من الأطفال عن قصد.';

  @override
  String get privacySection6Title => 'اتصل بنا';

  @override
  String get privacySection6Body =>
      'أسئلة أو مخاوف؟ أرسل بريدًا إلكترونيًا إلى العنوان Privacy@lifenavigator.app وسنقوم بالرد عليك خلال يومي عمل.';

  @override
  String get termsLeading => 'شروط';

  @override
  String get termsAccent => 'خدمة';

  @override
  String get termsLastUpdated => 'آخر تحديث: 18 مايو 2026';

  @override
  String get termsSection1Title => '1. القبول';

  @override
  String get termsSection1Body =>
      'باستخدام AI Life Navigator فإنك توافق على هذه الشروط. إذا كنت لا توافق، يرجى عدم استخدام التطبيق.';

  @override
  String get termsSection2Title => '2. الحساب';

  @override
  String get termsSection2Body =>
      'أنت مسؤول عن الحفاظ على أمان حسابك. لا تشارك بيانات الاعتماد الخاصة بك.';

  @override
  String get termsSection3Title => '3. توصيات الذكاء الاصطناعي';

  @override
  String get termsSection3Body =>
      'إن مخرجات الذكاء الاصطناعي هي توجيهات وليست مشورة مهنية. أنت مسؤول عن القرارات التي تتخذها بناءً عليها.';

  @override
  String get termsSection4Title => '4. الاشتراكات';

  @override
  String get termsSection4Body =>
      'يتم تجديد الخطط المميزة تلقائيًا حتى يتم إلغاؤها. يمكنك الإلغاء في أي وقت من حساب المتجر الخاص بك.';

  @override
  String get termsSection5Title => '5. الاستخدام المقبول';

  @override
  String get termsSection5Body =>
      'لا يوجد محتوى مسيء، ولا هندسة عكسية، ولا تجريف. قد تؤدي الانتهاكات إلى تعليق الحساب.';

  @override
  String get termsSection6Title => '6. حدود المسؤولية';

  @override
  String get termsSection6Body =>
      'إلى الحد الأقصى الذي يسمح به القانون، تقتصر مسؤوليتنا على المبلغ الذي دفعته لنا في الأشهر الـ 12 السابقة.';

  @override
  String get termsSection7Title => '7. التغييرات';

  @override
  String get termsSection7Body =>
      'يجوز لنا تحديث هذه الشروط. سنخطرك بالتغييرات المادية عبر إشعار داخل التطبيق أو عبر البريد الإلكتروني.';

  @override
  String get faqQ1 => 'كيف أبدأ باتخاذ قرار جديد؟';

  @override
  String get faqA1 =>
      'اضغط على بطاقة \"بدء تحليل جديد\" على الشاشة الرئيسية، ثم أعط قرارك عنوانًا، واتبع الخطوات الإرشادية.';

  @override
  String get faqQ2 => 'هل بياناتي خاصة؟';

  @override
  String get faqA2 =>
      'نعم. يتم تخزين القرارات محليًا على جهازك بشكل افتراضي. المزامنة السحابية قابلة للاشتراك ومشفرة.';

  @override
  String get faqQ3 => 'ما مدى دقة الذكاء الاصطناعي؟';

  @override
  String get faqA3 =>
      'يوفر الذكاء الاصطناعي إرشادات منظمة، وليس مشورة مهنية. استخدمها كمساعدة على التفكير إلى جانب حكمك الخاص.';

  @override
  String get faqQ4 => 'هل يستطيع الذكاء الاصطناعي الوصول إلى محادثاتي؟';

  @override
  String get faqA4 =>
      'لا. يتم استخدام المدخلات التي ترسلها في تدفق القرار فقط. تتم قراءة أي شيء آخر من جهازك.';

  @override
  String get faqQ5 => 'كيف يمكنني إلغاء اشتراكي؟';

  @override
  String get faqA5 =>
      'قم بالإلغاء في أي وقت من صفحة الاشتراك في App Store / Google Play. ويستمر الوصول حتى انتهاء الفترة.';

  @override
  String get faqQ6 => 'هل تقدمون المبالغ المستردة؟';

  @override
  String get faqA6 =>
      'نعم - خلال 7 أيام من أول عملية شراء. البريد الإلكتروني support@lifenavigator.app.';

  @override
  String get faqQ7 => 'كيف يمكنني حذف حسابي؟';

  @override
  String get faqA7 =>
      'الإعدادات → الحساب → حذف الحساب. تتم إزالة كافة البيانات الخاصة بك في غضون 30 يوما.';

  @override
  String get faqQ8 => 'هل يمكنني تصدير قراراتي؟';

  @override
  String get faqA8 =>
      'نعم. افتح أي قرار محفوظ واضغط على \"تصدير التقرير\" لتنزيله بصيغة PDF أو Word أو Excel أو صورة.';

  @override
  String get notificationsLeading => 'يخطر';

  @override
  String get notificationsAccent => 'الكاتيونات';

  @override
  String get decisionTextRiskFallback =>
      'قم بإجراء تحليل كامل للحصول على نصائح مخصصة للحد من المخاطر.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'مستوى المخاطرة الإجمالي لديك هو $label ($score%). قم بمراجعة التفاصيل أدناه لفهم الأسباب التي تؤدي إلى هذه النتيجة.';
  }
}
