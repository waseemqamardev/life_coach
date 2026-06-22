// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Yapay Zeka Yaşam Gezgini';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navChatbot => 'AI Sohbet';

  @override
  String get navInsights => 'Analizler';

  @override
  String get navHistory => 'Tarih';

  @override
  String get continueButton => 'Devam';

  @override
  String get nextButton => 'İleri';

  @override
  String get backButton => 'Geri';

  @override
  String get saveButton => 'Kaydetmek';

  @override
  String get analyzeButton => 'Analiz et';

  @override
  String get tryAgain => 'Tekrar deneyin';

  @override
  String get viewAll => 'Tümünü Görüntüle';

  @override
  String get searchHint => 'Aramak...';

  @override
  String get selectLanguage => 'Seçme';

  @override
  String get languageWord => 'Dil';

  @override
  String get searchLanguageHint => 'Dili burada arayın...';

  @override
  String get noLanguagesFound => 'Dil bulunamadı';

  @override
  String get settings => 'Ayarlar';

  @override
  String get accountSettings => 'Hesap Ayarı';

  @override
  String get languages => 'Diller';

  @override
  String get theme => 'Tema';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get termsOfService => 'Hizmet Şartları';

  @override
  String get helpSupport => 'Yardım ve Destek';

  @override
  String get logout => 'Oturumu kapat';

  @override
  String get welcomeBack => 'Tekrar hoşgeldiniz!';

  @override
  String get emailAddress => 'E-posta Adresi';

  @override
  String get password => 'Şifre';

  @override
  String get login => 'Giriş';

  @override
  String get signUp => 'Kayıt ol';

  @override
  String get forgotPassword => 'Parolanızı mı unuttunuz?';

  @override
  String get rememberMe => 'Beni Hatırla';

  @override
  String goodMorning(String name) {
    return 'Günaydın, $name 👋';
  }

  @override
  String get homeSubtitle =>
      'Bir sonraki önemli kararınız için yapay zeka destekli rehberlik alın.';

  @override
  String get startNewAnalysis => 'Yeni Analizi Başlat';

  @override
  String get startAnalysisSubtitle =>
      'Rehberli bir analiz başlatın ve kişiselleştirilmiş bir öneri alın.';

  @override
  String get decisionOverview => 'Karara Genel Bakış';

  @override
  String get riskScore => 'Risk Puanı';

  @override
  String get successChance => 'Başarı Şansı';

  @override
  String get activePlans => 'Aktif Planlar';

  @override
  String get inProgress => 'Devam etmekte';

  @override
  String get recentInsights => 'Son Analizler';

  @override
  String get stepDefine => 'Tanımla';

  @override
  String get stepAnalyze => 'Analiz';

  @override
  String get stepQuestions => 'Sorular';

  @override
  String get stepResult => 'Sonuç';

  @override
  String get defineYourProblem => 'Tanımlayın';

  @override
  String get problemWord => 'Sorun';

  @override
  String get tellUsMore => 'Kararınız hakkında bize daha fazla bilgi verin';

  @override
  String get wizardHint =>
      'Ne kadar çok ayrıntı sağlarsanız yapay zekamız sizi o kadar iyi analiz edebilir ve yönlendirebilir.';

  @override
  String get describeDecision => 'Kararınızı Açıklayın';

  @override
  String get quickTips => 'Hızlı İpuçları';

  @override
  String get beSpecific => 'Spesifik Olun';

  @override
  String get includeContext => 'Bağlamı Ekle';

  @override
  String get mentionGoal => 'Mansiyon Hedefi';

  @override
  String get choosingBetween => 'Ne arasında seçim yapıyorsunuz?';

  @override
  String get optionsHint =>
      'En fazla 5 seçeneği listeleyin. Yapay zeka her birini hedeflerinize göre tartacaktır.';

  @override
  String get addAnotherOption => 'Başka Bir Seçenek Ekle';

  @override
  String get continueToAnalysis => 'Analize Devam Et';

  @override
  String get aiQuestionsTitle => 'yapay zeka';

  @override
  String get questionsWord => 'Sorular';

  @override
  String get preparingQuestions => 'Kişiye özel sorular hazırlanıyor…';

  @override
  String basedOnDecision(String title) {
    return 'Kararınıza göre: $title';
  }

  @override
  String get basedOnWizard => 'Sihirbazda paylaştıklarınıza göre';

  @override
  String get aiNavigator => 'Yapay Zeka Yaşam Gezgini';

  @override
  String get aiQuestionsHint =>
      'Dürüstçe cevap verin; yanıtlarınız yapay zeka analizini şekillendirir.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'Yapay zeka bu soruları özellikle \"$title\" için oluşturdu.';
  }

  @override
  String questionOf(int current, int total) {
    return '$total sorusunun $current sorusu';
  }

  @override
  String get whyThisMatters => 'Bu neden önemli?';

  @override
  String get whyQuestionsMatter =>
      'Yanıtlarınız yapay zekanın durumunuzla en alakalı olana odaklanmasına yardımcı olur.';

  @override
  String get securePrivate => 'Verileriniz güvende ve gizli';

  @override
  String get processingAnalyzing => 'Seçenekleriniz analiz ediliyor...';

  @override
  String get processingRisk => 'Risk faktörleri hesaplanıyor...';

  @override
  String get processingOutcomes => 'Sonuçları tahmin etmek...';

  @override
  String get processingPlan => 'Eylem planı oluşturuluyor...';

  @override
  String get processingFinalizing => 'Sonuç Sonlandırılıyor';

  @override
  String get decisionResult => 'Karar';

  @override
  String get resultWord => 'Sonuç';

  @override
  String get recommendedChoice => 'Önerilen Seçim';

  @override
  String get benefitScore => 'Fayda Puanı';

  @override
  String get confidence => 'Kendinden emin';

  @override
  String get fitScore => 'Uyum Puanı';

  @override
  String get resultBreakdown => 'Sonuç Dağılımı';

  @override
  String get finalRecommendation => 'Nihai Tavsiye';

  @override
  String get outcomePrediction => 'Sonuç Tahmini';

  @override
  String get confidenceMeter => 'Güven Ölçer';

  @override
  String get actionPlan => 'Eylem Planı';

  @override
  String get prosCons => 'Artıları ve Eksileri';

  @override
  String get tipFromAi => 'AI\'dan ipucu';

  @override
  String get saveReport => 'Raporu Kaydet';

  @override
  String get startNewDecision => 'Yeni Karar Başlat';

  @override
  String get decisionWord => 'Karar';

  @override
  String get comparisonWord => 'Karşılaştırmak';

  @override
  String get whyRecommended => 'Bu Neden Tavsiye Edilir?';

  @override
  String get riskBreakdown => 'Risk Dağılımı';

  @override
  String get riskInterpretation => 'Risk Yorumu';

  @override
  String get howToImprove => 'Nasıl Geliştirilir';

  @override
  String get overallConfidence => 'Genel Güven';

  @override
  String get confidenceBreakdown => 'Güven Dağılımı';

  @override
  String get successLikelihood => 'Başarı Olasılığı';

  @override
  String get outcomeBreakdown => 'Sonuç Dağılımı';

  @override
  String get keyOutcomeFactors => 'Temel Sonuç Faktörleri';

  @override
  String get prosTitle => 'Bu Kararın Artıları';

  @override
  String get consTitle => 'Bu Kararın Eksileri';

  @override
  String get overallProsCons => 'Genel Artılar ve Eksiler';

  @override
  String get bestOverallFit => 'En iyi genel uyum';

  @override
  String get bestOverallChoice => 'En iyi genel seçim';

  @override
  String get recommendedChoiceLabel => 'Önerilen seçim';

  @override
  String get yourActionPlan => 'Eylem Planınız';

  @override
  String get aiInsight => 'Yapay Zeka Analizi';

  @override
  String get keyComparison => 'Anahtar Karşılaştırma';

  @override
  String get overallScore => 'Genel Puan';

  @override
  String get keyPoints => 'Önemli Noktalar';

  @override
  String get analysisFailed =>
      'Analiz başarısız oldu. İnternetinizi ve API anahtarınızı kontrol edin.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY eksik. Bunu .env\'ye ekleyin ve uygulamayı yeniden başlatın.';

  @override
  String get noDescription => 'Açıklama sağlanmadı.';

  @override
  String get history => 'Tarih';

  @override
  String get about => 'Hakkında';

  @override
  String get profile => 'Profil';

  @override
  String get editProfile => 'Profili Düzenle';

  @override
  String get low => 'Düşük';

  @override
  String get medium => 'Orta';

  @override
  String get high => 'Yüksek';

  @override
  String get lowRisk => 'Düşük Risk';

  @override
  String get mediumRisk => 'Orta Risk';

  @override
  String get highRisk => 'Yüksek Risk';

  @override
  String get notAssessed => 'Değerlendirilmedi';

  @override
  String get couldNotLoadQuestions => 'Sorular yüklenemedi';

  @override
  String get noQuestionsGenerated => 'Hiçbir soru oluşturulmadı.';

  @override
  String get onboardingTitle1 => 'Yapay zeka ile daha akıllı kararlar alın';

  @override
  String get onboardingSubtitle1 =>
      'Hayatın önemli seçimleri için kişiselleştirilmiş rehberlik alın.';

  @override
  String get onboardingTitle2 => 'Riskleri ve sonuçları analiz edin';

  @override
  String get onboardingSubtitle2 =>
      'Taahhütte bulunmadan önce ödünleşimleri anlayın.';

  @override
  String get onboardingTitle3 => 'Net bir eylem planı izleyin';

  @override
  String get onboardingSubtitle3 =>
      'İçgörüleri pratik sonraki adımlara dönüştürün.';

  @override
  String get getStarted => 'Başla';

  @override
  String get skip => 'Atla';

  @override
  String get darkMode => 'Karanlık Mod';

  @override
  String get lightMode => 'Işık Modu';

  @override
  String get systemDefault => 'Sistem Varsayılanı';

  @override
  String get generalSettings => 'Genel Ayarlar';

  @override
  String get support => 'Destek';

  @override
  String get legal => 'Yasal';

  @override
  String get languageChanged => 'Dil güncellendi';

  @override
  String get yourOptions => 'Seçenekleriniz';

  @override
  String get recommended => 'Tavsiye edilen';

  @override
  String get compareOptions => 'Seçenekleri karşılaştır';

  @override
  String get plan => 'Planı';

  @override
  String get prepare => 'Hazırlanmak';

  @override
  String get execute => 'Uygulamak';

  @override
  String get positiveOutcome => 'Olumlu Sonuç';

  @override
  String get neutralOutcome => 'Nötr Sonuç';

  @override
  String get negativeOutcome => 'Olumsuz Sonuç';

  @override
  String get overallRiskScore => 'Genel Risk Puanı';

  @override
  String get yourDecisionRiskLevel => 'Karar risk seviyeniz';

  @override
  String get overallPrediction => 'Genel Tahmin';

  @override
  String get overallProsConsTitle => 'Genel Artılar ve Eksiler';

  @override
  String get emptyHistory => 'Henüz kayıtlı karar yok';

  @override
  String get startFirstDecision => 'İlk karar analizinizi başlatın';

  @override
  String get chatbotTitle => 'Yapay Zeka Sohbet Robotu';

  @override
  String get insightsTitle => 'Analizler';

  @override
  String get dailySuggestion => 'Günlük Öneri';

  @override
  String get aboutTagline =>
      'Yapay zeka tarafından desteklenen akıllı karar desteği; seçenekleri, riskleri ve sonraki adımları tartın.';

  @override
  String get aboutBody =>
      'AI Life Navigator, yapılandırılmış sorular, risk analizi ve net eylem planlarıyla yaşam ve kariyer kararları vermenize yardımcı olur.';

  @override
  String get personalInformation => 'Kişisel Bilgiler';

  @override
  String get appSetting => 'Uygulama Ayarı';

  @override
  String get securityPrivacy => 'Güvenlik ve Gizlilik';

  @override
  String get aboutUs => 'Hakkımızda';

  @override
  String get howToUse => 'Nasıl Kullanılır';

  @override
  String get appTheme => 'Uygulama Teması';

  @override
  String get shareApp => 'Paylaşmak';

  @override
  String get rateUs => 'Bizi Değerlendirin';

  @override
  String get pleaseAddOption => 'Lütfen en az bir seçenek ekleyin';

  @override
  String get noReportToSave => 'Kaydedilecek karar raporu yok.';

  @override
  String get reportSaved => 'Rapor Geçmiş\'e kaydedildi.';

  @override
  String get pendingAnalysis => 'Bekleyen analiz';

  @override
  String get untitledDecision => 'Başlıksız karar';

  @override
  String get describeDecisionHint =>
      'Durumunuzu, kısıtlamalarınızı ve başarının neye benzediğini açıklayın.';

  @override
  String optionLabel(String letter) {
    return 'Seçenek $letter';
  }

  @override
  String get goodChance => 'İyi Şans';

  @override
  String get fairChance => 'Adil Şans';

  @override
  String get poorChance => 'Kötü Şans';

  @override
  String get couldNotPrepareQuestions =>
      'Soruları hazırlayamadım. Lütfen tekrar deneyin.';

  @override
  String get greetingFallbackName => 'Orası';

  @override
  String get dontHaveAccount => 'Hesabınız yok mu?';

  @override
  String get alreadyHaveAccount => 'Zaten bir hesabınız var mı?';

  @override
  String get cancel => 'İptal';

  @override
  String get delete => 'Sil';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'HAYIR';

  @override
  String get welcome => 'Hoş geldin!';

  @override
  String get orContinueWith => 'veya devam et';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'Hayat';

  @override
  String get navigator => 'Gezgin';

  @override
  String get authTagline => 'Yapay Zeka Karar verme asistanı';

  @override
  String get chatbotReadySubtitle => 'Hayatınızı yönlendirmeye hazır';

  @override
  String get chatbotInputHint => 'Sohbetinize buradan başlayın...';

  @override
  String get chatbotErrorMessage =>
      'Üzgünüm, AI hizmetine ulaşamadım. Lütfen bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get selectAll => 'Tümünü seç';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => 'Silinecek kararları seçin.';

  @override
  String get total => 'Toplam';

  @override
  String get highScore => 'Yüksek Puan';

  @override
  String get justNow => 'Şu anda';

  @override
  String minutesAgo(int count) {
    return '$count dakika önce';
  }

  @override
  String hoursAgo(int count) {
    return '$count saat önce';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count saat önce';
  }

  @override
  String daysAgo(int count) {
    return '$count gün önce';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count gün önce';
  }

  @override
  String scoreLabel(int score) {
    return 'Puan $score';
  }

  @override
  String get themeCustomizeSubtitle =>
      'Uygulamanızın görünümünü ve tarzını özelleştirin';

  @override
  String get lightModeSubtitle => 'Temiz ve parlak deneyim';

  @override
  String get darkModeSubtitle => 'Düşük ışıkta gözleri yormaz';

  @override
  String get systemDefaultSubtitle => 'Cihaz teması tercihini kullan';

  @override
  String get preview => 'Önizleme';

  @override
  String get applyTheme => 'Temayı Uygula';

  @override
  String get shareAppMessage => 'Life Navigator\'ı arkadaşlarınızla paylaşın.';

  @override
  String get rateAppThanks =>
      'Life Navigator\'ı derecelendirdiğiniz için teşekkür ederiz!';

  @override
  String fieldRequired(String field) {
    return '$field gerekli';
  }

  @override
  String get emailRequired => 'E-posta gerekli';

  @override
  String get emailInvalid => 'Lütfen geçerli bir e-posta girin';

  @override
  String get passwordRequired => 'Şifre gerekli';

  @override
  String get passwordMinLength => 'Şifre en az 6 karakter olmalıdır';

  @override
  String get confirmPasswordRequired => 'Lütfen şifrenizi onaylayın';

  @override
  String get passwordsDoNotMatch => 'Şifreler eşleşmiyor';

  @override
  String get otpRequired => 'OTP gerekli';

  @override
  String otpInvalid(int length) {
    return 'Lütfen $length haneli geçerli bir kod girin';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field en az $min karakterden oluşmalıdır';
  }

  @override
  String get fieldDescription => 'Tanım';

  @override
  String get fieldTitle => 'Başlık';

  @override
  String get fullName => 'Ad Soyad';

  @override
  String get confirmPassword => 'Şifreyi Onayla';

  @override
  String get createAccount => 'Hesap oluşturmak';

  @override
  String get acceptTermsRequired =>
      'Lütfen Şartlar ve Gizlilik Politikasını kabul edin.';

  @override
  String get signupTitleLeading => 'Kendinizinkini Oluşturun';

  @override
  String get account => 'Hesap';

  @override
  String get signupSubtitle =>
      'Life Navigator\'a katılın ve her gün daha akıllı kararlar alın.';

  @override
  String get iAgreeToThe => 'katılıyorum';

  @override
  String get forgotPasswordLeading => 'Unutmuş olmak';

  @override
  String get forgotPasswordAccent => 'Şifre?';

  @override
  String get forgotPasswordSubtitle =>
      'E-postanızı girin, size şifrenizi sıfırlamanız için bir bağlantı göndereceğiz.';

  @override
  String get enterEmailHint => 'E-posta adresinizi girin';

  @override
  String get forgotPasswordInfo =>
      'E-posta adresinize şifre sıfırlama bağlantısı göndereceğiz.';

  @override
  String get sendVerificationCode => 'Doğrulama Kodunu Gönder';

  @override
  String get sendPasswordResetLink => 'Sıfırlama Bağlantısını Gönder';

  @override
  String get emailVerificationTitle => 'E-postayı Doğrula';

  @override
  String get emailVerificationSubtitle =>
      'E-postanıza bir doğrulama bağlantısı gönderdik. Hesabınızı etkinleştirmek için açın.';

  @override
  String get emailVerificationSpamHint =>
      'E-postayı birkaç dakika içinde görmezseniz spam veya önemsiz klasörünüzü kontrol edin.';

  @override
  String get emailVerificationWaiting =>
      'Doğrulama bekleniyor... Otomatik olarak kontrol edeceğiz.';

  @override
  String get emailVerificationResend => 'Doğrulama e-postasını yeniden gönder';

  @override
  String get emailVerificationResent =>
      'Doğrulama e-postası tekrar gönderildi.';

  @override
  String get authErrorWrongPassword =>
      'Yanlış e-posta veya şifre. Lütfen tekrar deneyin.';

  @override
  String get authErrorEmailInUse =>
      'Bu e-posta zaten kayıtlı. Bunun yerine giriş yapmayı deneyin.';

  @override
  String get authErrorWeakPassword =>
      'Şifre çok zayıf. En az 6 karakter kullanın.';

  @override
  String get authErrorUserNotFound => 'Bu e-postaya ait hesap bulunamadı.';

  @override
  String get authErrorTooManyRequests =>
      'Çok fazla deneme. Lütfen bekleyin ve tekrar deneyin.';

  @override
  String get authErrorGeneric =>
      'Bir şeyler ters gitti. Lütfen tekrar deneyin.';

  @override
  String get authErrorGoogleCancelled =>
      'Google\'da oturum açma işlemi iptal edildi.';

  @override
  String get passwordResetEmailSent =>
      'Şifre sıfırlama e-postası gönderildi. Gelen kutunuzu kontrol edin.';

  @override
  String get changePassword => 'Şifre değiştir';

  @override
  String get changePasswordSubtitle =>
      'Mevcut şifrenizi girin ve yeni bir şifre seçin.';

  @override
  String get currentPassword => 'Mevcut Şifre';

  @override
  String get deleteAccount => 'Hesabı Sil';

  @override
  String get deleteAccountConfirm =>
      'Bu, hesabınızı kalıcı olarak siler ve geri alınamaz.';

  @override
  String get deleteAccountSuccess =>
      'Ayrıca bu cihazda depolanan yerel kararları ve sohbeti de silin.';

  @override
  String get accountDeleted => 'Hesabınız silindi.';

  @override
  String get rememberPassword => 'Şifrenizi hatırlıyor musunuz?';

  @override
  String get passwordUpdatedLogin => 'Şifre güncellendi. Lütfen giriş yapın.';

  @override
  String get resetLeading => 'Sıfırla';

  @override
  String get resetPasswordSubtitle =>
      'Hesabınız için yeni bir şifre oluşturun.';

  @override
  String get newPassword => 'Yeni Şifre';

  @override
  String get confirmNewPassword => 'Yeni Şifreyi Onayla';

  @override
  String get passwordHint =>
      'Hatırlayabileceğiniz bir karışımla en az 6 karakter kullanın.';

  @override
  String get updating => 'Güncelleniyor...';

  @override
  String get updatePassword => 'Şifreyi Güncelle';

  @override
  String get backTo => 'Geri dön';

  @override
  String newCodeSentTo(String email) {
    return '$email adresine yeni kod gönderildi';
  }

  @override
  String get invalidVerificationCode =>
      'Geçersiz doğrulama kodu. Lütfen tekrar deneyin.';

  @override
  String otpResetSubtitle(String email) {
    return '$email adresine gönderilen 6 haneli sıfırlama kodunu girin';
  }

  @override
  String otpVerifySubtitle(String email) {
    return '$email adresine gönderilen 6 haneli doğrulama kodunu girin';
  }

  @override
  String get verifyLeading => 'Doğrulamak';

  @override
  String get verifyEmailLeading => 'Doğrulayın';

  @override
  String get codeWord => 'Kod';

  @override
  String get emailWord => 'E-posta';

  @override
  String resendCodeIn(int seconds) {
    return 'Kodu ${seconds}s cinsinden yeniden gönder';
  }

  @override
  String get didntReceiveCode => 'Kodu almadınız mı?';

  @override
  String get resendCode => 'Kodu Yeniden Gönder';

  @override
  String get verifying => 'Doğrulanıyor...';

  @override
  String get verifyCode => 'Kodu Doğrula';

  @override
  String get verifyAndContinue => 'Doğrula ve Devam Et';

  @override
  String get wrongEmail => 'Yanlış e-posta mı?';

  @override
  String get goBack => 'Geri gitmek';

  @override
  String get logOut => 'Oturumu Kapat';

  @override
  String get logoutConfirmMessage =>
      'Bu uygulamadan çıkış yapmak istediğinizden emin misiniz?';

  @override
  String get logoutConfirmYes => 'Evet, Oturumu Kapat';

  @override
  String get insightsHeroDescription =>
      'Kararlarınıza göre uyarlanmış günlük öneriler ve bilgiler.';

  @override
  String recommendedPrefix(String text) {
    return 'Önerilen: $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'Kişiselleştirilmiş bir risk yorumunu görmek için bir analizi tamamlayın.';

  @override
  String get startDecisionQuestion =>
      'Hangi karar konusunda yardım istiyorsunuz?';

  @override
  String get startDecisionSubtitle =>
      'Kararınızı açıklayın ve yapay zeka destekli içgörüler ve öneriler alın.';

  @override
  String get decisionTitle => 'Karar Başlığı';

  @override
  String get decisionTitleHint => 'örneğin Kariyerimi değiştirmeli miyim?';

  @override
  String get decisionCategory => 'Karar Kategorisi';

  @override
  String get importanceLevel => 'Önem Düzeyi';

  @override
  String get impactMinor => 'Küçük Etki';

  @override
  String get impactModerate => 'Orta Etki';

  @override
  String get impactHigh => 'Yüksek Etki';

  @override
  String get categoryCareer => 'Kariyer';

  @override
  String get categoryFinance => 'Finans';

  @override
  String get categoryHealth => 'Sağlık';

  @override
  String get categoryRelations => 'İlişkiler';

  @override
  String get categoryEducation => 'Eğitim';

  @override
  String get categoryOther => 'Diğer';

  @override
  String get addYourOptionsLeading => 'Ekle';

  @override
  String get optionsWord => 'Seçenekler';

  @override
  String get describeOptionHint => 'Bu seçeneği açıklayın';

  @override
  String get goalSelection => 'Hedef Seçimi';

  @override
  String get goalSelectionSubtitle =>
      'Kararınız için sizin için en önemli olan seçenekleri seçin.';

  @override
  String get selectAtLeastOneGoal => 'Lütfen en az bir hedef seçin';

  @override
  String get goalTipBody =>
      'Önceliklerinizi daha sonra istediğiniz zaman profilinizde ayarlayabilirsiniz.';

  @override
  String get goalGrowth => 'Büyüme';

  @override
  String get goalFinancialGain => 'Finansal Kazanç';

  @override
  String get goalRiskReduction => 'Risk Azaltma';

  @override
  String get goalPersonalSatisfaction => 'Kişisel Memnuniyet';

  @override
  String get goalTimeEfficiency => 'Zaman Verimliliği';

  @override
  String get goalWorkLifeBalance => 'İş-Yaşam Dengesi';

  @override
  String get goalStability => 'Kararlılık';

  @override
  String get goalImpact => 'Darbe';

  @override
  String get budgetInput => 'Bütçe Girişi';

  @override
  String get budgetSubtitle => 'Bu karar için tahmini bütçenizi seçin.';

  @override
  String get budgetImpactLevel => 'Bütçe Etki Düzeyi';

  @override
  String get budgetLessThan5k => '5.000 Dolardan Az';

  @override
  String get enterYourBudget => 'Bütçenizi Girin';

  @override
  String get timeAvailability => 'Zaman Kullanılabilirliği';

  @override
  String get timeAvailabilitySubtitle =>
      'Bu karar için uygun zamanınızı seçin.';

  @override
  String get experienceLevel => 'Deneyim Seviyesi';

  @override
  String get experienceSubtitle =>
      'Bu, yapay zekamızın geçmişinizi ve uzmanlığınızı anlamasına yardımcı olur.';

  @override
  String get riskTolerance => 'Risk Toleransı';

  @override
  String get riskToleranceSubtitle =>
      'Bu karar için risk tolerans düzeyinizi seçin.';

  @override
  String get timeUrgency => 'Zaman Aciliyeti';

  @override
  String get urgencySubtitle => 'Kararınızın aciliyetini seçin.';

  @override
  String get financialRisk => 'Finansal Risk';

  @override
  String get marketRisk => 'Piyasa Riski';

  @override
  String get timeRisk => 'Zaman Riski';

  @override
  String get executionRisk => 'İcra Riski';

  @override
  String get personalRisk => 'Kişisel Risk';

  @override
  String get overallFit => 'Genel Uyum';

  @override
  String get firstOption => 'İlk seçenek';

  @override
  String get secondOption => 'İkinci seçenek';

  @override
  String get versus => 'vs';

  @override
  String get confidenceInterpretation => 'Güven Yorumu';

  @override
  String get financialImpact => 'Finansal Etki';

  @override
  String get riskLevel => 'Risk Düzeyi';

  @override
  String get timeInvestment => 'Zaman Yatırımı';

  @override
  String get longTermSustainability => 'Uzun Vadeli Sürdürülebilirlik';

  @override
  String get personalGrowth => 'Kişisel Gelişim';

  @override
  String get outcomeConsistency => 'Sonuç Tutarlılığı';

  @override
  String get riskAssessment => 'Risk değerlendirmesi';

  @override
  String get historicalSimilarity => 'Tarihsel Benzerlik';

  @override
  String get relevanceMatch => 'Alaka Eşleşmesi';

  @override
  String get dataQuality => 'Veri Kalitesi';

  @override
  String get confidenceVeryHigh => 'Çok Yüksek';

  @override
  String get confidenceModerate => 'Ilıman';

  @override
  String get confidenceVeryLow => 'Çok Düşük';

  @override
  String get onboardingAiPowered => 'Yapay Zeka Destekli';

  @override
  String get onboardingSmartAnalysis => 'Daha iyi kararlar için akıllı analiz';

  @override
  String get onboardingRiskAnalysis => 'Risk Analizi';

  @override
  String get onboardingActionablePlans => 'Uygulanabilir Planlar';

  @override
  String get onboardingTrustedGuidance => 'Güvenilir Rehberlik';

  @override
  String get onboardingDefineGoalLeading => 'Tanımlayın';

  @override
  String get goalWord => 'Amaç';

  @override
  String get onboardingChooseJourney =>
      'Rehberlik almak istediğiniz yaşam yolculuğunu seçin';

  @override
  String get onboardingCareerPath => 'Kariyer Yolu';

  @override
  String get onboardingCareerPathDesc =>
      'Gelecekteki pazarları ve becerileri keşfedin';

  @override
  String get onboardingMajorPurchase => 'Büyük Satın Alma';

  @override
  String get onboardingMajorPurchaseDesc =>
      'Yeni bir satın alma için seçenekleri karşılaştırın';

  @override
  String get onboardingLifeChanges => 'Yaşam Değişiklikleri';

  @override
  String get onboardingLifeChangesDesc =>
      'Bir yer değiştirmeyi veya yeni bir aşamayı planlayın';

  @override
  String get onboardingPersonalGrowth => 'Kişisel Gelişim';

  @override
  String get onboardingPersonalGrowthDesc =>
      'Beceri ve zihniyet değişimlerini tanımlayın';

  @override
  String get onboardingReadyLeading => 'Hazır';

  @override
  String get navigateWord => 'Gezin';

  @override
  String get onboardingReadySubtitle =>
      'Kişiselleştirilmiş asistanınız yardıma hazır';

  @override
  String get onboardingActionableGuidance => 'Uygulanabilir Rehberlik';

  @override
  String get onboardingActionableGuidanceDesc =>
      'Başarınız için rehberlik alın';

  @override
  String get onboardingProgressTracking => 'İlerleme Takibi';

  @override
  String get onboardingProgressTrackingDesc =>
      'Yolculuğunuzun kilometre taşlarını izleyin';

  @override
  String get onboardingAdjustOnTheFly => 'Anında Ayarlama';

  @override
  String get onboardingAdjustDesc =>
      'Hayat ilerledikçe planları yeniden değerlendirin';

  @override
  String get onboardingShareLearn => 'Paylaş ve Öğren';

  @override
  String get onboardingShareLearnDesc => 'Yollarınızı paylaşın ve öğrenin';

  @override
  String get myProfileLeading => 'Benim';

  @override
  String get preferences => 'Tercihler';

  @override
  String get personalityPreferences => 'Kişilik Tercihleri';

  @override
  String get saveChanges => 'Değişiklikleri Kaydet';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get tapToChangePhoto => 'Fotoğrafı değiştirmek için buraya dokunun';

  @override
  String get photoPickerComingSoon => 'Fotoğraf seçici yakında gelecek.';

  @override
  String get pickImageSourceTitle => 'Profil fotoğrafını değiştir';

  @override
  String get pickFromCamera => 'Fotoğraf çek';

  @override
  String get pickFromGallery => 'Galeriden seç';

  @override
  String get removePhoto => 'Fotoğrafı kaldır';

  @override
  String get cameraPermissionDenied =>
      'Fotoğraf çekmek için kamera izni gereklidir.';

  @override
  String get galleryPermissionDenied =>
      'Fotoğraf seçmek için fotoğraf kitaplığı izni gereklidir.';

  @override
  String get openSettings => 'Ayarları Aç';

  @override
  String get savePreferences => 'Tercihleri ​​Kaydet';

  @override
  String get preferencesSaved => 'Tercihler kaydedildi.';

  @override
  String get personalitySubtitle =>
      'Yapay zekanın sizi daha iyi anlamasına yardımcı olun';

  @override
  String get focusAreas => 'Odak Alanları';

  @override
  String get emptyTitleLeading => 'Hiç bir şey';

  @override
  String get emptyTitleAccent => 'Henüz Burada';

  @override
  String get emptyQuietTitle => 'Burası sessiz';

  @override
  String get emptyHistoryHint =>
      'İlk kararınızı verdiğinizde geçmişiniz burada görünecektir.';

  @override
  String get startADecision => 'Bir Karar Başlatın';

  @override
  String get helpHereToHelp => 'Yardım etmek için buradayız';

  @override
  String get faq => 'SSS';

  @override
  String get noResults => 'Sonuç yok';

  @override
  String get errorTitle => 'Bir şeyler ters gitti';

  @override
  String get errorSubtitle =>
      'Beklenmedik bir hatayla karşılaştık. Lütfen tekrar deneyin.';

  @override
  String get contactSupport => 'Destek Ekibiyle İletişime Geçin';

  @override
  String get noInternetTitle => 'Bağlantı Yok';

  @override
  String get noInternetSubtitle =>
      'Lütfen internet bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get retryConnection => 'Bağlantıyı Yeniden Dene';

  @override
  String get offlineMode => 'Çevrimdışı Moda Git';

  @override
  String get permissionTitle => 'Uygulama İzinleri';

  @override
  String get permissionSubtitle => 'En iyi deneyim için izinler verin.';

  @override
  String get grantAll => 'Tümüne İzin Ver';

  @override
  String get notNow => 'Şimdi değil';

  @override
  String get updateAvailable => 'Güncelleme Mevcut';

  @override
  String get updateSubtitle =>
      'İyileştirmelerle birlikte yeni bir sürüm mevcut.';

  @override
  String get updateNow => 'Şimdi Güncelle';

  @override
  String get remindLater => 'Daha Sonra Hatırlat';

  @override
  String get loadingMessage => 'Eşyalar hazırlanıyor...';

  @override
  String get decisionDetailLeading => 'Karar';

  @override
  String get detailWord => 'Detay';

  @override
  String get decisionNotFound => 'Karar bulunamadı';

  @override
  String get overall => 'Etraflı';

  @override
  String get pros => 'Artıları';

  @override
  String get cons => 'Eksileri';

  @override
  String get notes => 'Notlar';

  @override
  String get saveAtLeastTwoToCompare =>
      'Karşılaştırmak için en az iki kararı kaydedin.';

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
  String get moderate => 'Ilıman';

  @override
  String get veryHigh => 'Çok Yüksek';

  @override
  String get veryLow => 'Çok Düşük';

  @override
  String get next => 'Sonraki';

  @override
  String get later => 'Daha sonra';

  @override
  String get useWord => 'Kullanmak';

  @override
  String get aboutUsLeading => 'Hakkında';

  @override
  String get aboutUsAccent => 'Biz';

  @override
  String get howToUseLeading => 'Nasıl Yapılır';

  @override
  String get versionLabel => 'Sürüm 1.0.0';

  @override
  String get dailyDecision => 'Günlük Karar';

  @override
  String get personalityDescription =>
      'Bu ayarlar önerilerin tonunu ve derinliğini kişiselleştirir.';

  @override
  String get traitOptimism => 'İyimserlik';

  @override
  String get traitPatience => 'Sabır';

  @override
  String get traitDetailFocus => 'Detay Odaklılığı';

  @override
  String get categoryTravel => 'Seyahat';

  @override
  String get helpResponseTime => 'Ortalama yanıt süresi: 24 saatten az';

  @override
  String get helpGetInTouch => 'İletişime geçin';

  @override
  String get helpLiveChat => 'Canlı Sohbet';

  @override
  String get helpLiveChatSub => 'Ekibimizle gerçek zamanlı sohbet edin';

  @override
  String get helpCall => 'Arama';

  @override
  String get helpCallSub => 'Pazartesi-Cum 09:00-17:00 PT';

  @override
  String get helpSubmitTicket => 'Bilet Gönder';

  @override
  String get helpSubmitTicketSub => 'Takip edilen bir destek bileti alın';

  @override
  String get helpQuickLinks => 'Hızlı bağlantılar';

  @override
  String get faqSubtitle => 'Sık sorulan soruların yanıtları';

  @override
  String get aboutSubtitle => 'Sürüm, katkılar ve bağlantılar';

  @override
  String get helpOpenLiveChat => 'Canlı Sohbeti Aç';

  @override
  String get helpLiveChatSoon =>
      'Canlı sohbet yakında açılıyor; 24 saat içinde size e-posta göndereceğiz.';

  @override
  String get moreOptionsComingSoon => 'Yakında daha fazla seçenek gelecek';

  @override
  String get insightCompoundTitle => 'Kararlarınızı birleştirin';

  @override
  String get insightCompoundMessage =>
      'Bugün alınan kararlar 6 ay sonraki fırsatları şekillendirir. En çok kapıyı açanı seçin.';

  @override
  String get insightParalysisTitle => 'Analiz felcine dikkat';

  @override
  String get insightParalysisMessage =>
      'Bir haftadan fazla süredir yeni bir bilgi olmadan bu konuyu düşünüyorsanız, karar vermek için yeterli bilgiye sahipsiniz demektir.';

  @override
  String get insightRiskStressTitle => 'Risk strese eşit değildir';

  @override
  String get insightRiskStressMessage =>
      'Açık bir B planınız varsa, yüksek riskli bir karar yine de düşük stresli olabilir. Her zaman geri dönüşünüzü tasarlayın.';

  @override
  String get insightFutureYouTitle => 'Gelecek-sen de oy veriyorsun';

  @override
  String get insightFutureYouMessage =>
      'Karar vermeden önce şunu sorun: Bundan 5 yıl sonra gelecekteki siz, bunun için şimdiki size teşekkür eder misiniz?';

  @override
  String streakDays(int count) {
    return '$count günlük seri';
  }

  @override
  String get streakKeepGoing => 'Devam edin; bugünün kararlarını dikkate alın.';

  @override
  String get todaysDecisionPrompt => 'Bugünün Karar İstemi';

  @override
  String get dailyDecisionExerciseSub =>
      '60 saniyelik hızlı bir karar egzersizi';

  @override
  String get dailyDecisionQuestion =>
      'Bu fırsata evet mi yoksa hayır mı demelisiniz?';

  @override
  String get dailyDecisionScenario =>
      'Bir meslektaşınız sizi bir yan projeye davet ediyor. Heyecan verici ama haftada 10 saat sürüyor.';

  @override
  String get seeAiAnalysis => 'Yapay Zeka Analizini görün';

  @override
  String get errorWhatYouCanDo => 'Ne yapabilirsin';

  @override
  String get errorTip1 => 'İnternet bağlantınızı kontrol edin';

  @override
  String get errorTip2 => 'İşlemi bir süre sonra tekrar deneyin';

  @override
  String get errorTip3 => 'Uygulamayı yeniden başlatın';

  @override
  String get errorTip4 => 'Sorun devam ederse destek ekibiyle iletişime geçin';

  @override
  String get noInternetYouCanStill => 'Hala yapabilirsin';

  @override
  String get offlineTip1 => 'Kaydedilen kararları ve geçmişi görüntüleyin';

  @override
  String get offlineTip2 => 'Notlarınızı ve eylem planlarınızı okuyun';

  @override
  String get offlineTip3 => 'SSS ve Hakkında\'ya göz atın';

  @override
  String get permissionNotificationsDesc =>
      'Hatırlatıcılar ve günlük karar istemleri alın';

  @override
  String get permissionLocation => 'Konum';

  @override
  String get permissionLocationDesc =>
      'Yalnızca konuma dayalı öneriler için kullanılır';

  @override
  String get permissionStorage => 'Depolamak';

  @override
  String get permissionStorageDesc =>
      'Raporlarınızı ve dışa aktarmalarınızı yerel olarak kaydedin';

  @override
  String get permissionSettingsNote =>
      'İzinleri istediğiniz zaman Ayarlar\'dan değiştirebilirsiniz';

  @override
  String updateVersionReady(String version) {
    return 'Sürüm $version kuruluma hazır';
  }

  @override
  String get whatsNew => 'Ne var ne yok';

  @override
  String get updateFeature1 => 'Daha hızlı yapay zeka analizi (2 kat hızlanma)';

  @override
  String get updateFeature2 => 'Yeni Kariyer Danışmanı modülü';

  @override
  String get updateFeature3 => 'Geliştirilmiş karanlık mod kontrastı';

  @override
  String get updateFeature4 =>
      'Hata düzeltmeleri ve kararlılık iyileştirmeleri';

  @override
  String get loadingSubtitle => 'Bu genellikle sadece birkaç saniye sürer';

  @override
  String get howToUseStep1Title => 'Kararınızı tanımlayın';

  @override
  String get howToUseStep1Body =>
      'Kararınızı, kategorinizi ve sizin için en önemli olanı açıklayarak başlayın.';

  @override
  String get howToUseStep2Title => 'Seçeneklerinizi analiz edin';

  @override
  String get howToUseStep2Body =>
      'Hedefler, aciliyet, bütçe ve risk toleransı ile ilgili rehberli soruları yanıtlayın.';

  @override
  String get howToUseStep3Title => 'Yapay zeka sonuçlarını inceleyin';

  @override
  String get howToUseStep3Body =>
      'Önerinizi, risk puanınızı, artılarınızı ve eksilerinizi ve adım adım eylem planınızı görün.';

  @override
  String get howToUseStep4Title => 'İlerlemeyi kaydedin ve izleyin';

  @override
  String get howToUseStep4Body =>
      'Kararları Geçmişe kaydedin ve rehberliğe ihtiyaç duyduğunuzda öngörüleri yeniden ziyaret edin.';

  @override
  String get clientSelectionLeading => 'Müşteri';

  @override
  String get clientSelectionAccent => 'Seçim';

  @override
  String get whichClientQuestion => 'Hangi müşteriye evet demelisiniz?';

  @override
  String get clientSelectionSubtitle =>
      'Yapay zeka, müşteri fırsatlarını uygunluk, ücret ve riske göre puanlar.';

  @override
  String get freelancePricingLeading => 'Serbest çalışan';

  @override
  String get freelancePricingAccent => 'Fiyatlandırma';

  @override
  String get recommendedPrice => 'Önerilen Fiyat';

  @override
  String get pricingScore => 'Fiyatlandırma Puanı';

  @override
  String get priceComparison => 'Fiyat Karşılaştırması';

  @override
  String get priceDrivers => 'Fiyat Etkenleri';

  @override
  String get marketRate => 'Piyasa Oranı';

  @override
  String get experienceLabel => 'Deneyim';

  @override
  String get timelineLabel => 'Zaman çizelgesi';

  @override
  String get complexityLabel => 'Karmaşıklık';

  @override
  String get projectValue => 'Proje Değeri';

  @override
  String get sendProposal => 'Teklif Gönder';

  @override
  String get proposalSent => 'Teklif müşteriye gönderildi.';

  @override
  String get productivityLeading => 'Verimlilik';

  @override
  String get productivityAccent => 'Planlayıcı';

  @override
  String get eisenhowerPriority => 'Eisenhower önceliği';

  @override
  String get startFocusBlock => 'Odak Bloğunu Başlat';

  @override
  String get focusBlockStarted =>
      'Odaklanma engellemesi başladı — iyi şanslar!';

  @override
  String get careerAdvisorLeading => 'Kariyer';

  @override
  String get careerAdvisorAccent => 'Danışman';

  @override
  String get careerFitScore => 'Kariyer Uyum Skoru';

  @override
  String get topPathProductManager => 'Üst Yol: Ürün Yöneticisi';

  @override
  String get skillMatch => 'Beceri Maçı';

  @override
  String get strategyLabel => 'Strateji';

  @override
  String get communicationLabel => 'İletişim';

  @override
  String get analyticsLabel => 'Analitik';

  @override
  String get technicalLabel => 'Teknik';

  @override
  String get build90DayPlan => '90 Günlük Plan Oluşturun';

  @override
  String get businessIdeaLeading => 'İşletme';

  @override
  String get businessIdeaAccent => 'Fikir';

  @override
  String get describeBusinessIdea => 'İş fikrinizi açıklayın';

  @override
  String get businessIdeaSubtitle =>
      'Yapay zeka uygulanabilirliği, pazara uygunluğu ve riski puanlayacak.';

  @override
  String get viabilityScore => 'Yaşayabilirlik Puanı';

  @override
  String get scoreBreakdown => 'Puan Dağılımı';

  @override
  String get aiVerdict => 'Yapay Zeka Kararı';

  @override
  String get fullPlanGenerated => 'Tam plan oluşturuldu ve kaydedildi.';

  @override
  String get financialCalcLeading => 'Finansal';

  @override
  String get financialCalcAccent => 'Hesap Makinesi';

  @override
  String get compoundGrowth => 'Bileşik Büyüme';

  @override
  String get futureValue => 'Gelecek Değer';

  @override
  String get saveToDecisions => 'Kararlara Kaydet';

  @override
  String get saveDecisionLeading => 'Kaydetmek';

  @override
  String get saveDecisionAccent => 'Karar';

  @override
  String get decisionSaved => 'Karar kaydedildi.';

  @override
  String get folderLabel => 'Dosya';

  @override
  String get folderDefault => 'Varsayılan';

  @override
  String get folderCareer => 'Kariyer';

  @override
  String get folderFinance => 'Finans';

  @override
  String get folderHealth => 'Sağlık';

  @override
  String get folderPersonal => 'Kişisel';

  @override
  String get reportExportLeading => 'İhracat';

  @override
  String get reportExportAccent => 'Rapor';

  @override
  String get exportReport => 'Raporu Dışa Aktar';

  @override
  String get shareReport => 'Raporu Paylaş';

  @override
  String get subscriptionLeading => 'Seçin';

  @override
  String get subscriptionAccent => 'Planı';

  @override
  String get mostPopular => 'En Popüler';

  @override
  String get freeTrial => '7 Günlük Ücretsiz Deneme';

  @override
  String get upgradePremium => 'Premium\'a Yükselt';

  @override
  String get choosePlan => 'Bir Plan Seçin';

  @override
  String get paymentSuccessful => 'Ödeme Başarılı!';

  @override
  String get thankYouUpgrade =>
      'Premium\'a yükselttiğiniz için teşekkür ederiz.';

  @override
  String get goToDashboard => 'Kontrol Paneline Git';

  @override
  String get paymentDetails => 'Ödeme Detayları';

  @override
  String get payNow => 'Şimdi Öde';

  @override
  String get cardNumber => 'Kart Numarası';

  @override
  String get nameOnCard => 'Karttaki İsim';

  @override
  String get premiumFeatures => 'Premium Özellikler';

  @override
  String get faqSearchHint => 'Arama SSS\'leri';

  @override
  String get topicAll => 'Tüm';

  @override
  String get topicGettingStarted => 'Başlarken';

  @override
  String get topicAi => 'yapay zeka';

  @override
  String get topicBilling => 'Faturalandırma';

  @override
  String get topicAccount => 'Hesap';

  @override
  String get tabAll => 'Tüm';

  @override
  String get tabUnread => 'Okunmamış';

  @override
  String get tabArchived => 'Arşivlendi';

  @override
  String get noArchivedItems => 'Arşivlenmiş öğe yok';

  @override
  String get traitRiskTolerance => 'Risk Toleransı';

  @override
  String get budgetWhyMatters =>
      'Bütçe, yapay zekanın önerinizdeki finansal dengeleri tartmasına yardımcı olur.';

  @override
  String get timeWhyMatters =>
      'Zamanın mevcudiyeti, eylem planınızın ne kadar iddialı olması gerektiğini şekillendirir.';

  @override
  String get experienceWhyMatters =>
      'Deneyim düzeyi, yapay zekanın tavsiyeleri geçmişinize göre kalibre etmesine yardımcı olur.';

  @override
  String get riskWhyMatters =>
      'Risk toleransı, tavsiyenizin ne kadar ihtiyatlı veya cesur olacağını belirler.';

  @override
  String get urgencyWhyMatters =>
      'Aciliyet, tavsiyeye göre ne kadar hızlı hareket etmeniz gerektiğini etkiler.';

  @override
  String get confidenceReliableRecommend => 'Genel olarak güvenilir öneri';

  @override
  String get confidenceReliableSomeRisks =>
      'Bazı risklerle birlikte genellikle güvenilir';

  @override
  String get confidenceConsiderRisks => 'Riskleri dikkatlice değerlendirin';

  @override
  String get confidenceHighUncertainty =>
      'Yüksek belirsizlik — dikkatli ilerleyin';

  @override
  String get stepResults => 'Sonuçlar';

  @override
  String get urgencyNoRush => 'acele yok';

  @override
  String get urgencyModerate => 'Ilıman';

  @override
  String get urgencyUrgent => 'Acil';

  @override
  String get urgencyCritical => 'Kritik';

  @override
  String get experienceBeginner => 'Acemi';

  @override
  String get experienceIntermediate => 'Orta seviye';

  @override
  String get experienceAdvanced => 'Gelişmiş';

  @override
  String get experienceExpert => 'Uzman';

  @override
  String get timeVeryLimited => 'Çok Sınırlı';

  @override
  String get timeLimited => 'Sınırlı';

  @override
  String get timeModerateAvail => 'Ilıman';

  @override
  String get timeHighAvail => 'Yüksek';

  @override
  String get timeVeryHigh => 'Çok Yüksek';

  @override
  String get riskToleranceLow => 'Düşük';

  @override
  String get riskToleranceModerate => 'Ilıman';

  @override
  String get riskToleranceHigh => 'Yüksek';

  @override
  String get riskToleranceVeryHigh => 'Çok Yüksek';

  @override
  String get doNow => 'Şimdi yap';

  @override
  String get doToday => 'Bugün yap';

  @override
  String get scheduleLabel => 'Takvim';

  @override
  String get deleteLabel => 'Silmek';

  @override
  String get tipLabel => 'Uç';

  @override
  String get aiRecommendation => 'Yapay Zeka Önerisi';

  @override
  String get comparisonMenu => 'Karşılaştırmak';

  @override
  String get clientSelectionVerdictBody =>
      'Acme en güçlü uyumdur - evet deyin. Gizli Müşteri: kibarca reddedin; belirsiz özetler kapsamın kaymasını tahmin ediyor.';

  @override
  String get freelancePricingSubtitle => 'Yapay zeka destekli oran önerileri';

  @override
  String get priceLower => 'Daha düşük';

  @override
  String get priceRecommended => 'Tavsiye edilen';

  @override
  String get priceHigher => 'Daha yüksek';

  @override
  String get freelancePricingRecommendationBody =>
      'Bu müşteriyi sağlıklı bir marjla kazanmak için fiyat 2.800 dolardır. Eğer geri adım atarlarsa fiyatı düşürmek yerine kapsamı sabitleyin.';

  @override
  String get productivitySubtitle =>
      'Yapay zeka şimdi ne yapılacağını, neyin planlanacağını ve neyin bırakılacağını sıralıyor.';

  @override
  String get productivityTipBody =>
      'Her şey acilse hiçbir şey acil değildir. 1-2 tane şimdi yapılacak öğe seçin ve bunları toplantılar gibi koruyun.';

  @override
  String get careerAdvisorDescription =>
      'Becerilerinize, iletişim tarzınıza ve büyüme ilginize dayalı güçlü uyum.';

  @override
  String get nextSteps => 'Sonraki adımlar';

  @override
  String get careerAdvisorNextStepsBody =>
      'PM tarzı bir performans geçmişi oluşturmak için bu çeyrekte küçük bir işlevler arası girişime liderlik edin.';

  @override
  String get excellent => 'Harika';

  @override
  String get good => 'İyi';

  @override
  String get businessIdeaHint =>
      'örneğin, yapay zeka bakımı hatırlatıcıları olan iç mekan bitkileri için bir abonelik kutusu';

  @override
  String get marketSize => 'Pazar Büyüklüğü';

  @override
  String get competition => 'Yarışma';

  @override
  String get profitability => 'karlılık';

  @override
  String get executionEase => 'Uygulama Kolaylığı';

  @override
  String get large => 'Büyük';

  @override
  String get businessIdeaVerdictBody =>
      'Net bir hedef kitleye sahip güçlü bir konsept. Pazarlamayı ölçeklendirmeden önce ilk 90 günü, ödeme yapan 20 müşteriye ulaşmaya odaklanın.';

  @override
  String get generateFullPlan => 'Tam Plan Oluştur';

  @override
  String get financialCalcSubtitle =>
      'Paranızın zamanla ne kadar büyüdüğünü görün.';

  @override
  String get financialInitialAmount => 'Başlangıç ​​Tutarı (\$)';

  @override
  String get financialAnnualRate => 'Yıllık Oran (%)';

  @override
  String get financialDuration => 'Süre (yıl)';

  @override
  String get financialCalcTipBody =>
      'Küçük aylık katkılar bile 10+ yıllık bir ufukta tek seferlik büyük mevduatları geride bırakıyor.';

  @override
  String get saveDecisionNotesHint =>
      'Bu kararla ilgili hatırlamak istediğiniz her şey';

  @override
  String get reportExportSubtitle => 'Karar raporunuzu kaydedin veya paylaşın';

  @override
  String get completed => 'Tamamlanmış';

  @override
  String get goAhead => 'Devam etmek';

  @override
  String get includeInReport => 'Rapora Ekle';

  @override
  String get executiveSummary => 'Yönetici Özeti';

  @override
  String get analysisDetails => 'Analiz Detayları';

  @override
  String get notesAndInputs => 'Notlar ve Girişler';

  @override
  String get exportFormat => 'Dışa Aktarma Formatı';

  @override
  String get pdfBestForSharing => 'Paylaşmak için en iyisi';

  @override
  String get excelDataScores => 'Veriler ve Puanlar';

  @override
  String get wordDocument => 'Belge';

  @override
  String get imageJpgPng => 'JPG / PNG';

  @override
  String get shareOrSave => 'Paylaşın veya Kaydedin';

  @override
  String get shareLink => 'Bağlantıyı Paylaş';

  @override
  String get createShareableLink => 'Paylaşılabilir bir bağlantı oluşturun';

  @override
  String get emailReport => 'E-posta Raporu';

  @override
  String get sendViaEmail => 'E-postayla gönder';

  @override
  String get saveToDevice => 'Cihaza Kaydet';

  @override
  String get downloadToDevice => 'Cihaza indir';

  @override
  String get scheduleAutoReports => 'Otomatik Raporları Planlama';

  @override
  String exportedAs(String format) {
    return '$format olarak dışa aktarıldı';
  }

  @override
  String get subscriptionSubtitle =>
      'Sizin için doğru planla daha akıllı kararlar alın';

  @override
  String get makeSmarterDecisions => 'Daha Akıllı Kararlar Alın';

  @override
  String get subscriptionHeroBody =>
      'Sınırsız yapay zeka analizinin, derin içgörülerin ve kişiselleştirilmiş önerilerin kilidini açın.';

  @override
  String get planBasic => 'Temel';

  @override
  String get planPremium => 'prim';

  @override
  String get planPro => 'Profesyonel';

  @override
  String get perMonth => '/ay';

  @override
  String get allPlansInclude => 'Tüm Planlar Dahil';

  @override
  String get moneyBackGuarantee => '7 Günlük Para İade Garantisi';

  @override
  String get moneyBackGuaranteeBody =>
      'Memnun değil misiniz? 7 gün içinde tam para iadesi alın.';

  @override
  String get subscribeTermsNote =>
      'Abone olarak Şartlarımızı ve Gizlilik Politikamızı kabul etmiş olursunuz.';

  @override
  String get securePaymentEncryption =>
      'Endüstri standardı şifrelemeyle güvenli ödeme';

  @override
  String get paymentLeading => 'Ödeme';

  @override
  String get paymentAccent => 'Detaylar';

  @override
  String get premiumMonthly => 'Prim • Aylık';

  @override
  String get taxEstimate => 'Vergi tahmini';

  @override
  String get totalToday => 'Bugünkü toplam';

  @override
  String get paymentMethod => 'Ödeme yöntemi';

  @override
  String get paymentCard => 'Kart';

  @override
  String get paymentPayPal => 'PayPal';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get cardExpiryHint => 'AA/YY';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'Uçtan uca şifrelenmiştir. Kartınızı asla saklamayız.';

  @override
  String get premiumFeaturesLeading => 'prim';

  @override
  String get premiumFeaturesAccent => 'Özellikler';

  @override
  String get premiumUnlockSubtitle =>
      'Life Navigator\'ın tüm gücünün kilidini açın';

  @override
  String get premiumFeature1Title => 'Sınırsız Yapay Zeka Analizi';

  @override
  String get premiumFeature1Body => 'İhtiyaç duyduğunuz kadar karar yürütün.';

  @override
  String get premiumFeature2Title => 'Derin Bilgiler';

  @override
  String get premiumFeature2Body => 'Risk, güven, sonuç ve etki grafikleri.';

  @override
  String get premiumFeature3Title => 'Kararları Karşılaştır';

  @override
  String get premiumFeature3Body => 'Kararları yan yana görün.';

  @override
  String get premiumFeature4Title => 'Raporları Dışa Aktar';

  @override
  String get premiumFeature4Body =>
      'PDF, Word, Excel ve görüntü dışa aktarmaları.';

  @override
  String get premiumFeature5Title => 'Bulut Senkronizasyonu';

  @override
  String get premiumFeature5Body => 'Buluta güvenli bir şekilde yedeklenir.';

  @override
  String get premiumFeature6Title => 'Öncelikli Destek';

  @override
  String get premiumFeature6Body => '24 saat içinde cevap verin.';

  @override
  String get paymentSuccessLeading => 'Ödeme';

  @override
  String get paymentSuccessAccent => 'Başarılı!';

  @override
  String get youNowHaveAccessTo => 'Artık Erişiminiz Var';

  @override
  String get planLabel => 'Planı';

  @override
  String get amountLabel => 'Miktar';

  @override
  String get methodLabel => 'Yöntem';

  @override
  String get transactionIdLabel => 'İşlem Kimliği';

  @override
  String get unlimitedAi => 'Sınırsız yapay zeka';

  @override
  String get deepInsightsShort => 'Derin Bilgiler';

  @override
  String get compareShort => 'Karşılaştırmak';

  @override
  String get exportsShort => 'İhracat';

  @override
  String get cloudSyncShort => 'Bulut Senkronizasyonu';

  @override
  String get prioritySupportShort => 'Öncelikli Destek';

  @override
  String get privacyLeading => 'Mahremiyet';

  @override
  String get privacyAccent => 'Politika';

  @override
  String get privacyLastUpdated => 'Son güncelleme: 18 Mayıs 2026';

  @override
  String get privacySection1Title => 'Ne topluyoruz';

  @override
  String get privacySection1Body =>
      'Yalnızca bize verdiğiniz bilgileri, yani kaydettiğiniz kararları, hesap ayrıntılarınızı (isim + e-posta) ve tercihlerinizi topluyoruz. Geriye kalan her şey cihazınızda kalır.';

  @override
  String get privacySection2Title => 'Bunu nasıl kullanıyoruz?';

  @override
  String get privacySection2Body =>
      'Yapay zeka önerilerini kişiselleştirmek için isterseniz verilerinizi senkronize edin ve uygulamayı iyileştirin. Verilerinizi asla üçüncü taraflara satmayız.';

  @override
  String get privacySection3Title => 'Yerel öncelikli depolama';

  @override
  String get privacySection3Body =>
      'Kararlarınız varsayılan olarak cihazınızda saklanır. Bulut senkronizasyonu isteğe bağlıdır ve aktarım sırasında ve kullanımda değilken şifrelenir.';

  @override
  String get privacySection4Title => 'Haklarınız';

  @override
  String get privacySection4Body =>
      'Tüm verilerinizi istediğiniz zaman Ayarlar\'dan dışa aktarabilir veya silebilirsiniz. Veri taleplerine 7 gün içinde yanıt veriyoruz.';

  @override
  String get privacySection5Title => 'Çocuklar';

  @override
  String get privacySection5Body =>
      'AI Life Navigator, 13 yaşın altındaki çocuklara yönelik değildir. Çocuklardan bilerek veri toplamıyoruz.';

  @override
  String get privacySection6Title => 'Bize Ulaşın';

  @override
  String get privacySection6Body =>
      'Sorularınız veya endişeleriniz mi var? Privacy@lifenavigator.app adresine e-posta gönderin; iki iş günü içinde size geri dönüş yapacağız.';

  @override
  String get termsLeading => 'Şartları';

  @override
  String get termsAccent => 'Hizmet';

  @override
  String get termsLastUpdated => 'Son güncelleme: 18 Mayıs 2026';

  @override
  String get termsSection1Title => '1. Kabul';

  @override
  String get termsSection1Body =>
      'AI Life Navigator\'ı kullanarak bu Şartları kabul etmiş olursunuz. Kabul etmiyorsanız lütfen uygulamayı kullanmayın.';

  @override
  String get termsSection2Title => '2. Hesap';

  @override
  String get termsSection2Body =>
      'Hesabınızın güvenliğini sağlamak sizin sorumluluğunuzdadır. Kimlik bilgilerinizi paylaşmayın.';

  @override
  String get termsSection3Title => '3. Yapay Zeka önerileri';

  @override
  String get termsSection3Body =>
      'Yapay zeka çıktıları profesyonel tavsiye değil, rehberlik niteliğindedir. Bunlara dayanarak vereceğiniz kararlardan siz sorumlusunuz.';

  @override
  String get termsSection4Title => '4. Abonelikler';

  @override
  String get termsSection4Body =>
      'Premium planlar iptal edilene kadar otomatik olarak yenilenir. Mağaza hesabınızdan istediğiniz zaman iptal edebilirsiniz.';

  @override
  String get termsSection5Title => '5. Kabul edilebilir kullanım';

  @override
  String get termsSection5Body =>
      'Kötüye kullanım içeren içerik yok, tersine mühendislik yok, kazıma yok. İhlaller hesabın askıya alınmasına neden olabilir.';

  @override
  String get termsSection6Title => '6. Sorumluluğun Sınırlandırılması';

  @override
  String get termsSection6Body =>
      'Sorumluluğumuz, yasaların izin verdiği azami ölçüde, önceki 12 ayda bize ödediğiniz tutarla sınırlıdır.';

  @override
  String get termsSection7Title => '7. Değişiklikler';

  @override
  String get termsSection7Body =>
      'Bu Koşulları güncelleyebiliriz. Önemli değişiklikleri uygulama içi bildirim veya e-posta yoluyla size bildireceğiz.';

  @override
  String get faqQ1 => 'Yeni bir karara nasıl başlayabilirim?';

  @override
  String get faqA1 =>
      'Ana ekranda \"Yeni Analiz Başlat\" kartına dokunun, kararınıza bir başlık verin ve verilen adımları izleyin.';

  @override
  String get faqQ2 => 'Verilerim gizli mi?';

  @override
  String get faqA2 =>
      'Evet. Kararlar varsayılan olarak cihazınızda yerel olarak saklanır. Bulut senkronizasyonu isteğe bağlıdır ve şifrelenir.';

  @override
  String get faqQ3 => 'Yapay zeka ne kadar doğru?';

  @override
  String get faqA3 =>
      'Yapay zeka, profesyonel tavsiye değil, yapılandırılmış rehberlik sağlar. Bunu kendi muhakemenizin yanında bir düşünme yardımcısı olarak kullanın.';

  @override
  String get faqQ4 => 'Yapay zeka konuşmalarıma erişebilir mi?';

  @override
  String get faqA4 =>
      'Hayır. Yalnızca karar akışında gönderdiğiniz girdiler kullanılır. Cihazınızdan başka hiçbir şey okunmaz.';

  @override
  String get faqQ5 => 'Aboneliğimi nasıl iptal edebilirim?';

  @override
  String get faqA5 =>
      'App Store / Google Play abonelik sayfasından istediğiniz zaman iptal edin. Erişim süre bitene kadar devam eder.';

  @override
  String get faqQ6 => 'Geri ödeme sunuyor musunuz?';

  @override
  String get faqA6 =>
      'Evet — ilk satın alımınızdan sonraki 7 gün içinde. support@lifenavigator.app adresine e-posta gönderin.';

  @override
  String get faqQ7 => 'Hesabımı nasıl silerim?';

  @override
  String get faqA7 =>
      'Ayarlar → Hesap → Hesabı Sil. Tüm verileriniz 30 gün içerisinde silinir.';

  @override
  String get faqQ8 => 'Kararlarımı dışa aktarabilir miyim?';

  @override
  String get faqA8 =>
      'Evet. Kaydedilen herhangi bir kararı açın ve PDF, Word, Excel veya resim olarak indirmek için Raporu Dışa Aktar\'a dokunun.';

  @override
  String get notificationsLeading => 'Bildirim';

  @override
  String get notificationsAccent => 'katyonlar';

  @override
  String get decisionTextRiskFallback =>
      'Özel risk azaltma ipuçları almak için tam bir analiz yapın.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'Genel risk düzeyiniz $label (%$score) şeklindedir. Bu puanı neyin tetiklediğini anlamak için aşağıdaki dökümü inceleyin.';
  }

  @override
  String get urgencyNoRushSub =>
      'Araştırmak ve seçenekleri karşılaştırmak için zaman ayırın.';

  @override
  String get urgencyNoRushTag => 'Esnek zaman çizelgesi';

  @override
  String get urgencyModerateSub =>
      'Önümüzdeki birkaç hafta içinde karar verin.';

  @override
  String get urgencyModerateTag => 'Birkaç Hafta';

  @override
  String get urgencyUrgentSub => 'Günler içinde bir karara ihtiyacınız var.';

  @override
  String get urgencyUrgentTag => 'Günler içinde';

  @override
  String get urgencyCriticalSub => 'Acil eylem gereklidir.';

  @override
  String get urgencyCriticalTag => 'Hemen';

  @override
  String get urgencyWhyMattersDesc =>
      'Aciliyet, yapay zekanın hangi faktörlere daha çok ağırlık vereceğini etkiler - hızlı kararlar ve daha net sinyaller.';

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
      'Bütçeniz, yapay zekanın seçenekleri değerlendirmesine ve sizin için maliyet etkin çözümler önermesine yardımcı olur.';

  @override
  String get riskToleranceLowSub =>
      'İstikrarlı ve öngörülebilir sonuçları tercih edin.';

  @override
  String get riskToleranceLowTag => 'İstikrarlı ve güvenli';

  @override
  String get riskToleranceModerateSub => 'Dengeli ödünleri kabul edin.';

  @override
  String get riskToleranceModerateTag => 'Dengeli risk';

  @override
  String get riskToleranceHighSub =>
      'Büyüme için daha büyük dalgalanmalara açık olun.';

  @override
  String get riskToleranceHighTag => 'Büyüme odaklı';

  @override
  String get riskToleranceVeryHighSub =>
      'Büyük belirsizliklerde rahat hissedin.';

  @override
  String get riskToleranceVeryHighTag => 'Maksimum kazanç';

  @override
  String get riskWhyMattersDesc =>
      'Risk toleransı, yapay zekanın potansiyel ödüller ile olası dezavantajları dengelemesine yardımcı olur.';

  @override
  String get experienceBeginnerSub =>
      'Bu alanda yeni; hala bilgi birikimi oluşturuyor.';

  @override
  String get experienceBeginnerTag => 'Öğrenmek için en iyisi';

  @override
  String get experienceIntermediateSub => 'İlgili deneyim ve bağlama sahip.';

  @override
  String get experienceIntermediateTag => 'Dengeli seçenekler';

  @override
  String get experienceAdvancedSub => 'Bu alanda güçlü geçmişe sahip.';

  @override
  String get experienceAdvancedTag => 'Büyüme odaklı';

  @override
  String get experienceExpertSub =>
      'Derin uzmanlık ve kanıtlanmış başarı geçmişi.';

  @override
  String get experienceExpertTag => 'Maksimum sonuçlar';

  @override
  String get experienceWhyMattersDesc =>
      'Deneyim seviyeniz, yapay zekanın önerilerin karmaşıklığını ve derinliğini kişiselleştirmesine yardımcı olur.';

  @override
  String get timeVeryLimitedSub => 'Haftada sadece birkaç saat uygun.';

  @override
  String get timeVeryLimitedTag => 'Minimum saat';

  @override
  String get timeLimitedSub => 'Bazı akşamlar veya hafta sonları boş.';

  @override
  String get timeLimitedTag => 'Yarı zamanlı odak';

  @override
  String get timeModerateAvailSub => 'Her hafta düzenli bir süre.';

  @override
  String get timeModerateAvailTag => 'Düzenli taahhüt';

  @override
  String get timeHighAvailSub => 'Haftalık önemli miktarda saat ayırabilir.';

  @override
  String get timeHighAvailTag => 'Güçlü uygunluk';

  @override
  String get timeVeryHighSub => 'Bu şu anki birincil odağınız olabilir.';

  @override
  String get timeVeryHighTag => 'Tam odaklanma';

  @override
  String get timeWhyMattersDesc =>
      'Zaman uygunluğunuz, yapay zekanın bağlı kalabileceğiniz gerçekçi planlar önermesine yardımcı olur.';
}
