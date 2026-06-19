// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'AI生活领航员';

  @override
  String get navHome => '首页';

  @override
  String get navChatbot => 'AI 聊天';

  @override
  String get navInsights => '洞察';

  @override
  String get navHistory => '历史';

  @override
  String get continueButton => '继续';

  @override
  String get nextButton => '下一步';

  @override
  String get backButton => '后退';

  @override
  String get saveButton => '节省';

  @override
  String get analyzeButton => '分析';

  @override
  String get tryAgain => '再试一次';

  @override
  String get viewAll => '查看全部';

  @override
  String get searchHint => '搜索...';

  @override
  String get selectLanguage => '选择';

  @override
  String get languageWord => '语言';

  @override
  String get searchLanguageHint => '在此搜索语言...';

  @override
  String get noLanguagesFound => '未找到语言';

  @override
  String get settings => '设置';

  @override
  String get accountSettings => '账户设置';

  @override
  String get languages => '语言';

  @override
  String get theme => '主题';

  @override
  String get notifications => '通知';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get termsOfService => '服务条款';

  @override
  String get helpSupport => '帮助与支持';

  @override
  String get logout => '退出';

  @override
  String get welcomeBack => '欢迎回来！';

  @override
  String get emailAddress => '电子邮件';

  @override
  String get password => '密码';

  @override
  String get login => '登录';

  @override
  String get signUp => '注册';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get rememberMe => '记住账号';

  @override
  String goodMorning(String name) {
    return '早上好，$name 👋';
  }

  @override
  String get homeSubtitle => '为您下一个重要决定获取 AI 指导。';

  @override
  String get startNewAnalysis => '开始新的分析';

  @override
  String get startAnalysisSubtitle => '开始指导分析并接收个性化建议。';

  @override
  String get decisionOverview => '决策概述';

  @override
  String get riskScore => '风险评分';

  @override
  String get successChance => '成功机会';

  @override
  String get activePlans => '积极计划';

  @override
  String get inProgress => '进行中';

  @override
  String get recentInsights => '最近的见解';

  @override
  String get stepDefine => '定义';

  @override
  String get stepAnalyze => '分析';

  @override
  String get stepQuestions => '问题';

  @override
  String get stepResult => '结果';

  @override
  String get defineYourProblem => '定义你的';

  @override
  String get problemWord => '问题';

  @override
  String get tellUsMore => '告诉我们更多有关您的决定的信息';

  @override
  String get wizardHint => '您提供的详细信息越多，我们的人工智能就能更好地分析和指导您。';

  @override
  String get describeDecision => '描述你的决定';

  @override
  String get quickTips => '快速提示';

  @override
  String get beSpecific => '具体一点';

  @override
  String get includeContext => '包括上下文';

  @override
  String get mentionGoal => '提及目标';

  @override
  String get choosingBetween => '你在什么之间做出选择？';

  @override
  String get optionsHint => '最多列出 5 个选项。人工智能将根据你的目标权衡每一项。';

  @override
  String get addAnotherOption => '添加另一个选项';

  @override
  String get continueToAnalysis => '继续分析';

  @override
  String get aiQuestionsTitle => '人工智能';

  @override
  String get questionsWord => '问题';

  @override
  String get preparingQuestions => '准备个性化问题...';

  @override
  String basedOnDecision(String title) {
    return '根据您的决定：$title';
  }

  @override
  String get basedOnWizard => '基于您在向导中共享的内容';

  @override
  String get aiNavigator => 'AI生活领航员';

  @override
  String get aiQuestionsHint => '诚实回答——您的回答将影响人工智能分析。';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'AI 专门针对“$title”生成了这些问题。';
  }

  @override
  String questionOf(int current, int total) {
    return '$total 的问题 $current';
  }

  @override
  String get whyThisMatters => '为什么这很重要？';

  @override
  String get whyQuestionsMatter => '您的回答有助于人工智能专注于与您的情况最相关的问题。';

  @override
  String get securePrivate => '您的数据是安全且私密的';

  @override
  String get processingAnalyzing => '正在分析您的选择...';

  @override
  String get processingRisk => '计算风险因素...';

  @override
  String get processingOutcomes => '预测结果...';

  @override
  String get processingPlan => '制定行动计划...';

  @override
  String get processingFinalizing => '最终结果';

  @override
  String get decisionResult => '决定';

  @override
  String get resultWord => '结果';

  @override
  String get recommendedChoice => '推荐选择';

  @override
  String get benefitScore => '效益分数';

  @override
  String get confidence => '信心';

  @override
  String get fitScore => '适合度分数';

  @override
  String get resultBreakdown => '结果细目';

  @override
  String get finalRecommendation => '最终推荐';

  @override
  String get outcomePrediction => '结果预测';

  @override
  String get confidenceMeter => '置信度计';

  @override
  String get actionPlan => '行动计划';

  @override
  String get prosCons => '优点和缺点';

  @override
  String get tipFromAi => '来自人工智能的提示';

  @override
  String get saveReport => '保存报告';

  @override
  String get startNewDecision => '开始新的决定';

  @override
  String get decisionWord => '决定';

  @override
  String get comparisonWord => '比较';

  @override
  String get whyRecommended => '为什么推荐这个？';

  @override
  String get riskBreakdown => '风险分解';

  @override
  String get riskInterpretation => '风险解读';

  @override
  String get howToImprove => '如何改进';

  @override
  String get overallConfidence => '整体信心';

  @override
  String get confidenceBreakdown => '信心崩溃';

  @override
  String get successLikelihood => '成功可能性';

  @override
  String get outcomeBreakdown => '结果细目';

  @override
  String get keyOutcomeFactors => '关键结果因素';

  @override
  String get prosTitle => '这个决定的优点';

  @override
  String get consTitle => '这个决定的缺点';

  @override
  String get overallProsCons => '总体优缺点';

  @override
  String get bestOverallFit => '最佳整体贴合度';

  @override
  String get bestOverallChoice => '最佳整体选择';

  @override
  String get recommendedChoiceLabel => '推荐选择';

  @override
  String get yourActionPlan => '你的行动计划';

  @override
  String get aiInsight => '人工智能洞察';

  @override
  String get keyComparison => '主要比较';

  @override
  String get overallScore => '总分';

  @override
  String get keyPoints => '要点';

  @override
  String get analysisFailed => '分析失败。检查您的互联网和 API 密钥。';

  @override
  String get missingApiKey => 'GEMINI_API_KEY 丢失。将其添加到 .env 并重新启动应用程序。';

  @override
  String get noDescription => '没有提供描述。';

  @override
  String get history => '历史';

  @override
  String get about => '关于';

  @override
  String get profile => '轮廓';

  @override
  String get editProfile => '编辑个人资料';

  @override
  String get low => '低的';

  @override
  String get medium => '中等的';

  @override
  String get high => '高的';

  @override
  String get lowRisk => '低风险';

  @override
  String get mediumRisk => '中等风险';

  @override
  String get highRisk => '高风险';

  @override
  String get notAssessed => '未评估';

  @override
  String get couldNotLoadQuestions => '无法加载问题';

  @override
  String get noQuestionsGenerated => '没有产生任何问题。';

  @override
  String get onboardingTitle1 => '利用人工智能做出更明智的决策';

  @override
  String get onboardingSubtitle1 => '获得人生重要选择的个性化指导。';

  @override
  String get onboardingTitle2 => '分析风险和结果';

  @override
  String get onboardingSubtitle2 => '在做出承诺之前了解权衡。';

  @override
  String get onboardingTitle3 => '遵循明确的行动计划';

  @override
  String get onboardingSubtitle3 => '将见解转化为实际的后续步骤。';

  @override
  String get getStarted => '开始';

  @override
  String get skip => '跳过';

  @override
  String get darkMode => '深色模式';

  @override
  String get lightMode => '灯光模式';

  @override
  String get systemDefault => '系统默认值';

  @override
  String get generalSettings => '常规设置';

  @override
  String get support => '支持';

  @override
  String get legal => '合法的';

  @override
  String get languageChanged => '语言已更新';

  @override
  String get yourOptions => '您的选择';

  @override
  String get recommended => '受到推崇的';

  @override
  String get compareOptions => '比较选项';

  @override
  String get plan => '计划';

  @override
  String get prepare => '准备';

  @override
  String get execute => '执行';

  @override
  String get positiveOutcome => '积极成果';

  @override
  String get neutralOutcome => '中性结果';

  @override
  String get negativeOutcome => '负面结果';

  @override
  String get overallRiskScore => '总体风险评分';

  @override
  String get yourDecisionRiskLevel => '您的决策风险级别';

  @override
  String get overallPrediction => '总体预测';

  @override
  String get overallProsConsTitle => '总体优缺点';

  @override
  String get emptyHistory => '尚未保存决定';

  @override
  String get startFirstDecision => '开始您的第一次决策分析';

  @override
  String get chatbotTitle => '人工智能聊天机器人';

  @override
  String get insightsTitle => '见解';

  @override
  String get dailySuggestion => '每日建议';

  @override
  String get aboutTagline => '由人工智能提供支持的智能决策支持——权衡选项、风险和后续步骤。';

  @override
  String get aboutBody => 'AI Life Navigator 通过结构化问题、风险分析和明确的行动计划帮助您做出人生和职业决策。';

  @override
  String get personalInformation => '个人信息';

  @override
  String get appSetting => '应用程序设置';

  @override
  String get securityPrivacy => '安全与隐私';

  @override
  String get aboutUs => '关于我们';

  @override
  String get howToUse => '如何使用';

  @override
  String get appTheme => '应用主题';

  @override
  String get shareApp => '分享';

  @override
  String get rateUs => '评价我们';

  @override
  String get pleaseAddOption => '请添加至少一个选项';

  @override
  String get noReportToSave => '没有要保存的决策报告。';

  @override
  String get reportSaved => '报告已保存到历史记录。';

  @override
  String get pendingAnalysis => '待分析';

  @override
  String get untitledDecision => '无标题的决定';

  @override
  String get describeDecisionHint => '描述一下你的处境、限制以及成功是什么样的。';

  @override
  String optionLabel(String letter) {
    return '选项 $letter';
  }

  @override
  String get goodChance => '好机会';

  @override
  String get fairChance => '公平机会';

  @override
  String get poorChance => '机会渺茫';

  @override
  String get couldNotPrepareQuestions => '无法准备问题。请再试一次。';

  @override
  String get greetingFallbackName => '那里';

  @override
  String get dontHaveAccount => '没有帐户？';

  @override
  String get alreadyHaveAccount => '已经有帐户？';

  @override
  String get cancel => '取消';

  @override
  String get delete => '删除';

  @override
  String get yes => '是的';

  @override
  String get no => '不';

  @override
  String get welcome => '欢迎！';

  @override
  String get orContinueWith => '或继续';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => '生活';

  @override
  String get navigator => '航海家';

  @override
  String get authTagline => 'AI决策助手';

  @override
  String get chatbotReadySubtitle => '准备好驾驭您的生活';

  @override
  String get chatbotInputHint => '在这里开始聊天...';

  @override
  String get chatbotErrorMessage => '抱歉，我无法访问 AI 服务。请检查您的连接并重试。';

  @override
  String get selectAll => '选择全部';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => '选择要删除的决定。';

  @override
  String get total => '全部的';

  @override
  String get highScore => '高分';

  @override
  String get justNow => '现在';

  @override
  String minutesAgo(int count) {
    return '$count 分钟前';
  }

  @override
  String hoursAgo(int count) {
    return '$count 小时前';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count 小时前';
  }

  @override
  String daysAgo(int count) {
    return '$count 天前';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count 天前';
  }

  @override
  String scoreLabel(int score) {
    return '分数$score';
  }

  @override
  String get themeCustomizeSubtitle => '自定义应用程序的外观和风格';

  @override
  String get lightModeSubtitle => '干净明亮的体验';

  @override
  String get darkModeSubtitle => '弱光下不伤眼睛';

  @override
  String get systemDefaultSubtitle => '使用设备主题首选项';

  @override
  String get preview => '预览';

  @override
  String get applyTheme => '应用主题';

  @override
  String get shareAppMessage => '与您的朋友分享生活导航。';

  @override
  String get rateAppThanks => '感谢您对生活导航的评价！';

  @override
  String fieldRequired(String field) {
    return '$field 为必填项';
  }

  @override
  String get emailRequired => '电子邮件为必填项';

  @override
  String get emailInvalid => '请输入有效的电子邮件';

  @override
  String get passwordRequired => '需要密码';

  @override
  String get passwordMinLength => '密码必须至少为 6 个字符';

  @override
  String get confirmPasswordRequired => '请确认您的密码';

  @override
  String get passwordsDoNotMatch => '密码不匹配';

  @override
  String get otpRequired => '需要一次性密码';

  @override
  String otpInvalid(int length) {
    return '请输入有效的 $length 数字代码';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field 必须至少包含 $min 个字符';
  }

  @override
  String get fieldDescription => '描述';

  @override
  String get fieldTitle => '标题';

  @override
  String get fullName => '姓名';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get createAccount => '创建账户';

  @override
  String get acceptTermsRequired => '请接受条款和隐私政策。';

  @override
  String get signupTitleLeading => '创建您的';

  @override
  String get account => '帐户';

  @override
  String get signupSubtitle => '加入 Life Navigator，每天做出更明智的决定。';

  @override
  String get iAgreeToThe => '我同意';

  @override
  String get forgotPasswordLeading => '忘记了';

  @override
  String get forgotPasswordAccent => '密码？';

  @override
  String get forgotPasswordSubtitle => '输入您的电子邮件，我们将向您发送用于重置密码的链接。';

  @override
  String get enterEmailHint => '输入您的电子邮件地址';

  @override
  String get forgotPasswordInfo => '我们会将密码重置链接发送到您的电子邮件地址。';

  @override
  String get sendVerificationCode => '发送验证码';

  @override
  String get sendPasswordResetLink => '发送重置链接';

  @override
  String get emailVerificationTitle => '验证邮箱';

  @override
  String get emailVerificationSubtitle => '我们向您的电子邮件发送了验证链接。打开它以激活您的帐户。';

  @override
  String get emailVerificationSpamHint => '如果您在几分钟内没有看到电子邮件，请检查您的垃圾邮件或垃圾文件夹。';

  @override
  String get emailVerificationWaiting => '等待验证...我们会自动检查。';

  @override
  String get emailVerificationResend => '重新发送验证邮件';

  @override
  String get emailVerificationResent => '再次发送验证邮件。';

  @override
  String get authErrorWrongPassword => '电子邮件或密码不正确。请再试一次。';

  @override
  String get authErrorEmailInUse => '此邮箱号已被注册。请尝试登录。';

  @override
  String get authErrorWeakPassword => '密码太弱。至少使用 6 个字符。';

  @override
  String get authErrorUserNotFound => '未找到此电子邮件的帐户。';

  @override
  String get authErrorTooManyRequests => '尝试次数太多。请等待并重试。';

  @override
  String get authErrorGeneric => '出了点问题。请再试一次。';

  @override
  String get authErrorGoogleCancelled => 'Google 登录已取消。';

  @override
  String get passwordResetEmailSent => '已发送密码重置电子邮件。检查您的收件箱。';

  @override
  String get changePassword => '更改密码';

  @override
  String get changePasswordSubtitle => '输入您当前的密码并选择一个新密码。';

  @override
  String get currentPassword => '当前密码';

  @override
  String get deleteAccount => '删除帐户';

  @override
  String get deleteAccountConfirm => '这将永久删除您的帐户且无法撤消。';

  @override
  String get deleteAccountSuccess => '同时删除存储在该设备上的本地决策和聊天记录。';

  @override
  String get accountDeleted => '您的帐户已被删除。';

  @override
  String get rememberPassword => '还记得您的密码吗？';

  @override
  String get passwordUpdatedLogin => '密码已更新。请登录。';

  @override
  String get resetLeading => '重置';

  @override
  String get resetPasswordSubtitle => '为您的帐户创建一个新密码。';

  @override
  String get newPassword => '新密码';

  @override
  String get confirmNewPassword => '确认新密码';

  @override
  String get passwordHint => '至少使用 6 个您能记住的字符组合。';

  @override
  String get updating => '更新中...';

  @override
  String get updatePassword => '更新密码';

  @override
  String get backTo => '返回';

  @override
  String newCodeSentTo(String email) {
    return '新代码发送至 $email';
  }

  @override
  String get invalidVerificationCode => '验证码无效。请再试一次。';

  @override
  String otpResetSubtitle(String email) {
    return '输入发送至 $email 的 6 位重置代码';
  }

  @override
  String otpVerifySubtitle(String email) {
    return '输入发送至$email的6位验证码';
  }

  @override
  String get verifyLeading => '核实';

  @override
  String get verifyEmailLeading => '验证您的';

  @override
  String get codeWord => '代码';

  @override
  String get emailWord => '电子邮件';

  @override
  String resendCodeIn(int seconds) {
    return '在 ${seconds}s 中重新发送代码';
  }

  @override
  String get didntReceiveCode => '没有收到代码？';

  @override
  String get resendCode => '重新发送代码';

  @override
  String get verifying => '正在验证...';

  @override
  String get verifyCode => '验证码';

  @override
  String get verifyAndContinue => '验证并继续';

  @override
  String get wrongEmail => '电子邮件错误？';

  @override
  String get goBack => '回去';

  @override
  String get logOut => '退出';

  @override
  String get logoutConfirmMessage => '您确定要退出此应用程序吗？';

  @override
  String get logoutConfirmYes => '是的，退出';

  @override
  String get insightsHeroDescription => '根据您的决策量身定制的每日建议和见解。';

  @override
  String recommendedPrefix(String text) {
    return '推荐：$text';
  }

  @override
  String get riskInterpretationEmpty => '完成分析以查看个性化的风险解释。';

  @override
  String get startDecisionQuestion => '您需要什么决定方面的帮助？';

  @override
  String get startDecisionSubtitle => '描述您的决定并获得人工智能支持的见解和建议。';

  @override
  String get decisionTitle => '决定标题';

  @override
  String get decisionTitleHint => '例如我应该改变职业吗？';

  @override
  String get decisionCategory => '决策类别';

  @override
  String get importanceLevel => '重要性级别';

  @override
  String get impactMinor => '影响较小';

  @override
  String get impactModerate => '中等影响';

  @override
  String get impactHigh => '高影响力';

  @override
  String get categoryCareer => '职业';

  @override
  String get categoryFinance => '金融';

  @override
  String get categoryHealth => '健康';

  @override
  String get categoryRelations => '关系';

  @override
  String get categoryEducation => '教育';

  @override
  String get categoryOther => '其他';

  @override
  String get addYourOptionsLeading => '添加您的';

  @override
  String get optionsWord => '选项';

  @override
  String get describeOptionHint => '描述这个选项';

  @override
  String get goalSelection => '目标选择';

  @override
  String get goalSelectionSubtitle => '选择对您最重要的决策选项。';

  @override
  String get selectAtLeastOneGoal => '请至少选择一个目标';

  @override
  String get goalTipBody => '您可以随时在个人资料中调整您的优先级。';

  @override
  String get goalGrowth => '生长';

  @override
  String get goalFinancialGain => '财务收益';

  @override
  String get goalRiskReduction => '降低风险';

  @override
  String get goalPersonalSatisfaction => '个人满意度';

  @override
  String get goalTimeEfficiency => '时间效率';

  @override
  String get goalWorkLifeBalance => '工作与生活的平衡';

  @override
  String get goalStability => '稳定';

  @override
  String get goalImpact => '影响';

  @override
  String get budgetInput => '预算投入';

  @override
  String get budgetSubtitle => '选择您对此决定的估计预算。';

  @override
  String get budgetImpactLevel => '预算影响水平';

  @override
  String get budgetLessThan5k => '低于 5,000 美元';

  @override
  String get enterYourBudget => '输入您的预算';

  @override
  String get timeAvailability => '可用时间';

  @override
  String get timeAvailabilitySubtitle => '选择您可以做出此决定的时间。';

  @override
  String get experienceLevel => '经验水平';

  @override
  String get experienceSubtitle => '这有助于我们的人工智能了解您的背景和专业知识。';

  @override
  String get riskTolerance => '风险承受能力';

  @override
  String get riskToleranceSubtitle => '选择您对此决定的风险承受能力级别。';

  @override
  String get timeUrgency => '时间紧迫';

  @override
  String get urgencySubtitle => '选择您的决定的紧急程度。';

  @override
  String get financialRisk => '财务风险';

  @override
  String get marketRisk => '市场风险';

  @override
  String get timeRisk => '时间风险';

  @override
  String get executionRisk => '执行风险';

  @override
  String get personalRisk => '个人风险';

  @override
  String get overallFit => '整体合身';

  @override
  String get firstOption => '第一个选项';

  @override
  String get secondOption => '第二个选择';

  @override
  String get versus => 'VS';

  @override
  String get confidenceInterpretation => '信心解读';

  @override
  String get financialImpact => '财务影响';

  @override
  String get riskLevel => '风险等级';

  @override
  String get timeInvestment => '时间投资';

  @override
  String get longTermSustainability => '长期可持续性';

  @override
  String get personalGrowth => '个人成长';

  @override
  String get outcomeConsistency => '结果一致性';

  @override
  String get riskAssessment => '风险评估';

  @override
  String get historicalSimilarity => '历史相似性';

  @override
  String get relevanceMatch => '相关性匹配';

  @override
  String get dataQuality => '数据质量';

  @override
  String get confidenceVeryHigh => '非常高';

  @override
  String get confidenceModerate => '缓和';

  @override
  String get confidenceVeryLow => '非常低';

  @override
  String get onboardingAiPowered => '人工智能驱动';

  @override
  String get onboardingSmartAnalysis => '智能分析以做出更好的决策';

  @override
  String get onboardingRiskAnalysis => '风险分析';

  @override
  String get onboardingActionablePlans => '可行的计划';

  @override
  String get onboardingTrustedGuidance => '值得信赖的指导';

  @override
  String get onboardingDefineGoalLeading => '定义你的';

  @override
  String get goalWord => '目标';

  @override
  String get onboardingChooseJourney => '选择您想要指导的人生旅程';

  @override
  String get onboardingCareerPath => '职业道路';

  @override
  String get onboardingCareerPathDesc => '探索未来市场和技能';

  @override
  String get onboardingMajorPurchase => '主要采购';

  @override
  String get onboardingMajorPurchaseDesc => '比较新购买的选项';

  @override
  String get onboardingLifeChanges => '生活的改变';

  @override
  String get onboardingLifeChangesDesc => '规划搬迁或新阶段';

  @override
  String get onboardingPersonalGrowth => '个人成长';

  @override
  String get onboardingPersonalGrowthDesc => '识别技能和心态转变';

  @override
  String get onboardingReadyLeading => '准备好';

  @override
  String get navigateWord => '导航';

  @override
  String get onboardingReadySubtitle => '您的个性化助理随时为您提供帮助';

  @override
  String get onboardingActionableGuidance => '可行的指导';

  @override
  String get onboardingActionableGuidanceDesc => '获得成功指导';

  @override
  String get onboardingProgressTracking => '进度追踪';

  @override
  String get onboardingProgressTrackingDesc => '监控您旅程中的里程碑';

  @override
  String get onboardingAdjustOnTheFly => '即时调整';

  @override
  String get onboardingAdjustDesc => '随着生活的发生重新评估计划';

  @override
  String get onboardingShareLearn => '分享与学习';

  @override
  String get onboardingShareLearnDesc => '分享并从您的道路中学习';

  @override
  String get myProfileLeading => '我的';

  @override
  String get preferences => '偏好设置';

  @override
  String get personalityPreferences => '性格偏好';

  @override
  String get saveChanges => '保存更改';

  @override
  String get phoneNumber => '电话号码';

  @override
  String get tapToChangePhoto => '点击此处更改照片';

  @override
  String get photoPickerComingSoon => '照片选择器即将推出。';

  @override
  String get pickImageSourceTitle => '更改个人资料照片';

  @override
  String get pickFromCamera => '拍照';

  @override
  String get pickFromGallery => '从画廊中选择';

  @override
  String get removePhoto => '删除照片';

  @override
  String get cameraPermissionDenied => '拍照需要相机许可。';

  @override
  String get galleryPermissionDenied => '选择照片需要照片库许可。';

  @override
  String get openSettings => '打开设置';

  @override
  String get savePreferences => '保存首选项';

  @override
  String get preferencesSaved => '已保存首选项。';

  @override
  String get personalitySubtitle => '帮助AI更好地理解你';

  @override
  String get focusAreas => '重点领域';

  @override
  String get emptyTitleLeading => '没有什么';

  @override
  String get emptyTitleAccent => '还在这里';

  @override
  String get emptyQuietTitle => '这里很安静';

  @override
  String get emptyHistoryHint => '开始你的第一个决定，你的历史记录将出现在这里。';

  @override
  String get startADecision => '开始做决定';

  @override
  String get helpHereToHelp => '我们随时为您提供帮助';

  @override
  String get faq => '常问问题';

  @override
  String get noResults => '没有结果';

  @override
  String get errorTitle => '出了点问题';

  @override
  String get errorSubtitle => '我们遇到了意外错误。请再试一次。';

  @override
  String get contactSupport => '联系支持人员';

  @override
  String get noInternetTitle => '无连接';

  @override
  String get noInternetSubtitle => '请检查您的互联网连接，然后重试。';

  @override
  String get retryConnection => '重试连接';

  @override
  String get offlineMode => '进入离线模式';

  @override
  String get permissionTitle => '应用程序权限';

  @override
  String get permissionSubtitle => '授予权限以获得最佳体验。';

  @override
  String get grantAll => '全部授予';

  @override
  String get notNow => '现在不要';

  @override
  String get updateAvailable => '可用更新';

  @override
  String get updateSubtitle => '现已推出经过改进的新版本。';

  @override
  String get updateNow => '立即更新';

  @override
  String get remindLater => '稍后提醒我';

  @override
  String get loadingMessage => '准备好东西...';

  @override
  String get decisionDetailLeading => '决定';

  @override
  String get detailWord => '细节';

  @override
  String get decisionNotFound => '未找到决定';

  @override
  String get overall => '全面的';

  @override
  String get pros => '优点';

  @override
  String get cons => '缺点';

  @override
  String get notes => '笔记';

  @override
  String get saveAtLeastTwoToCompare => '至少保存两个决策以进行比较。';

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
  String get moderate => '缓和';

  @override
  String get veryHigh => '非常高';

  @override
  String get veryLow => '非常低';

  @override
  String get next => '下一个';

  @override
  String get later => '之后';

  @override
  String get useWord => '使用';

  @override
  String get aboutUsLeading => '关于';

  @override
  String get aboutUsAccent => '我们';

  @override
  String get howToUseLeading => '如何做';

  @override
  String get versionLabel => '版本1.0.0';

  @override
  String get dailyDecision => '每日决策';

  @override
  String get personalityDescription => '这些设置可以个性化推荐的语气和深度。';

  @override
  String get traitOptimism => '乐观';

  @override
  String get traitPatience => '耐心';

  @override
  String get traitDetailFocus => '细节聚焦';

  @override
  String get categoryTravel => '旅行';

  @override
  String get helpResponseTime => '平均响应时间：24小时内';

  @override
  String get helpGetInTouch => '联系我们';

  @override
  String get helpLiveChat => '实时聊天';

  @override
  String get helpLiveChatSub => '与我们的团队实时聊天';

  @override
  String get helpCall => '称呼';

  @override
  String get helpCallSub => '太平洋时间周一至周五上午 9 点至下午 5 点';

  @override
  String get helpSubmitTicket => '提交票证';

  @override
  String get helpSubmitTicketSub => '获取跟踪支持票';

  @override
  String get helpQuickLinks => '快速链接';

  @override
  String get faqSubtitle => '常见问题解答';

  @override
  String get aboutSubtitle => '版本、制作者名单和链接';

  @override
  String get helpOpenLiveChat => '打开实时聊天';

  @override
  String get helpLiveChatSoon => '实时聊天即将开放 - 我们将在 24 小时内给您回复电子邮件。';

  @override
  String get moreOptionsComingSoon => '更多选项即将推出';

  @override
  String get insightCompoundTitle => '复合你的决定';

  @override
  String get insightCompoundMessage => '今天做出的决定决定了 6 个月后的机会。选择打开最多门的那一个。';

  @override
  String get insightParalysisTitle => '谨防分析瘫痪';

  @override
  String get insightParalysisMessage => '如果您已经考虑了一个多星期而没有新的信息，那么您就足以做出决定。';

  @override
  String get insightRiskStressTitle => '风险不等于压力';

  @override
  String get insightRiskStressMessage =>
      '如果您有明确的 B 计划，那么高风险的决策仍然可以是低压力的。始终设计您的后备方案。';

  @override
  String get insightFutureYouTitle => '未来-你也投票';

  @override
  String get insightFutureYouMessage => '在做出决定之前，问问自己：五年后的未来的你会为此感谢现在的你吗？';

  @override
  String streakDays(int count) {
    return '$count 天连续';
  }

  @override
  String get streakKeepGoing => '继续前进——让今天的决定发挥作用。';

  @override
  String get todaysDecisionPrompt => '今天的决策提示';

  @override
  String get dailyDecisionExerciseSub => '60 秒快速决策练习';

  @override
  String get dailyDecisionQuestion => '你应该对这个机会说“是”还是“不”？';

  @override
  String get dailyDecisionScenario => '一位同事邀请您参加一个业余项目。这很令人兴奋，但每周需要 10 个小时。';

  @override
  String get seeAiAnalysis => '查看人工智能分析';

  @override
  String get errorWhatYouCanDo => '你能做什么';

  @override
  String get errorTip1 => '检查您的互联网连接';

  @override
  String get errorTip2 => '稍后再尝试该操作';

  @override
  String get errorTip3 => '重新启动应用程序';

  @override
  String get errorTip4 => '如果这种情况持续发生，请联系支持人员';

  @override
  String get noInternetYouCanStill => '你仍然可以';

  @override
  String get offlineTip1 => '查看保存的决策和历史记录';

  @override
  String get offlineTip2 => '阅读你的笔记和行动计划';

  @override
  String get offlineTip3 => '浏览常见问题解答和关于';

  @override
  String get permissionNotificationsDesc => '获取提醒和每日决策提示';

  @override
  String get permissionLocation => '地点';

  @override
  String get permissionLocationDesc => '仅用于基于位置的建议';

  @override
  String get permissionStorage => '贮存';

  @override
  String get permissionStorageDesc => '在本地保存您的报告和导出';

  @override
  String get permissionSettingsNote => '您可以随时从“设置”更改权限';

  @override
  String updateVersionReady(String version) {
    return '版本 $version 已准备好安装';
  }

  @override
  String get whatsNew => '什么是新的';

  @override
  String get updateFeature1 => '更快的 AI 分析（加速 2 倍）';

  @override
  String get updateFeature2 => '新的职业顾问模块';

  @override
  String get updateFeature3 => '改善暗模式对比度';

  @override
  String get updateFeature4 => '错误修复和稳定性改进';

  @override
  String get loadingSubtitle => '这通常只需要几秒钟';

  @override
  String get howToUseStep1Title => '定义你的决定';

  @override
  String get howToUseStep1Body => '首先描述您的决定、类别以及对您最重要的事情。';

  @override
  String get howToUseStep2Title => '分析您的选择';

  @override
  String get howToUseStep2Body => '回答有关目标、紧迫性、预算和风险承受能力的引导性问题。';

  @override
  String get howToUseStep3Title => '查看人工智能结果';

  @override
  String get howToUseStep3Body => '查看您的建议、风险评分、利弊以及分步行动计划。';

  @override
  String get howToUseStep4Title => '保存并跟踪进度';

  @override
  String get howToUseStep4Body => '将决策保存到历史记录中，并在需要指导时重新审视见解。';

  @override
  String get clientSelectionLeading => '客户';

  @override
  String get clientSelectionAccent => '选择';

  @override
  String get whichClientQuestion => '您应该对哪位客户说“是”？';

  @override
  String get clientSelectionSubtitle => '人工智能根据适合度、费用和风险对客户机会进行评分。';

  @override
  String get freelancePricingLeading => '自由职业者';

  @override
  String get freelancePricingAccent => '定价';

  @override
  String get recommendedPrice => '推荐价格';

  @override
  String get pricingScore => '定价分数';

  @override
  String get priceComparison => '价格比较';

  @override
  String get priceDrivers => '价格驱动因素';

  @override
  String get marketRate => '市场利率';

  @override
  String get experienceLabel => '经验';

  @override
  String get timelineLabel => '时间轴';

  @override
  String get complexityLabel => '复杂';

  @override
  String get projectValue => '项目价值';

  @override
  String get sendProposal => '发送提案';

  @override
  String get proposalSent => '提案发送给客户。';

  @override
  String get productivityLeading => '生产率';

  @override
  String get productivityAccent => '规划师';

  @override
  String get eisenhowerPriority => '艾森豪威尔优先';

  @override
  String get startFocusBlock => '启动焦点块';

  @override
  String get focusBlockStarted => '焦点块开始——祝你好运！';

  @override
  String get careerAdvisorLeading => '职业';

  @override
  String get careerAdvisorAccent => '顾问';

  @override
  String get careerFitScore => '职业适合度分数';

  @override
  String get topPathProductManager => '顶级路径：产品经理';

  @override
  String get skillMatch => '技能比赛';

  @override
  String get strategyLabel => '战略';

  @override
  String get communicationLabel => '沟通';

  @override
  String get analyticsLabel => '分析';

  @override
  String get technicalLabel => '技术的';

  @override
  String get build90DayPlan => '制定 90 天计划';

  @override
  String get businessIdeaLeading => '商业';

  @override
  String get businessIdeaAccent => '主意';

  @override
  String get describeBusinessIdea => '描述您的经营理念';

  @override
  String get businessIdeaSubtitle => '人工智能将对可行性、市场契合度和风险进行评分。';

  @override
  String get viabilityScore => '生存能力评分';

  @override
  String get scoreBreakdown => '分数明细';

  @override
  String get aiVerdict => '人工智能判决';

  @override
  String get fullPlanGenerated => '生成并保存完整计划。';

  @override
  String get financialCalcLeading => '金融的';

  @override
  String get financialCalcAccent => '计算器';

  @override
  String get compoundGrowth => '复合增长';

  @override
  String get futureValue => '未来价值';

  @override
  String get saveToDecisions => '保存到决策';

  @override
  String get saveDecisionLeading => '节省';

  @override
  String get saveDecisionAccent => '决定';

  @override
  String get decisionSaved => '决定已保存。';

  @override
  String get folderLabel => '文件夹';

  @override
  String get folderDefault => '默认';

  @override
  String get folderCareer => '职业';

  @override
  String get folderFinance => '金融';

  @override
  String get folderHealth => '健康';

  @override
  String get folderPersonal => '个人的';

  @override
  String get reportExportLeading => '出口';

  @override
  String get reportExportAccent => '报告';

  @override
  String get exportReport => '出口报告';

  @override
  String get shareReport => '分享报告';

  @override
  String get subscriptionLeading => '选择您的';

  @override
  String get subscriptionAccent => '计划';

  @override
  String get mostPopular => '最受欢迎';

  @override
  String get freeTrial => '7 天免费试用';

  @override
  String get upgradePremium => '升级至高级版';

  @override
  String get choosePlan => '选择一个计划';

  @override
  String get paymentSuccessful => '付款成功！';

  @override
  String get thankYouUpgrade => '感谢您升级到高级版。';

  @override
  String get goToDashboard => '转到仪表板';

  @override
  String get paymentDetails => '付款详情';

  @override
  String get payNow => '立即付款';

  @override
  String get cardNumber => '卡号';

  @override
  String get nameOnCard => '卡上的姓名';

  @override
  String get premiumFeatures => '高级功能';

  @override
  String get faqSearchHint => '搜索常见问题解答';

  @override
  String get topicAll => '全部';

  @override
  String get topicGettingStarted => '入门';

  @override
  String get topicAi => '人工智能';

  @override
  String get topicBilling => '计费';

  @override
  String get topicAccount => '帐户';

  @override
  String get tabAll => '全部';

  @override
  String get tabUnread => '未读';

  @override
  String get tabArchived => '已存档';

  @override
  String get noArchivedItems => '没有存档项目';

  @override
  String get traitRiskTolerance => '风险承受能力';

  @override
  String get budgetWhyMatters => '预算可帮助人工智能在您的建议中权衡财务权衡。';

  @override
  String get timeWhyMatters => '时间的可用性决定了你的行动计划应该有多么雄心勃勃。';

  @override
  String get experienceWhyMatters => '经验水平有助于人工智能根据您的背景调整建议。';

  @override
  String get riskWhyMatters => '风险承受能力决定了您的建议是保守还是大胆。';

  @override
  String get urgencyWhyMatters => '紧急程度会影响您对建议采取行动的速度。';

  @override
  String get confidenceReliableRecommend => '一般可靠的推荐';

  @override
  String get confidenceReliableSomeRisks => '总体可靠，但存在一定风险';

  @override
  String get confidenceConsiderRisks => '仔细考虑风险';

  @override
  String get confidenceHighUncertainty => '高度不确定性——谨慎行事';

  @override
  String get stepResults => '结果';

  @override
  String get urgencyNoRush => '不着急';

  @override
  String get urgencyModerate => '缓和';

  @override
  String get urgencyUrgent => '紧迫的';

  @override
  String get urgencyCritical => '批判的';

  @override
  String get experienceBeginner => '初学者';

  @override
  String get experienceIntermediate => '中间的';

  @override
  String get experienceAdvanced => '先进的';

  @override
  String get experienceExpert => '专家';

  @override
  String get timeVeryLimited => '非常有限';

  @override
  String get timeLimited => '有限的';

  @override
  String get timeModerateAvail => '缓和';

  @override
  String get timeHighAvail => '高的';

  @override
  String get timeVeryHigh => '非常高';

  @override
  String get riskToleranceLow => '低的';

  @override
  String get riskToleranceModerate => '缓和';

  @override
  String get riskToleranceHigh => '高的';

  @override
  String get riskToleranceVeryHigh => '非常高';

  @override
  String get doNow => '现在就做';

  @override
  String get doToday => '今天做';

  @override
  String get scheduleLabel => '日程';

  @override
  String get deleteLabel => '删除';

  @override
  String get tipLabel => '提示';

  @override
  String get aiRecommendation => '人工智能推荐';

  @override
  String get comparisonMenu => '比较';

  @override
  String get clientSelectionVerdictBody =>
      'Acme 是最合适的——说是。神秘客户：礼貌拒绝；模糊的简报预示着范围的蔓延。';

  @override
  String get freelancePricingSubtitle => 'AI 支持的费率建议';

  @override
  String get priceLower => '降低';

  @override
  String get priceRecommended => '受到推崇的';

  @override
  String get priceHigher => '更高';

  @override
  String get freelancePricingRecommendationBody =>
      '价格为 2,800 美元，以可观的利润赢得该客户。如果他们反对，那就锁定范围而不是降低价格。';

  @override
  String get productivitySubtitle => '人工智能可以对现在要做什么、要安排什么以及要放弃什么进行排序。';

  @override
  String get productivityTipBody =>
      '如果一切都很紧急，那就没有什么是紧急的。选择 1-2 个立即执行的项目并像会议一样保护它们。';

  @override
  String get careerAdvisorDescription => '基于您的技能、沟通方式和成长兴趣的高度契合。';

  @override
  String get nextSteps => '后续步骤';

  @override
  String get careerAdvisorNextStepsBody => '本季度领导一项小型跨职能计划，以建立 PM 式的业绩记录。';

  @override
  String get excellent => '出色的';

  @override
  String get good => '好的';

  @override
  String get businessIdeaHint => '例如，带有人工智能护理提醒功能的室内植物订阅盒';

  @override
  String get marketSize => '市场规模';

  @override
  String get competition => '竞赛';

  @override
  String get profitability => '盈利能力';

  @override
  String get executionEase => '执行轻松';

  @override
  String get large => '大的';

  @override
  String get businessIdeaVerdictBody =>
      '具有明确受众的强大概念。在扩大营销规模之前，前 90 天重点关注吸引 20 位付费客户。';

  @override
  String get generateFullPlan => '生成完整计划';

  @override
  String get financialCalcSubtitle => '看看你的钱随着时间的推移会增长到什么程度。';

  @override
  String get financialInitialAmount => '初始金额（\$）';

  @override
  String get financialAnnualRate => '年利率(%)';

  @override
  String get financialDuration => '持续时间（年）';

  @override
  String get financialCalcTipBody => '即使是每月的小额供款也比 10 年以上的一次性大笔存款要好。';

  @override
  String get saveDecisionNotesHint => '关于这个决定你想记住的任何事情';

  @override
  String get reportExportSubtitle => '保存或分享您的决策报告';

  @override
  String get completed => '完全的';

  @override
  String get goAhead => '前进';

  @override
  String get includeInReport => '包含在报告中';

  @override
  String get executiveSummary => '执行摘要';

  @override
  String get analysisDetails => '分析详情';

  @override
  String get notesAndInputs => '注释和输入';

  @override
  String get exportFormat => '导出格式';

  @override
  String get pdfBestForSharing => '最适合分享';

  @override
  String get excelDataScores => '数据与分数';

  @override
  String get wordDocument => '文档';

  @override
  String get imageJpgPng => 'JPG / PNG';

  @override
  String get shareOrSave => '分享或保存';

  @override
  String get shareLink => '分享链接';

  @override
  String get createShareableLink => '创建可共享链接';

  @override
  String get emailReport => '电子邮件报告';

  @override
  String get sendViaEmail => '通过电子邮件发送';

  @override
  String get saveToDevice => '保存到设备';

  @override
  String get downloadToDevice => '下载到设备';

  @override
  String get scheduleAutoReports => '安排自动报告';

  @override
  String exportedAs(String format) {
    return '导出为 $format';
  }

  @override
  String get subscriptionSubtitle => '通过适合您的计划做出更明智的决定';

  @override
  String get makeSmarterDecisions => '做出更明智的决定';

  @override
  String get subscriptionHeroBody => '解锁无限的人工智能分析、深入见解和个性化建议。';

  @override
  String get planBasic => '基本的';

  @override
  String get planPremium => '优质的';

  @override
  String get planPro => '专业版';

  @override
  String get perMonth => '/月';

  @override
  String get allPlansInclude => '所有计划包括';

  @override
  String get moneyBackGuarantee => '7 天退款保证';

  @override
  String get moneyBackGuaranteeBody => '不满意？ 7 天内获得全额退款。';

  @override
  String get subscribeTermsNote => '订阅即表示您同意我们的条款和隐私政策。';

  @override
  String get securePaymentEncryption => '采用行业标准加密技术确保支付安全';

  @override
  String get paymentLeading => '支付';

  @override
  String get paymentAccent => '细节';

  @override
  String get premiumMonthly => '保费 • 每月';

  @override
  String get taxEstimate => '税收估算';

  @override
  String get totalToday => '今天总计';

  @override
  String get paymentMethod => '付款方式';

  @override
  String get paymentCard => '卡片';

  @override
  String get paymentPayPal => '贝宝';

  @override
  String get paymentGooglePay => '谷歌支付';

  @override
  String get paymentApplePay => '苹果支付';

  @override
  String get cardExpiryHint => '月/年';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter => '端到端加密。我们从不存储您的卡。';

  @override
  String get premiumFeaturesLeading => '优质的';

  @override
  String get premiumFeaturesAccent => '特征';

  @override
  String get premiumUnlockSubtitle => '释放生活导航器的全部力量';

  @override
  String get premiumFeature1Title => '无限AI分析';

  @override
  String get premiumFeature1Body => '根据需要进行尽可能多的决策。';

  @override
  String get premiumFeature2Title => '深刻的见解';

  @override
  String get premiumFeature2Body => '风险、信心、结果和影响图表。';

  @override
  String get premiumFeature3Title => '比较决策';

  @override
  String get premiumFeature3Body => '并排查看决策。';

  @override
  String get premiumFeature4Title => '导出报告';

  @override
  String get premiumFeature4Body => 'PDF、Word、Excel 和图像导出。';

  @override
  String get premiumFeature5Title => '云同步';

  @override
  String get premiumFeature5Body => '安全备份到云端。';

  @override
  String get premiumFeature6Title => '优先支持';

  @override
  String get premiumFeature6Body => '24小时内回复。';

  @override
  String get paymentSuccessLeading => '支付';

  @override
  String get paymentSuccessAccent => '成功的！';

  @override
  String get youNowHaveAccessTo => '您现在可以访问';

  @override
  String get planLabel => '计划';

  @override
  String get amountLabel => '数量';

  @override
  String get methodLabel => '方法';

  @override
  String get transactionIdLabel => '交易ID';

  @override
  String get unlimitedAi => '无限人工智能';

  @override
  String get deepInsightsShort => '深刻的见解';

  @override
  String get compareShort => '比较';

  @override
  String get exportsShort => '出口';

  @override
  String get cloudSyncShort => '云同步';

  @override
  String get prioritySupportShort => '优先支持';

  @override
  String get privacyLeading => '隐私';

  @override
  String get privacyAccent => '政策';

  @override
  String get privacyLastUpdated => '最后更新时间：2026 年 5 月 18 日';

  @override
  String get privacySection1Title => '我们收集什么';

  @override
  String get privacySection1Body =>
      '我们仅收集您提供给我们的信息 - 您保存的决定、您的帐户详细信息（姓名 + 电子邮件）以及您的偏好。其他所有内容都保留在您的设备上。';

  @override
  String get privacySection2Title => '我们如何使用它';

  @override
  String get privacySection2Body =>
      '要个性化 AI 建议，请同步您的数据（如果您选择）并改进应用程序。我们绝不会将您的数据出售给第三方。';

  @override
  String get privacySection3Title => '本地优先存储';

  @override
  String get privacySection3Body =>
      '默认情况下，您的决定存储在您的设备上。云同步是选择加入的，并在传输和静态时进行加密。';

  @override
  String get privacySection4Title => '您的权利';

  @override
  String get privacySection4Body => '您可以随时从“设置”中导出或删除所有数据。我们会在 7 天内回复数据请求。';

  @override
  String get privacySection5Title => '孩子们';

  @override
  String get privacySection5Body =>
      'AI Life Navigator 不适合 13 岁以下的儿童。我们不会故意收集儿童的数据。';

  @override
  String get privacySection6Title => '联系我们';

  @override
  String get privacySection6Body =>
      '有问题或疑虑吗？发送电子邮件至privacy@lifenavigator.app，我们将在两个工作日内回复您。';

  @override
  String get termsLeading => '条款';

  @override
  String get termsAccent => '服务';

  @override
  String get termsLastUpdated => '最后更新时间：2026 年 5 月 18 日';

  @override
  String get termsSection1Title => '1. 验收';

  @override
  String get termsSection1Body =>
      '使用 AI Life Navigator 即表示您同意这些条款。如果您不同意，请不要使用该应用程序。';

  @override
  String get termsSection2Title => '2. 账户';

  @override
  String get termsSection2Body => '您有责任保证您的帐户安全。不要分享您的凭据。';

  @override
  String get termsSection3Title => '3.人工智能建议';

  @override
  String get termsSection3Body => '人工智能输出是指导，而不是专业建议。您对根据它们做出的决定负责。';

  @override
  String get termsSection4Title => '4. 订阅';

  @override
  String get termsSection4Body => '高级计划会自动续订，直至取消。您可以随时从您的商店帐户取消。';

  @override
  String get termsSection5Title => '5. 可接受的使用';

  @override
  String get termsSection5Body => '没有滥用内容，没有逆向工程，没有抓取。违规可能会导致帐户被暂停。';

  @override
  String get termsSection6Title => '6. 责任限制';

  @override
  String get termsSection6Body => '在法律允许的最大范围内，我们的责任仅限于您在过去 12 个月内向我们支付的金额。';

  @override
  String get termsSection7Title => '7. 变化';

  @override
  String get termsSection7Body => '我们可能会更新这些条款。我们将通过应用内通知或电子邮件通知您重大变更。';

  @override
  String get faqQ1 => '我如何开始新的决定？';

  @override
  String get faqA1 => '点击主屏幕上的“开始新分析”卡，为您的决定命名，然后按照指导步骤操作。';

  @override
  String get faqQ2 => '我的数据是私人的吗？';

  @override
  String get faqA2 => '是的。默认情况下，决策存储在您的设备本地。云同步是选择加入和加密的。';

  @override
  String get faqQ3 => '人工智能的准确度如何？';

  @override
  String get faqA3 => '人工智能提供结构化指导，而不是专业建议。将其与您自己的判断一起用作思考辅助工具。';

  @override
  String get faqQ4 => 'AI 可以访问我的对话吗？';

  @override
  String get faqA4 => '不会。仅使用您在决策流程中提交的输入。不会读取您设备上的任何其他内容。';

  @override
  String get faqQ5 => '我如何取消我的订阅？';

  @override
  String get faqA5 => '随时从 App Store / Google Play 订阅页面取消。访问将持续到该期限结束。';

  @override
  String get faqQ6 => '你们提供退款吗？';

  @override
  String get faqA6 => '是的 — 首次购买后 7 天内。发送电子邮件至 support@lifenavigator.app。';

  @override
  String get faqQ7 => '如何删除我的帐户？';

  @override
  String get faqA7 => '设置 → 帐户 → 删除帐户。您的所有数据将在 30 天内删除。';

  @override
  String get faqQ8 => '我可以导出我的决定吗？';

  @override
  String get faqA8 => '是的。打开任何保存的决策，然后点击“导出报告”以 PDF、Word、Excel 或图像形式下载。';

  @override
  String get notificationsLeading => '诺蒂菲';

  @override
  String get notificationsAccent => '阳离子';

  @override
  String get decisionTextRiskFallback => '进行全面分析以获得量身定制的降低风险技巧。';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return '您的总体风险级别为 $label ($score%)。查看下面的细分，了解是什么驱动了这个分数。';
  }
}
