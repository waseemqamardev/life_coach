// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'AI-навигатор по жизни';

  @override
  String get navHome => 'Главная';

  @override
  String get navChatbot => 'AI-чат';

  @override
  String get navInsights => 'Информация';

  @override
  String get navHistory => 'История';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get nextButton => 'Далее';

  @override
  String get backButton => 'Назад';

  @override
  String get saveButton => 'Сохранять';

  @override
  String get analyzeButton => 'Анализировать';

  @override
  String get tryAgain => 'Попробуйте еще раз';

  @override
  String get viewAll => 'Посмотреть все';

  @override
  String get searchHint => 'Поиск...';

  @override
  String get selectLanguage => 'Выбирать';

  @override
  String get languageWord => 'Язык';

  @override
  String get searchLanguageHint => 'Искать язык здесь...';

  @override
  String get noLanguagesFound => 'Языки не найдены';

  @override
  String get settings => 'Настройки';

  @override
  String get accountSettings => 'Настройка учетной записи';

  @override
  String get languages => 'Языки';

  @override
  String get theme => 'Тема';

  @override
  String get notifications => 'Уведомления';

  @override
  String get privacyPolicy => 'политика конфиденциальности';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get helpSupport => 'Помощь и поддержка';

  @override
  String get logout => 'Выход из системы';

  @override
  String get welcomeBack => 'Добро пожаловать!';

  @override
  String get emailAddress => 'Адрес электронной почты';

  @override
  String get password => 'Пароль';

  @override
  String get login => 'Войти';

  @override
  String get signUp => 'Регистрация';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get rememberMe => 'Запомнить меня';

  @override
  String goodMorning(String name) {
    return 'Доброе утро, $name 👋';
  }

  @override
  String get homeSubtitle =>
      'Получите рекомендации на базе искусственного интеллекта для принятия следующего важного решения.';

  @override
  String get startNewAnalysis => 'Начать новый анализ';

  @override
  String get startAnalysisSubtitle =>
      'Начните управляемый анализ и получите персональную рекомендацию.';

  @override
  String get decisionOverview => 'Обзор решения';

  @override
  String get riskScore => 'Оценка риска';

  @override
  String get successChance => 'Шанс на успех';

  @override
  String get activePlans => 'Активные планы';

  @override
  String get inProgress => 'В ходе выполнения';

  @override
  String get recentInsights => 'Недавняя информация';

  @override
  String get stepDefine => 'Определить';

  @override
  String get stepAnalyze => 'Анализ';

  @override
  String get stepQuestions => 'Вопросы';

  @override
  String get stepResult => 'Результат';

  @override
  String get defineYourProblem => 'Определите свой';

  @override
  String get problemWord => 'Проблема';

  @override
  String get tellUsMore => 'Расскажите нам подробнее о своем решении';

  @override
  String get wizardHint =>
      'Чем больше подробностей вы предоставите, тем лучше наш ИИ сможет анализировать и направлять вас.';

  @override
  String get describeDecision => 'Опишите свое решение';

  @override
  String get quickTips => 'Краткие советы';

  @override
  String get beSpecific => 'Будьте конкретны';

  @override
  String get includeContext => 'Включить контекст';

  @override
  String get mentionGoal => 'Упоминание цели';

  @override
  String get choosingBetween => 'Между чем вы выбираете?';

  @override
  String get optionsHint =>
      'Назовите до 5 вариантов. ИИ взвесит каждое из ваших целей.';

  @override
  String get addAnotherOption => 'Добавить еще один вариант';

  @override
  String get continueToAnalysis => 'Продолжить анализ';

  @override
  String get aiQuestionsTitle => 'ИИ';

  @override
  String get questionsWord => 'Вопросы';

  @override
  String get preparingQuestions => 'Подготовка индивидуальных вопросов…';

  @override
  String basedOnDecision(String title) {
    return 'На основании вашего решения: $title';
  }

  @override
  String get basedOnWizard => 'На основе того, что вы поделились в мастере';

  @override
  String get aiNavigator => 'AI-навигатор по жизни';

  @override
  String get aiQuestionsHint =>
      'Ответьте честно: ваши ответы формируют анализ ИИ.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'ИИ сгенерировал эти вопросы специально для «$title».';
  }

  @override
  String questionOf(int current, int total) {
    return 'Вопрос $current из $total';
  }

  @override
  String get whyThisMatters => 'Почему это важно?';

  @override
  String get whyQuestionsMatter =>
      'Ваши ответы помогут ИИ сосредоточиться на том, что наиболее важно для вашей ситуации.';

  @override
  String get securePrivate => 'Ваши данные в безопасности и конфиденциальности';

  @override
  String get processingAnalyzing => 'Анализ ваших возможностей...';

  @override
  String get processingRisk => 'Расчет факторов риска...';

  @override
  String get processingOutcomes => 'Прогнозируем результат...';

  @override
  String get processingPlan => 'Составление плана действий...';

  @override
  String get processingFinalizing => 'Окончательный результат';

  @override
  String get decisionResult => 'Решение';

  @override
  String get resultWord => 'Результат';

  @override
  String get recommendedChoice => 'Рекомендуемый выбор';

  @override
  String get benefitScore => 'Оценка преимуществ';

  @override
  String get confidence => 'Уверенность';

  @override
  String get fitScore => 'Оценка соответствия';

  @override
  String get resultBreakdown => 'Разбивка результатов';

  @override
  String get finalRecommendation => 'Заключительная рекомендация';

  @override
  String get outcomePrediction => 'Прогнозирование результата';

  @override
  String get confidenceMeter => 'Индикатор уверенности';

  @override
  String get actionPlan => 'План действий';

  @override
  String get prosCons => 'Плюсы и минусы';

  @override
  String get tipFromAi => 'Совет от ИИ';

  @override
  String get saveReport => 'Сохранить отчет';

  @override
  String get startNewDecision => 'Начать новое решение';

  @override
  String get decisionWord => 'Решение';

  @override
  String get comparisonWord => 'Сравнение';

  @override
  String get whyRecommended => 'Почему это рекомендуется?';

  @override
  String get riskBreakdown => 'Распределение рисков';

  @override
  String get riskInterpretation => 'Интерпретация риска';

  @override
  String get howToImprove => 'Как улучшить';

  @override
  String get overallConfidence => 'Общая уверенность';

  @override
  String get confidenceBreakdown => 'Распад доверия';

  @override
  String get successLikelihood => 'Вероятность успеха';

  @override
  String get outcomeBreakdown => 'Разбивка результатов';

  @override
  String get keyOutcomeFactors => 'Ключевые факторы результата';

  @override
  String get prosTitle => 'Плюсы этого решения';

  @override
  String get consTitle => 'Минусы этого решения';

  @override
  String get overallProsCons => 'Общие плюсы и минусы';

  @override
  String get bestOverallFit => 'Лучшее общее соответствие';

  @override
  String get bestOverallChoice => 'Лучший общий выбор';

  @override
  String get recommendedChoiceLabel => 'Рекомендуемый выбор';

  @override
  String get yourActionPlan => 'Ваш план действий';

  @override
  String get aiInsight => 'AI-инсайт';

  @override
  String get keyComparison => 'Ключевое сравнение';

  @override
  String get overallScore => 'Общий балл';

  @override
  String get keyPoints => 'Ключевые моменты';

  @override
  String get analysisFailed =>
      'Анализ не удался. Проверьте свой Интернет и ключ API.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY отсутствует. Добавьте его в .env и перезапустите приложение.';

  @override
  String get noDescription => 'Описание не предоставлено.';

  @override
  String get history => 'История';

  @override
  String get about => 'О';

  @override
  String get profile => 'Профиль';

  @override
  String get editProfile => 'Редактировать профиль';

  @override
  String get low => 'Низкий';

  @override
  String get medium => 'Середина';

  @override
  String get high => 'Высокий';

  @override
  String get lowRisk => 'Низкий риск';

  @override
  String get mediumRisk => 'Средний риск';

  @override
  String get highRisk => 'Высокий риск';

  @override
  String get notAssessed => 'Не оценивается';

  @override
  String get couldNotLoadQuestions => 'Не удалось загрузить вопросы';

  @override
  String get noQuestionsGenerated => 'Никаких вопросов не возникло.';

  @override
  String get onboardingTitle1 =>
      'Принимайте более разумные решения с помощью ИИ';

  @override
  String get onboardingSubtitle1 =>
      'Получите персональные рекомендации по важным жизненным выборам.';

  @override
  String get onboardingTitle2 => 'Анализируйте риски и результаты';

  @override
  String get onboardingSubtitle2 =>
      'Прежде чем брать на себя обязательства, поймите компромиссы.';

  @override
  String get onboardingTitle3 => 'Следуйте четкому плану действий';

  @override
  String get onboardingSubtitle3 =>
      'Превратите идеи в практические следующие шаги.';

  @override
  String get getStarted => 'Начать';

  @override
  String get skip => 'Пропустить';

  @override
  String get darkMode => 'Темный режим';

  @override
  String get lightMode => 'Светлый режим';

  @override
  String get systemDefault => 'Системные настройки по умолчанию';

  @override
  String get generalSettings => 'Общие настройки';

  @override
  String get support => 'Поддерживать';

  @override
  String get legal => 'Юридический';

  @override
  String get languageChanged => 'Язык обновлен';

  @override
  String get yourOptions => 'Ваши варианты';

  @override
  String get recommended => 'Рекомендуется';

  @override
  String get compareOptions => 'Сравнить варианты';

  @override
  String get plan => 'План';

  @override
  String get prepare => 'Подготовить';

  @override
  String get execute => 'Выполнять';

  @override
  String get positiveOutcome => 'Положительный результат';

  @override
  String get neutralOutcome => 'Нейтральный результат';

  @override
  String get negativeOutcome => 'Отрицательный результат';

  @override
  String get overallRiskScore => 'Общая оценка риска';

  @override
  String get yourDecisionRiskLevel => 'Уровень риска вашего решения';

  @override
  String get overallPrediction => 'Общий прогноз';

  @override
  String get overallProsConsTitle => 'Общие плюсы и минусы';

  @override
  String get emptyHistory => 'Сохраненных решений пока нет.';

  @override
  String get startFirstDecision => 'Начните свой первый анализ решения';

  @override
  String get chatbotTitle => 'ИИ-чат-бот';

  @override
  String get insightsTitle => 'Информация';

  @override
  String get dailySuggestion => 'Ежедневное предложение';

  @override
  String get aboutTagline =>
      'Умная поддержка принятия решений на базе искусственного интеллекта — взвесьте варианты, риски и следующие шаги.';

  @override
  String get aboutBody =>
      'AI Life Navigator помогает вам принимать жизненные и карьерные решения с помощью структурированных вопросов, анализа рисков и четких планов действий.';

  @override
  String get personalInformation => 'Персональная информация';

  @override
  String get appSetting => 'Настройка приложения';

  @override
  String get securityPrivacy => 'Безопасность и конфиденциальность';

  @override
  String get aboutUs => 'О нас';

  @override
  String get howToUse => 'Как использовать';

  @override
  String get appTheme => 'Тема приложения';

  @override
  String get shareApp => 'Делиться';

  @override
  String get rateUs => 'Оцените нас';

  @override
  String get pleaseAddOption => 'Пожалуйста, добавьте хотя бы один вариант';

  @override
  String get noReportToSave => 'Нет отчета о решении для сохранения.';

  @override
  String get reportSaved => 'Отчет сохранен в истории.';

  @override
  String get pendingAnalysis => 'Ожидается анализ';

  @override
  String get untitledDecision => 'Безымянное решение';

  @override
  String get describeDecisionHint =>
      'Опишите вашу ситуацию, ограничения и то, как выглядит успех.';

  @override
  String optionLabel(String letter) {
    return 'Опция $letter';
  }

  @override
  String get goodChance => 'Хороший шанс';

  @override
  String get fairChance => 'Честный шанс';

  @override
  String get poorChance => 'Плохой шанс';

  @override
  String get couldNotPrepareQuestions =>
      'Не смог подготовить вопросы. Пожалуйста, попробуйте еще раз.';

  @override
  String get greetingFallbackName => 'там';

  @override
  String get dontHaveAccount => 'У вас нет учетной записи?';

  @override
  String get alreadyHaveAccount => 'У вас уже есть аккаунт?';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get welcome => 'Добро пожаловать!';

  @override
  String get orContinueWith => 'или продолжить с';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'Жизнь';

  @override
  String get navigator => 'Навигатор';

  @override
  String get authTagline =>
      'Помощник по принятию решений с использованием искусственного интеллекта';

  @override
  String get chatbotReadySubtitle => 'Готов управлять своей жизнью';

  @override
  String get chatbotInputHint => 'Начни свой чат здесь...';

  @override
  String get chatbotErrorMessage =>
      'К сожалению, мне не удалось связаться со службой AI. Пожалуйста, проверьте подключение и повторите попытку.';

  @override
  String get selectAll => 'Выбрать все';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => 'Выберите решения для удаления.';

  @override
  String get total => 'Общий';

  @override
  String get highScore => 'Высокий балл';

  @override
  String get justNow => 'Прямо сейчас';

  @override
  String minutesAgo(int count) {
    return '$count мин. назад';
  }

  @override
  String hoursAgo(int count) {
    return '$count час назад';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count часов назад';
  }

  @override
  String daysAgo(int count) {
    return '$count день назад';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count дней назад';
  }

  @override
  String scoreLabel(int score) {
    return 'Оценка $score';
  }

  @override
  String get themeCustomizeSubtitle =>
      'Настройте внешний вид вашего приложения';

  @override
  String get lightModeSubtitle => 'Чистый и яркий опыт';

  @override
  String get darkModeSubtitle => 'Удобен для глаз при слабом освещении';

  @override
  String get systemDefaultSubtitle => 'Использовать настройки темы устройства';

  @override
  String get preview => 'Предварительный просмотр';

  @override
  String get applyTheme => 'Применить тему';

  @override
  String get shareAppMessage => 'Поделитесь Life Navigator с друзьями.';

  @override
  String get rateAppThanks => 'Спасибо за оценку Life Navigator!';

  @override
  String fieldRequired(String field) {
    return '$field требуется';
  }

  @override
  String get emailRequired => 'Требуется электронная почта';

  @override
  String get emailInvalid =>
      'Пожалуйста, введите действительный адрес электронной почты';

  @override
  String get passwordRequired => 'Требуется пароль';

  @override
  String get passwordMinLength => 'Пароль должен быть не менее 6 символов';

  @override
  String get confirmPasswordRequired => 'Пожалуйста, подтвердите свой пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get otpRequired => 'Требуется одноразовый код';

  @override
  String otpInvalid(int length) {
    return 'Пожалуйста, введите действительный $length-значный код.';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field должен содержать не менее $min символов.';
  }

  @override
  String get fieldDescription => 'Описание';

  @override
  String get fieldTitle => 'Заголовок';

  @override
  String get fullName => 'Полное имя';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get createAccount => 'Зарегистрироваться';

  @override
  String get acceptTermsRequired =>
      'Пожалуйста, примите Условия и Политику конфиденциальности.';

  @override
  String get signupTitleLeading => 'Создайте свой';

  @override
  String get account => 'Счет';

  @override
  String get signupSubtitle =>
      'Присоединяйтесь к Life Navigator и принимайте более разумные решения каждый день.';

  @override
  String get iAgreeToThe => 'Я согласен на';

  @override
  String get forgotPasswordLeading => 'Забыл';

  @override
  String get forgotPasswordAccent => 'Пароль?';

  @override
  String get forgotPasswordSubtitle =>
      'Введите свой адрес электронной почты, и мы вышлем вам ссылку для сброса пароля.';

  @override
  String get enterEmailHint => 'Введите свой адрес электронной почты';

  @override
  String get forgotPasswordInfo =>
      'Мы отправим ссылку для сброса пароля на ваш адрес электронной почты.';

  @override
  String get sendVerificationCode => 'Отправить код подтверждения';

  @override
  String get sendPasswordResetLink => 'Отправить ссылку для сброса';

  @override
  String get emailVerificationTitle => 'Подтвердите адрес электронной почты';

  @override
  String get emailVerificationSubtitle =>
      'Мы отправили ссылку для подтверждения на вашу электронную почту. Откройте его, чтобы активировать свою учетную запись.';

  @override
  String get emailVerificationSpamHint =>
      'Если вы не видите письмо в течение нескольких минут, проверьте папку со спамом или нежелательной почтой.';

  @override
  String get emailVerificationWaiting =>
      'Ожидание проверки… проверим автоматически.';

  @override
  String get emailVerificationResend =>
      'Повторно отправить письмо с подтверждением';

  @override
  String get emailVerificationResent =>
      'Письмо с подтверждением отправлено повторно.';

  @override
  String get authErrorWrongPassword =>
      'Неправильный адрес электронной почты или пароль. Пожалуйста, попробуйте еще раз.';

  @override
  String get authErrorEmailInUse =>
      'Этот адрес уже зарегистрирован. Вместо этого попробуйте войти в систему.';

  @override
  String get authErrorWeakPassword =>
      'Пароль слишком слабый. Используйте не менее 6 символов.';

  @override
  String get authErrorUserNotFound =>
      'Аккаунт с этим адресом электронной почты не найден.';

  @override
  String get authErrorTooManyRequests =>
      'Слишком много попыток. Пожалуйста, подождите и повторите попытку.';

  @override
  String get authErrorGeneric =>
      'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';

  @override
  String get authErrorGoogleCancelled => 'Вход в Google отменен.';

  @override
  String get passwordResetEmailSent =>
      'Письмо для сброса пароля отправлено. Проверьте свой почтовый ящик.';

  @override
  String get changePassword => 'Изменить пароль';

  @override
  String get changePasswordSubtitle =>
      'Введите текущий пароль и выберите новый.';

  @override
  String get currentPassword => 'Текущий пароль';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteAccountConfirm =>
      'Это приведет к безвозвратному удалению вашей учетной записи и не может быть отменено.';

  @override
  String get deleteAccountSuccess =>
      'Также удалите локальные решения и чат, хранящиеся на этом устройстве.';

  @override
  String get accountDeleted => 'Ваш аккаунт был удален.';

  @override
  String get rememberPassword => 'Помните свой пароль?';

  @override
  String get passwordUpdatedLogin =>
      'Пароль обновлен. Пожалуйста, войдите в систему.';

  @override
  String get resetLeading => 'Перезагрузить';

  @override
  String get resetPasswordSubtitle =>
      'Создайте новый пароль для своей учетной записи.';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get confirmNewPassword => 'Подтвердите новый пароль';

  @override
  String get passwordHint =>
      'Используйте не менее 6 символов и микс, который вы можете запомнить.';

  @override
  String get updating => 'Обновление...';

  @override
  String get updatePassword => 'Обновить пароль';

  @override
  String get backTo => 'Вернуться к';

  @override
  String newCodeSentTo(String email) {
    return 'Новый код отправлен на $email.';
  }

  @override
  String get invalidVerificationCode =>
      'Неверный код подтверждения. Пожалуйста, попробуйте еще раз.';

  @override
  String otpResetSubtitle(String email) {
    return 'Введите 6-значный код сброса, отправленный на $email.';
  }

  @override
  String otpVerifySubtitle(String email) {
    return 'Введите 6-значный код подтверждения, отправленный на $email.';
  }

  @override
  String get verifyLeading => 'Проверять';

  @override
  String get verifyEmailLeading => 'Подтвердите свой';

  @override
  String get codeWord => 'Код';

  @override
  String get emailWord => 'Электронная почта';

  @override
  String resendCodeIn(int seconds) {
    return 'Повторно отправить код через ${seconds}s';
  }

  @override
  String get didntReceiveCode => 'Не получили код?';

  @override
  String get resendCode => 'Повторно отправить код';

  @override
  String get verifying => 'Проверка...';

  @override
  String get verifyCode => 'Проверить код';

  @override
  String get verifyAndContinue => 'Подтвердить и продолжить';

  @override
  String get wrongEmail => 'Неправильный адрес электронной почты?';

  @override
  String get goBack => 'Возвращаться';

  @override
  String get logOut => 'Выйти';

  @override
  String get logoutConfirmMessage =>
      'Вы уверены, что хотите выйти из этого приложения?';

  @override
  String get logoutConfirmYes => 'Да, выйти';

  @override
  String get insightsHeroDescription =>
      'Ежедневные предложения и идеи, адаптированные к вашим решениям.';

  @override
  String recommendedPrefix(String text) {
    return 'Рекомендуется: $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'Завершите анализ, чтобы увидеть персонализированную интерпретацию рисков.';

  @override
  String get startDecisionQuestion => 'С каким решением вам нужна помощь?';

  @override
  String get startDecisionSubtitle =>
      'Опишите свое решение и получите ценную информацию и рекомендации на основе искусственного интеллекта.';

  @override
  String get decisionTitle => 'Название решения';

  @override
  String get decisionTitleHint => 'например Стоит ли мне менять карьеру?';

  @override
  String get decisionCategory => 'Категория решения';

  @override
  String get importanceLevel => 'Уровень важности';

  @override
  String get impactMinor => 'Незначительное воздействие';

  @override
  String get impactModerate => 'Умеренное воздействие';

  @override
  String get impactHigh => 'Высокое воздействие';

  @override
  String get categoryCareer => 'Карьера';

  @override
  String get categoryFinance => 'Финансы';

  @override
  String get categoryHealth => 'Здоровье';

  @override
  String get categoryRelations => 'Отношения';

  @override
  String get categoryEducation => 'Образование';

  @override
  String get categoryOther => 'Другой';

  @override
  String get addYourOptionsLeading => 'Добавьте свой';

  @override
  String get optionsWord => 'Параметры';

  @override
  String get describeOptionHint => 'Опишите этот вариант';

  @override
  String get goalSelection => 'Выбор цели';

  @override
  String get goalSelectionSubtitle =>
      'Выберите для своего решения наиболее важные для вас варианты.';

  @override
  String get selectAtLeastOneGoal => 'Пожалуйста, выберите хотя бы одну цель';

  @override
  String get goalTipBody =>
      'Вы всегда можете изменить свои приоритеты позже в своем профиле.';

  @override
  String get goalGrowth => 'Рост';

  @override
  String get goalFinancialGain => 'Финансовая выгода';

  @override
  String get goalRiskReduction => 'Снижение риска';

  @override
  String get goalPersonalSatisfaction => 'Личное удовлетворение';

  @override
  String get goalTimeEfficiency => 'Эффективность времени';

  @override
  String get goalWorkLifeBalance => 'Баланс между работой и личной жизнью';

  @override
  String get goalStability => 'Стабильность';

  @override
  String get goalImpact => 'Влияние';

  @override
  String get budgetInput => 'Затраты на бюджет';

  @override
  String get budgetSubtitle =>
      'Выберите предполагаемый бюджет для этого решения.';

  @override
  String get budgetImpactLevel => 'Уровень влияния на бюджет';

  @override
  String get budgetLessThan5k => 'Менее 5 тысяч долларов';

  @override
  String get enterYourBudget => 'Введите свой бюджет';

  @override
  String get timeAvailability => 'Доступность времени';

  @override
  String get timeAvailabilitySubtitle =>
      'Выберите наличие времени для принятия этого решения.';

  @override
  String get experienceLevel => 'Уровень опыта';

  @override
  String get experienceSubtitle =>
      'Это помогает нашему ИИ понять ваш опыт и опыт.';

  @override
  String get riskTolerance => 'Толерантность к риску';

  @override
  String get riskToleranceSubtitle =>
      'Выберите уровень толерантности к риску для этого решения.';

  @override
  String get timeUrgency => 'Срочное время';

  @override
  String get urgencySubtitle => 'Выберите срочность вашего решения.';

  @override
  String get financialRisk => 'Финансовый риск';

  @override
  String get marketRisk => 'Рыночный риск';

  @override
  String get timeRisk => 'Временной риск';

  @override
  String get executionRisk => 'Риск исполнения';

  @override
  String get personalRisk => 'Личный риск';

  @override
  String get overallFit => 'Общая посадка';

  @override
  String get firstOption => 'Первый вариант';

  @override
  String get secondOption => 'Второй вариант';

  @override
  String get versus => 'Против';

  @override
  String get confidenceInterpretation => 'Интерпретация уверенности';

  @override
  String get financialImpact => 'Финансовое влияние';

  @override
  String get riskLevel => 'Уровень риска';

  @override
  String get timeInvestment => 'Инвестиции времени';

  @override
  String get longTermSustainability => 'Долгосрочная устойчивость';

  @override
  String get personalGrowth => 'Личностный рост';

  @override
  String get outcomeConsistency => 'Согласованность результатов';

  @override
  String get riskAssessment => 'Оценка риска';

  @override
  String get historicalSimilarity => 'Историческое сходство';

  @override
  String get relevanceMatch => 'Соответствие релевантности';

  @override
  String get dataQuality => 'Качество данных';

  @override
  String get confidenceVeryHigh => 'Очень высокий';

  @override
  String get confidenceModerate => 'Умеренный';

  @override
  String get confidenceVeryLow => 'Очень низкий';

  @override
  String get onboardingAiPowered => 'Работает на искусственном интеллекте';

  @override
  String get onboardingSmartAnalysis =>
      'Умный анализ для принятия лучших решений';

  @override
  String get onboardingRiskAnalysis => 'Анализ рисков';

  @override
  String get onboardingActionablePlans => 'Планы действий';

  @override
  String get onboardingTrustedGuidance => 'Надежное руководство';

  @override
  String get onboardingDefineGoalLeading => 'Определите свой';

  @override
  String get goalWord => 'Цель';

  @override
  String get onboardingChooseJourney =>
      'Выберите жизненный путь, по которому вы хотите получить руководство';

  @override
  String get onboardingCareerPath => 'Карьерный путь';

  @override
  String get onboardingCareerPathDesc => 'Изучите будущие рынки и навыки';

  @override
  String get onboardingMajorPurchase => 'Крупная покупка';

  @override
  String get onboardingMajorPurchaseDesc => 'Сравните варианты новой покупки';

  @override
  String get onboardingLifeChanges => 'Изменения в жизни';

  @override
  String get onboardingLifeChangesDesc => 'Запланируйте переезд или новый этап';

  @override
  String get onboardingPersonalGrowth => 'Личностный рост';

  @override
  String get onboardingPersonalGrowthDesc =>
      'Определить изменения в навыках и мышлении';

  @override
  String get onboardingReadyLeading => 'Готов к';

  @override
  String get navigateWord => 'Навигация';

  @override
  String get onboardingReadySubtitle =>
      'Ваш персональный помощник готов помочь';

  @override
  String get onboardingActionableGuidance => 'Действенное руководство';

  @override
  String get onboardingActionableGuidanceDesc =>
      'Получите рекомендации для вашего успеха';

  @override
  String get onboardingProgressTracking => 'Отслеживание прогресса';

  @override
  String get onboardingProgressTrackingDesc =>
      'Отслеживайте этапы вашего путешествия';

  @override
  String get onboardingAdjustOnTheFly => 'Настройка на лету';

  @override
  String get onboardingAdjustDesc =>
      'Переоценивайте планы по мере развития событий';

  @override
  String get onboardingShareLearn => 'Делитесь и учитесь';

  @override
  String get onboardingShareLearnDesc => 'Делитесь и учитесь на своих путях';

  @override
  String get myProfileLeading => 'Мой';

  @override
  String get preferences => 'Предпочтения';

  @override
  String get personalityPreferences => 'Личностные предпочтения';

  @override
  String get saveChanges => 'Сохранить изменения';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get tapToChangePhoto => 'Нажмите здесь, чтобы изменить фотографию';

  @override
  String get photoPickerComingSoon =>
      'Скоро появится средство выбора фотографий.';

  @override
  String get pickImageSourceTitle => 'Изменить фотографию профиля';

  @override
  String get pickFromCamera => 'Сфотографироваться';

  @override
  String get pickFromGallery => 'Выбрать из галереи';

  @override
  String get removePhoto => 'Удалить фото';

  @override
  String get cameraPermissionDenied =>
      'Для фотографирования требуется разрешение камеры.';

  @override
  String get galleryPermissionDenied =>
      'Для выбора фотографии требуется разрешение библиотеки фотографий.';

  @override
  String get openSettings => 'Открыть настройки';

  @override
  String get savePreferences => 'Сохранить настройки';

  @override
  String get preferencesSaved => 'Настройки сохранены.';

  @override
  String get personalitySubtitle => 'Помогите ИИ лучше понять вас';

  @override
  String get focusAreas => 'Направления деятельности';

  @override
  String get emptyTitleLeading => 'Ничего';

  @override
  String get emptyTitleAccent => 'Здесь еще';

  @override
  String get emptyQuietTitle => 'Здесь тихо';

  @override
  String get emptyHistoryHint =>
      'Начните принимать первое решение, и ваша история появится здесь.';

  @override
  String get startADecision => 'Принять решение';

  @override
  String get helpHereToHelp => 'Мы здесь, чтобы помочь';

  @override
  String get faq => 'Часто задаваемые вопросы';

  @override
  String get noResults => 'Нет результатов';

  @override
  String get errorTitle => 'Что-то пошло не так';

  @override
  String get errorSubtitle =>
      'Мы столкнулись с непредвиденной ошибкой. Пожалуйста, попробуйте еще раз.';

  @override
  String get contactSupport => 'Обратиться в службу поддержки';

  @override
  String get noInternetTitle => 'Нет соединения';

  @override
  String get noInternetSubtitle =>
      'Пожалуйста, проверьте подключение к Интернету и повторите попытку.';

  @override
  String get retryConnection => 'Повторить попытку подключения';

  @override
  String get offlineMode => 'Перейти в автономный режим';

  @override
  String get permissionTitle => 'Разрешения приложения';

  @override
  String get permissionSubtitle => 'Предоставьте разрешения для лучшего опыта.';

  @override
  String get grantAll => 'Предоставить все';

  @override
  String get notNow => 'Не сейчас';

  @override
  String get updateAvailable => 'Доступно обновление';

  @override
  String get updateSubtitle => 'Доступна новая версия с улучшениями.';

  @override
  String get updateNow => 'Обновить сейчас';

  @override
  String get remindLater => 'Напомни мне позже';

  @override
  String get loadingMessage => 'Готовим вещи...';

  @override
  String get decisionDetailLeading => 'Решение';

  @override
  String get detailWord => 'Деталь';

  @override
  String get decisionNotFound => 'Решение не найдено';

  @override
  String get overall => 'Общий';

  @override
  String get pros => 'Плюсы';

  @override
  String get cons => 'Минусы';

  @override
  String get notes => 'Примечания';

  @override
  String get saveAtLeastTwoToCompare =>
      'Сохраните как минимум два решения для сравнения.';

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
  String get moderate => 'Умеренный';

  @override
  String get veryHigh => 'Очень высокий';

  @override
  String get veryLow => 'Очень низкий';

  @override
  String get next => 'Следующий';

  @override
  String get later => 'Позже';

  @override
  String get useWord => 'Использовать';

  @override
  String get aboutUsLeading => 'О';

  @override
  String get aboutUsAccent => 'Нас';

  @override
  String get howToUseLeading => 'Как';

  @override
  String get versionLabel => 'Версия 1.0.0';

  @override
  String get dailyDecision => 'Ежедневное решение';

  @override
  String get personalityDescription =>
      'Эти настройки персонализируют тон и глубину рекомендаций.';

  @override
  String get traitOptimism => 'Оптимизм';

  @override
  String get traitPatience => 'Терпение';

  @override
  String get traitDetailFocus => 'Детальный фокус';

  @override
  String get categoryTravel => 'Путешествовать';

  @override
  String get helpResponseTime => 'Среднее время ответа: менее 24 часов';

  @override
  String get helpGetInTouch => 'Свяжитесь с нами';

  @override
  String get helpLiveChat => 'Живой чат';

  @override
  String get helpLiveChatSub =>
      'Общайтесь с нашей командой в режиме реального времени';

  @override
  String get helpCall => 'Вызов';

  @override
  String get helpCallSub => 'Пн–Пт, 9:00–17:00 (тихоокеанское время)';

  @override
  String get helpSubmitTicket => 'Отправить билет';

  @override
  String get helpSubmitTicketSub =>
      'Получите отслеживаемый запрос в службу поддержки';

  @override
  String get helpQuickLinks => 'Быстрые ссылки';

  @override
  String get faqSubtitle => 'Ответы на распространенные вопросы';

  @override
  String get aboutSubtitle => 'Версия, авторы и ссылки';

  @override
  String get helpOpenLiveChat => 'Открыть чат';

  @override
  String get helpLiveChatSoon =>
      'Скоро откроется онлайн-чат — мы ответим вам по электронной почте в течение 24 часов.';

  @override
  String get moreOptionsComingSoon => 'Скоро появятся новые варианты';

  @override
  String get insightCompoundTitle => 'Объединяйте свои решения';

  @override
  String get insightCompoundMessage =>
      'Решения, принятые сегодня, определяют возможности через 6 месяцев. Выберите тот, который открывает больше всего дверей.';

  @override
  String get insightParalysisTitle => 'Остерегайтесь аналитического паралича';

  @override
  String get insightParalysisMessage =>
      'Если вы думали об этом больше недели и не получили новой информации, у вас есть достаточно, чтобы принять решение.';

  @override
  String get insightRiskStressTitle => 'Риск не равен стрессу';

  @override
  String get insightRiskStressMessage =>
      'Решение, связанное с высоким риском, все равно может оказаться менее стрессовым, если у вас есть четкий план Б. Всегда продумывайте запасной вариант.';

  @override
  String get insightFutureYouTitle => 'Будущее – вы тоже голосуете';

  @override
  String get insightFutureYouMessage =>
      'Прежде чем принять решение, спросите себя: будете ли вы из будущего через 5 лет благодарить настоящего за это?';

  @override
  String streakDays(int count) {
    return '$count-дневная серия';
  }

  @override
  String get streakKeepGoing =>
      'Продолжайте идти – примите сегодняшнее решение во внимание.';

  @override
  String get todaysDecisionPrompt =>
      'Сегодняшняя подсказка для принятия решения';

  @override
  String get dailyDecisionExerciseSub =>
      'Быстрое 60-секундное упражнение на принятие решений';

  @override
  String get dailyDecisionQuestion =>
      'Стоит ли вам сказать «да» или «нет» этой возможности?';

  @override
  String get dailyDecisionScenario =>
      'Коллега приглашает вас в сторонний проект. Это увлекательно, но занимает 10 часов в неделю.';

  @override
  String get seeAiAnalysis => 'См. анализ ИИ';

  @override
  String get errorWhatYouCanDo => 'Что вы можете сделать';

  @override
  String get errorTip1 => 'Проверьте подключение к Интернету';

  @override
  String get errorTip2 => 'Повторите действие через минуту.';

  @override
  String get errorTip3 => 'Перезапустите приложение';

  @override
  String get errorTip4 =>
      'Свяжитесь со службой поддержки, если это продолжится.';

  @override
  String get noInternetYouCanStill => 'Вы все еще можете';

  @override
  String get offlineTip1 => 'Просмотр сохраненных решений и истории';

  @override
  String get offlineTip2 => 'Прочтите свои заметки и планы действий';

  @override
  String get offlineTip3 => 'Просмотрите часто задаваемые вопросы и информацию';

  @override
  String get permissionNotificationsDesc =>
      'Получайте напоминания и ежедневные подсказки для принятия решений';

  @override
  String get permissionLocation => 'Расположение';

  @override
  String get permissionLocationDesc =>
      'Используется только для предложений на основе местоположения.';

  @override
  String get permissionStorage => 'Хранилище';

  @override
  String get permissionStorageDesc =>
      'Сохраняйте отчеты и экспортируйте локально';

  @override
  String get permissionSettingsNote =>
      'Вы можете изменить разрешения в любое время в настройках.';

  @override
  String updateVersionReady(String version) {
    return 'Версия $version готова к установке.';
  }

  @override
  String get whatsNew => 'Что нового';

  @override
  String get updateFeature1 => 'Более быстрый анализ ИИ (ускорение в 2 раза)';

  @override
  String get updateFeature2 => 'Новый модуль «Карьерный консультант»';

  @override
  String get updateFeature3 => 'Улучшен контраст темного режима.';

  @override
  String get updateFeature4 => 'Исправлены ошибки и улучшена стабильность.';

  @override
  String get loadingSubtitle => 'Обычно это занимает всего несколько секунд';

  @override
  String get howToUseStep1Title => 'Определите свое решение';

  @override
  String get howToUseStep1Body =>
      'Начните с описания вашего решения, категории и того, что для вас наиболее важно.';

  @override
  String get howToUseStep2Title => 'Проанализируйте свои варианты';

  @override
  String get howToUseStep2Body =>
      'Отвечайте на управляемые вопросы о целях, срочности, бюджете и толерантности к риску.';

  @override
  String get howToUseStep3Title => 'Обзор результатов ИИ';

  @override
  String get howToUseStep3Body =>
      'Ознакомьтесь с вашими рекомендациями, оценкой риска, плюсами и минусами, а также пошаговым планом действий.';

  @override
  String get howToUseStep4Title => 'Сохраняйте и отслеживайте прогресс';

  @override
  String get howToUseStep4Body =>
      'Сохраняйте решения в истории и возвращайтесь к ним всякий раз, когда вам понадобятся рекомендации.';

  @override
  String get clientSelectionLeading => 'Клиент';

  @override
  String get clientSelectionAccent => 'Выбор';

  @override
  String get whichClientQuestion => 'Какому клиенту следует сказать «да»?';

  @override
  String get clientSelectionSubtitle =>
      'ИИ оценивает возможности клиентов по критериям соответствия, комиссии и риска.';

  @override
  String get freelancePricingLeading => 'Внештатный';

  @override
  String get freelancePricingAccent => 'Цены';

  @override
  String get recommendedPrice => 'Рекомендуемая цена';

  @override
  String get pricingScore => 'Оценка цен';

  @override
  String get priceComparison => 'Сравнение цен';

  @override
  String get priceDrivers => 'Ценовые драйверы';

  @override
  String get marketRate => 'Рыночная ставка';

  @override
  String get experienceLabel => 'Опыт';

  @override
  String get timelineLabel => 'Хронология';

  @override
  String get complexityLabel => 'Сложность';

  @override
  String get projectValue => 'Стоимость проекта';

  @override
  String get sendProposal => 'Отправить предложение';

  @override
  String get proposalSent => 'Предложение отправлено клиенту.';

  @override
  String get productivityLeading => 'Производительность';

  @override
  String get productivityAccent => 'Планировщик';

  @override
  String get eisenhowerPriority => 'Приоритет Эйзенхауэра';

  @override
  String get startFocusBlock => 'Начать блокировку фокуса';

  @override
  String get focusBlockStarted => 'Блокировка фокуса началась — удачи!';

  @override
  String get careerAdvisorLeading => 'Карьера';

  @override
  String get careerAdvisorAccent => 'Советник';

  @override
  String get careerFitScore => 'Оценка соответствия карьере';

  @override
  String get topPathProductManager => 'Верхний путь: Менеджер по продукту';

  @override
  String get skillMatch => 'Матч навыков';

  @override
  String get strategyLabel => 'Стратегия';

  @override
  String get communicationLabel => 'Коммуникация';

  @override
  String get analyticsLabel => 'Аналитика';

  @override
  String get technicalLabel => 'Технический';

  @override
  String get build90DayPlan => 'Постройте 90-дневный план';

  @override
  String get businessIdeaLeading => 'Бизнес';

  @override
  String get businessIdeaAccent => 'Идея';

  @override
  String get describeBusinessIdea => 'Опишите свою бизнес-идею';

  @override
  String get businessIdeaSubtitle =>
      'ИИ будет оценивать жизнеспособность, соответствие рынку и риск.';

  @override
  String get viabilityScore => 'Оценка жизнеспособности';

  @override
  String get scoreBreakdown => 'Распределение очков';

  @override
  String get aiVerdict => 'Вердикт ИИ';

  @override
  String get fullPlanGenerated => 'Полный план создан и сохранен.';

  @override
  String get financialCalcLeading => 'Финансовый';

  @override
  String get financialCalcAccent => 'Калькулятор';

  @override
  String get compoundGrowth => 'Комплексный рост';

  @override
  String get futureValue => 'Будущая стоимость';

  @override
  String get saveToDecisions => 'Сохранить в решения';

  @override
  String get saveDecisionLeading => 'Сохранять';

  @override
  String get saveDecisionAccent => 'Решение';

  @override
  String get decisionSaved => 'Решение сохранено.';

  @override
  String get folderLabel => 'Папка';

  @override
  String get folderDefault => 'По умолчанию';

  @override
  String get folderCareer => 'Карьера';

  @override
  String get folderFinance => 'Финансы';

  @override
  String get folderHealth => 'Здоровье';

  @override
  String get folderPersonal => 'Персональный';

  @override
  String get reportExportLeading => 'Экспорт';

  @override
  String get reportExportAccent => 'Отчет';

  @override
  String get exportReport => 'Экспортный отчет';

  @override
  String get shareReport => 'Поделиться отчетом';

  @override
  String get subscriptionLeading => 'Выберите свой';

  @override
  String get subscriptionAccent => 'План';

  @override
  String get mostPopular => 'Самый популярный';

  @override
  String get freeTrial => '7-дневная бесплатная пробная версия';

  @override
  String get upgradePremium => 'Обновите до Премиум';

  @override
  String get choosePlan => 'Выберите план';

  @override
  String get paymentSuccessful => 'Платеж успешен!';

  @override
  String get thankYouUpgrade => 'Благодарим вас за переход на Премиум.';

  @override
  String get goToDashboard => 'Перейти на панель управления';

  @override
  String get paymentDetails => 'Детали оплаты';

  @override
  String get payNow => 'Оплатить сейчас';

  @override
  String get cardNumber => 'Номер карты';

  @override
  String get nameOnCard => 'Имя на карте';

  @override
  String get premiumFeatures => 'Премиум-функции';

  @override
  String get faqSearchHint => 'Поиск часто задаваемых вопросов';

  @override
  String get topicAll => 'Все';

  @override
  String get topicGettingStarted => 'Начиная';

  @override
  String get topicAi => 'ИИ';

  @override
  String get topicBilling => 'Биллинг';

  @override
  String get topicAccount => 'Счет';

  @override
  String get tabAll => 'Все';

  @override
  String get tabUnread => 'Непрочитано';

  @override
  String get tabArchived => 'В архиве';

  @override
  String get noArchivedItems => 'Нет элементов в архиве';

  @override
  String get traitRiskTolerance => 'Толерантность к риску';

  @override
  String get budgetWhyMatters =>
      'Бюджет помогает ИИ взвесить финансовые компромиссы в ваших рекомендациях.';

  @override
  String get timeWhyMatters =>
      'Наличие времени определяет, насколько амбициозным должен быть ваш план действий.';

  @override
  String get experienceWhyMatters =>
      'Уровень опыта помогает ИИ адаптировать советы к вашему опыту.';

  @override
  String get riskWhyMatters =>
      'Толерантность к риску определяет, насколько консервативными или смелыми будут ваши рекомендации.';

  @override
  String get urgencyWhyMatters =>
      'Срочность влияет на то, насколько быстро вам следует действовать по рекомендации.';

  @override
  String get confidenceReliableRecommend => 'В целом надежная рекомендация';

  @override
  String get confidenceReliableSomeRisks =>
      'В целом надежен с некоторыми рисками';

  @override
  String get confidenceConsiderRisks => 'Тщательно учитывайте риски';

  @override
  String get confidenceHighUncertainty =>
      'Высокая неопределенность — действуйте осторожно';

  @override
  String get stepResults => 'Результаты';

  @override
  String get urgencyNoRush => 'Нет спешки';

  @override
  String get urgencyModerate => 'Умеренный';

  @override
  String get urgencyUrgent => 'Срочный';

  @override
  String get urgencyCritical => 'Критический';

  @override
  String get experienceBeginner => 'Новичок';

  @override
  String get experienceIntermediate => 'Средний';

  @override
  String get experienceAdvanced => 'Передовой';

  @override
  String get experienceExpert => 'Эксперт';

  @override
  String get timeVeryLimited => 'Очень ограничено';

  @override
  String get timeLimited => 'Ограниченный';

  @override
  String get timeModerateAvail => 'Умеренный';

  @override
  String get timeHighAvail => 'Высокий';

  @override
  String get timeVeryHigh => 'Очень высокий';

  @override
  String get riskToleranceLow => 'Низкий';

  @override
  String get riskToleranceModerate => 'Умеренный';

  @override
  String get riskToleranceHigh => 'Высокий';

  @override
  String get riskToleranceVeryHigh => 'Очень высокий';

  @override
  String get doNow => 'Сделайте сейчас';

  @override
  String get doToday => 'Сделай сегодня';

  @override
  String get scheduleLabel => 'Расписание';

  @override
  String get deleteLabel => 'Удалить';

  @override
  String get tipLabel => 'Кончик';

  @override
  String get aiRecommendation => 'Рекомендации по искусственному интеллекту';

  @override
  String get comparisonMenu => 'Сравнение';

  @override
  String get clientSelectionVerdictBody =>
      'Acme — лучший вариант — скажите «да». Тайный клиент: вежливо откажитесь; Расплывчатые описания предсказывают расширение масштабов.';

  @override
  String get freelancePricingSubtitle =>
      'Рекомендации по тарифам на основе искусственного интеллекта';

  @override
  String get priceLower => 'Ниже';

  @override
  String get priceRecommended => 'Рекомендуется';

  @override
  String get priceHigher => 'Выше';

  @override
  String get freelancePricingRecommendationBody =>
      'Цена в 2800 долларов позволит заполучить этого клиента с хорошей прибылью. Если они сопротивляются, сосредоточьтесь на объеме, а не снижайте цену.';

  @override
  String get productivitySubtitle =>
      'ИИ сортирует, что делать сейчас, что запланировать, а что отказаться.';

  @override
  String get productivityTipBody =>
      'Если все срочно, то ничего. Выберите 1–2 дела, которые нужно сделать сейчас, и защитите их, как встречи.';

  @override
  String get careerAdvisorDescription =>
      'Идеально подходит в зависимости от ваших навыков, стиля общения и роста интереса.';

  @override
  String get nextSteps => 'Следующие шаги';

  @override
  String get careerAdvisorNextStepsBody =>
      'В этом квартале возглавьте небольшую межфункциональную инициативу, чтобы добиться успеха в стиле PM.';

  @override
  String get excellent => 'Отличный';

  @override
  String get good => 'Хороший';

  @override
  String get businessIdeaHint =>
      'например, коробочка для подписки на комнатные растения с напоминаниями об уходе от искусственного интеллекта.';

  @override
  String get marketSize => 'Размер рынка';

  @override
  String get competition => 'Соревнование';

  @override
  String get profitability => 'Рентабельность';

  @override
  String get executionEase => 'Легкость исполнения';

  @override
  String get large => 'Большой';

  @override
  String get businessIdeaVerdictBody =>
      'Сильная концепция с четкой аудиторией. Сосредоточьтесь в первые 90 дней на привлечении 20 платежеспособных клиентов, прежде чем масштабировать маркетинг.';

  @override
  String get generateFullPlan => 'Создать полный план';

  @override
  String get financialCalcSubtitle =>
      'Посмотрите, во что со временем вырастут ваши деньги.';

  @override
  String get financialInitialAmount => 'Начальная сумма (\$)';

  @override
  String get financialAnnualRate => 'Годовая ставка (%)';

  @override
  String get financialDuration => 'Продолжительность (лет)';

  @override
  String get financialCalcTipBody =>
      'Даже небольшие ежемесячные взносы превосходят крупные разовые депозиты на срок более 10 лет.';

  @override
  String get saveDecisionNotesHint =>
      'Все, что вы хотите запомнить об этом решении';

  @override
  String get reportExportSubtitle =>
      'Сохраните или поделитесь отчетом о своем решении';

  @override
  String get completed => 'Завершенный';

  @override
  String get goAhead => 'Вперед, продолжать';

  @override
  String get includeInReport => 'Включить в отчет';

  @override
  String get executiveSummary => 'Управляющее резюме';

  @override
  String get analysisDetails => 'Детали анализа';

  @override
  String get notesAndInputs => 'Примечания и данные';

  @override
  String get exportFormat => 'Формат экспорта';

  @override
  String get pdfBestForSharing => 'Лучше всего поделиться';

  @override
  String get excelDataScores => 'Данные и оценки';

  @override
  String get wordDocument => 'Документ';

  @override
  String get imageJpgPng => 'JPG / PNG';

  @override
  String get shareOrSave => 'Поделитесь или сохраните';

  @override
  String get shareLink => 'Поделиться ссылкой';

  @override
  String get createShareableLink => 'Создайте ссылку для общего доступа';

  @override
  String get emailReport => 'Отчет по электронной почте';

  @override
  String get sendViaEmail => 'Отправить по электронной почте';

  @override
  String get saveToDevice => 'Сохранить на устройство';

  @override
  String get downloadToDevice => 'Загрузить на устройство';

  @override
  String get scheduleAutoReports => 'Расписание автоматических отчетов';

  @override
  String exportedAs(String format) {
    return 'Экспортировано как $format';
  }

  @override
  String get subscriptionSubtitle =>
      'Принимайте более разумные решения с помощью подходящего для вас плана';

  @override
  String get makeSmarterDecisions => 'Принимайте более разумные решения';

  @override
  String get subscriptionHeroBody =>
      'Разблокируйте неограниченный анализ ИИ, глубокую аналитику и персонализированные рекомендации.';

  @override
  String get planBasic => 'Базовый';

  @override
  String get planPremium => 'Премиум';

  @override
  String get planPro => 'Про';

  @override
  String get perMonth => '/месяц';

  @override
  String get allPlansInclude => 'Все планы включают';

  @override
  String get moneyBackGuarantee => '7-дневная гарантия возврата денег';

  @override
  String get moneyBackGuaranteeBody =>
      'Не удовлетворены? Получите полный возврат средств в течение 7 дней.';

  @override
  String get subscribeTermsNote =>
      'Подписываясь, вы соглашаетесь с нашими Условиями и Политикой конфиденциальности.';

  @override
  String get securePaymentEncryption =>
      'Безопасная оплата с помощью стандартного шифрования';

  @override
  String get paymentLeading => 'Оплата';

  @override
  String get paymentAccent => 'Подробности';

  @override
  String get premiumMonthly => 'Премиум • Ежемесячно';

  @override
  String get taxEstimate => 'Налоговая оценка';

  @override
  String get totalToday => 'Итого сегодня';

  @override
  String get paymentMethod => 'Способ оплаты';

  @override
  String get paymentCard => 'Карта';

  @override
  String get paymentPayPal => 'PayPal';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get cardExpiryHint => 'ММ/ГГ';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'Сквозное шифрование. Мы никогда не храним вашу карту.';

  @override
  String get premiumFeaturesLeading => 'Премиум';

  @override
  String get premiumFeaturesAccent => 'Функции';

  @override
  String get premiumUnlockSubtitle => 'Раскройте всю мощь Life Navigator';

  @override
  String get premiumFeature1Title => 'Неограниченный анализ ИИ';

  @override
  String get premiumFeature1Body =>
      'Принимайте столько решений, сколько вам нужно.';

  @override
  String get premiumFeature2Title => 'Глубокая информация';

  @override
  String get premiumFeature2Body =>
      'Диаграммы риска, уверенности, результатов и воздействия.';

  @override
  String get premiumFeature3Title => 'Сравнить решения';

  @override
  String get premiumFeature3Body => 'Смотрите решения параллельно.';

  @override
  String get premiumFeature4Title => 'Экспорт отчетов';

  @override
  String get premiumFeature4Body => 'Экспорт PDF, Word, Excel и изображений.';

  @override
  String get premiumFeature5Title => 'Облачная синхронизация';

  @override
  String get premiumFeature5Body => 'Надежное резервное копирование в облако.';

  @override
  String get premiumFeature6Title => 'Приоритетная поддержка';

  @override
  String get premiumFeature6Body => 'Ответ в течение 24 часов.';

  @override
  String get paymentSuccessLeading => 'Оплата';

  @override
  String get paymentSuccessAccent => 'Успешный!';

  @override
  String get youNowHaveAccessTo => 'Теперь у вас есть доступ к';

  @override
  String get planLabel => 'План';

  @override
  String get amountLabel => 'Количество';

  @override
  String get methodLabel => 'Метод';

  @override
  String get transactionIdLabel => 'Идентификатор транзакции';

  @override
  String get unlimitedAi => 'Неограниченный ИИ';

  @override
  String get deepInsightsShort => 'Глубокая информация';

  @override
  String get compareShort => 'Сравнивать';

  @override
  String get exportsShort => 'Экспорт';

  @override
  String get cloudSyncShort => 'Облачная синхронизация';

  @override
  String get prioritySupportShort => 'Приоритетная поддержка';

  @override
  String get privacyLeading => 'Конфиденциальность';

  @override
  String get privacyAccent => 'Политика';

  @override
  String get privacyLastUpdated => 'Последнее обновление: 18 мая 2026 г.';

  @override
  String get privacySection1Title => 'Что мы собираем';

  @override
  String get privacySection1Body =>
      'Мы собираем только то, что вы нам предоставляете — сохраненные вами решения, данные вашей учетной записи (имя + адрес электронной почты) и ваши предпочтения. Все остальное остается на вашем устройстве.';

  @override
  String get privacySection2Title => 'Как мы это используем';

  @override
  String get privacySection2Body =>
      'Чтобы персонализировать рекомендации ИИ, синхронизируйте свои данные, если хотите, и улучшите приложение. Мы никогда не продаем ваши данные третьим лицам.';

  @override
  String get privacySection3Title => 'Локальное хранилище';

  @override
  String get privacySection3Body =>
      'Ваши решения по умолчанию сохраняются на вашем устройстве. Облачная синхронизация включается и шифруется при передаче и хранении.';

  @override
  String get privacySection4Title => 'Ваши права';

  @override
  String get privacySection4Body =>
      'Вы можете экспортировать или удалить все свои данные в любое время из настроек. Мы отвечаем на запросы данных в течение 7 дней.';

  @override
  String get privacySection5Title => 'Дети';

  @override
  String get privacySection5Body =>
      'AI Life Navigator не предназначен для детей до 13 лет. Мы сознательно не собираем данные от детей.';

  @override
  String get privacySection6Title => 'Связаться с нами';

  @override
  String get privacySection6Body =>
      'Вопросы или опасения? Отправьте электронное письмо по адресу Privacy@lifenavigator.app, и мы свяжемся с вами в течение двух рабочих дней.';

  @override
  String get termsLeading => 'Условия';

  @override
  String get termsAccent => 'Услуга';

  @override
  String get termsLastUpdated => 'Последнее обновление: 18 мая 2026 г.';

  @override
  String get termsSection1Title => '1. Принятие';

  @override
  String get termsSection1Body =>
      'Используя AI Life Navigator, вы соглашаетесь с настоящими Условиями. Если вы не согласны, пожалуйста, не используйте приложение.';

  @override
  String get termsSection2Title => '2. Аккаунт';

  @override
  String get termsSection2Body =>
      'Вы несете ответственность за безопасность своей учетной записи. Не делитесь своими учетными данными.';

  @override
  String get termsSection3Title => '3. Рекомендации ИИ';

  @override
  String get termsSection3Body =>
      'Результаты ИИ — это рекомендации, а не профессиональные советы. Вы несете ответственность за решения, которые принимаете на их основе.';

  @override
  String get termsSection4Title => '4. Подписки';

  @override
  String get termsSection4Body =>
      'Премиум-планы автоматически продлеваются до тех пор, пока не будут отменены. Вы можете отменить подписку в любое время со своей учетной записи в магазине.';

  @override
  String get termsSection5Title => '5. Допустимое использование';

  @override
  String get termsSection5Body =>
      'Никакого оскорбительного контента, никакого обратного проектирования и парсинга. Нарушения могут привести к блокировке аккаунта.';

  @override
  String get termsSection6Title => '6. Ограничение ответственности';

  @override
  String get termsSection6Body =>
      'В максимальной степени, разрешенной законом, наша ответственность ограничивается суммой, которую вы заплатили нам за предыдущие 12 месяцев.';

  @override
  String get termsSection7Title => '7. Изменения';

  @override
  String get termsSection7Body =>
      'Мы можем обновлять настоящие Условия. Мы уведомим вас о существенных изменениях через уведомление в приложении или по электронной почте.';

  @override
  String get faqQ1 => 'Как мне начать принимать новое решение?';

  @override
  String get faqA1 =>
      'Нажмите карточку «Начать новый анализ» на главном экране, дайте название своему решению и следуйте инструкциям.';

  @override
  String get faqQ2 => 'Мои данные конфиденциальны?';

  @override
  String get faqA2 =>
      'Да. Решения по умолчанию сохраняются локально на вашем устройстве. Облачная синхронизация осуществляется по согласию и зашифрована.';

  @override
  String get faqQ3 => 'Насколько точен ИИ?';

  @override
  String get faqA3 =>
      'ИИ предоставляет структурированное руководство, а не профессиональные советы. Используйте его как помощь в размышлении наряду с собственными суждениями.';

  @override
  String get faqQ4 => 'Может ли ИИ получить доступ к моим разговорам?';

  @override
  String get faqA4 =>
      'Нет. Используются только те данные, которые вы отправляете в потоке принятия решений. Больше ничего с вашего устройства не читается.';

  @override
  String get faqQ5 => 'Как мне отменить подписку?';

  @override
  String get faqA5 =>
      'Отмените подписку в любое время на странице подписки App Store/Google Play. Доступ сохраняется до окончания периода.';

  @override
  String get faqQ6 => 'Вы предлагаете возврат средств?';

  @override
  String get faqA6 =>
      'Да — в течение 7 дней с момента вашей первой покупки. Электронная почта support@lifenavigator.app.';

  @override
  String get faqQ7 => 'Как мне удалить свою учетную запись?';

  @override
  String get faqA7 =>
      'Настройки → Учетная запись → Удалить учетную запись. Все ваши данные будут удалены в течение 30 дней.';

  @override
  String get faqQ8 => 'Могу ли я экспортировать свои решения?';

  @override
  String get faqA8 =>
      'Да. Откройте любое сохраненное решение и нажмите «Экспортировать отчет», чтобы загрузить его в формате PDF, Word, Excel или изображения.';

  @override
  String get notificationsLeading => 'Уведомление';

  @override
  String get notificationsAccent => 'катионы';

  @override
  String get decisionTextRiskFallback =>
      'Проведите полный анализ, чтобы получить индивидуальные советы по снижению рисков.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'Ваш общий уровень риска составляет $label ($score%). Просмотрите разбивку ниже, чтобы понять, что влияет на этот рейтинг.';
  }

  @override
  String get urgencyNoRushSub => 'Не торопитесь, изучите и сравните варианты.';

  @override
  String get urgencyNoRushTag => 'Гибкие сроки';

  @override
  String get urgencyModerateSub =>
      'Примите решение в ближайшие несколько недель.';

  @override
  String get urgencyModerateTag => 'Несколько недель';

  @override
  String get urgencyUrgentSub =>
      'Вам нужно принять решение в течение нескольких дней.';

  @override
  String get urgencyUrgentTag => 'В течение нескольких дней';

  @override
  String get urgencyCriticalSub => 'Требуются немедленные действия.';

  @override
  String get urgencyCriticalTag => 'Срочно';

  @override
  String get urgencyWhyMattersDesc =>
      'Срочность влияет на то, какие факторы ИИ учитывает в первую очередь: быстрые решения и четкие сигналы.';

  @override
  String get budgetRange1 => '1-5 тыс. \$';

  @override
  String get budgetRange2 => '5-20 тыс. \$';

  @override
  String get budgetRange3 => '20-50 тыс. \$';

  @override
  String get budgetRange4 => '50 тыс. \$ +';

  @override
  String get budgetWhyMattersDesc =>
      'Ваш бюджет помогает ИИ оценивать варианты и рекомендовать наиболее экономичные решения.';

  @override
  String get riskToleranceLowSub =>
      'Предпочтение стабильным, предсказуемым результатам.';

  @override
  String get riskToleranceLowTag => 'Стабильно и безопасно';

  @override
  String get riskToleranceModerateSub =>
      'Принятие сбалансированных компромиссов.';

  @override
  String get riskToleranceModerateTag => 'Сбалансированный риск';

  @override
  String get riskToleranceHighSub => 'Готовность к риску ради большей выгоды.';

  @override
  String get riskToleranceHighTag => 'Ориентировано на рост';

  @override
  String get riskToleranceVeryHighSub =>
      'Комфорт при высокой неопределенности.';

  @override
  String get riskToleranceVeryHighTag => 'Максимальная выгода';

  @override
  String get riskWhyMattersDesc =>
      'Толерантность к риску помогает ИИ сопоставить потенциальную выгоду и возможные потери.';

  @override
  String get experienceBeginnerSub =>
      'Новичок в этой сфере; все еще накапливает знания.';

  @override
  String get experienceBeginnerTag => 'Лучшее для обучения';

  @override
  String get experienceIntermediateSub =>
      'Есть некоторый опыт и понимание контекста.';

  @override
  String get experienceIntermediateTag => 'Сбалансированные варианты';

  @override
  String get experienceAdvancedSub => 'Хорошая база в этой области.';

  @override
  String get experienceAdvancedTag => 'Ориентировано на рост';

  @override
  String get experienceExpertSub => 'Глубокие знания и доказанный опыт.';

  @override
  String get experienceExpertTag => 'Максимальный результат';

  @override
  String get experienceWhyMattersDesc =>
      'Ваш уровень опыта помогает ИИ настроить сложность и глубину рекомендаций.';

  @override
  String get timeVeryLimitedSub => 'Доступно всего несколько часов в неделю.';

  @override
  String get timeVeryLimitedTag => 'Минимум часов';

  @override
  String get timeLimitedSub => 'Свободно время по вечерам или выходным.';

  @override
  String get timeLimitedTag => 'Частичная занятость';

  @override
  String get timeModerateAvailSub =>
      'Стабильное количество времени каждую неделю.';

  @override
  String get timeModerateAvailTag => 'Регулярная занятость';

  @override
  String get timeHighAvailSub => 'Может уделять много часов в неделю.';

  @override
  String get timeHighAvailTag => 'Высокая доступность';

  @override
  String get timeVeryHighSub => 'Сейчас это может быть вашим главным фокусом.';

  @override
  String get timeVeryHighTag => 'Полная концентрация';

  @override
  String get timeWhyMattersDesc =>
      'Ваше свободное время помогает ИИ предлагать реалистичные планы, которых вы сможете придерживаться.';
}
