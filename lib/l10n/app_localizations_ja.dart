// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'AIライフナビゲーター';

  @override
  String get navHome => 'ホーム';

  @override
  String get navChatbot => 'AIチャット';

  @override
  String get navInsights => '洞察';

  @override
  String get navHistory => '歴史';

  @override
  String get continueButton => '続ける';

  @override
  String get nextButton => '次へ';

  @override
  String get backButton => '戻る';

  @override
  String get saveButton => '保存';

  @override
  String get analyzeButton => '分析する';

  @override
  String get tryAgain => 'もう一度やり直してください';

  @override
  String get viewAll => 'すべて見る';

  @override
  String get searchHint => '検索...';

  @override
  String get selectLanguage => '選択';

  @override
  String get languageWord => '言語';

  @override
  String get searchLanguageHint => 'ここで言語を検索...';

  @override
  String get noLanguagesFound => '言語が見つかりません';

  @override
  String get settings => '設定';

  @override
  String get accountSettings => 'アカウント設定';

  @override
  String get languages => '言語';

  @override
  String get theme => 'テーマ';

  @override
  String get notifications => '通知';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get termsOfService => '利用規約';

  @override
  String get helpSupport => 'ヘルプとサポート';

  @override
  String get logout => 'ログアウト';

  @override
  String get welcomeBack => 'おかえり！';

  @override
  String get emailAddress => '電子メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get login => 'ログイン';

  @override
  String get signUp => '登録';

  @override
  String get forgotPassword => 'パスワードをお忘れですか？';

  @override
  String get rememberMe => '私を覚えてますか';

  @override
  String goodMorning(String name) {
    return 'おはようございます、$name 👋';
  }

  @override
  String get homeSubtitle => '次の重要な決定のために AI を活用したガイダンスを取得します。';

  @override
  String get startNewAnalysis => '新しい分析を開始する';

  @override
  String get startAnalysisSubtitle => 'ガイド付き分析を開始し、パーソナライズされた推奨事項を受け取ります。';

  @override
  String get decisionOverview => '決定の概要';

  @override
  String get riskScore => 'リスクスコア';

  @override
  String get successChance => '成功のチャンス';

  @override
  String get activePlans => 'アクティブなプラン';

  @override
  String get inProgress => '進行中';

  @override
  String get recentInsights => '最近の洞察';

  @override
  String get stepDefine => '定義';

  @override
  String get stepAnalyze => '分析';

  @override
  String get stepQuestions => '質問';

  @override
  String get stepResult => '結果';

  @override
  String get defineYourProblem => 'あなたを定義してください';

  @override
  String get problemWord => '問題';

  @override
  String get tellUsMore => 'あなたの決断について詳しく教えてください';

  @override
  String get wizardHint => '提供する詳細が多いほど、AI がより適切に分析し、ガイドすることができます。';

  @override
  String get describeDecision => 'あなたの決定を説明してください';

  @override
  String get quickTips => '簡単なヒント';

  @override
  String get beSpecific => '具体的にする';

  @override
  String get includeContext => 'コンテキストを含める';

  @override
  String get mentionGoal => '目標について言及する';

  @override
  String get choosingBetween => 'どちらを選択しますか?';

  @override
  String get optionsHint => '最大 5 つのオプションをリストします。 AI がそれぞれの目標を比較検討します。';

  @override
  String get addAnotherOption => '別のオプションを追加する';

  @override
  String get continueToAnalysis => '分析を続ける';

  @override
  String get aiQuestionsTitle => 'AI';

  @override
  String get questionsWord => '質問';

  @override
  String get preparingQuestions => '個別の質問を準備しています…';

  @override
  String basedOnDecision(String title) {
    return 'あなたの決定に基づいて: $title';
  }

  @override
  String get basedOnWizard => 'ウィザードで共有した内容に基づいて';

  @override
  String get aiNavigator => 'AIライフナビゲーター';

  @override
  String get aiQuestionsHint => '正直に答えてください。あなたの回答が AI 分析を形作ります。';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'AI は「$title」専用にこれらの質問を生成しました。';
  }

  @override
  String questionOf(int current, int total) {
    return '質問 $current/$total';
  }

  @override
  String get whyThisMatters => 'なぜこれが重要なのでしょうか?';

  @override
  String get whyQuestionsMatter => 'あなたの回答は、AI があなたの状況に最も関係のあることに集中するのに役立ちます。';

  @override
  String get securePrivate => 'あなたのデータは安全でプライベートです';

  @override
  String get processingAnalyzing => 'オプションを分析中...';

  @override
  String get processingRisk => '危険因子を計算しています...';

  @override
  String get processingOutcomes => '結果を予測しています...';

  @override
  String get processingPlan => '行動計画を構築中...';

  @override
  String get processingFinalizing => '結果の最終処理';

  @override
  String get decisionResult => '決断';

  @override
  String get resultWord => '結果';

  @override
  String get recommendedChoice => '推奨される選択肢';

  @override
  String get benefitScore => 'ベネフィットスコア';

  @override
  String get confidence => '自信';

  @override
  String get fitScore => 'フィットスコア';

  @override
  String get resultBreakdown => '結果の内訳';

  @override
  String get finalRecommendation => '最終的な推奨事項';

  @override
  String get outcomePrediction => '結果の予測';

  @override
  String get confidenceMeter => '信頼度メーター';

  @override
  String get actionPlan => '行動計画';

  @override
  String get prosCons => '長所と短所';

  @override
  String get tipFromAi => 'AIからのヒント';

  @override
  String get saveReport => 'レポートの保存';

  @override
  String get startNewDecision => '新たな決断を始める';

  @override
  String get decisionWord => '決断';

  @override
  String get comparisonWord => '比較';

  @override
  String get whyRecommended => 'これが推奨される理由';

  @override
  String get riskBreakdown => 'リスクの内訳';

  @override
  String get riskInterpretation => 'リスクの解釈';

  @override
  String get howToImprove => '改善方法';

  @override
  String get overallConfidence => '全体的な信頼度';

  @override
  String get confidenceBreakdown => '信頼の内訳';

  @override
  String get successLikelihood => '成功の可能性';

  @override
  String get outcomeBreakdown => '結果の内訳';

  @override
  String get keyOutcomeFactors => '主要な結果要因';

  @override
  String get prosTitle => 'この決定の利点';

  @override
  String get consTitle => 'この決定の短所';

  @override
  String get overallProsCons => '全体的な長所と短所';

  @override
  String get bestOverallFit => '全体的に最高のフィット感';

  @override
  String get bestOverallChoice => '全体的に最良の選択';

  @override
  String get recommendedChoiceLabel => '推奨される選択肢';

  @override
  String get yourActionPlan => 'あなたの行動計画';

  @override
  String get aiInsight => 'AI インサイト';

  @override
  String get keyComparison => 'キーの比較';

  @override
  String get overallScore => '総合スコア';

  @override
  String get keyPoints => '重要なポイント';

  @override
  String get analysisFailed => '分析に失敗しました。インターネットと API キーを確認してください。';

  @override
  String get missingApiKey => 'GEMINI_API_KEY がありません。これを .env に追加し、アプリを再起動します。';

  @override
  String get noDescription => '説明はありません。';

  @override
  String get history => '歴史';

  @override
  String get about => 'について';

  @override
  String get profile => 'プロフィール';

  @override
  String get editProfile => 'プロフィールの編集';

  @override
  String get low => '低い';

  @override
  String get medium => '中くらい';

  @override
  String get high => '高い';

  @override
  String get lowRisk => '低リスク';

  @override
  String get mediumRisk => '中リスク';

  @override
  String get highRisk => '高リスク';

  @override
  String get notAssessed => '評価されていない';

  @override
  String get couldNotLoadQuestions => '質問を読み込めませんでした';

  @override
  String get noQuestionsGenerated => '質問は生成されませんでした。';

  @override
  String get onboardingTitle1 => 'AI を使用してより賢明な意思決定を行う';

  @override
  String get onboardingSubtitle1 => '人生の重要な選択について、個人に合わせたガイダンスが得られます。';

  @override
  String get onboardingTitle2 => 'リスクと結果を分析する';

  @override
  String get onboardingSubtitle2 => 'コミットする前にトレードオフを理解してください。';

  @override
  String get onboardingTitle3 => '明確な行動計画に従ってください';

  @override
  String get onboardingSubtitle3 => '洞察を実用的な次のステップに変えます。';

  @override
  String get getStarted => '始める';

  @override
  String get skip => 'スキップ';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get lightMode => 'ライトモード';

  @override
  String get systemDefault => 'システムのデフォルト';

  @override
  String get generalSettings => '一般設定';

  @override
  String get support => 'サポート';

  @override
  String get legal => '法律上の';

  @override
  String get languageChanged => '言語が更新されました';

  @override
  String get yourOptions => 'あなたのオプション';

  @override
  String get recommended => '推奨';

  @override
  String get compareOptions => 'オプションを比較する';

  @override
  String get plan => 'プラン';

  @override
  String get prepare => '準備する';

  @override
  String get execute => '実行する';

  @override
  String get positiveOutcome => '肯定的な結果';

  @override
  String get neutralOutcome => '中立的な結果';

  @override
  String get negativeOutcome => '否定的な結果';

  @override
  String get overallRiskScore => '全体的なリスクスコア';

  @override
  String get yourDecisionRiskLevel => 'あなたの意思決定のリスクレベル';

  @override
  String get overallPrediction => '全体的な予測';

  @override
  String get overallProsConsTitle => '全体的な長所と短所';

  @override
  String get emptyHistory => '保存された決定はまだありません';

  @override
  String get startFirstDecision => '最初の意思決定分析を開始する';

  @override
  String get chatbotTitle => 'AIチャットボット';

  @override
  String get insightsTitle => '洞察';

  @override
  String get dailySuggestion => '毎日の提案';

  @override
  String get aboutTagline =>
      'AI を活用したスマートな意思決定サポート - オプション、リスク、次のステップを比較検討します。';

  @override
  String get aboutBody =>
      'AI Life Navigator は、構造化された質問、リスク分析、明確な行動計画により、人生とキャリアの意思決定を支援します。';

  @override
  String get personalInformation => '個人情報';

  @override
  String get appSetting => 'アプリ設定';

  @override
  String get securityPrivacy => 'セキュリティとプライバシー';

  @override
  String get aboutUs => '私たちについて';

  @override
  String get howToUse => '使用方法';

  @override
  String get appTheme => 'アプリのテーマ';

  @override
  String get shareApp => '共有';

  @override
  String get rateUs => '評価してください';

  @override
  String get pleaseAddOption => '少なくとも 1 つのオプションを追加してください';

  @override
  String get noReportToSave => '保存する決定レポートがありません。';

  @override
  String get reportSaved => 'レポートは履歴に保存されました。';

  @override
  String get pendingAnalysis => '分析保留中';

  @override
  String get untitledDecision => '無題の決定';

  @override
  String get describeDecisionHint => 'あなたの状況、制約、成功とはどのようなものかを説明してください。';

  @override
  String optionLabel(String letter) {
    return 'オプション $letter';
  }

  @override
  String get goodChance => '良いチャンス';

  @override
  String get fairChance => '公平なチャンス';

  @override
  String get poorChance => 'チャンスが低い';

  @override
  String get couldNotPrepareQuestions => '質問を準備できませんでした。もう一度試してください。';

  @override
  String get greetingFallbackName => 'そこには';

  @override
  String get dontHaveAccount => 'アカウントをお持ちでない場合は、';

  @override
  String get alreadyHaveAccount => 'すでにアカウントをお持ちですか?';

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get welcome => 'いらっしゃいませ！';

  @override
  String get orContinueWith => 'または続行してください';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => '人生';

  @override
  String get navigator => 'ナビゲーター';

  @override
  String get authTagline => 'AI 意思決定アシスタント';

  @override
  String get chatbotReadySubtitle => '人生をナビゲートする準備ができています';

  @override
  String get chatbotInputHint => 'ここからチャットを開始してください...';

  @override
  String get chatbotErrorMessage =>
      '申し訳ありませんが、AI サービスに接続できませんでした。接続を確認して、もう一度試してください。';

  @override
  String get selectAll => 'すべて選択';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => '削除する決定を選択します。';

  @override
  String get total => '合計';

  @override
  String get highScore => 'ハイスコ​​ア';

  @override
  String get justNow => 'ちょうど今';

  @override
  String minutesAgo(int count) {
    return '$count分前';
  }

  @override
  String hoursAgo(int count) {
    return '$count 時間前';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count時間前';
  }

  @override
  String daysAgo(int count) {
    return '$count 日前';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count日前';
  }

  @override
  String scoreLabel(int score) {
    return 'スコア $score';
  }

  @override
  String get themeCustomizeSubtitle => 'アプリのルック＆フィールをカスタマイズする';

  @override
  String get lightModeSubtitle => '清潔で明るい体験';

  @override
  String get darkModeSubtitle => '暗い場所でも目に優しい';

  @override
  String get systemDefaultSubtitle => 'デバイスのテーマ設定を使用する';

  @override
  String get preview => 'プレビュー';

  @override
  String get applyTheme => 'テーマの適用';

  @override
  String get shareAppMessage => 'Life Navigator を友達と共有しましょう。';

  @override
  String get rateAppThanks => 'ライフナビゲーターを評価していただきありがとうございます。';

  @override
  String fieldRequired(String field) {
    return '$fieldは必須です';
  }

  @override
  String get emailRequired => 'メールアドレスは必須です';

  @override
  String get emailInvalid => '有効なメールアドレスを入力してください';

  @override
  String get passwordRequired => 'パスワードが必要です';

  @override
  String get passwordMinLength => 'パスワードは6文字以上である必要があります';

  @override
  String get confirmPasswordRequired => 'パスワードを確認してください';

  @override
  String get passwordsDoNotMatch => 'パスワードが一致しません';

  @override
  String get otpRequired => 'OTPは必須です';

  @override
  String otpInvalid(int length) {
    return '有効な$length桁のコードを入力してください';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field は少なくとも $min 文字でなければなりません';
  }

  @override
  String get fieldDescription => '説明';

  @override
  String get fieldTitle => 'タイトル';

  @override
  String get fullName => 'フルネーム';

  @override
  String get confirmPassword => 'パスワードを認証する';

  @override
  String get createAccount => 'アカウントを作成する';

  @override
  String get acceptTermsRequired => '利用規約とプライバシーポリシーに同意してください。';

  @override
  String get signupTitleLeading => 'あなたのものを作成してください';

  @override
  String get account => 'アカウント';

  @override
  String get signupSubtitle => 'Life Navigator に参加して、毎日より賢明な意思決定をしましょう。';

  @override
  String get iAgreeToThe => 'に同意します';

  @override
  String get forgotPasswordLeading => '忘れた';

  @override
  String get forgotPasswordAccent => 'パスワード？';

  @override
  String get forgotPasswordSubtitle =>
      'メールアドレスを入力すると、パスワードをリセットするためのリンクが送信されます。';

  @override
  String get enterEmailHint => 'メールアドレスを入力してください';

  @override
  String get forgotPasswordInfo => 'あなたの電子メールアドレスにパスワードリセットリンクを送信します。';

  @override
  String get sendVerificationCode => '認証コードを送信する';

  @override
  String get sendPasswordResetLink => 'リセットリンクを送信する';

  @override
  String get emailVerificationTitle => 'メールの確認';

  @override
  String get emailVerificationSubtitle =>
      'あなたの電子メールに確認リンクを送信しました。それを開いてアカウントをアクティブ化します。';

  @override
  String get emailVerificationSpamHint =>
      '数分以内にメールが届かない場合は、スパム フォルダまたはジャンク フォルダを確認してください。';

  @override
  String get emailVerificationWaiting => '検証を待っています…自動的にチェックされます。';

  @override
  String get emailVerificationResend => '確認メールを再送信する';

  @override
  String get emailVerificationResent => '確認メールが再度送信されました。';

  @override
  String get authErrorWrongPassword => 'メールアドレスまたはパスワードが間違っています。もう一度試してください。';

  @override
  String get authErrorEmailInUse => 'このEメールはすでに登録されています。代わりにログインしてみてください。';

  @override
  String get authErrorWeakPassword => 'パスワードが弱すぎます。少なくとも 6 文字を使用してください。';

  @override
  String get authErrorUserNotFound => 'このメールではアカウントが見つかりませんでした。';

  @override
  String get authErrorTooManyRequests => '試行回数が多すぎます。しばらく待ってからもう一度お試しください。';

  @override
  String get authErrorGeneric => '何か問題が発生しました。もう一度試してください。';

  @override
  String get authErrorGoogleCancelled => 'Google サインインがキャンセルされました。';

  @override
  String get passwordResetEmailSent => 'パスワードリセットメールを送信しました。受信箱を確認してください。';

  @override
  String get changePassword => 'パスワードを変更する';

  @override
  String get changePasswordSubtitle => '現在のパスワードを入力し、新しいパスワードを選択します。';

  @override
  String get currentPassword => '現在のパスワード';

  @override
  String get deleteAccount => 'アカウントの削除';

  @override
  String get deleteAccountConfirm => 'これによりアカウントが完全に削除され、元に戻すことはできません。';

  @override
  String get deleteAccountSuccess => 'このデバイスに保存されているローカル決定とチャットも削除します。';

  @override
  String get accountDeleted => 'あなたのアカウントは削除されました。';

  @override
  String get rememberPassword => 'パスワードを覚えていますか?';

  @override
  String get passwordUpdatedLogin => 'パスワードが更新されました。ログインしてください。';

  @override
  String get resetLeading => 'リセット';

  @override
  String get resetPasswordSubtitle => 'アカウントの新しいパスワードを作成します。';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get confirmNewPassword => '新しいパスワードの確認';

  @override
  String get passwordHint => '少なくとも 6 文字を覚えやすい組み合わせで使用します。';

  @override
  String get updating => '更新中...';

  @override
  String get updatePassword => 'パスワードを更新する';

  @override
  String get backTo => '戻る';

  @override
  String newCodeSentTo(String email) {
    return '新しいコードが $email に送信されました';
  }

  @override
  String get invalidVerificationCode => '無効な確認コードです。もう一度試してください。';

  @override
  String otpResetSubtitle(String email) {
    return '$email に送信された 6 桁のリセット コードを入力してください';
  }

  @override
  String otpVerifySubtitle(String email) {
    return '$email に送信された 6 桁の確認コードを入力してください';
  }

  @override
  String get verifyLeading => '確認する';

  @override
  String get verifyEmailLeading => 'あなたのことを確認してください';

  @override
  String get codeWord => 'コード';

  @override
  String get emailWord => '電子メール';

  @override
  String resendCodeIn(int seconds) {
    return '${seconds}s 以内にコードを再送信します';
  }

  @override
  String get didntReceiveCode => 'コードを受け取っていませんか?';

  @override
  String get resendCode => 'コードを再送信する';

  @override
  String get verifying => '確認中...';

  @override
  String get verifyCode => 'コードの検証';

  @override
  String get verifyAndContinue => '確認して続行';

  @override
  String get wrongEmail => '間違ったメールですか?';

  @override
  String get goBack => '戻る';

  @override
  String get logOut => 'ログアウト';

  @override
  String get logoutConfirmMessage => 'このアプリをログアウトしてもよろしいですか?';

  @override
  String get logoutConfirmYes => 'はい、ログアウトします';

  @override
  String get insightsHeroDescription => 'あなたの決定に合わせた毎日の提案と洞察。';

  @override
  String recommendedPrefix(String text) {
    return '推奨: $text';
  }

  @override
  String get riskInterpretationEmpty => '分析を完了して、個別のリスク解釈を確認します。';

  @override
  String get startDecisionQuestion => 'どのような決定についてサポートが必要ですか?';

  @override
  String get startDecisionSubtitle => '自分の決定について説明し、AI を活用した洞察と推奨事項を取得します。';

  @override
  String get decisionTitle => '決定タイトル';

  @override
  String get decisionTitleHint => '例えばキャリアを変えるべきでしょうか？';

  @override
  String get decisionCategory => '決定カテゴリー';

  @override
  String get importanceLevel => '重要度';

  @override
  String get impactMinor => '軽微な影響';

  @override
  String get impactModerate => '中程度の影響';

  @override
  String get impactHigh => '高い影響力';

  @override
  String get categoryCareer => 'キャリア';

  @override
  String get categoryFinance => 'ファイナンス';

  @override
  String get categoryHealth => '健康';

  @override
  String get categoryRelations => '関係';

  @override
  String get categoryEducation => '教育';

  @override
  String get categoryOther => '他の';

  @override
  String get addYourOptionsLeading => '追加してください';

  @override
  String get optionsWord => 'オプション';

  @override
  String get describeOptionHint => 'このオプションについて説明してください';

  @override
  String get goalSelection => '目標の選択';

  @override
  String get goalSelectionSubtitle => 'あなたにとって最も重要な決定のためのオプションを選択してください。';

  @override
  String get selectAtLeastOneGoal => '少なくとも 1 つの目標を選択してください';

  @override
  String get goalTipBody => '後からプロフィール内でいつでも優先順位を調整できます。';

  @override
  String get goalGrowth => '成長';

  @override
  String get goalFinancialGain => '経済的利益';

  @override
  String get goalRiskReduction => 'リスクの軽減';

  @override
  String get goalPersonalSatisfaction => '個人的な満足度';

  @override
  String get goalTimeEfficiency => '時間効率';

  @override
  String get goalWorkLifeBalance => 'ワークライフバランス';

  @override
  String get goalStability => '安定性';

  @override
  String get goalImpact => 'インパクト';

  @override
  String get budgetInput => '予算の入力';

  @override
  String get budgetSubtitle => 'この決定に対する推定予算を選択してください。';

  @override
  String get budgetImpactLevel => '予算影響レベル';

  @override
  String get budgetLessThan5k => '5,000 ドル未満';

  @override
  String get enterYourBudget => '予算を入力してください';

  @override
  String get timeAvailability => '利用可能な時間';

  @override
  String get timeAvailabilitySubtitle => 'この決定を行うための空き時間を選択してください。';

  @override
  String get experienceLevel => '経験レベル';

  @override
  String get experienceSubtitle => 'これは、当社の AI があなたの背景と専門知識を理解するのに役立ちます。';

  @override
  String get riskTolerance => 'リスク許容度';

  @override
  String get riskToleranceSubtitle => 'この決定に対するリスク許容レベルを選択してください。';

  @override
  String get timeUrgency => '時間的緊急性';

  @override
  String get urgencySubtitle => '決定の緊急性を選択してください。';

  @override
  String get financialRisk => '財務リスク';

  @override
  String get marketRisk => '市場リスク';

  @override
  String get timeRisk => '時間的リスク';

  @override
  String get executionRisk => '実行リスク';

  @override
  String get personalRisk => '個人のリスク';

  @override
  String get overallFit => '全体的なフィット感';

  @override
  String get firstOption => '最初のオプション';

  @override
  String get secondOption => '2 番目のオプション';

  @override
  String get versus => '対';

  @override
  String get confidenceInterpretation => '信頼度の解釈';

  @override
  String get financialImpact => '財務上の影響';

  @override
  String get riskLevel => 'リスクレベル';

  @override
  String get timeInvestment => '時間の投資';

  @override
  String get longTermSustainability => '長期的な持続可能性';

  @override
  String get personalGrowth => '個人の成長';

  @override
  String get outcomeConsistency => '結果の一貫性';

  @override
  String get riskAssessment => 'リスクアセスメント';

  @override
  String get historicalSimilarity => '歴史的な類似性';

  @override
  String get relevanceMatch => '関連性の一致';

  @override
  String get dataQuality => 'データ品質';

  @override
  String get confidenceVeryHigh => '非常に高い';

  @override
  String get confidenceModerate => '適度';

  @override
  String get confidenceVeryLow => '非常に低い';

  @override
  String get onboardingAiPowered => 'AI を活用した';

  @override
  String get onboardingSmartAnalysis => 'より良い意思決定のためのスマートな分析';

  @override
  String get onboardingRiskAnalysis => 'リスク分析';

  @override
  String get onboardingActionablePlans => '実行可能な計画';

  @override
  String get onboardingTrustedGuidance => '信頼できるガイダンス';

  @override
  String get onboardingDefineGoalLeading => 'あなたを定義してください';

  @override
  String get goalWord => 'ゴール';

  @override
  String get onboardingChooseJourney => '指導を受けたい人生の旅路を選択してください';

  @override
  String get onboardingCareerPath => 'キャリアパス';

  @override
  String get onboardingCareerPathDesc => '将来の市場とスキルを探る';

  @override
  String get onboardingMajorPurchase => '大きな買い物';

  @override
  String get onboardingMajorPurchaseDesc => '新規購入のオプションを比較する';

  @override
  String get onboardingLifeChanges => '人生の変化';

  @override
  String get onboardingLifeChangesDesc => '移転または新しいフェーズを計画する';

  @override
  String get onboardingPersonalGrowth => '個人の成長';

  @override
  String get onboardingPersonalGrowthDesc => 'スキルと考え方の変化を特定する';

  @override
  String get onboardingReadyLeading => '準備完了';

  @override
  String get navigateWord => 'ナビゲート';

  @override
  String get onboardingReadySubtitle => 'あなたのパーソナルアシスタントがいつでもお手伝いします';

  @override
  String get onboardingActionableGuidance => '実用的なガイダンス';

  @override
  String get onboardingActionableGuidanceDesc => '成功のためのガイダンスを得る';

  @override
  String get onboardingProgressTracking => '進捗状況の追跡';

  @override
  String get onboardingProgressTrackingDesc => '旅のマイルストーンを監視する';

  @override
  String get onboardingAdjustOnTheFly => 'オンザフライで調整';

  @override
  String get onboardingAdjustDesc => '生活の変化に合わせて計画を再評価する';

  @override
  String get onboardingShareLearn => '共有して学ぶ';

  @override
  String get onboardingShareLearnDesc => '自分の道を共有し、そこから学びましょう';

  @override
  String get myProfileLeading => '私の';

  @override
  String get preferences => '設定';

  @override
  String get personalityPreferences => '性格の好み';

  @override
  String get saveChanges => '変更を保存';

  @override
  String get phoneNumber => '電話番号';

  @override
  String get tapToChangePhoto => '写真を変更するにはここをタップしてください';

  @override
  String get photoPickerComingSoon => 'フォトピッカーは近日公開予定です。';

  @override
  String get pickImageSourceTitle => 'プロフィール写真を変更する';

  @override
  String get pickFromCamera => '写真を撮る';

  @override
  String get pickFromGallery => 'ギャラリーから選ぶ';

  @override
  String get removePhoto => '写真を削除';

  @override
  String get cameraPermissionDenied => '写真を撮るにはカメラの許可が必要です。';

  @override
  String get galleryPermissionDenied => '写真を選択するにはフォトライブラリの許可が必要です。';

  @override
  String get openSettings => '設定を開く';

  @override
  String get savePreferences => '設定の保存';

  @override
  String get preferencesSaved => '設定が保存されました。';

  @override
  String get personalitySubtitle => 'AI があなたをよりよく理解できるように支援する';

  @override
  String get focusAreas => '注力分野';

  @override
  String get emptyTitleLeading => '何もない';

  @override
  String get emptyTitleAccent => 'ここはまだ';

  @override
  String get emptyQuietTitle => 'ここは静かだよ';

  @override
  String get emptyHistoryHint => '最初の決定を開始すると、履歴がここに表示されます。';

  @override
  String get startADecision => '決断を始める';

  @override
  String get helpHereToHelp => '私たちはお手伝いします';

  @override
  String get faq => 'よくある質問';

  @override
  String get noResults => '結果はありません';

  @override
  String get errorTitle => '何か問題が発生しました';

  @override
  String get errorSubtitle => '予期しないエラーが発生しました。もう一度試してください。';

  @override
  String get contactSupport => 'サポートに連絡する';

  @override
  String get noInternetTitle => '接続がありません';

  @override
  String get noInternetSubtitle => 'インターネット接続を確認して、もう一度試してください。';

  @override
  String get retryConnection => '接続を再試行する';

  @override
  String get offlineMode => 'オフラインモードに移動';

  @override
  String get permissionTitle => 'アプリの権限';

  @override
  String get permissionSubtitle => '最高のエクスペリエンスを実現するために権限を付与します。';

  @override
  String get grantAll => 'すべてを許可する';

  @override
  String get notNow => '今じゃない';

  @override
  String get updateAvailable => '利用可能なアップデート';

  @override
  String get updateSubtitle => '改良を加えた新しいバージョンが利用可能です。';

  @override
  String get updateNow => '今すぐアップデート';

  @override
  String get remindLater => '後でリマインドする';

  @override
  String get loadingMessage => '準備を整えています...';

  @override
  String get decisionDetailLeading => '決断';

  @override
  String get detailWord => '詳細';

  @override
  String get decisionNotFound => '決定が見つかりません';

  @override
  String get overall => '全体';

  @override
  String get pros => '長所';

  @override
  String get cons => '短所';

  @override
  String get notes => '注意事項';

  @override
  String get saveAtLeastTwoToCompare => '比較するために少なくとも 2 つの決定を保存します。';

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
  String get moderate => '適度';

  @override
  String get veryHigh => '非常に高い';

  @override
  String get veryLow => '非常に低い';

  @override
  String get next => '次';

  @override
  String get later => '後で';

  @override
  String get useWord => '使用';

  @override
  String get aboutUsLeading => 'について';

  @override
  String get aboutUsAccent => '私たち';

  @override
  String get howToUseLeading => 'ハウツー';

  @override
  String get versionLabel => 'バージョン1.0.0';

  @override
  String get dailyDecision => '毎日の決定';

  @override
  String get personalityDescription => 'これらの設定は、推奨のトーンと深さをパーソナライズします。';

  @override
  String get traitOptimism => '楽観';

  @override
  String get traitPatience => '忍耐';

  @override
  String get traitDetailFocus => 'ディテールフォーカス';

  @override
  String get categoryTravel => '旅行';

  @override
  String get helpResponseTime => '平均応答時間: 24 時間未満';

  @override
  String get helpGetInTouch => '連絡する';

  @override
  String get helpLiveChat => 'ライブチャット';

  @override
  String get helpLiveChatSub => 'リアルタイムでチームとチャット';

  @override
  String get helpCall => '電話';

  @override
  String get helpCallSub => '月曜日～金曜日 午前 9 時～午後 5 時（PT）';

  @override
  String get helpSubmitTicket => 'チケットを送信する';

  @override
  String get helpSubmitTicketSub => '追跡サポートチケットを取得する';

  @override
  String get helpQuickLinks => 'クイックリンク';

  @override
  String get faqSubtitle => 'よくある質問への回答';

  @override
  String get aboutSubtitle => 'バージョン、クレジット、リンク';

  @override
  String get helpOpenLiveChat => 'ライブチャットを開く';

  @override
  String get helpLiveChatSoon =>
      'ライブチャットがまもなく開始されます — 24 時間以内にメールで返信させていただきます。';

  @override
  String get moreOptionsComingSoon => 'さらに多くのオプションが近日公開予定';

  @override
  String get insightCompoundTitle => '決断をさらに強化する';

  @override
  String get insightCompoundMessage =>
      '今日の決定が 6 か月後のチャンスを形作ります。最も多くのドアを開くものを選択してください。';

  @override
  String get insightParalysisTitle => '分析麻痺に注意';

  @override
  String get insightParalysisMessage => '1 週間以上考えても新しい情報がなければ、決断するのは十分です。';

  @override
  String get insightRiskStressTitle => 'リスクとストレスはイコールではない';

  @override
  String get insightRiskStressMessage =>
      '明確なプラン B があれば、リスクの高い決定でもストレスを軽減できます。常にフォールバックを設計します。';

  @override
  String get insightFutureYouTitle => '未来のあなたも投票してください';

  @override
  String get insightFutureYouMessage =>
      '決める前に、「5年後の未来のあなたは、現在のあなたにこのことに感謝するだろうか？」と考えてみましょう。';

  @override
  String streakDays(int count) {
    return '$count 日連続';
  }

  @override
  String get streakKeepGoing => '続けてください - 今日の決断を大切にしてください。';

  @override
  String get todaysDecisionPrompt => '今日の意思決定のプロンプト';

  @override
  String get dailyDecisionExerciseSub => '60 秒の簡単な意思決定練習';

  @override
  String get dailyDecisionQuestion => 'この機会に「イエス」と言うべきでしょうか、それとも「ノー」と言うべきですか?';

  @override
  String get dailyDecisionScenario =>
      '同僚があなたをサイドプロジェクトに招待します。刺激的ですが、週に10時間かかります。';

  @override
  String get seeAiAnalysis => 'AI 分析を参照';

  @override
  String get errorWhatYouCanDo => 'できること';

  @override
  String get errorTip1 => 'インターネット接続を確認してください';

  @override
  String get errorTip2 => 'しばらくしてからアクションをもう一度試してください';

  @override
  String get errorTip3 => 'アプリを再起動する';

  @override
  String get errorTip4 => '引き続き発生する場合はサポートに連絡してください';

  @override
  String get noInternetYouCanStill => 'まだできます';

  @override
  String get offlineTip1 => '保存された決定と履歴を表示する';

  @override
  String get offlineTip2 => 'メモと行動計画を読む';

  @override
  String get offlineTip3 => 'よくある質問と概要を参照';

  @override
  String get permissionNotificationsDesc => 'リマインダーと毎日の意思決定のプロンプトを受け取る';

  @override
  String get permissionLocation => '位置';

  @override
  String get permissionLocationDesc => '位置情報に基づいた提案のみに使用されます';

  @override
  String get permissionStorage => 'ストレージ';

  @override
  String get permissionStorageDesc => 'レポートを保存してローカルにエクスポートする';

  @override
  String get permissionSettingsNote => '権限はいつでも「設定」から変更できます';

  @override
  String updateVersionReady(String version) {
    return 'バージョン $version をインストールする準備ができました';
  }

  @override
  String get whatsNew => '新着情報';

  @override
  String get updateFeature1 => 'AI解析の高速化（2倍高速化）';

  @override
  String get updateFeature2 => '新しいキャリアアドバイザーモジュール';

  @override
  String get updateFeature3 => 'ダークモードのコントラストの向上';

  @override
  String get updateFeature4 => 'バグ修正と安定性の向上';

  @override
  String get loadingSubtitle => '通常、これには数秒しかかかりません';

  @override
  String get howToUseStep1Title => '自分の決定を定義する';

  @override
  String get howToUseStep1Body => 'まず、あなたの決定、カテゴリー、そしてあなたにとって最も重要なことを説明してください。';

  @override
  String get howToUseStep2Title => '選択肢を分析する';

  @override
  String get howToUseStep2Body => '目標、緊急性、予算、リスク許容度に関するガイド付きの質問に答えます。';

  @override
  String get howToUseStep3Title => 'AI の結果を確認する';

  @override
  String get howToUseStep3Body => '推奨事項、リスク スコア、長所と短所、段階的なアクション プランを確認します。';

  @override
  String get howToUseStep4Title => '進行状況を保存して追跡する';

  @override
  String get howToUseStep4Body => '決定を履歴に保存し、ガイダンスが必要なときにいつでも洞察を再確認できます。';

  @override
  String get clientSelectionLeading => 'クライアント';

  @override
  String get clientSelectionAccent => '選択';

  @override
  String get whichClientQuestion => 'どのクライアントに「イエス」と言うべきですか?';

  @override
  String get clientSelectionSubtitle => 'AI は、適合性、手数料、リスクに基づいて顧客の機会をスコアリングします。';

  @override
  String get freelancePricingLeading => 'フリーランス';

  @override
  String get freelancePricingAccent => '価格設定';

  @override
  String get recommendedPrice => '推奨価格';

  @override
  String get pricingScore => '価格スコア';

  @override
  String get priceComparison => '価格比較';

  @override
  String get priceDrivers => '価格要因';

  @override
  String get marketRate => '市場レート';

  @override
  String get experienceLabel => '経験';

  @override
  String get timelineLabel => 'タイムライン';

  @override
  String get complexityLabel => '複雑';

  @override
  String get projectValue => 'プロジェクトの価値';

  @override
  String get sendProposal => '提案の送信';

  @override
  String get proposalSent => '提案書がクライアントに送信されました。';

  @override
  String get productivityLeading => '生産性';

  @override
  String get productivityAccent => 'プランナー';

  @override
  String get eisenhowerPriority => 'アイゼンハワー優先';

  @override
  String get startFocusBlock => 'フォーカスブロックの開始';

  @override
  String get focusBlockStarted => 'フォーカス ブロックが開始されました — 頑張ってください!';

  @override
  String get careerAdvisorLeading => 'キャリア';

  @override
  String get careerAdvisorAccent => 'アドバイザー';

  @override
  String get careerFitScore => 'キャリアフィットスコア';

  @override
  String get topPathProductManager => 'トップパス: プロダクトマネージャー';

  @override
  String get skillMatch => 'スキルマッチ';

  @override
  String get strategyLabel => '戦略';

  @override
  String get communicationLabel => 'コミュニケーション';

  @override
  String get analyticsLabel => '分析';

  @override
  String get technicalLabel => 'テクニカル';

  @override
  String get build90DayPlan => '90日間の計画を立てる';

  @override
  String get businessIdeaLeading => '仕事';

  @override
  String get businessIdeaAccent => 'アイデア';

  @override
  String get describeBusinessIdea => 'ビジネスアイデアを説明してください';

  @override
  String get businessIdeaSubtitle => 'AI は実行可能性、市場適合性、リスクをスコアリングします。';

  @override
  String get viabilityScore => '生存率スコア';

  @override
  String get scoreBreakdown => 'スコアの内訳';

  @override
  String get aiVerdict => 'AI の評決';

  @override
  String get fullPlanGenerated => '完全な計画が生成され、保存されました。';

  @override
  String get financialCalcLeading => '金融';

  @override
  String get financialCalcAccent => '電卓';

  @override
  String get compoundGrowth => '複合的な成長';

  @override
  String get futureValue => '将来価値';

  @override
  String get saveToDecisions => '決定事項に保存';

  @override
  String get saveDecisionLeading => '保存';

  @override
  String get saveDecisionAccent => '決断';

  @override
  String get decisionSaved => '決定が保存されました。';

  @override
  String get folderLabel => 'フォルダ';

  @override
  String get folderDefault => 'デフォルト';

  @override
  String get folderCareer => 'キャリア';

  @override
  String get folderFinance => 'ファイナンス';

  @override
  String get folderHealth => '健康';

  @override
  String get folderPersonal => '個人的';

  @override
  String get reportExportLeading => '輸出';

  @override
  String get reportExportAccent => '報告';

  @override
  String get exportReport => 'レポートのエクスポート';

  @override
  String get shareReport => 'シェアレポート';

  @override
  String get subscriptionLeading => '選択してください';

  @override
  String get subscriptionAccent => 'プラン';

  @override
  String get mostPopular => '最も人気のある';

  @override
  String get freeTrial => '7日間の無料トライアル';

  @override
  String get upgradePremium => 'プレミアムにアップグレード';

  @override
  String get choosePlan => 'プランを選択してください';

  @override
  String get paymentSuccessful => '支払いが成功しました！';

  @override
  String get thankYouUpgrade => 'プレミアムにアップグレードしていただきありがとうございます。';

  @override
  String get goToDashboard => 'ダッシュボードに移動';

  @override
  String get paymentDetails => 'お支払い詳細';

  @override
  String get payNow => '今すぐ支払う';

  @override
  String get cardNumber => 'カード番号';

  @override
  String get nameOnCard => 'カード上の名前';

  @override
  String get premiumFeatures => 'プレミアム機能';

  @override
  String get faqSearchHint => 'よくある質問を検索';

  @override
  String get topicAll => '全て';

  @override
  String get topicGettingStarted => 'はじめる';

  @override
  String get topicAi => 'AI';

  @override
  String get topicBilling => '請求する';

  @override
  String get topicAccount => 'アカウント';

  @override
  String get tabAll => '全て';

  @override
  String get tabUnread => '未読';

  @override
  String get tabArchived => 'アーカイブ済み';

  @override
  String get noArchivedItems => 'アーカイブされたアイテムはありません';

  @override
  String get traitRiskTolerance => 'リスク許容度';

  @override
  String get budgetWhyMatters => '予算は、AI が推奨事項の財務上のトレードオフを検討するのに役立ちます。';

  @override
  String get timeWhyMatters => '時間の利用可能性によって、行動計画がどれほど野心的であるべきかが決まります。';

  @override
  String get experienceWhyMatters => '経験レベルは、AI があなたの背景に合わせてアドバイスを調整するのに役立ちます。';

  @override
  String get riskWhyMatters => 'リスク許容度によって、推奨事項がどの程度保守的か大胆かが決まります。';

  @override
  String get urgencyWhyMatters => '緊急性は、推奨事項にどれだけ早く対応する必要があるかに影響します。';

  @override
  String get confidenceReliableRecommend => '一般的に信頼できる推奨事項';

  @override
  String get confidenceReliableSomeRisks => '一般的に信頼できるが、いくつかのリスクがある';

  @override
  String get confidenceConsiderRisks => 'リスクを慎重に考慮する';

  @override
  String get confidenceHighUncertainty => '不確実性が高い - 慎重に進めてください';

  @override
  String get stepResults => '結果';

  @override
  String get urgencyNoRush => 'ラッシュはありません';

  @override
  String get urgencyModerate => '適度';

  @override
  String get urgencyUrgent => '緊急';

  @override
  String get urgencyCritical => '致命的';

  @override
  String get experienceBeginner => '初心者';

  @override
  String get experienceIntermediate => '中級';

  @override
  String get experienceAdvanced => '高度な';

  @override
  String get experienceExpert => '専門家';

  @override
  String get timeVeryLimited => '非常に限られた';

  @override
  String get timeLimited => '限定';

  @override
  String get timeModerateAvail => '適度';

  @override
  String get timeHighAvail => '高い';

  @override
  String get timeVeryHigh => '非常に高い';

  @override
  String get riskToleranceLow => '低い';

  @override
  String get riskToleranceModerate => '適度';

  @override
  String get riskToleranceHigh => '高い';

  @override
  String get riskToleranceVeryHigh => '非常に高い';

  @override
  String get doNow => '今すぐやる';

  @override
  String get doToday => '今日やります';

  @override
  String get scheduleLabel => 'スケジュール';

  @override
  String get deleteLabel => '消去';

  @override
  String get tipLabel => 'ヒント';

  @override
  String get aiRecommendation => 'AIレコメンド';

  @override
  String get comparisonMenu => '比較';

  @override
  String get clientSelectionVerdictBody =>
      'Acme が最も適しています。「そうだ」と答えてください。謎のクライアント: 丁重にお断りします。曖昧なブリーフは範囲のクリープを予測します。';

  @override
  String get freelancePricingSubtitle => 'AIを活用した料金推奨';

  @override
  String get priceLower => 'より低い';

  @override
  String get priceRecommended => '推奨';

  @override
  String get priceHigher => 'より高い';

  @override
  String get freelancePricingRecommendationBody =>
      'この顧客を健全な利益率で獲得するには、価格を 2,800 ドルに設定します。彼らが反発した場合は、価格を下げるのではなく、範囲を固定します。';

  @override
  String get productivitySubtitle => 'AI は、今何をするか、何をスケジュールするか、何をドロップするかを分類します。';

  @override
  String get productivityTipBody =>
      'すべてが緊急であれば、何も緊急ではありません。今すぐやるべき項目を 1 ～ 2 つ選択し、会議のように保護します。';

  @override
  String get careerAdvisorDescription =>
      'あなたのスキル、コミュニケーション スタイル、成長への関心に基づいて最適です。';

  @override
  String get nextSteps => '次のステップ';

  @override
  String get careerAdvisorNextStepsBody =>
      '今四半期、部門を超えた小規模な取り組みを主導して、PM スタイルの実績を構築します。';

  @override
  String get excellent => '素晴らしい';

  @override
  String get good => '良い';

  @override
  String get businessIdeaHint => '例: AI ケア リマインダーを備えた観葉植物用のサブスクリプション ボックス';

  @override
  String get marketSize => '市場規模';

  @override
  String get competition => '競争';

  @override
  String get profitability => '収益性';

  @override
  String get executionEase => '実行の容易さ';

  @override
  String get large => '大きい';

  @override
  String get businessIdeaVerdictBody =>
      '明確な聴衆を持つ強力なコンセプト。マーケティングを拡大する前に、最初の 90 日間は 20 人の有料顧客を獲得することに集中します。';

  @override
  String get generateFullPlan => '完全な計画を生成する';

  @override
  String get financialCalcSubtitle => '時間の経過とともにお金がどのくらい増加するかを確認します。';

  @override
  String get financialInitialAmount => '初期金額 (\$)';

  @override
  String get financialAnnualRate => '年率(%)';

  @override
  String get financialDuration => '期間（年）';

  @override
  String get financialCalcTipBody =>
      'たとえ毎月の少額の拠出であっても、10 年以上の期間で見れば、多額の 1 回限りの積立を上回ります。';

  @override
  String get saveDecisionNotesHint => 'この決定について覚えておきたいこと';

  @override
  String get reportExportSubtitle => '決定レポートを保存または共有する';

  @override
  String get completed => '完了';

  @override
  String get goAhead => 'どうぞ';

  @override
  String get includeInReport => 'レポートに含める';

  @override
  String get executiveSummary => 'エグゼクティブサマリー';

  @override
  String get analysisDetails => '分析の詳細';

  @override
  String get notesAndInputs => 'メモと入力';

  @override
  String get exportFormat => 'エクスポート形式';

  @override
  String get pdfBestForSharing => '共有に最適';

  @override
  String get excelDataScores => 'データとスコア';

  @override
  String get wordDocument => '書類';

  @override
  String get imageJpgPng => 'JPG / PNG';

  @override
  String get shareOrSave => '共有または保存';

  @override
  String get shareLink => 'リンクを共有する';

  @override
  String get createShareableLink => '共有可能なリンクを作成する';

  @override
  String get emailReport => '電子メールレポート';

  @override
  String get sendViaEmail => '電子メールで送信する';

  @override
  String get saveToDevice => 'デバイスに保存';

  @override
  String get downloadToDevice => 'デバイスにダウンロードする';

  @override
  String get scheduleAutoReports => '自動レポートのスケジュールを設定する';

  @override
  String exportedAs(String format) {
    return '$format としてエクスポート';
  }

  @override
  String get subscriptionSubtitle => '自分に合ったプランで賢明な意思決定を行う';

  @override
  String get makeSmarterDecisions => 'より賢明な決定を下す';

  @override
  String get subscriptionHeroBody => '無制限の AI 分析、深い洞察、パーソナライズされた推奨事項を利用できます。';

  @override
  String get planBasic => '基本';

  @override
  String get planPremium => 'プレミアム';

  @override
  String get planPro => 'プロ';

  @override
  String get perMonth => '/月';

  @override
  String get allPlansInclude => 'すべてのプランに含まれるもの';

  @override
  String get moneyBackGuarantee => '7日間の返金保証';

  @override
  String get moneyBackGuaranteeBody => '満足していませんか? 7日以内に全額返金を受けてください。';

  @override
  String get subscribeTermsNote => '購読すると、利用規約とプライバシー ポリシーに同意したものとみなされます。';

  @override
  String get securePaymentEncryption => '業界標準の暗号化による安全な支払い';

  @override
  String get paymentLeading => '支払い';

  @override
  String get paymentAccent => '詳細';

  @override
  String get premiumMonthly => 'プレミアム • 月額';

  @override
  String get taxEstimate => '推定税額';

  @override
  String get totalToday => '今日の合計';

  @override
  String get paymentMethod => '支払方法';

  @override
  String get paymentCard => 'カード';

  @override
  String get paymentPayPal => 'ペイパル';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get cardExpiryHint => 'YY/MM';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'エンドツーエンドで暗号化されます。当社がお客様のカードを保管することはありません。';

  @override
  String get premiumFeaturesLeading => 'プレミアム';

  @override
  String get premiumFeaturesAccent => '特徴';

  @override
  String get premiumUnlockSubtitle => 'Life Navigator の機能を最大限に活用しましょう';

  @override
  String get premiumFeature1Title => '無制限のAI分析';

  @override
  String get premiumFeature1Body => '必要なだけ意思決定を実行します。';

  @override
  String get premiumFeature2Title => '深い洞察';

  @override
  String get premiumFeature2Body => 'リスク、信頼度、結果、影響のグラフ。';

  @override
  String get premiumFeature3Title => '決定を比較する';

  @override
  String get premiumFeature3Body => '決定事項を並べて確認します。';

  @override
  String get premiumFeature4Title => 'レポートのエクスポート';

  @override
  String get premiumFeature4Body => 'PDF、Word、Excel、画像のエクスポート。';

  @override
  String get premiumFeature5Title => 'クラウド同期';

  @override
  String get premiumFeature5Body => 'クラウドに安全にバックアップ。';

  @override
  String get premiumFeature6Title => '優先サポート';

  @override
  String get premiumFeature6Body => '24時間以内にご返信ください。';

  @override
  String get paymentSuccessLeading => '支払い';

  @override
  String get paymentSuccessAccent => '成功！';

  @override
  String get youNowHaveAccessTo => 'アクセスできるようになりました';

  @override
  String get planLabel => 'プラン';

  @override
  String get amountLabel => '額';

  @override
  String get methodLabel => '方法';

  @override
  String get transactionIdLabel => 'トランザクションID';

  @override
  String get unlimitedAi => '無制限のAI';

  @override
  String get deepInsightsShort => '深い洞察';

  @override
  String get compareShort => '比較する';

  @override
  String get exportsShort => '輸出';

  @override
  String get cloudSyncShort => 'クラウド同期';

  @override
  String get prioritySupportShort => '優先サポート';

  @override
  String get privacyLeading => 'プライバシー';

  @override
  String get privacyAccent => 'ポリシー';

  @override
  String get privacyLastUpdated => '最終更新日: 2026 年 5 月 18 日';

  @override
  String get privacySection1Title => '私たちが収集するもの';

  @override
  String get privacySection1Body =>
      '当社は、お客様から提供されたもの、つまりお客様が保存した決定事項、アカウントの詳細 (名前とメールアドレス)、およびお客様の設定のみを収集します。それ以外はすべてデバイス上に残ります。';

  @override
  String get privacySection2Title => '使い方';

  @override
  String get privacySection2Body =>
      'AI の推奨事項をパーソナライズするには、必要に応じてデータを同期し、アプリを改善します。当社はお客様のデータを第三者に販売することはありません。';

  @override
  String get privacySection3Title => 'ローカルファーストのストレージ';

  @override
  String get privacySection3Body =>
      '決定はデフォルトでデバイスに保存されます。クラウド同期はオプトインで、転送中も保存中も暗号化されます。';

  @override
  String get privacySection4Title => 'あなたの権利';

  @override
  String get privacySection4Body =>
      'すべてのデータは、[設定] からいつでもエクスポートまたは削除できます。データリクエストには 7 日以内に対応します。';

  @override
  String get privacySection5Title => '子供たち';

  @override
  String get privacySection5Body =>
      'AI ライフ ナビゲーターは 13 歳未満のお子様を対象としていません。当社は意図的にお子様からデータを収集しません。';

  @override
  String get privacySection6Title => 'お問い合わせ';

  @override
  String get privacySection6Body =>
      'ご質問やご懸念はありますか?メールでprivacy@lifenavigator.appまでお送りください。2営業日以内にご連絡いたします。';

  @override
  String get termsLeading => '利用規約';

  @override
  String get termsAccent => 'サービス';

  @override
  String get termsLastUpdated => '最終更新日: 2026 年 5 月 18 日';

  @override
  String get termsSection1Title => '1. 承諾';

  @override
  String get termsSection1Body =>
      'AIライフナビゲーターを使用すると、本規約に同意したものとみなされます。同意できない場合は、アプリを使用しないでください。';

  @override
  String get termsSection2Title => '2. アカウント';

  @override
  String get termsSection2Body =>
      'あなたのアカウントを安全に保つのはあなた自身の責任です。資格情報を共有しないでください。';

  @override
  String get termsSection3Title => '3. AI による推奨事項';

  @override
  String get termsSection3Body =>
      'AI の出力はガイダンスであり、専門的なアドバイスではありません。それらに基づいて行う決定については、あなたが責任を負います。';

  @override
  String get termsSection4Title => '4. 定期購読';

  @override
  String get termsSection4Body =>
      'プレミアムプランはキャンセルされるまで自動更新されます。ストアアカウントからいつでもキャンセルできます。';

  @override
  String get termsSection5Title => '5. 許容される使用方法';

  @override
  String get termsSection5Body =>
      '虐待的なコンテンツ、リバースエンジニアリング、スクレイピングはありません。違反した場合はアカウントが停止される場合があります。';

  @override
  String get termsSection6Title => '6. 責任の制限';

  @override
  String get termsSection6Body =>
      '法律で認められる最大限の範囲で、当社の責任は、お客様が過去 12 か月間に当社に支払った金額に限定されます。';

  @override
  String get termsSection7Title => '7. 変更点';

  @override
  String get termsSection7Body =>
      '当社は本規約を更新する場合があります。重要な変更については、アプリ内通知または電子メールでお知らせします。';

  @override
  String get faqQ1 => '新しい決断を始めるにはどうすればよいですか?';

  @override
  String get faqA1 => 'ホーム画面で [新しい分析を開始] カードをタップし、決定にタイトルを付けて、ガイドに沿った手順に従います。';

  @override
  String get faqQ2 => '私のデータはプライベートですか?';

  @override
  String get faqA2 => 'はい。デフォルトでは、決定はデバイス上にローカルに保存されます。クラウド同期はオプトインで暗号化されます。';

  @override
  String get faqQ3 => 'AIはどの程度正確ですか?';

  @override
  String get faqA3 =>
      'AI は専門的なアドバイスではなく、構造化されたガイダンスを提供します。自分自身の判断と併せて、思考の補助として使用してください。';

  @override
  String get faqQ4 => 'AI は私の会話にアクセスできますか?';

  @override
  String get faqA4 => 'いいえ。決定フローで送信した入力のみが使用されます。デバイスからは何も読み取られません。';

  @override
  String get faqQ5 => 'サブスクリプションをキャンセルするにはどうすればよいですか?';

  @override
  String get faqA5 =>
      'App Store / Google Playの定期購入ページからいつでもキャンセルできます。期間が終了するまでアクセスは継続されます。';

  @override
  String get faqQ6 => '返金はありますか?';

  @override
  String get faqA6 =>
      'はい - 最初の購入から 7 日以内。 support@lifenavigator.app にメールで送信してください。';

  @override
  String get faqQ7 => 'アカウントを削除するにはどうすればよいですか?';

  @override
  String get faqA7 => '「設定」→「アカウント」→「アカウントを削除」。すべてのデータは 30 日以内に削除されます。';

  @override
  String get faqQ8 => '自分の決定をエクスポートできますか?';

  @override
  String get faqA8 =>
      'はい。保存した決定を開き、「レポートのエクスポート」をタップして、PDF、Word、Excel、または画像としてダウンロードします。';

  @override
  String get notificationsLeading => '通知';

  @override
  String get notificationsAccent => 'カチオン';

  @override
  String get decisionTextRiskFallback => '完全な分析を実行して、カスタマイズされたリスク軽減のヒントを取得します。';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return '全体的なリスク レベルは $label ($score%) です。このスコアの原因を理解するには、以下の内訳を確認してください。';
  }

  @override
  String get urgencyNoRushSub => '時間をかけて選択肢をリサーチし、比較します。';

  @override
  String get urgencyNoRushTag => '柔軟なスケジュール';

  @override
  String get urgencyModerateSub => '数週間以内に決定します。';

  @override
  String get urgencyModerateTag => '数週間以内';

  @override
  String get urgencyUrgentSub => '数日以内に決定する必要があります。';

  @override
  String get urgencyUrgentTag => '数日以内';

  @override
  String get urgencyCriticalSub => '即時の対応が必要です。';

  @override
  String get urgencyCriticalTag => '即時';

  @override
  String get urgencyWhyMattersDesc =>
      '緊急度は、AIがどの要因を重視するかに影響します（迅速な意思決定と明確なサイン）。';

  @override
  String get budgetRange1 => '1千-5千ドル';

  @override
  String get budgetRange2 => '5千-2万ドル';

  @override
  String get budgetRange3 => '2万-5万ドル';

  @override
  String get budgetRange4 => '5万ドル以上';

  @override
  String get budgetWhyMattersDesc => '予算を設定することで、AIは選択肢を評価し、コスト効率の高い解決策を提案します。';

  @override
  String get riskToleranceLowSub => '安定した、予測可能な結果を好みます。';

  @override
  String get riskToleranceLowTag => '安定・安全';

  @override
  String get riskToleranceModerateSub => 'バランスの取れたトレードオフを受け入れます。';

  @override
  String get riskToleranceModerateTag => 'バランスの取れたリスク';

  @override
  String get riskToleranceHighSub => 'より大きなリターンを目指して、変動を許容します。';

  @override
  String get riskToleranceHighTag => '成長志向';

  @override
  String get riskToleranceVeryHighSub => '大きな不確実性も許容できます。';

  @override
  String get riskToleranceVeryHighTag => '最大リターン';

  @override
  String get riskWhyMattersDesc =>
      'リスク許容度は、AIが潜在的なリターンと起こりうるリスクのバランスを取るのに役立ちます。';

  @override
  String get experienceBeginnerSub => 'この分野の初心者で、まだ知識を構築中である。';

  @override
  String get experienceBeginnerTag => '学習に最適';

  @override
  String get experienceIntermediateSub => '関連する経験やある程度の理解がある。';

  @override
  String get experienceIntermediateTag => 'バランス重視';

  @override
  String get experienceAdvancedSub => 'この分野において強固なバックグラウンドを持つ。';

  @override
  String get experienceAdvancedTag => '成長志向';

  @override
  String get experienceExpertSub => '深い専門知識と確かな実績がある。';

  @override
  String get experienceExpertTag => '成果の最大化';

  @override
  String get experienceWhyMattersDesc =>
      '経験レベルは、AIが推奨事項の難易度や深度をカスタマイズするのに役立ちます。';

  @override
  String get timeVeryLimitedSub => '週に数時間のみ利用可能です。';

  @override
  String get timeVeryLimitedTag => '最小限の時間';

  @override
  String get timeLimitedSub => '平日の夜や週末に少し空き時間があります。';

  @override
  String get timeLimitedTag => 'パートタイム感覚';

  @override
  String get timeModerateAvailSub => '毎週安定した時間を確保できます。';

  @override
  String get timeModerateAvailTag => '定期的な取り組み';

  @override
  String get timeHighAvailSub => '毎週かなりの時間を費やすことができます。';

  @override
  String get timeHighAvailTag => '十分な稼働時間';

  @override
  String get timeVeryHighSub => 'これを現在の最優先事項にできます。';

  @override
  String get timeVeryHighTag => 'フルコミット';

  @override
  String get timeWhyMattersDesc => '時間の余裕度を把握することで、AIは継続可能な現実的なプランを提案します。';
}
