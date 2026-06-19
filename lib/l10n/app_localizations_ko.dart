// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'AI 라이프 네비게이터';

  @override
  String get navHome => '홈';

  @override
  String get navChatbot => 'AI 채팅';

  @override
  String get navInsights => '통찰력';

  @override
  String get navHistory => '역사';

  @override
  String get continueButton => '계속';

  @override
  String get nextButton => '다음';

  @override
  String get backButton => '뒤쪽에';

  @override
  String get saveButton => '구하다';

  @override
  String get analyzeButton => '분석하다';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get viewAll => '모두 보기';

  @override
  String get searchHint => '찾다...';

  @override
  String get selectLanguage => '선택하다';

  @override
  String get languageWord => '언어';

  @override
  String get searchLanguageHint => '여기서 언어를 검색하세요...';

  @override
  String get noLanguagesFound => '언어를 찾을 수 없습니다.';

  @override
  String get settings => '설정';

  @override
  String get accountSettings => '계정 설정';

  @override
  String get languages => '언어';

  @override
  String get theme => '주제';

  @override
  String get notifications => '알림';

  @override
  String get privacyPolicy => '개인 정보 보호 정책';

  @override
  String get termsOfService => '서비스 약관';

  @override
  String get helpSupport => '도움말 및 지원';

  @override
  String get logout => '로그아웃';

  @override
  String get welcomeBack => '돌아온 것을 환영합니다!';

  @override
  String get emailAddress => '이메일 주소';

  @override
  String get password => '비밀번호';

  @override
  String get login => '로그인';

  @override
  String get signUp => '가입';

  @override
  String get forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get rememberMe => '나를 기억해';

  @override
  String goodMorning(String name) {
    return '좋은 아침입니다, $name 👋';
  }

  @override
  String get homeSubtitle => '다음 중요한 결정을 위해 AI 기반 지침을 받으세요.';

  @override
  String get startNewAnalysis => '새 분석 시작';

  @override
  String get startAnalysisSubtitle => '안내 분석을 시작하고 맞춤형 추천을 받으세요.';

  @override
  String get decisionOverview => '결정 개요';

  @override
  String get riskScore => '위험 점수';

  @override
  String get successChance => '성공 확률';

  @override
  String get activePlans => '활성 계획';

  @override
  String get inProgress => '진행 중';

  @override
  String get recentInsights => '최근 통찰';

  @override
  String get stepDefine => '정의';

  @override
  String get stepAnalyze => '분석';

  @override
  String get stepQuestions => '질문';

  @override
  String get stepResult => '결과';

  @override
  String get defineYourProblem => '당신의 정의';

  @override
  String get problemWord => '문제';

  @override
  String get tellUsMore => '결정에 대해 자세히 알려주세요.';

  @override
  String get wizardHint => '더 많은 세부 정보를 제공할수록 AI가 더 효과적으로 분석하고 안내할 수 있습니다.';

  @override
  String get describeDecision => '귀하의 결정을 설명하십시오';

  @override
  String get quickTips => '빠른 팁';

  @override
  String get beSpecific => '구체적으로 말하라';

  @override
  String get includeContext => '컨텍스트 포함';

  @override
  String get mentionGoal => '목표 언급';

  @override
  String get choosingBetween => '당신은 무엇을 선택하고 있나요?';

  @override
  String get optionsHint => '최대 5개의 옵션을 나열하세요. AI는 귀하의 목표와 각각의 가치를 평가합니다.';

  @override
  String get addAnotherOption => '다른 옵션 추가';

  @override
  String get continueToAnalysis => '계속해서 분석하기';

  @override
  String get aiQuestionsTitle => '일체 포함';

  @override
  String get questionsWord => '질문';

  @override
  String get preparingQuestions => '맞춤형 질문 준비 중…';

  @override
  String basedOnDecision(String title) {
    return '귀하의 결정에 따라: $title';
  }

  @override
  String get basedOnWizard => '마법사에서 공유한 내용을 기반으로 합니다.';

  @override
  String get aiNavigator => 'AI 라이프 네비게이터';

  @override
  String get aiQuestionsHint => '정직하게 답변하십시오. 귀하의 답변이 AI 분석을 형성합니다.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'AI는 특별히 \"$title\"에 대해 이러한 질문을 생성했습니다.';
  }

  @override
  String questionOf(int current, int total) {
    return '$total의 질문 $current';
  }

  @override
  String get whyThisMatters => '이것이 왜 중요한가요?';

  @override
  String get whyQuestionsMatter =>
      '귀하의 답변은 AI가 귀하의 상황과 가장 관련성이 높은 것에 집중하는 데 도움이 됩니다.';

  @override
  String get securePrivate => '귀하의 데이터는 안전하고 비공개입니다';

  @override
  String get processingAnalyzing => '옵션 분석 중...';

  @override
  String get processingRisk => '위험 요인 계산 중...';

  @override
  String get processingOutcomes => '결과를 예측하는 중...';

  @override
  String get processingPlan => '실행 계획 수립 중...';

  @override
  String get processingFinalizing => '최종 결과';

  @override
  String get decisionResult => '결정';

  @override
  String get resultWord => '결과';

  @override
  String get recommendedChoice => '추천 선택';

  @override
  String get benefitScore => '혜택 점수';

  @override
  String get confidence => '신뢰';

  @override
  String get fitScore => '적합점수';

  @override
  String get resultBreakdown => '결과 분석';

  @override
  String get finalRecommendation => '최종 권고사항';

  @override
  String get outcomePrediction => '결과 예측';

  @override
  String get confidenceMeter => '신뢰도 측정기';

  @override
  String get actionPlan => '실천 계획';

  @override
  String get prosCons => '장점과 단점';

  @override
  String get tipFromAi => 'AI가 알려주는 팁';

  @override
  String get saveReport => '보고서 저장';

  @override
  String get startNewDecision => '새로운 결정을 시작하다';

  @override
  String get decisionWord => '결정';

  @override
  String get comparisonWord => '비교';

  @override
  String get whyRecommended => '이것이 권장되는 이유는 무엇입니까?';

  @override
  String get riskBreakdown => '위험 분석';

  @override
  String get riskInterpretation => '위험 해석';

  @override
  String get howToImprove => '개선 방법';

  @override
  String get overallConfidence => '전반적인 자신감';

  @override
  String get confidenceBreakdown => '신뢰도 분석';

  @override
  String get successLikelihood => '성공 가능성';

  @override
  String get outcomeBreakdown => '결과 분석';

  @override
  String get keyOutcomeFactors => '주요 결과 요인';

  @override
  String get prosTitle => '이 결정의 장점';

  @override
  String get consTitle => '이 결정의 단점';

  @override
  String get overallProsCons => '전반적인 장단점';

  @override
  String get bestOverallFit => '전체적으로 핏이 제일 좋음';

  @override
  String get bestOverallChoice => '전반적으로 최고의 선택';

  @override
  String get recommendedChoiceLabel => '추천 선택';

  @override
  String get yourActionPlan => '귀하의 실천 계획';

  @override
  String get aiInsight => 'AI 인사이트';

  @override
  String get keyComparison => '주요 비교';

  @override
  String get overallScore => '종합점수';

  @override
  String get keyPoints => '핵심사항';

  @override
  String get analysisFailed => '분석에 실패했습니다. 인터넷 및 API 키를 확인하세요.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY가 누락되었습니다. .env에 추가하고 앱을 다시 시작하세요.';

  @override
  String get noDescription => '설명이 제공되지 않았습니다.';

  @override
  String get history => '역사';

  @override
  String get about => '에 대한';

  @override
  String get profile => '윤곽';

  @override
  String get editProfile => '프로필 편집';

  @override
  String get low => '낮은';

  @override
  String get medium => '중간';

  @override
  String get high => '높은';

  @override
  String get lowRisk => '낮은 위험';

  @override
  String get mediumRisk => '중간 위험';

  @override
  String get highRisk => '위험';

  @override
  String get notAssessed => '평가되지 않음';

  @override
  String get couldNotLoadQuestions => '질문을 로드할 수 없습니다.';

  @override
  String get noQuestionsGenerated => '질문이 생성되지 않았습니다.';

  @override
  String get onboardingTitle1 => 'AI로 더 스마트한 결정을 내리세요';

  @override
  String get onboardingSubtitle1 => '인생의 중요한 선택에 대한 맞춤형 지침을 받아보세요.';

  @override
  String get onboardingTitle2 => '위험 및 결과 분석';

  @override
  String get onboardingSubtitle2 => '커밋하기 전에 장단점을 이해하세요.';

  @override
  String get onboardingTitle3 => '명확한 실행 계획을 따르십시오.';

  @override
  String get onboardingSubtitle3 => '통찰력을 실용적인 다음 단계로 전환하세요.';

  @override
  String get getStarted => '시작하기';

  @override
  String get skip => '건너뛰기';

  @override
  String get darkMode => '다크 모드';

  @override
  String get lightMode => '라이트 모드';

  @override
  String get systemDefault => '시스템 기본값';

  @override
  String get generalSettings => '일반 설정';

  @override
  String get support => '지원하다';

  @override
  String get legal => '합법적인';

  @override
  String get languageChanged => '언어가 업데이트되었습니다.';

  @override
  String get yourOptions => '귀하의 옵션';

  @override
  String get recommended => '추천';

  @override
  String get compareOptions => '옵션 비교';

  @override
  String get plan => '계획';

  @override
  String get prepare => '준비하다';

  @override
  String get execute => '실행하다';

  @override
  String get positiveOutcome => '긍정적인 결과';

  @override
  String get neutralOutcome => '중립적인 결과';

  @override
  String get negativeOutcome => '부정적인 결과';

  @override
  String get overallRiskScore => '전체 위험 점수';

  @override
  String get yourDecisionRiskLevel => '귀하의 결정 위험 수준';

  @override
  String get overallPrediction => '전반적인 예측';

  @override
  String get overallProsConsTitle => '전반적인 장단점';

  @override
  String get emptyHistory => '아직 저장된 결정이 없습니다.';

  @override
  String get startFirstDecision => '첫 번째 의사결정 분석을 시작하세요';

  @override
  String get chatbotTitle => 'AI 챗봇';

  @override
  String get insightsTitle => '통찰력';

  @override
  String get dailySuggestion => '일일 제안';

  @override
  String get aboutTagline => 'AI를 기반으로 한 현명한 의사 결정 지원 — 옵션, 위험 및 다음 단계를 평가합니다.';

  @override
  String get aboutBody =>
      'AI Life Navigator는 구조화된 질문, 위험 분석, 명확한 실행 계획을 통해 인생과 직업 결정을 내리는 데 도움이 됩니다.';

  @override
  String get personalInformation => '개인정보';

  @override
  String get appSetting => '앱 설정';

  @override
  String get securityPrivacy => '보안 및 개인정보 보호';

  @override
  String get aboutUs => '회사 소개';

  @override
  String get howToUse => '사용 방법';

  @override
  String get appTheme => '앱 테마';

  @override
  String get shareApp => '공유하다';

  @override
  String get rateUs => '우리를 평가해 주세요';

  @override
  String get pleaseAddOption => '옵션을 하나 이상 추가하세요.';

  @override
  String get noReportToSave => '저장할 결정 보고서가 없습니다.';

  @override
  String get reportSaved => '보고서가 기록에 저장되었습니다.';

  @override
  String get pendingAnalysis => '분석 대기 중';

  @override
  String get untitledDecision => '제목 없는 결정';

  @override
  String get describeDecisionHint => '현재 상황, 제약 조건, 성공 사례를 설명하세요.';

  @override
  String optionLabel(String letter) {
    return '옵션 $letter';
  }

  @override
  String get goodChance => '좋은 기회';

  @override
  String get fairChance => '공정한 기회';

  @override
  String get poorChance => '좋지 않은 기회';

  @override
  String get couldNotPrepareQuestions => '질문을 준비하지 못했습니다. 다시 시도해 주세요.';

  @override
  String get greetingFallbackName => '거기';

  @override
  String get dontHaveAccount => '계정이 없나요?';

  @override
  String get alreadyHaveAccount => '이미 계정이 있나요?';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get yes => '예';

  @override
  String get no => '아니요';

  @override
  String get welcome => '환영!';

  @override
  String get orContinueWith => '아니면 계속';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => '삶';

  @override
  String get navigator => '항해자';

  @override
  String get authTagline => 'AI 의사결정 보조자';

  @override
  String get chatbotReadySubtitle => '인생을 탐색할 준비가 되었습니다.';

  @override
  String get chatbotInputHint => '여기서 채팅을 시작하세요...';

  @override
  String get chatbotErrorMessage =>
      '죄송합니다. AI 서비스에 연결할 수 없습니다. 연결을 확인하고 다시 시도해 주세요.';

  @override
  String get selectAll => '모두 선택';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => '삭제할 결정을 선택하세요.';

  @override
  String get total => '총';

  @override
  String get highScore => '높은 점수';

  @override
  String get justNow => '방금';

  @override
  String minutesAgo(int count) {
    return '$count분 전';
  }

  @override
  String hoursAgo(int count) {
    return '$count시간 전';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count시간 전';
  }

  @override
  String daysAgo(int count) {
    return '$count일 전';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count일 전';
  }

  @override
  String scoreLabel(int score) {
    return '점수 $score';
  }

  @override
  String get themeCustomizeSubtitle => '앱의 디자인과 느낌을 맞춤설정하세요.';

  @override
  String get lightModeSubtitle => '깨끗하고 밝은 경험';

  @override
  String get darkModeSubtitle => '어두운 곳에서 눈이 편안해집니다.';

  @override
  String get systemDefaultSubtitle => '장치 테마 기본 설정 사용';

  @override
  String get preview => '시사';

  @override
  String get applyTheme => '테마 적용';

  @override
  String get shareAppMessage => 'Life Navigator를 친구들과 공유하세요.';

  @override
  String get rateAppThanks => 'Life Navigator를 평가해 주셔서 감사합니다!';

  @override
  String fieldRequired(String field) {
    return '$field은(는) 필수 항목입니다.';
  }

  @override
  String get emailRequired => '이메일은 필수입니다';

  @override
  String get emailInvalid => '유효한 이메일을 입력해주세요';

  @override
  String get passwordRequired => '비밀번호가 필요합니다';

  @override
  String get passwordMinLength => '비밀번호는 6자 이상이어야 합니다.';

  @override
  String get confirmPasswordRequired => '비밀번호를 확인해 주세요';

  @override
  String get passwordsDoNotMatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get otpRequired => 'OTP가 필요합니다';

  @override
  String otpInvalid(int length) {
    return '유효한 $length자리 코드를 입력하세요.';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field은(는) $min자 이상이어야 합니다.';
  }

  @override
  String get fieldDescription => '설명';

  @override
  String get fieldTitle => '제목';

  @override
  String get fullName => '성명';

  @override
  String get confirmPassword => '비밀번호 확인';

  @override
  String get createAccount => '계정 만들기';

  @override
  String get acceptTermsRequired => '이용약관 및 개인정보 보호정책에 동의해 주세요.';

  @override
  String get signupTitleLeading => '당신의 만들기';

  @override
  String get account => '계정';

  @override
  String get signupSubtitle => 'Life Navigator에 가입하여 매일 더 현명한 결정을 내리세요.';

  @override
  String get iAgreeToThe => '나는 다음에 동의한다.';

  @override
  String get forgotPasswordLeading => '잊어버렸다';

  @override
  String get forgotPasswordAccent => '비밀번호?';

  @override
  String get forgotPasswordSubtitle => '이메일을 입력하시면 비밀번호를 재설정할 수 있는 링크를 보내드립니다.';

  @override
  String get enterEmailHint => '이메일 주소를 입력하세요';

  @override
  String get forgotPasswordInfo => '귀하의 이메일 주소로 비밀번호 재설정 링크를 보내드립니다.';

  @override
  String get sendVerificationCode => '인증코드 보내기';

  @override
  String get sendPasswordResetLink => '재설정 링크 보내기';

  @override
  String get emailVerificationTitle => '이메일 확인';

  @override
  String get emailVerificationSubtitle =>
      '귀하의 이메일로 확인 링크를 보냈습니다. 이를 열어 계정을 활성화하세요.';

  @override
  String get emailVerificationSpamHint =>
      '몇 분 내에 이메일이 표시되지 않으면 스팸 또는 정크 폴더를 확인하세요.';

  @override
  String get emailVerificationWaiting => '확인을 기다리는 중입니다. 자동으로 확인하겠습니다.';

  @override
  String get emailVerificationResend => '확인 이메일 다시 보내기';

  @override
  String get emailVerificationResent => '확인 이메일이 다시 전송되었습니다.';

  @override
  String get authErrorWrongPassword => '이메일이나 비밀번호가 잘못되었습니다. 다시 시도해 주세요.';

  @override
  String get authErrorEmailInUse => '이 이메일은 이미 등록되어 있습니다. 대신 로그인해 보세요.';

  @override
  String get authErrorWeakPassword => '비밀번호가 너무 취약합니다. 6자 이상을 사용하세요.';

  @override
  String get authErrorUserNotFound => '이 이메일에는 계정이 없습니다.';

  @override
  String get authErrorTooManyRequests => '시도 횟수가 너무 많습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get authErrorGeneric => '문제가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get authErrorGoogleCancelled => 'Google 로그인이 취소되었습니다.';

  @override
  String get passwordResetEmailSent => '비밀번호 재설정 이메일이 전송되었습니다. 받은편지함을 확인하세요.';

  @override
  String get changePassword => '비밀번호 변경';

  @override
  String get changePasswordSubtitle => '현재 비밀번호를 입력하고 새 비밀번호를 선택하세요.';

  @override
  String get currentPassword => '현재 비밀번호';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get deleteAccountConfirm => '이렇게 하면 계정이 영구적으로 삭제되며 취소할 수 없습니다.';

  @override
  String get deleteAccountSuccess => '또한 이 기기에 저장된 로컬 결정 및 채팅도 삭제하세요.';

  @override
  String get accountDeleted => '귀하의 계정이 삭제되었습니다.';

  @override
  String get rememberPassword => '비밀번호를 기억하시나요?';

  @override
  String get passwordUpdatedLogin => '비밀번호가 업데이트되었습니다. 로그인해주세요.';

  @override
  String get resetLeading => '다시 놓기';

  @override
  String get resetPasswordSubtitle => '귀하의 계정에 대한 새 비밀번호를 만드십시오.';

  @override
  String get newPassword => '새 비밀번호';

  @override
  String get confirmNewPassword => '새 비밀번호 확인';

  @override
  String get passwordHint => '기억할 수 있는 조합으로 6자 이상을 사용하세요.';

  @override
  String get updating => '업데이트 중...';

  @override
  String get updatePassword => '비밀번호 업데이트';

  @override
  String get backTo => '돌아가기';

  @override
  String newCodeSentTo(String email) {
    return '$email(으)로 새 코드가 전송되었습니다.';
  }

  @override
  String get invalidVerificationCode => '인증 코드가 잘못되었습니다. 다시 시도해 주세요.';

  @override
  String otpResetSubtitle(String email) {
    return '$email(으)로 전송된 6자리 재설정 코드를 입력하세요.';
  }

  @override
  String otpVerifySubtitle(String email) {
    return '$email(으)로 전송된 6자리 인증 코드를 입력하세요.';
  }

  @override
  String get verifyLeading => '확인하다';

  @override
  String get verifyEmailLeading => '귀하의 확인';

  @override
  String get codeWord => '암호';

  @override
  String get emailWord => '이메일';

  @override
  String resendCodeIn(int seconds) {
    return '${seconds}s 후에 코드 재전송';
  }

  @override
  String get didntReceiveCode => '코드를 받지 못하셨나요?';

  @override
  String get resendCode => '코드 재전송';

  @override
  String get verifying => '확인 중...';

  @override
  String get verifyCode => '코드 확인';

  @override
  String get verifyAndContinue => '확인 및 계속';

  @override
  String get wrongEmail => '이메일이 잘못되었나요?';

  @override
  String get goBack => '돌아가기';

  @override
  String get logOut => '로그아웃';

  @override
  String get logoutConfirmMessage => '정말로 이 앱에서 로그아웃하시겠습니까?';

  @override
  String get logoutConfirmYes => '예, 로그아웃합니다';

  @override
  String get insightsHeroDescription => '귀하의 결정에 맞는 일일 제안 및 통찰력.';

  @override
  String recommendedPrefix(String text) {
    return '권장사항: $text';
  }

  @override
  String get riskInterpretationEmpty => '맞춤형 위험 해석을 보려면 분석을 완료하세요.';

  @override
  String get startDecisionQuestion => '어떤 결정에 도움이 필요하신가요?';

  @override
  String get startDecisionSubtitle => '결정을 설명하고 AI 기반 통찰력과 권장 사항을 얻으십시오.';

  @override
  String get decisionTitle => '결정 제목';

  @override
  String get decisionTitleHint => '예를 들어 직업을 바꿔야 할까요?';

  @override
  String get decisionCategory => '결정 카테고리';

  @override
  String get importanceLevel => '중요도 수준';

  @override
  String get impactMinor => '사소한 영향';

  @override
  String get impactModerate => '중간 정도의 영향';

  @override
  String get impactHigh => '높은 영향';

  @override
  String get categoryCareer => '직업';

  @override
  String get categoryFinance => '재원';

  @override
  String get categoryHealth => '건강';

  @override
  String get categoryRelations => '처지';

  @override
  String get categoryEducation => '교육';

  @override
  String get categoryOther => '다른';

  @override
  String get addYourOptionsLeading => '귀하의 추가';

  @override
  String get optionsWord => '옵션';

  @override
  String get describeOptionHint => '이 옵션 설명';

  @override
  String get goalSelection => '목표 선택';

  @override
  String get goalSelectionSubtitle => '귀하에게 가장 중요한 결정 옵션을 선택하세요.';

  @override
  String get selectAtLeastOneGoal => '목표를 하나 이상 선택하세요.';

  @override
  String get goalTipBody => '나중에 프로필에서 언제든지 우선순위를 조정할 수 있습니다.';

  @override
  String get goalGrowth => '성장';

  @override
  String get goalFinancialGain => '재정적 이득';

  @override
  String get goalRiskReduction => '위험 감소';

  @override
  String get goalPersonalSatisfaction => '개인적 만족도';

  @override
  String get goalTimeEfficiency => '시간 효율성';

  @override
  String get goalWorkLifeBalance => '일과 삶의 균형';

  @override
  String get goalStability => '안정';

  @override
  String get goalImpact => '영향';

  @override
  String get budgetInput => '예산 투입';

  @override
  String get budgetSubtitle => '이 결정에 대한 예상 예산을 선택하세요.';

  @override
  String get budgetImpactLevel => '예산 영향 수준';

  @override
  String get budgetLessThan5k => '5,000달러 미만';

  @override
  String get enterYourBudget => '예산을 입력하세요';

  @override
  String get timeAvailability => '시간 가용성';

  @override
  String get timeAvailabilitySubtitle => '이 결정에 대한 시간 가용성을 선택하십시오.';

  @override
  String get experienceLevel => '경험치';

  @override
  String get experienceSubtitle => '이는 AI가 귀하의 배경과 전문 지식을 이해하는 데 도움이 됩니다.';

  @override
  String get riskTolerance => '위험 허용 범위';

  @override
  String get riskToleranceSubtitle => '이 결정에 대한 위험 허용 수준을 선택하십시오.';

  @override
  String get timeUrgency => '긴급한 시간';

  @override
  String get urgencySubtitle => '결정의 긴급성을 선택하세요.';

  @override
  String get financialRisk => '재정적 위험';

  @override
  String get marketRisk => '시장위험';

  @override
  String get timeRisk => '시간 위험';

  @override
  String get executionRisk => '실행 위험';

  @override
  String get personalRisk => '개인 위험';

  @override
  String get overallFit => '전체적인 핏';

  @override
  String get firstOption => '첫 번째 옵션';

  @override
  String get secondOption => '두 번째 옵션';

  @override
  String get versus => '대';

  @override
  String get confidenceInterpretation => '신뢰도 해석';

  @override
  String get financialImpact => '재정적 영향';

  @override
  String get riskLevel => '위험 수준';

  @override
  String get timeInvestment => '시간 투자';

  @override
  String get longTermSustainability => '장기적인 지속 가능성';

  @override
  String get personalGrowth => '개인적 성장';

  @override
  String get outcomeConsistency => '결과 일관성';

  @override
  String get riskAssessment => '위험 평가';

  @override
  String get historicalSimilarity => '역사적 유사성';

  @override
  String get relevanceMatch => '관련성 일치';

  @override
  String get dataQuality => '데이터 품질';

  @override
  String get confidenceVeryHigh => '매우 높음';

  @override
  String get confidenceModerate => '보통의';

  @override
  String get confidenceVeryLow => '매우 낮음';

  @override
  String get onboardingAiPowered => 'AI 기반';

  @override
  String get onboardingSmartAnalysis => '더 나은 의사결정을 위한 스마트 분석';

  @override
  String get onboardingRiskAnalysis => '위험 분석';

  @override
  String get onboardingActionablePlans => '실행 가능한 계획';

  @override
  String get onboardingTrustedGuidance => '신뢰할 수 있는 지침';

  @override
  String get onboardingDefineGoalLeading => '당신의 정의';

  @override
  String get goalWord => '목표';

  @override
  String get onboardingChooseJourney => '안내받고 싶은 인생 여정을 선택하세요.';

  @override
  String get onboardingCareerPath => '진로';

  @override
  String get onboardingCareerPathDesc => '미래 시장 및 기술 탐색';

  @override
  String get onboardingMajorPurchase => '주요 구매';

  @override
  String get onboardingMajorPurchaseDesc => '신규 구매 옵션 비교';

  @override
  String get onboardingLifeChanges => '삶의 변화';

  @override
  String get onboardingLifeChangesDesc => '이전 또는 새로운 단계 계획';

  @override
  String get onboardingPersonalGrowth => '개인적 성장';

  @override
  String get onboardingPersonalGrowthDesc => '기술 및 사고방식 변화 파악';

  @override
  String get onboardingReadyLeading => '준비 완료';

  @override
  String get navigateWord => '탐색';

  @override
  String get onboardingReadySubtitle => '귀하의 맞춤 비서가 도와드릴 준비가 되어 있습니다';

  @override
  String get onboardingActionableGuidance => '실행 가능한 지침';

  @override
  String get onboardingActionableGuidanceDesc => '성공을 위한 지침 받기';

  @override
  String get onboardingProgressTracking => '진행 상황 추적';

  @override
  String get onboardingProgressTrackingDesc => '여정의 이정표를 모니터링하세요';

  @override
  String get onboardingAdjustOnTheFly => '즉시 조정';

  @override
  String get onboardingAdjustDesc => '인생이 진행됨에 따라 계획을 재평가하십시오.';

  @override
  String get onboardingShareLearn => '공유하고 배우세요';

  @override
  String get onboardingShareLearnDesc => '자신의 경로를 공유하고 학습하세요.';

  @override
  String get myProfileLeading => '나의';

  @override
  String get preferences => '환경설정';

  @override
  String get personalityPreferences => '성격 선호도';

  @override
  String get saveChanges => '변경 사항 저장';

  @override
  String get phoneNumber => '전화 번호';

  @override
  String get tapToChangePhoto => '사진을 변경하려면 여기를 탭하세요.';

  @override
  String get photoPickerComingSoon => '사진 선택 도구가 곧 제공될 예정입니다.';

  @override
  String get pickImageSourceTitle => '프로필 사진 변경';

  @override
  String get pickFromCamera => '사진 찍기';

  @override
  String get pickFromGallery => '갤러리에서 선택';

  @override
  String get removePhoto => '사진 삭제';

  @override
  String get cameraPermissionDenied => '사진을 찍으려면 카메라 권한이 필요합니다.';

  @override
  String get galleryPermissionDenied => '사진을 선택하려면 사진 라이브러리 권한이 필요합니다.';

  @override
  String get openSettings => '설정 열기';

  @override
  String get savePreferences => '환경설정 저장';

  @override
  String get preferencesSaved => '환경설정이 저장되었습니다.';

  @override
  String get personalitySubtitle => 'AI가 당신을 더 잘 이해할 수 있도록 도와주세요';

  @override
  String get focusAreas => '중점 분야';

  @override
  String get emptyTitleLeading => '아무것도 아님';

  @override
  String get emptyTitleAccent => '아직은 여기';

  @override
  String get emptyQuietTitle => '여기는 조용해요';

  @override
  String get emptyHistoryHint => '첫 번째 결정을 시작하면 여기에 기록이 표시됩니다.';

  @override
  String get startADecision => '결정을 시작하세요';

  @override
  String get helpHereToHelp => '우리가 도와드리겠습니다.';

  @override
  String get faq => 'FAQ';

  @override
  String get noResults => '결과 없음';

  @override
  String get errorTitle => '문제가 발생했습니다.';

  @override
  String get errorSubtitle => '예상치 못한 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get contactSupport => '지원팀에 문의';

  @override
  String get noInternetTitle => '연결되지 않음';

  @override
  String get noInternetSubtitle => '인터넷 연결을 확인하고 다시 시도해 주세요.';

  @override
  String get retryConnection => '연결 재시도';

  @override
  String get offlineMode => '오프라인 모드로 이동';

  @override
  String get permissionTitle => '앱 권한';

  @override
  String get permissionSubtitle => '최상의 경험을 위해 권한을 부여하세요.';

  @override
  String get grantAll => '모두 부여';

  @override
  String get notNow => '지금은 아님';

  @override
  String get updateAvailable => '업데이트 가능';

  @override
  String get updateSubtitle => '개선된 새 버전이 출시되었습니다.';

  @override
  String get updateNow => '지금 업데이트';

  @override
  String get remindLater => '나중에 알림';

  @override
  String get loadingMessage => '준비하는 중...';

  @override
  String get decisionDetailLeading => '결정';

  @override
  String get detailWord => '세부 사항';

  @override
  String get decisionNotFound => '결정을 찾을 수 없음';

  @override
  String get overall => '전반적인';

  @override
  String get pros => '장점';

  @override
  String get cons => '단점';

  @override
  String get notes => '메모';

  @override
  String get saveAtLeastTwoToCompare => '비교할 최소 두 가지 결정을 저장하세요.';

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
  String get moderate => '보통의';

  @override
  String get veryHigh => '매우 높음';

  @override
  String get veryLow => '매우 낮음';

  @override
  String get next => '다음';

  @override
  String get later => '나중에';

  @override
  String get useWord => '사용';

  @override
  String get aboutUsLeading => '에 대한';

  @override
  String get aboutUsAccent => '우리를';

  @override
  String get howToUseLeading => '방법';

  @override
  String get versionLabel => '버전 1.0.0';

  @override
  String get dailyDecision => '일일 결정';

  @override
  String get personalityDescription => '이러한 설정은 추천의 톤과 깊이를 개인화합니다.';

  @override
  String get traitOptimism => '낙천주의';

  @override
  String get traitPatience => '인내심';

  @override
  String get traitDetailFocus => '디테일 포커스';

  @override
  String get categoryTravel => '여행하다';

  @override
  String get helpResponseTime => '평균 응답 시간: 24시간 미만';

  @override
  String get helpGetInTouch => '연락하세요';

  @override
  String get helpLiveChat => '라이브 채팅';

  @override
  String get helpLiveChatSub => '우리 팀과 실시간으로 채팅하세요';

  @override
  String get helpCall => '부르다';

  @override
  String get helpCallSub => '월~금 오전 9시~오후 5시(태평양 표준시)';

  @override
  String get helpSubmitTicket => '티켓 제출';

  @override
  String get helpSubmitTicketSub => '추적된 지원 티켓 받기';

  @override
  String get helpQuickLinks => '빠른 링크';

  @override
  String get faqSubtitle => '일반적인 질문에 대한 답변';

  @override
  String get aboutSubtitle => '버전, 크레딧, 링크';

  @override
  String get helpOpenLiveChat => '오픈 라이브 채팅';

  @override
  String get helpLiveChatSoon => '실시간 채팅이 곧 시작됩니다. 24시간 이내에 이메일을 보내드리겠습니다.';

  @override
  String get moreOptionsComingSoon => '더 많은 옵션이 곧 제공될 예정입니다.';

  @override
  String get insightCompoundTitle => '결정을 복합적으로 결정하세요';

  @override
  String get insightCompoundMessage =>
      '오늘 내린 결정은 6개월 후의 기회를 결정합니다. 가장 많은 문을 여는 것을 선택하세요.';

  @override
  String get insightParalysisTitle => '분석 마비를 조심하세요';

  @override
  String get insightParalysisMessage => '새로운 정보 없이 일주일 넘게 고민했다면 결정하기에 충분합니다.';

  @override
  String get insightRiskStressTitle => '위험은 스트레스와 같지 않습니다';

  @override
  String get insightRiskStressMessage =>
      '명확한 계획 B가 있으면 위험도가 높은 결정에도 스트레스가 적을 수 있습니다. 항상 대체 수단을 설계하세요.';

  @override
  String get insightFutureYouTitle => '미래-당신도 투표하세요';

  @override
  String get insightFutureYouMessage =>
      '결정하기 전에 다음과 같이 물어보십시오. 지금부터 5년 후 미래의 당신이 이에 대해 현재의 당신에게 감사할 것입니까?';

  @override
  String streakDays(int count) {
    return '$count일 연속';
  }

  @override
  String get streakKeepGoing => '계속하세요. 오늘의 결정을 중요하게 여기세요.';

  @override
  String get todaysDecisionPrompt => '오늘의 결정 프롬프트';

  @override
  String get dailyDecisionExerciseSub => '빠른 60초 의사결정 연습';

  @override
  String get dailyDecisionQuestion => '이 기회에 동의해야 할까요, 아니면 거절해야 할까요?';

  @override
  String get dailyDecisionScenario =>
      '동료가 당신을 사이드 프로젝트에 초대합니다. 흥미롭지만 일주일에 10시간이 걸립니다.';

  @override
  String get seeAiAnalysis => 'AI 분석 보기';

  @override
  String get errorWhatYouCanDo => '당신이 할 수 있는 일';

  @override
  String get errorTip1 => '인터넷 연결을 확인하세요';

  @override
  String get errorTip2 => '잠시 후 다시 작업을 시도해 보세요.';

  @override
  String get errorTip3 => '앱을 다시 시작하세요';

  @override
  String get errorTip4 => '문제가 계속 발생하면 지원팀에 문의하세요.';

  @override
  String get noInternetYouCanStill => '당신은 아직도 할 수 있습니다';

  @override
  String get offlineTip1 => '저장된 결정 및 기록 보기';

  @override
  String get offlineTip2 => '메모 및 실행 계획을 읽어보세요.';

  @override
  String get offlineTip3 => 'FAQ 및 정보 찾아보기';

  @override
  String get permissionNotificationsDesc => '알림 및 일일 결정 메시지 받기';

  @override
  String get permissionLocation => '위치';

  @override
  String get permissionLocationDesc => '위치 기반 제안에만 사용됩니다.';

  @override
  String get permissionStorage => '저장';

  @override
  String get permissionStorageDesc => '보고서를 저장하고 로컬로 내보냅니다.';

  @override
  String get permissionSettingsNote => '설정에서 언제든지 권한을 변경할 수 있습니다.';

  @override
  String updateVersionReady(String version) {
    return '버전 $version을(를) 설치할 준비가 되었습니다.';
  }

  @override
  String get whatsNew => '새로운 소식';

  @override
  String get updateFeature1 => '더욱 빨라진 AI 분석(2배 속도 향상)';

  @override
  String get updateFeature2 => '새로운 Career Advisor 모듈';

  @override
  String get updateFeature3 => '다크 모드 대비 개선';

  @override
  String get updateFeature4 => '버그 수정 및 안정성 개선';

  @override
  String get loadingSubtitle => '이 작업은 일반적으로 몇 초 밖에 걸리지 않습니다.';

  @override
  String get howToUseStep1Title => '결정을 정의하세요';

  @override
  String get howToUseStep1Body => '결정, 카테고리, 가장 중요한 사항을 설명하는 것부터 시작하세요.';

  @override
  String get howToUseStep2Title => '옵션을 분석하세요';

  @override
  String get howToUseStep2Body => '목표, 긴급성, 예산, 위험 허용 범위에 대한 안내 질문에 답변하세요.';

  @override
  String get howToUseStep3Title => 'AI 결과 검토';

  @override
  String get howToUseStep3Body => '권장 사항, 위험 점수, 장단점, 단계별 실행 계획을 확인하세요.';

  @override
  String get howToUseStep4Title => '저장 및 진행 상황 추적';

  @override
  String get howToUseStep4Body => '결정 사항을 기록에 저장하고 지침이 필요할 때마다 통찰력을 다시 확인하세요.';

  @override
  String get clientSelectionLeading => '고객';

  @override
  String get clientSelectionAccent => '선택';

  @override
  String get whichClientQuestion => '어떤 고객에게 \'예\'라고 대답해야 할까요?';

  @override
  String get clientSelectionSubtitle =>
      'AI는 적합성, 수수료, 위험을 기준으로 고객 기회의 점수를 매깁니다.';

  @override
  String get freelancePricingLeading => '프리랜서';

  @override
  String get freelancePricingAccent => '가격';

  @override
  String get recommendedPrice => '권장 가격';

  @override
  String get pricingScore => '가격 점수';

  @override
  String get priceComparison => '가격 비교';

  @override
  String get priceDrivers => '가격 동인';

  @override
  String get marketRate => '시장 환율';

  @override
  String get experienceLabel => '경험';

  @override
  String get timelineLabel => '타임라인';

  @override
  String get complexityLabel => '복잡성';

  @override
  String get projectValue => '프로젝트 가치';

  @override
  String get sendProposal => '제안 보내기';

  @override
  String get proposalSent => '클라이언트에게 제안서를 보냈습니다.';

  @override
  String get productivityLeading => '생산력';

  @override
  String get productivityAccent => '입안자';

  @override
  String get eisenhowerPriority => '아이젠하워 우선순위';

  @override
  String get startFocusBlock => '포커스 블록 시작';

  @override
  String get focusBlockStarted => '초점 차단이 시작되었습니다. 행운을 빕니다!';

  @override
  String get careerAdvisorLeading => '직업';

  @override
  String get careerAdvisorAccent => '고문';

  @override
  String get careerFitScore => '경력 적합성 점수';

  @override
  String get topPathProductManager => '최상위 경로: 제품 관리자';

  @override
  String get skillMatch => '스킬 매치';

  @override
  String get strategyLabel => '전략';

  @override
  String get communicationLabel => '의사소통';

  @override
  String get analyticsLabel => '해석학';

  @override
  String get technicalLabel => '인위적인';

  @override
  String get build90DayPlan => '90일 계획 수립';

  @override
  String get businessIdeaLeading => '사업';

  @override
  String get businessIdeaAccent => '아이디어';

  @override
  String get describeBusinessIdea => '당신의 사업 아이디어를 설명하세요';

  @override
  String get businessIdeaSubtitle => 'AI는 생존 가능성, 시장 적합성 및 위험을 평가합니다.';

  @override
  String get viabilityScore => '생존 가능성 점수';

  @override
  String get scoreBreakdown => '점수 분석';

  @override
  String get aiVerdict => 'AI 평결';

  @override
  String get fullPlanGenerated => '전체 계획이 생성되고 저장되었습니다.';

  @override
  String get financialCalcLeading => '재정적인';

  @override
  String get financialCalcAccent => '계산자';

  @override
  String get compoundGrowth => '복합 성장';

  @override
  String get futureValue => '미래가치';

  @override
  String get saveToDecisions => '결정에 저장';

  @override
  String get saveDecisionLeading => '구하다';

  @override
  String get saveDecisionAccent => '결정';

  @override
  String get decisionSaved => '결정이 저장되었습니다.';

  @override
  String get folderLabel => '접는 사람';

  @override
  String get folderDefault => '기본';

  @override
  String get folderCareer => '직업';

  @override
  String get folderFinance => '재원';

  @override
  String get folderHealth => '건강';

  @override
  String get folderPersonal => '개인의';

  @override
  String get reportExportLeading => '내보내다';

  @override
  String get reportExportAccent => '보고서';

  @override
  String get exportReport => '보고서 내보내기';

  @override
  String get shareReport => '보고서 공유';

  @override
  String get subscriptionLeading => '당신을 선택하세요';

  @override
  String get subscriptionAccent => '계획';

  @override
  String get mostPopular => '가장 인기있는';

  @override
  String get freeTrial => '7일 무료 평가판';

  @override
  String get upgradePremium => '프리미엄으로 업그레이드';

  @override
  String get choosePlan => '플랜을 선택하세요';

  @override
  String get paymentSuccessful => '결제 성공!';

  @override
  String get thankYouUpgrade => '프리미엄으로 업그레이드해주셔서 감사합니다.';

  @override
  String get goToDashboard => '대시보드로 이동';

  @override
  String get paymentDetails => '결제 세부정보';

  @override
  String get payNow => '지금 결제';

  @override
  String get cardNumber => '카드번호';

  @override
  String get nameOnCard => '카드 이름';

  @override
  String get premiumFeatures => '프리미엄 기능';

  @override
  String get faqSearchHint => 'FAQ 검색';

  @override
  String get topicAll => '모두';

  @override
  String get topicGettingStarted => '시작하기';

  @override
  String get topicAi => '일체 포함';

  @override
  String get topicBilling => '청구';

  @override
  String get topicAccount => '계정';

  @override
  String get tabAll => '모두';

  @override
  String get tabUnread => '읽히지 않는';

  @override
  String get tabArchived => '보관됨';

  @override
  String get noArchivedItems => '보관된 항목 없음';

  @override
  String get traitRiskTolerance => '위험 허용 범위';

  @override
  String get budgetWhyMatters => '예산은 AI가 귀하의 추천에서 재정적 균형을 평가하는 데 도움이 됩니다.';

  @override
  String get timeWhyMatters => '시간 가용성은 귀하의 행동 계획이 얼마나 야심적이어야 하는지를 결정합니다.';

  @override
  String get experienceWhyMatters =>
      '경험 수준은 AI가 귀하의 배경에 맞게 조언을 조정하는 데 도움이 됩니다.';

  @override
  String get riskWhyMatters => '위험 허용 범위는 권장 사항이 얼마나 보수적이거나 대담한지를 결정합니다.';

  @override
  String get urgencyWhyMatters =>
      '긴급성은 권장 사항에 따라 얼마나 빨리 조치를 취해야 하는지에 영향을 미칩니다.';

  @override
  String get confidenceReliableRecommend => '일반적으로 신뢰할 수 있는 추천';

  @override
  String get confidenceReliableSomeRisks => '약간의 위험이 있지만 일반적으로 신뢰할 수 있음';

  @override
  String get confidenceConsiderRisks => '위험을 신중하게 고려하세요';

  @override
  String get confidenceHighUncertainty => '높은 불확실성 - 신중하게 진행';

  @override
  String get stepResults => '결과';

  @override
  String get urgencyNoRush => '서두르지 마세요';

  @override
  String get urgencyModerate => '보통의';

  @override
  String get urgencyUrgent => '긴급한';

  @override
  String get urgencyCritical => '비판적인';

  @override
  String get experienceBeginner => '초보자';

  @override
  String get experienceIntermediate => '중급';

  @override
  String get experienceAdvanced => '고급의';

  @override
  String get experienceExpert => '전문가';

  @override
  String get timeVeryLimited => '매우 제한적';

  @override
  String get timeLimited => '제한된';

  @override
  String get timeModerateAvail => '보통의';

  @override
  String get timeHighAvail => '높은';

  @override
  String get timeVeryHigh => '매우 높음';

  @override
  String get riskToleranceLow => '낮은';

  @override
  String get riskToleranceModerate => '보통의';

  @override
  String get riskToleranceHigh => '높은';

  @override
  String get riskToleranceVeryHigh => '매우 높음';

  @override
  String get doNow => '지금 하세요';

  @override
  String get doToday => '오늘 하세요';

  @override
  String get scheduleLabel => '일정';

  @override
  String get deleteLabel => '삭제';

  @override
  String get tipLabel => '팁';

  @override
  String get aiRecommendation => 'AI 추천';

  @override
  String get comparisonMenu => '비교';

  @override
  String get clientSelectionVerdictBody =>
      'Acme가 가장 적합합니다. 그렇다고 대답하세요. 미스터리 클라이언트: 정중하게 거절합니다. 모호한 브리핑은 범위 크리프를 예측합니다.';

  @override
  String get freelancePricingSubtitle => 'AI 기반 요금 추천';

  @override
  String get priceLower => '낮추다';

  @override
  String get priceRecommended => '추천';

  @override
  String get priceHigher => '더 높은';

  @override
  String get freelancePricingRecommendationBody =>
      '\$2,800의 가격으로 이 고객을 확보할 수 있습니다. 그들이 반발한다면 가격을 낮추기보다는 범위를 정하세요.';

  @override
  String get productivitySubtitle => 'AI는 지금 해야 할 일, 예약할 일, 버려야 할 일을 분류합니다.';

  @override
  String get productivityTipBody =>
      '모든 것이 긴급하다면 아무것도 아닙니다. 지금 해야 할 일을 1~2개 골라 회의처럼 지켜보세요.';

  @override
  String get careerAdvisorDescription =>
      '귀하의 기술, 커뮤니케이션 스타일 및 성장 관심을 기반으로 한 강력한 적합성.';

  @override
  String get nextSteps => '다음 단계';

  @override
  String get careerAdvisorNextStepsBody =>
      'PM 스타일의 실적을 구축하기 위해 이번 분기에 소규모 다기능 이니셔티브를 주도하세요.';

  @override
  String get excellent => '훌륭한';

  @override
  String get good => '좋은';

  @override
  String get businessIdeaHint => '예: AI 관리 알림이 포함된 실내 식물 구독 상자';

  @override
  String get marketSize => '시장 규모';

  @override
  String get competition => '경쟁';

  @override
  String get profitability => '수익성';

  @override
  String get executionEase => '실행 용이성';

  @override
  String get large => '크기가 큰';

  @override
  String get businessIdeaVerdictBody =>
      '명확한 청중을 확보한 강력한 컨셉. 마케팅을 확장하기 전에 처음 90일 동안 20명의 유료 고객을 확보하는 데 집중하세요.';

  @override
  String get generateFullPlan => '전체 계획 생성';

  @override
  String get financialCalcSubtitle => '시간이 지남에 따라 돈이 어떻게 증가하는지 확인하십시오.';

  @override
  String get financialInitialAmount => '초기금액(\$)';

  @override
  String get financialAnnualRate => '연율(%)';

  @override
  String get financialDuration => '기간(년)';

  @override
  String get financialCalcTipBody =>
      '10년 이상의 기간 동안 월간 기부금은 적더라도 대규모 일회성 예금보다 뛰어납니다.';

  @override
  String get saveDecisionNotesHint => '이번 결정에 대해 기억하고 싶은 내용';

  @override
  String get reportExportSubtitle => '결정 보고서 저장 또는 공유';

  @override
  String get completed => '완전한';

  @override
  String get goAhead => '계속하세요';

  @override
  String get includeInReport => '보고서에 포함';

  @override
  String get executiveSummary => '요약';

  @override
  String get analysisDetails => '분석 세부정보';

  @override
  String get notesAndInputs => '메모 및 입력';

  @override
  String get exportFormat => '내보내기 형식';

  @override
  String get pdfBestForSharing => '공유에 가장 적합';

  @override
  String get excelDataScores => '데이터 및 점수';

  @override
  String get wordDocument => '문서';

  @override
  String get imageJpgPng => 'JPG / PNG';

  @override
  String get shareOrSave => '공유 또는 저장';

  @override
  String get shareLink => '링크 공유';

  @override
  String get createShareableLink => '공유 가능한 링크 만들기';

  @override
  String get emailReport => '이메일 보고서';

  @override
  String get sendViaEmail => '이메일로 보내기';

  @override
  String get saveToDevice => '장치에 저장';

  @override
  String get downloadToDevice => '장치에 다운로드';

  @override
  String get scheduleAutoReports => '자동 보고서 예약';

  @override
  String exportedAs(String format) {
    return '$format로 내보냈습니다.';
  }

  @override
  String get subscriptionSubtitle => '나에게 꼭 맞는 계획으로 더욱 스마트한 결정을 내리세요';

  @override
  String get makeSmarterDecisions => '더욱 현명한 결정을 내리세요';

  @override
  String get subscriptionHeroBody => '무제한 AI 분석, 심층적인 통찰력, 맞춤형 추천을 받아보세요.';

  @override
  String get planBasic => '기초적인';

  @override
  String get planPremium => '프리미엄';

  @override
  String get planPro => '찬성';

  @override
  String get perMonth => '/월';

  @override
  String get allPlansInclude => '모든 계획에는 다음이 포함됩니다';

  @override
  String get moneyBackGuarantee => '7일 환불 보장';

  @override
  String get moneyBackGuaranteeBody => '만족스럽지 않으신가요? 7일 이내에 전액 환불받으세요.';

  @override
  String get subscribeTermsNote => '구독하시면 당사의 이용 약관 및 개인 정보 보호 정책에 동의하게 됩니다.';

  @override
  String get securePaymentEncryption => '업계 표준 암호화로 안전한 결제';

  @override
  String get paymentLeading => '지불';

  @override
  String get paymentAccent => '세부';

  @override
  String get premiumMonthly => '프리미엄 • 월간';

  @override
  String get taxEstimate => '세금 추정';

  @override
  String get totalToday => '오늘 총계';

  @override
  String get paymentMethod => '결제수단';

  @override
  String get paymentCard => '카드';

  @override
  String get paymentPayPal => '페이팔';

  @override
  String get paymentGooglePay => '구글페이';

  @override
  String get paymentApplePay => '애플페이';

  @override
  String get cardExpiryHint => '월/년';

  @override
  String get cardCvvHint => '이력서';

  @override
  String get encryptedPaymentFooter => '종단 간 암호화됩니다. 우리는 귀하의 카드를 절대 저장하지 않습니다.';

  @override
  String get premiumFeaturesLeading => '프리미엄';

  @override
  String get premiumFeaturesAccent => '특징';

  @override
  String get premiumUnlockSubtitle => 'Life Navigator의 모든 기능을 활용하세요';

  @override
  String get premiumFeature1Title => '무제한 AI 분석';

  @override
  String get premiumFeature1Body => '필요한 만큼 많은 결정을 실행하세요.';

  @override
  String get premiumFeature2Title => '깊은 통찰력';

  @override
  String get premiumFeature2Body => '위험, 신뢰도, 결과 및 영향 차트.';

  @override
  String get premiumFeature3Title => '결정 비교';

  @override
  String get premiumFeature3Body => '결정 사항을 나란히 확인하세요.';

  @override
  String get premiumFeature4Title => '보고서 내보내기';

  @override
  String get premiumFeature4Body => 'PDF, Word, Excel 및 이미지 내보내기.';

  @override
  String get premiumFeature5Title => '클라우드 동기화';

  @override
  String get premiumFeature5Body => '클라우드에 안전하게 백업됩니다.';

  @override
  String get premiumFeature6Title => '우선 지원';

  @override
  String get premiumFeature6Body => '24시간 이내에 답장을 보내주세요.';

  @override
  String get paymentSuccessLeading => '지불';

  @override
  String get paymentSuccessAccent => '성공적인!';

  @override
  String get youNowHaveAccessTo => '이제 다음에 액세스할 수 있습니다.';

  @override
  String get planLabel => '계획';

  @override
  String get amountLabel => '양';

  @override
  String get methodLabel => '방법';

  @override
  String get transactionIdLabel => '거래 ID';

  @override
  String get unlimitedAi => '무제한 AI';

  @override
  String get deepInsightsShort => '깊은 통찰력';

  @override
  String get compareShort => '비교하다';

  @override
  String get exportsShort => '수출';

  @override
  String get cloudSyncShort => '클라우드 동기화';

  @override
  String get prioritySupportShort => '우선 지원';

  @override
  String get privacyLeading => '은둔';

  @override
  String get privacyAccent => '정책';

  @override
  String get privacyLastUpdated => '최종 업데이트 날짜: 2026년 5월 18일';

  @override
  String get privacySection1Title => '우리가 수집하는 것';

  @override
  String get privacySection1Body =>
      '우리는 귀하가 저장한 결정 사항, 계정 세부 정보(이름 + 이메일), 선호 사항 등 귀하가 제공한 정보만 수집합니다. 다른 모든 것은 장치에 유지됩니다.';

  @override
  String get privacySection2Title => '우리가 그것을 사용하는 방법';

  @override
  String get privacySection2Body =>
      'AI 추천을 개인화하려면 원하는 경우 데이터를 동기화하고 앱을 개선하세요. 우리는 귀하의 데이터를 제3자에게 절대 판매하지 않습니다.';

  @override
  String get privacySection3Title => '로컬 우선 스토리지';

  @override
  String get privacySection3Body =>
      '귀하의 결정은 기본적으로 장치에 저장됩니다. 클라우드 동기화는 선택적으로 제공되며 전송 중 및 저장 중 암호화됩니다.';

  @override
  String get privacySection4Title => '귀하의 권리';

  @override
  String get privacySection4Body =>
      '언제든지 설정에서 모든 데이터를 내보내거나 삭제할 수 있습니다. 우리는 7일 이내에 데이터 요청에 응답합니다.';

  @override
  String get privacySection5Title => '어린이들';

  @override
  String get privacySection5Body =>
      'AI Life Navigator는 13세 미만의 어린이를 대상으로 하지 않습니다. 우리는 어린이로부터 고의로 데이터를 수집하지 않습니다.';

  @override
  String get privacySection6Title => '문의하기';

  @override
  String get privacySection6Body =>
      '질문이나 우려사항이 있으신가요? Privacy@lifenavigator.app으로 이메일을 보내주시면 영업일 기준 2일 이내에 연락드리겠습니다.';

  @override
  String get termsLeading => '이용 약관';

  @override
  String get termsAccent => '서비스';

  @override
  String get termsLastUpdated => '최종 업데이트 날짜: 2026년 5월 18일';

  @override
  String get termsSection1Title => '1. 수락';

  @override
  String get termsSection1Body =>
      'AI Life Navigator를 사용함으로써 귀하는 본 약관에 동의하게 됩니다. 동의하지 않으시면 앱을 사용하지 마세요.';

  @override
  String get termsSection2Title => '2. 계정';

  @override
  String get termsSection2Body =>
      '귀하는 귀하의 계정을 안전하게 유지할 책임이 있습니다. 자격 증명을 공유하지 마십시오.';

  @override
  String get termsSection3Title => '3. AI 추천';

  @override
  String get termsSection3Body =>
      'AI 결과는 전문적인 조언이 아닌 지침입니다. 이를 바탕으로 내린 결정에 대한 책임은 귀하에게 있습니다.';

  @override
  String get termsSection4Title => '4. 구독';

  @override
  String get termsSection4Body =>
      '프리미엄 플랜은 취소될 때까지 자동 갱신됩니다. 언제든지 스토어 계정에서 취소할 수 있습니다.';

  @override
  String get termsSection5Title => '5. 허용되는 사용';

  @override
  String get termsSection5Body =>
      '악의적인 콘텐츠, 리버스 엔지니어링, 스크래핑이 없습니다. 위반 시 계정이 정지될 수 있습니다.';

  @override
  String get termsSection6Title => '6. 책임의 제한';

  @override
  String get termsSection6Body =>
      '법률이 허용하는 최대 한도 내에서 당사의 책임은 귀하가 지난 12개월 동안 당사에 지불한 금액으로 제한됩니다.';

  @override
  String get termsSection7Title => '7. 변경 사항';

  @override
  String get termsSection7Body =>
      '당사는 본 약관을 업데이트할 수 있습니다. 중요한 변경사항은 인앱 공지사항이나 이메일을 통해 알려드리겠습니다.';

  @override
  String get faqQ1 => '새로운 결정을 어떻게 시작하나요?';

  @override
  String get faqA1 => '홈 화면에서 \'새 분석 시작\' 카드를 탭하고 결정에 제목을 지정한 후 안내 단계를 따르세요.';

  @override
  String get faqQ2 => '내 데이터는 비공개인가요?';

  @override
  String get faqA2 =>
      '예. 결정은 기본적으로 장치에 로컬로 저장됩니다. 클라우드 동기화는 선택적으로 이루어지며 암호화됩니다.';

  @override
  String get faqQ3 => 'AI는 얼마나 정확합니까?';

  @override
  String get faqA3 =>
      'AI는 전문적인 조언이 아닌 체계적인 지침을 제공합니다. 자신의 판단과 함께 사고 보조 도구로 사용하십시오.';

  @override
  String get faqQ4 => 'AI가 내 대화에 접근할 수 있나요?';

  @override
  String get faqA4 => '아니요. 결정 흐름에 제출한 입력만 사용됩니다. 장치의 다른 내용은 읽혀지지 않습니다.';

  @override
  String get faqQ5 => '구독을 어떻게 취소하나요?';

  @override
  String get faqA5 =>
      'App Store/Google Play 구독 페이지에서 언제든지 취소하실 수 있습니다. 기간이 종료될 때까지 액세스는 계속됩니다.';

  @override
  String get faqQ6 => '환불을 제공합니까?';

  @override
  String get faqA6 =>
      '예. 첫 구매 후 7일 이내에 가능합니다. support@lifenavigator.app으로 이메일을 보내세요.';

  @override
  String get faqQ7 => '내 계정을 어떻게 삭제하나요?';

  @override
  String get faqA7 => '설정 → 계정 → 계정 삭제. 모든 데이터는 30일 이내에 제거됩니다.';

  @override
  String get faqQ8 => '내 결정을 내보낼 수 있나요?';

  @override
  String get faqA8 =>
      '예. 저장된 결정을 열고 보고서 내보내기를 눌러 PDF, Word, Excel 또는 이미지로 다운로드하세요.';

  @override
  String get notificationsLeading => '알림';

  @override
  String get notificationsAccent => '양이온';

  @override
  String get decisionTextRiskFallback => '전체 분석을 실행하여 맞춤형 위험 감소 팁을 얻으십시오.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return '전반적인 위험 수준은 $label($score%)입니다. 이 점수의 원인이 무엇인지 이해하려면 아래 분석을 검토하세요.';
  }
}
