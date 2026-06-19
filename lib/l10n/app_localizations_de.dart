// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'KI-Lebensnavigator';

  @override
  String get navHome => 'Start';

  @override
  String get navChatbot => 'KI-Chat';

  @override
  String get navInsights => 'Einblicke';

  @override
  String get navHistory => 'Geschichte';

  @override
  String get continueButton => 'Weiter';

  @override
  String get nextButton => 'Weiter';

  @override
  String get backButton => 'Zurück';

  @override
  String get saveButton => 'Speichern';

  @override
  String get analyzeButton => 'Analysieren';

  @override
  String get tryAgain => 'Versuchen Sie es erneut';

  @override
  String get viewAll => 'Alle anzeigen';

  @override
  String get searchHint => 'Suchen...';

  @override
  String get selectLanguage => 'Wählen';

  @override
  String get languageWord => 'Sprache';

  @override
  String get searchLanguageHint => 'Suchen Sie hier nach Sprache...';

  @override
  String get noLanguagesFound => 'Keine Sprachen gefunden';

  @override
  String get settings => 'Einstellungen';

  @override
  String get accountSettings => 'Kontoeinstellung';

  @override
  String get languages => 'Sprachen';

  @override
  String get theme => 'Thema';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get helpSupport => 'Hilfe und Support';

  @override
  String get logout => 'Abmelden';

  @override
  String get welcomeBack => 'Willkommen zurück!';

  @override
  String get emailAddress => 'E-Mail-Adresse';

  @override
  String get password => 'Passwort';

  @override
  String get login => 'Anmelden';

  @override
  String get signUp => 'Registrieren';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get rememberMe => 'Erinnere dich an mich';

  @override
  String goodMorning(String name) {
    return 'Guten Morgen, $name 👋';
  }

  @override
  String get homeSubtitle =>
      'Erhalten Sie KI-gestützte Beratung für Ihre nächste wichtige Entscheidung.';

  @override
  String get startNewAnalysis => 'Neue Analyse starten';

  @override
  String get startAnalysisSubtitle =>
      'Starten Sie eine geführte Analyse und erhalten Sie eine personalisierte Empfehlung.';

  @override
  String get decisionOverview => 'Entscheidungsübersicht';

  @override
  String get riskScore => 'Risikobewertung';

  @override
  String get successChance => 'Erfolgschance';

  @override
  String get activePlans => 'Aktive Pläne';

  @override
  String get inProgress => 'Im Gange';

  @override
  String get recentInsights => 'Aktuelle Erkenntnisse';

  @override
  String get stepDefine => 'Definieren';

  @override
  String get stepAnalyze => 'Analysieren';

  @override
  String get stepQuestions => 'Fragen';

  @override
  String get stepResult => 'Ergebnis';

  @override
  String get defineYourProblem => 'Definieren Sie Ihr';

  @override
  String get problemWord => 'Problem';

  @override
  String get tellUsMore => 'Erzählen Sie uns mehr über Ihre Entscheidung';

  @override
  String get wizardHint =>
      'Je mehr Details Sie angeben, desto besser kann unsere KI Sie analysieren und anleiten.';

  @override
  String get describeDecision => 'Beschreiben Sie Ihre Entscheidung';

  @override
  String get quickTips => 'Schnelle Tipps';

  @override
  String get beSpecific => 'Seien Sie konkret';

  @override
  String get includeContext => 'Kontext einbeziehen';

  @override
  String get mentionGoal => 'Erwähnen Sie das Ziel';

  @override
  String get choosingBetween => 'Wozwischen wählen Sie?';

  @override
  String get optionsHint =>
      'Listen Sie bis zu 5 Optionen auf. Die KI wird jeden einzelnen Schritt gegen Ihre Ziele abwägen.';

  @override
  String get addAnotherOption => 'Fügen Sie eine weitere Option hinzu';

  @override
  String get continueToAnalysis => 'Weiter zur Analyse';

  @override
  String get aiQuestionsTitle => 'KI';

  @override
  String get questionsWord => 'Fragen';

  @override
  String get preparingQuestions => 'Persönliche Fragen vorbereiten…';

  @override
  String basedOnDecision(String title) {
    return 'Basierend auf Ihrer Entscheidung: $title';
  }

  @override
  String get basedOnWizard =>
      'Basierend auf dem, was Sie im Assistenten geteilt haben';

  @override
  String get aiNavigator => 'KI-Lebensnavigator';

  @override
  String get aiQuestionsHint =>
      'Antworten Sie ehrlich – Ihre Antworten prägen die KI-Analyse.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'AI hat diese Fragen speziell für „$title“ generiert.';
  }

  @override
  String questionOf(int current, int total) {
    return 'Frage $current von $total';
  }

  @override
  String get whyThisMatters => 'Warum ist das wichtig?';

  @override
  String get whyQuestionsMatter =>
      'Ihre Antworten helfen der KI, sich auf das zu konzentrieren, was für Ihre Situation am relevantesten ist.';

  @override
  String get securePrivate => 'Ihre Daten sind sicher und privat';

  @override
  String get processingAnalyzing => 'Analysieren Sie Ihre Optionen...';

  @override
  String get processingRisk => 'Risikofaktoren berechnen...';

  @override
  String get processingOutcomes => 'Ergebnisse vorhersagen...';

  @override
  String get processingPlan => 'Aktionsplan erstellen...';

  @override
  String get processingFinalizing => 'Endgültiges Ergebnis';

  @override
  String get decisionResult => 'Entscheidung';

  @override
  String get resultWord => 'Ergebnis';

  @override
  String get recommendedChoice => 'Empfohlene Wahl';

  @override
  String get benefitScore => 'Nutzenbewertung';

  @override
  String get confidence => 'Vertrauen';

  @override
  String get fitScore => 'Fit-Score';

  @override
  String get resultBreakdown => 'Ergebnisaufschlüsselung';

  @override
  String get finalRecommendation => 'Abschließende Empfehlung';

  @override
  String get outcomePrediction => 'Ergebnisvorhersage';

  @override
  String get confidenceMeter => 'Vertrauensmesser';

  @override
  String get actionPlan => 'Aktionsplan';

  @override
  String get prosCons => 'Vor- und Nachteile';

  @override
  String get tipFromAi => 'Tipp von AI';

  @override
  String get saveReport => 'Bericht speichern';

  @override
  String get startNewDecision => 'Starten Sie eine neue Entscheidung';

  @override
  String get decisionWord => 'Entscheidung';

  @override
  String get comparisonWord => 'Vergleich';

  @override
  String get whyRecommended => 'Warum wird dies empfohlen?';

  @override
  String get riskBreakdown => 'Risikoaufschlüsselung';

  @override
  String get riskInterpretation => 'Risikointerpretation';

  @override
  String get howToImprove => 'So verbessern Sie sich';

  @override
  String get overallConfidence => 'Allgemeines Vertrauen';

  @override
  String get confidenceBreakdown => 'Vertrauenszusammenbruch';

  @override
  String get successLikelihood => 'Erfolgswahrscheinlichkeit';

  @override
  String get outcomeBreakdown => 'Ergebnisaufschlüsselung';

  @override
  String get keyOutcomeFactors => 'Wichtige Ergebnisfaktoren';

  @override
  String get prosTitle => 'Vorteile dieser Entscheidung';

  @override
  String get consTitle => 'Nachteile dieser Entscheidung';

  @override
  String get overallProsCons => 'Allgemeine Vor- und Nachteile';

  @override
  String get bestOverallFit => 'Beste Gesamtpassform';

  @override
  String get bestOverallChoice => 'Insgesamt die beste Wahl';

  @override
  String get recommendedChoiceLabel => 'Empfohlene Wahl';

  @override
  String get yourActionPlan => 'Ihr Aktionsplan';

  @override
  String get aiInsight => 'KI-Einblick';

  @override
  String get keyComparison => 'Schlüsselvergleich';

  @override
  String get overallScore => 'Gesamtpunktzahl';

  @override
  String get keyPoints => 'Wichtige Punkte';

  @override
  String get analysisFailed =>
      'Die Analyse ist fehlgeschlagen. Überprüfen Sie Ihren Internet- und API-Schlüssel.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY fehlt. Fügen Sie es zu .env hinzu und starten Sie die App neu.';

  @override
  String get noDescription => 'Keine Beschreibung angegeben.';

  @override
  String get history => 'Geschichte';

  @override
  String get about => 'Um';

  @override
  String get profile => 'Profil';

  @override
  String get editProfile => 'Profil bearbeiten';

  @override
  String get low => 'Niedrig';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'Hoch';

  @override
  String get lowRisk => 'Geringes Risiko';

  @override
  String get mediumRisk => 'Mittleres Risiko';

  @override
  String get highRisk => 'Hohes Risiko';

  @override
  String get notAssessed => 'Nicht bewertet';

  @override
  String get couldNotLoadQuestions => 'Fragen konnten nicht geladen werden';

  @override
  String get noQuestionsGenerated => 'Es wurden keine Fragen generiert.';

  @override
  String get onboardingTitle1 =>
      'Treffen Sie intelligentere Entscheidungen mit KI';

  @override
  String get onboardingSubtitle1 =>
      'Erhalten Sie individuelle Beratung bei wichtigen Entscheidungen im Leben.';

  @override
  String get onboardingTitle2 => 'Analysieren Sie Risiken und Ergebnisse';

  @override
  String get onboardingSubtitle2 =>
      'Verstehen Sie Kompromisse, bevor Sie sich verpflichten.';

  @override
  String get onboardingTitle3 => 'Befolgen Sie einen klaren Aktionsplan';

  @override
  String get onboardingSubtitle3 =>
      'Verwandeln Sie Erkenntnisse in praktische nächste Schritte.';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get skip => 'Überspringen';

  @override
  String get darkMode => 'Dunkler Modus';

  @override
  String get lightMode => 'Lichtmodus';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get generalSettings => 'Allgemeine Einstellungen';

  @override
  String get support => 'Unterstützung';

  @override
  String get legal => 'Legal';

  @override
  String get languageChanged => 'Sprache aktualisiert';

  @override
  String get yourOptions => 'Ihre Möglichkeiten';

  @override
  String get recommended => 'Empfohlen';

  @override
  String get compareOptions => 'Vergleichen Sie Optionen';

  @override
  String get plan => 'Planen';

  @override
  String get prepare => 'Vorbereiten';

  @override
  String get execute => 'Ausführen';

  @override
  String get positiveOutcome => 'Positives Ergebnis';

  @override
  String get neutralOutcome => 'Neutrales Ergebnis';

  @override
  String get negativeOutcome => 'Negatives Ergebnis';

  @override
  String get overallRiskScore => 'Gesamtrisikobewertung';

  @override
  String get yourDecisionRiskLevel => 'Ihr Entscheidungsrisikoniveau';

  @override
  String get overallPrediction => 'Gesamtvorhersage';

  @override
  String get overallProsConsTitle => 'Allgemeine Vor- und Nachteile';

  @override
  String get emptyHistory => 'Noch keine gespeicherten Entscheidungen';

  @override
  String get startFirstDecision =>
      'Starten Sie Ihre erste Entscheidungsanalyse';

  @override
  String get chatbotTitle => 'KI-Chatbot';

  @override
  String get insightsTitle => 'Einblicke';

  @override
  String get dailySuggestion => 'Täglicher Vorschlag';

  @override
  String get aboutTagline =>
      'Intelligente Entscheidungsunterstützung durch KI – wägen Sie Optionen, Risiken und nächste Schritte ab.';

  @override
  String get aboutBody =>
      'AI Life Navigator hilft Ihnen, Lebens- und Karriereentscheidungen mit strukturierten Fragen, Risikoanalysen und klaren Aktionsplänen zu treffen.';

  @override
  String get personalInformation => 'Persönliche Informationen';

  @override
  String get appSetting => 'App-Einstellung';

  @override
  String get securityPrivacy => 'Sicherheit und Datenschutz';

  @override
  String get aboutUs => 'Über uns';

  @override
  String get howToUse => 'Verwendung';

  @override
  String get appTheme => 'App-Theme';

  @override
  String get shareApp => 'Aktie';

  @override
  String get rateUs => 'Bewerten Sie uns';

  @override
  String get pleaseAddOption => 'Bitte fügen Sie mindestens eine Option hinzu';

  @override
  String get noReportToSave =>
      'Kein Entscheidungsbericht zum Speichern vorhanden.';

  @override
  String get reportSaved => 'Bericht im Verlauf gespeichert.';

  @override
  String get pendingAnalysis => 'Ausstehende Analyse';

  @override
  String get untitledDecision => 'Entscheidung ohne Titel';

  @override
  String get describeDecisionHint =>
      'Beschreiben Sie Ihre Situation, Einschränkungen und wie Erfolg aussieht.';

  @override
  String optionLabel(String letter) {
    return 'Option $letter';
  }

  @override
  String get goodChance => 'Gute Chance';

  @override
  String get fairChance => 'Faire Chance';

  @override
  String get poorChance => 'Schlechte Chance';

  @override
  String get couldNotPrepareQuestions =>
      'Fragen konnten nicht vorbereitet werden. Bitte versuchen Sie es erneut.';

  @override
  String get greetingFallbackName => 'Dort';

  @override
  String get dontHaveAccount => 'Sie haben noch kein Konto?';

  @override
  String get alreadyHaveAccount => 'Sie haben bereits ein Konto?';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'NEIN';

  @override
  String get welcome => 'Willkommen!';

  @override
  String get orContinueWith => 'oder weitermachen';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'Leben';

  @override
  String get navigator => 'Navigator';

  @override
  String get authTagline => 'KI-Entscheidungsassistent';

  @override
  String get chatbotReadySubtitle => 'Bereit, Ihr Leben zu steuern';

  @override
  String get chatbotInputHint => 'Starten Sie hier Ihren Chat...';

  @override
  String get chatbotErrorMessage =>
      'Leider konnte ich den AI-Dienst nicht erreichen. Bitte überprüfen Sie Ihre Verbindung und versuchen Sie es erneut.';

  @override
  String get selectAll => 'Alles auswählen';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete =>
      'Wählen Sie Entscheidungen zum Löschen aus.';

  @override
  String get total => 'Gesamt';

  @override
  String get highScore => 'Highscore';

  @override
  String get justNow => 'Soeben';

  @override
  String minutesAgo(int count) {
    return 'Vor $count Minuten';
  }

  @override
  String hoursAgo(int count) {
    return 'Vor $count Stunde';
  }

  @override
  String hoursAgoPlural(int count) {
    return 'Vor $count Stunden';
  }

  @override
  String daysAgo(int count) {
    return 'Vor $count Tag';
  }

  @override
  String daysAgoPlural(int count) {
    return 'Vor $count Tagen';
  }

  @override
  String scoreLabel(int score) {
    return 'Ergebnis $score';
  }

  @override
  String get themeCustomizeSubtitle =>
      'Passen Sie das Erscheinungsbild Ihrer App an';

  @override
  String get lightModeSubtitle => 'Sauberes und helles Erlebnis';

  @override
  String get darkModeSubtitle =>
      'Schont die Augen bei schlechten Lichtverhältnissen';

  @override
  String get systemDefaultSubtitle => 'Verwenden Sie die Gerätedesignpräferenz';

  @override
  String get preview => 'Vorschau';

  @override
  String get applyTheme => 'Theme anwenden';

  @override
  String get shareAppMessage => 'Teilen Sie Life Navigator mit Ihren Freunden.';

  @override
  String get rateAppThanks =>
      'Vielen Dank für Ihre Bewertung von Life Navigator!';

  @override
  String fieldRequired(String field) {
    return '$field ist erforderlich';
  }

  @override
  String get emailRequired => 'E-Mail ist erforderlich';

  @override
  String get emailInvalid => 'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get passwordRequired => 'Passwort ist erforderlich';

  @override
  String get passwordMinLength =>
      'Das Passwort muss mindestens 6 Zeichen lang sein';

  @override
  String get confirmPasswordRequired => 'Bitte bestätigen Sie Ihr Passwort';

  @override
  String get passwordsDoNotMatch => 'Passwörter stimmen nicht überein';

  @override
  String get otpRequired => 'OTP ist erforderlich';

  @override
  String otpInvalid(int length) {
    return 'Bitte geben Sie einen gültigen $length-stelligen Code ein';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field muss mindestens $min Zeichen umfassen';
  }

  @override
  String get fieldDescription => 'Beschreibung';

  @override
  String get fieldTitle => 'Titel';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get confirmPassword => 'Passwort bestätigen';

  @override
  String get createAccount => 'Benutzerkonto erstellen';

  @override
  String get acceptTermsRequired =>
      'Bitte akzeptieren Sie die Allgemeinen Geschäftsbedingungen und Datenschutzbestimmungen.';

  @override
  String get signupTitleLeading => 'Erstellen Sie Ihr';

  @override
  String get account => 'Konto';

  @override
  String get signupSubtitle =>
      'Treten Sie Life Navigator bei und treffen Sie jeden Tag intelligentere Entscheidungen.';

  @override
  String get iAgreeToThe => 'Ich stimme dem zu';

  @override
  String get forgotPasswordLeading => 'Vergessen';

  @override
  String get forgotPasswordAccent => 'Passwort?';

  @override
  String get forgotPasswordSubtitle =>
      'Geben Sie Ihre E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.';

  @override
  String get enterEmailHint => 'Geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get forgotPasswordInfo =>
      'Wir senden einen Link zum Zurücksetzen des Passworts an Ihre E-Mail-Adresse.';

  @override
  String get sendVerificationCode => 'Bestätigungscode senden';

  @override
  String get sendPasswordResetLink => 'Link zum Zurücksetzen senden';

  @override
  String get emailVerificationTitle => 'E-Mail bestätigen';

  @override
  String get emailVerificationSubtitle =>
      'Wir haben einen Bestätigungslink an Ihre E-Mail gesendet. Öffnen Sie es, um Ihr Konto zu aktivieren.';

  @override
  String get emailVerificationSpamHint =>
      'Überprüfen Sie Ihren Spam- oder Junk-Ordner, wenn Sie die E-Mail nicht innerhalb weniger Minuten sehen.';

  @override
  String get emailVerificationWaiting =>
      'Warten auf die Bestätigung... wir prüfen automatisch.';

  @override
  String get emailVerificationResend => 'Bestätigungs-E-Mail erneut senden';

  @override
  String get emailVerificationResent => 'Bestätigungs-E-Mail erneut gesendet.';

  @override
  String get authErrorWrongPassword =>
      'Falsche E-Mail-Adresse oder falsches Passwort. Bitte versuchen Sie es erneut.';

  @override
  String get authErrorEmailInUse =>
      'Diese E-Mail ist bereits registriert. Versuchen Sie stattdessen, sich anzumelden.';

  @override
  String get authErrorWeakPassword =>
      'Das Passwort ist zu schwach. Verwenden Sie mindestens 6 Zeichen.';

  @override
  String get authErrorUserNotFound =>
      'Mit dieser E-Mail wurde kein Konto gefunden.';

  @override
  String get authErrorTooManyRequests =>
      'Zu viele Versuche. Bitte warten Sie und versuchen Sie es erneut.';

  @override
  String get authErrorGeneric =>
      'Etwas ist schief gelaufen. Bitte versuchen Sie es erneut.';

  @override
  String get authErrorGoogleCancelled =>
      'Die Google-Anmeldung wurde abgebrochen.';

  @override
  String get passwordResetEmailSent =>
      'E-Mail zum Zurücksetzen des Passworts gesendet. Überprüfen Sie Ihren Posteingang.';

  @override
  String get changePassword => 'Kennwort ändern';

  @override
  String get changePasswordSubtitle =>
      'Geben Sie Ihr aktuelles Passwort ein und wählen Sie ein neues.';

  @override
  String get currentPassword => 'Aktuelles Passwort';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get deleteAccountConfirm =>
      'Dadurch wird Ihr Konto dauerhaft gelöscht und kann nicht rückgängig gemacht werden.';

  @override
  String get deleteAccountSuccess =>
      'Löschen Sie auch lokale Entscheidungen und Chats, die auf diesem Gerät gespeichert sind.';

  @override
  String get accountDeleted => 'Ihr Konto wurde gelöscht.';

  @override
  String get rememberPassword => 'Erinnern Sie sich an Ihr Passwort?';

  @override
  String get passwordUpdatedLogin =>
      'Passwort aktualisiert. Bitte melden Sie sich an.';

  @override
  String get resetLeading => 'Zurücksetzen';

  @override
  String get resetPasswordSubtitle =>
      'Erstellen Sie ein neues Passwort für Ihr Konto.';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get confirmNewPassword => 'Bestätigen Sie das neue Passwort';

  @override
  String get passwordHint =>
      'Verwenden Sie mindestens 6 Zeichen mit einer Mischung, die Sie sich merken können.';

  @override
  String get updating => 'Aktualisierung...';

  @override
  String get updatePassword => 'Passwort aktualisieren';

  @override
  String get backTo => 'Zurück zu';

  @override
  String newCodeSentTo(String email) {
    return 'Neuer Code an $email gesendet';
  }

  @override
  String get invalidVerificationCode =>
      'Ungültiger Bestätigungscode. Bitte versuchen Sie es erneut.';

  @override
  String otpResetSubtitle(String email) {
    return 'Geben Sie den 6-stelligen Reset-Code ein, der an $email gesendet wurde.';
  }

  @override
  String otpVerifySubtitle(String email) {
    return 'Geben Sie den 6-stelligen Bestätigungscode ein, der an $email gesendet wurde.';
  }

  @override
  String get verifyLeading => 'Verifizieren';

  @override
  String get verifyEmailLeading => 'Überprüfen Sie Ihre';

  @override
  String get codeWord => 'Code';

  @override
  String get emailWord => 'E-Mail';

  @override
  String resendCodeIn(int seconds) {
    return 'Code in ${seconds}s erneut senden';
  }

  @override
  String get didntReceiveCode => 'Sie haben den Code nicht erhalten?';

  @override
  String get resendCode => 'Code erneut senden';

  @override
  String get verifying => 'Überprüfung...';

  @override
  String get verifyCode => 'Code überprüfen';

  @override
  String get verifyAndContinue => 'Überprüfen und fortfahren';

  @override
  String get wrongEmail => 'Falsche E-Mail?';

  @override
  String get goBack => 'Geh zurück';

  @override
  String get logOut => 'Abmelden';

  @override
  String get logoutConfirmMessage => 'Möchten Sie diese App wirklich abmelden?';

  @override
  String get logoutConfirmYes => 'Ja, Abmelden';

  @override
  String get insightsHeroDescription =>
      'Tägliche Vorschläge und Erkenntnisse, die auf Ihre Entscheidungen zugeschnitten sind.';

  @override
  String recommendedPrefix(String text) {
    return 'Empfohlen: $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'Führen Sie eine Analyse durch, um eine personalisierte Risikointerpretation zu erhalten.';

  @override
  String get startDecisionQuestion =>
      'Bei welcher Entscheidung wünschen Sie sich Hilfe?';

  @override
  String get startDecisionSubtitle =>
      'Beschreiben Sie Ihre Entscheidung und erhalten Sie KI-gestützte Erkenntnisse und Empfehlungen.';

  @override
  String get decisionTitle => 'Entscheidungstitel';

  @override
  String get decisionTitleHint => 'z.B. Soll ich den Beruf wechseln?';

  @override
  String get decisionCategory => 'Entscheidungskategorie';

  @override
  String get importanceLevel => 'Wichtigkeitsstufe';

  @override
  String get impactMinor => 'Geringe Auswirkung';

  @override
  String get impactModerate => 'Mäßige Auswirkung';

  @override
  String get impactHigh => 'Hohe Wirkung';

  @override
  String get categoryCareer => 'Karriere';

  @override
  String get categoryFinance => 'Finanzen';

  @override
  String get categoryHealth => 'Gesundheit';

  @override
  String get categoryRelations => 'Beziehungen';

  @override
  String get categoryEducation => 'Ausbildung';

  @override
  String get categoryOther => 'Andere';

  @override
  String get addYourOptionsLeading => 'Fügen Sie Ihre hinzu';

  @override
  String get optionsWord => 'Optionen';

  @override
  String get describeOptionHint => 'Beschreiben Sie diese Option';

  @override
  String get goalSelection => 'Zielauswahl';

  @override
  String get goalSelectionSubtitle =>
      'Wählen Sie die Optionen für Ihre Entscheidung aus, die für Sie am wichtigsten sind.';

  @override
  String get selectAtLeastOneGoal => 'Bitte wählen Sie mindestens ein Ziel aus';

  @override
  String get goalTipBody =>
      'Sie können Ihre Prioritäten später jederzeit in Ihrem Profil anpassen.';

  @override
  String get goalGrowth => 'Wachstum';

  @override
  String get goalFinancialGain => 'Finanzieller Gewinn';

  @override
  String get goalRiskReduction => 'Risikominderung';

  @override
  String get goalPersonalSatisfaction => 'Persönliche Zufriedenheit';

  @override
  String get goalTimeEfficiency => 'Zeiteffizienz';

  @override
  String get goalWorkLifeBalance => 'Work-Life-Balance';

  @override
  String get goalStability => 'Stabilität';

  @override
  String get goalImpact => 'Auswirkungen';

  @override
  String get budgetInput => 'Budgeteingabe';

  @override
  String get budgetSubtitle =>
      'Wählen Sie Ihr geschätztes Budget für diese Entscheidung aus.';

  @override
  String get budgetImpactLevel => 'Budgetauswirkungsebene';

  @override
  String get budgetLessThan5k => 'Weniger als 5.000 \$';

  @override
  String get enterYourBudget => 'Geben Sie Ihr Budget ein';

  @override
  String get timeAvailability => 'Zeitliche Verfügbarkeit';

  @override
  String get timeAvailabilitySubtitle =>
      'Wählen Sie für diese Entscheidung Ihre Zeitverfügbarkeit aus.';

  @override
  String get experienceLevel => 'Erfahrungsniveau';

  @override
  String get experienceSubtitle =>
      'Dies hilft unserer KI, Ihren Hintergrund und Ihr Fachwissen zu verstehen.';

  @override
  String get riskTolerance => 'Risikotoleranz';

  @override
  String get riskToleranceSubtitle =>
      'Wählen Sie für diese Entscheidung Ihre Risikotoleranzstufe aus.';

  @override
  String get timeUrgency => 'Zeitliche Dringlichkeit';

  @override
  String get urgencySubtitle =>
      'Wählen Sie die Dringlichkeit Ihrer Entscheidung aus.';

  @override
  String get financialRisk => 'Finanzielles Risiko';

  @override
  String get marketRisk => 'Marktrisiko';

  @override
  String get timeRisk => 'Zeitrisiko';

  @override
  String get executionRisk => 'Ausführungsrisiko';

  @override
  String get personalRisk => 'Persönliches Risiko';

  @override
  String get overallFit => 'Gesamtpassform';

  @override
  String get firstOption => 'Erste Option';

  @override
  String get secondOption => 'Zweite Option';

  @override
  String get versus => 'Vs';

  @override
  String get confidenceInterpretation => 'Vertrauensinterpretation';

  @override
  String get financialImpact => 'Finanzielle Auswirkungen';

  @override
  String get riskLevel => 'Risikostufe';

  @override
  String get timeInvestment => 'Zeitinvestition';

  @override
  String get longTermSustainability => 'Langfristige Nachhaltigkeit';

  @override
  String get personalGrowth => 'Persönliches Wachstum';

  @override
  String get outcomeConsistency => 'Ergebniskonsistenz';

  @override
  String get riskAssessment => 'Risikobewertung';

  @override
  String get historicalSimilarity => 'Historische Ähnlichkeit';

  @override
  String get relevanceMatch => 'Relevanzübereinstimmung';

  @override
  String get dataQuality => 'Datenqualität';

  @override
  String get confidenceVeryHigh => 'Sehr hoch';

  @override
  String get confidenceModerate => 'Mäßig';

  @override
  String get confidenceVeryLow => 'Sehr niedrig';

  @override
  String get onboardingAiPowered => 'KI-betrieben';

  @override
  String get onboardingSmartAnalysis =>
      'Intelligente Analyse für bessere Entscheidungen';

  @override
  String get onboardingRiskAnalysis => 'Risikoanalyse';

  @override
  String get onboardingActionablePlans => 'Umsetzbare Pläne';

  @override
  String get onboardingTrustedGuidance => 'Vertrauenswürdige Beratung';

  @override
  String get onboardingDefineGoalLeading => 'Definieren Sie Ihr';

  @override
  String get goalWord => 'Ziel';

  @override
  String get onboardingChooseJourney =>
      'Wählen Sie die Lebensreise aus, auf der Sie Begleitung wünschen';

  @override
  String get onboardingCareerPath => 'Karriereweg';

  @override
  String get onboardingCareerPathDesc =>
      'Entdecken Sie zukünftige Märkte und Fähigkeiten';

  @override
  String get onboardingMajorPurchase => 'Große Anschaffung';

  @override
  String get onboardingMajorPurchaseDesc =>
      'Vergleichen Sie Optionen für einen Neukauf';

  @override
  String get onboardingLifeChanges => 'Lebensveränderungen';

  @override
  String get onboardingLifeChangesDesc =>
      'Planen Sie einen Umzug oder eine neue Phase';

  @override
  String get onboardingPersonalGrowth => 'Persönliches Wachstum';

  @override
  String get onboardingPersonalGrowthDesc =>
      'Identifizieren Sie Fähigkeiten und Denkweisenänderungen';

  @override
  String get onboardingReadyLeading => 'Bereit dazu';

  @override
  String get navigateWord => 'Navigieren';

  @override
  String get onboardingReadySubtitle =>
      'Ihr persönlicher Assistent steht Ihnen gerne zur Seite';

  @override
  String get onboardingActionableGuidance => 'Umsetzbare Anleitung';

  @override
  String get onboardingActionableGuidanceDesc =>
      'Holen Sie sich Anleitung für Ihren Erfolg';

  @override
  String get onboardingProgressTracking => 'Fortschrittsverfolgung';

  @override
  String get onboardingProgressTrackingDesc =>
      'Überwachen Sie Meilensteine ​​auf Ihrer Reise';

  @override
  String get onboardingAdjustOnTheFly => 'Passen Sie sich im Handumdrehen an';

  @override
  String get onboardingAdjustDesc => 'Überdenken Sie Pläne im Laufe des Lebens';

  @override
  String get onboardingShareLearn => 'Teilen und lernen';

  @override
  String get onboardingShareLearnDesc =>
      'Teilen Sie Ihre Wege und lernen Sie daraus';

  @override
  String get myProfileLeading => 'Mein';

  @override
  String get preferences => 'Präferenzen';

  @override
  String get personalityPreferences => 'Persönlichkeitspräferenzen';

  @override
  String get saveChanges => 'Änderungen speichern';

  @override
  String get phoneNumber => 'Telefonnummer';

  @override
  String get tapToChangePhoto => 'Tippen Sie hier, um das Foto zu ändern';

  @override
  String get photoPickerComingSoon => 'Fotoauswahl kommt bald.';

  @override
  String get pickImageSourceTitle => 'Profilfoto ändern';

  @override
  String get pickFromCamera => 'Machen Sie ein Foto';

  @override
  String get pickFromGallery => 'Wählen Sie aus der Galerie';

  @override
  String get removePhoto => 'Foto entfernen';

  @override
  String get cameraPermissionDenied =>
      'Zum Aufnehmen eines Fotos ist eine Kameraerlaubnis erforderlich.';

  @override
  String get galleryPermissionDenied =>
      'Für die Auswahl eines Fotos ist eine Genehmigung der Fotobibliothek erforderlich.';

  @override
  String get openSettings => 'Öffnen Sie Einstellungen';

  @override
  String get savePreferences => 'Einstellungen speichern';

  @override
  String get preferencesSaved => 'Einstellungen gespeichert.';

  @override
  String get personalitySubtitle =>
      'Helfen Sie der KI, Sie besser zu verstehen';

  @override
  String get focusAreas => 'Schwerpunktbereiche';

  @override
  String get emptyTitleLeading => 'Nichts';

  @override
  String get emptyTitleAccent => 'Noch hier';

  @override
  String get emptyQuietTitle => 'Es ist ruhig hier drin';

  @override
  String get emptyHistoryHint =>
      'Treffen Sie Ihre erste Entscheidung und Ihr Verlauf wird hier angezeigt.';

  @override
  String get startADecision => 'Beginnen Sie eine Entscheidung';

  @override
  String get helpHereToHelp => 'Wir sind hier, um zu helfen';

  @override
  String get faq => 'FAQ';

  @override
  String get noResults => 'Keine Ergebnisse';

  @override
  String get errorTitle => 'Etwas ist schief gelaufen';

  @override
  String get errorSubtitle =>
      'Es ist ein unerwarteter Fehler aufgetreten. Bitte versuchen Sie es erneut.';

  @override
  String get contactSupport => 'Kontaktieren Sie den Support';

  @override
  String get noInternetTitle => 'Keine Verbindung';

  @override
  String get noInternetSubtitle =>
      'Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut.';

  @override
  String get retryConnection => 'Verbindung erneut versuchen';

  @override
  String get offlineMode => 'Gehen Sie in den Offline-Modus';

  @override
  String get permissionTitle => 'App-Berechtigungen';

  @override
  String get permissionSubtitle =>
      'Erteilen Sie Berechtigungen für das beste Erlebnis.';

  @override
  String get grantAll => 'Alles gewähren';

  @override
  String get notNow => 'Nicht jetzt';

  @override
  String get updateAvailable => 'Update verfügbar';

  @override
  String get updateSubtitle =>
      'Es ist eine neue Version mit Verbesserungen verfügbar.';

  @override
  String get updateNow => 'Jetzt aktualisieren';

  @override
  String get remindLater => 'Erinnere mich später daran';

  @override
  String get loadingMessage => 'Alles vorbereiten...';

  @override
  String get decisionDetailLeading => 'Entscheidung';

  @override
  String get detailWord => 'Detail';

  @override
  String get decisionNotFound => 'Entscheidung nicht gefunden';

  @override
  String get overall => 'Gesamt';

  @override
  String get pros => 'Vorteile';

  @override
  String get cons => 'Nachteile';

  @override
  String get notes => 'Notizen';

  @override
  String get saveAtLeastTwoToCompare =>
      'Speichern Sie mindestens zwei Entscheidungen zum Vergleich.';

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
  String get moderate => 'Mäßig';

  @override
  String get veryHigh => 'Sehr hoch';

  @override
  String get veryLow => 'Sehr niedrig';

  @override
  String get next => 'Nächste';

  @override
  String get later => 'Später';

  @override
  String get useWord => 'Verwenden';

  @override
  String get aboutUsLeading => 'Um';

  @override
  String get aboutUsAccent => 'Uns';

  @override
  String get howToUseLeading => 'So geht\'s';

  @override
  String get versionLabel => 'Version 1.0.0';

  @override
  String get dailyDecision => 'Tägliche Entscheidung';

  @override
  String get personalityDescription =>
      'Diese Einstellungen personalisieren den Ton und die Tiefe der Empfehlungen.';

  @override
  String get traitOptimism => 'Optimismus';

  @override
  String get traitPatience => 'Geduld';

  @override
  String get traitDetailFocus => 'Detailfokus';

  @override
  String get categoryTravel => 'Reisen';

  @override
  String get helpResponseTime =>
      'Durchschnittliche Antwortzeit: unter 24 Stunden';

  @override
  String get helpGetInTouch => 'Nehmen Sie Kontakt auf';

  @override
  String get helpLiveChat => 'Live-Chat';

  @override
  String get helpLiveChatSub => 'Chatten Sie mit unserem Team in Echtzeit';

  @override
  String get helpCall => 'Anruf';

  @override
  String get helpCallSub => 'Mo–Fr 9–17 Uhr PT';

  @override
  String get helpSubmitTicket => 'Senden Sie ein Ticket';

  @override
  String get helpSubmitTicketSub =>
      'Erhalten Sie ein nachverfolgtes Support-Ticket';

  @override
  String get helpQuickLinks => 'Schnelle Links';

  @override
  String get faqSubtitle => 'Häufige Fragen beantwortet';

  @override
  String get aboutSubtitle => 'Version, Credits und Links';

  @override
  String get helpOpenLiveChat => 'Öffnen Sie den Live-Chat';

  @override
  String get helpLiveChatSoon =>
      'Der Live-Chat wird bald eröffnet – wir senden Ihnen innerhalb von 24 Stunden eine E-Mail.';

  @override
  String get moreOptionsComingSoon => 'Weitere Optionen folgen in Kürze';

  @override
  String get insightCompoundTitle => 'Verschärfen Sie Ihre Entscheidungen';

  @override
  String get insightCompoundMessage =>
      'Entscheidungen, die heute getroffen werden, prägen die Chancen in sechs Monaten. Wählen Sie diejenige aus, die die meisten Türen öffnet.';

  @override
  String get insightParalysisTitle => 'Vorsicht vor Analyselähmung';

  @override
  String get insightParalysisMessage =>
      'Wenn Sie über eine Woche lang darüber nachgedacht haben und keine neuen Informationen erhalten haben, haben Sie genug, um sich zu entscheiden.';

  @override
  String get insightRiskStressTitle =>
      'Risiko ist nicht gleichbedeutend mit Stress';

  @override
  String get insightRiskStressMessage =>
      'Eine Entscheidung mit hohem Risiko kann dennoch stressfrei sein, wenn Sie einen klaren Plan B haben. Gestalten Sie immer Ihren Fallback.';

  @override
  String get insightFutureYouTitle => 'Future-You-Stimmen auch';

  @override
  String get insightFutureYouMessage =>
      'Bevor Sie sich entscheiden, fragen Sie sich: Würde Ihr zukünftiges Ich Ihnen in 5 Jahren dafür danken?';

  @override
  String streakDays(int count) {
    return '$count-Tagesserie';
  }

  @override
  String get streakKeepGoing =>
      'Machen Sie weiter – lassen Sie die heutige Entscheidung zählen.';

  @override
  String get todaysDecisionPrompt => 'Die heutige Entscheidungsaufforderung';

  @override
  String get dailyDecisionExerciseSub =>
      'Eine schnelle 60-Sekunden-Entscheidungsübung';

  @override
  String get dailyDecisionQuestion =>
      'Sollten Sie zu dieser Gelegenheit Ja oder Nein sagen?';

  @override
  String get dailyDecisionScenario =>
      'Ein Kollege lädt Sie zu einem Nebenprojekt ein. Es ist aufregend, dauert aber 10 Stunden pro Woche.';

  @override
  String get seeAiAnalysis => 'Siehe KI-Analyse';

  @override
  String get errorWhatYouCanDo => 'Was Sie tun können';

  @override
  String get errorTip1 => 'Überprüfen Sie Ihre Internetverbindung';

  @override
  String get errorTip2 => 'Versuchen Sie die Aktion gleich noch einmal';

  @override
  String get errorTip3 => 'Starten Sie die App neu';

  @override
  String get errorTip4 =>
      'Wenden Sie sich an den Support, wenn das Problem weiterhin auftritt';

  @override
  String get noInternetYouCanStill => 'Du kannst immer noch';

  @override
  String get offlineTip1 => 'Gespeicherte Entscheidungen und Verlauf anzeigen';

  @override
  String get offlineTip2 => 'Lesen Sie Ihre Notizen und Aktionspläne';

  @override
  String get offlineTip3 => 'Durchsuchen Sie FAQs und Info';

  @override
  String get permissionNotificationsDesc =>
      'Erhalten Sie Erinnerungen und tägliche Entscheidungshilfen';

  @override
  String get permissionLocation => 'Standort';

  @override
  String get permissionLocationDesc =>
      'Wird nur für standortbezogene Vorschläge verwendet';

  @override
  String get permissionStorage => 'Lagerung';

  @override
  String get permissionStorageDesc =>
      'Speichern Sie Ihre Berichte und Exporte lokal';

  @override
  String get permissionSettingsNote =>
      'Sie können die Berechtigungen jederzeit in den Einstellungen ändern';

  @override
  String updateVersionReady(String version) {
    return 'Version $version ist zur Installation bereit';
  }

  @override
  String get whatsNew => 'Was ist neu';

  @override
  String get updateFeature1 => 'Schnellere KI-Analyse (2-fache Beschleunigung)';

  @override
  String get updateFeature2 => 'Neues Career Advisor-Modul';

  @override
  String get updateFeature3 => 'Verbesserter Kontrast im Dunkelmodus';

  @override
  String get updateFeature4 => 'Fehlerbehebungen und Stabilitätsverbesserungen';

  @override
  String get loadingSubtitle => 'Dies dauert in der Regel nur wenige Sekunden';

  @override
  String get howToUseStep1Title => 'Definieren Sie Ihre Entscheidung';

  @override
  String get howToUseStep1Body =>
      'Beschreiben Sie zunächst Ihre Entscheidung, Ihre Kategorie und was Ihnen am wichtigsten ist.';

  @override
  String get howToUseStep2Title => 'Analysieren Sie Ihre Optionen';

  @override
  String get howToUseStep2Body =>
      'Beantworten Sie geführte Fragen zu Zielen, Dringlichkeit, Budget und Risikotoleranz.';

  @override
  String get howToUseStep3Title => 'Überprüfen Sie die KI-Ergebnisse';

  @override
  String get howToUseStep3Body =>
      'Sehen Sie sich Ihre Empfehlung, Risikobewertung, Vor- und Nachteile sowie einen Schritt-für-Schritt-Aktionsplan an.';

  @override
  String get howToUseStep4Title =>
      'Speichern und verfolgen Sie den Fortschritt';

  @override
  String get howToUseStep4Body =>
      'Speichern Sie Entscheidungen im Verlauf und rufen Sie die Erkenntnisse erneut ab, wenn Sie Hilfe benötigen.';

  @override
  String get clientSelectionLeading => 'Kunde';

  @override
  String get clientSelectionAccent => 'Auswahl';

  @override
  String get whichClientQuestion =>
      'Zu welchem ​​Kunden sollten Sie „Ja“ sagen?';

  @override
  String get clientSelectionSubtitle =>
      'KI bewertet Kundenmöglichkeiten nach Eignung, Honorar und Risiko.';

  @override
  String get freelancePricingLeading => 'Freiberuflich';

  @override
  String get freelancePricingAccent => 'Preise';

  @override
  String get recommendedPrice => 'Empfohlener Preis';

  @override
  String get pricingScore => 'Preisbewertung';

  @override
  String get priceComparison => 'Preisvergleich';

  @override
  String get priceDrivers => 'Preistreiber';

  @override
  String get marketRate => 'Marktpreis';

  @override
  String get experienceLabel => 'Erfahrung';

  @override
  String get timelineLabel => 'Zeitleiste';

  @override
  String get complexityLabel => 'Komplexität';

  @override
  String get projectValue => 'Projektwert';

  @override
  String get sendProposal => 'Vorschlag senden';

  @override
  String get proposalSent => 'Angebot an den Kunden gesendet.';

  @override
  String get productivityLeading => 'Produktivität';

  @override
  String get productivityAccent => 'Planer';

  @override
  String get eisenhowerPriority => 'Eisenhower-Priorität';

  @override
  String get startFocusBlock => 'Starten Sie den Fokusblock';

  @override
  String get focusBlockStarted => 'Fokusblock gestartet – viel Glück!';

  @override
  String get careerAdvisorLeading => 'Karriere';

  @override
  String get careerAdvisorAccent => 'Berater';

  @override
  String get careerFitScore => 'Career Fit Score';

  @override
  String get topPathProductManager => 'Top-Pfad: Produktmanager';

  @override
  String get skillMatch => 'Skill-Match';

  @override
  String get strategyLabel => 'Strategie';

  @override
  String get communicationLabel => 'Kommunikation';

  @override
  String get analyticsLabel => 'Analytik';

  @override
  String get technicalLabel => 'Technisch';

  @override
  String get build90DayPlan => 'Erstellen Sie einen 90-Tage-Plan';

  @override
  String get businessIdeaLeading => 'Geschäft';

  @override
  String get businessIdeaAccent => 'Idee';

  @override
  String get describeBusinessIdea => 'Beschreiben Sie Ihre Geschäftsidee';

  @override
  String get businessIdeaSubtitle =>
      'KI bewertet Rentabilität, Markttauglichkeit und Risiko.';

  @override
  String get viabilityScore => 'Lebensfähigkeitsbewertung';

  @override
  String get scoreBreakdown => 'Punkteaufschlüsselung';

  @override
  String get aiVerdict => 'KI-Urteil';

  @override
  String get fullPlanGenerated =>
      'Vollständiger Plan generiert und gespeichert.';

  @override
  String get financialCalcLeading => 'Finanziell';

  @override
  String get financialCalcAccent => 'Kalkulator';

  @override
  String get compoundGrowth => 'Zusammengesetztes Wachstum';

  @override
  String get futureValue => 'Zukünftiger Wert';

  @override
  String get saveToDecisions => 'Unter „Entscheidungen“ speichern';

  @override
  String get saveDecisionLeading => 'Speichern';

  @override
  String get saveDecisionAccent => 'Entscheidung';

  @override
  String get decisionSaved => 'Entscheidung gespeichert.';

  @override
  String get folderLabel => 'Ordner';

  @override
  String get folderDefault => 'Standard';

  @override
  String get folderCareer => 'Karriere';

  @override
  String get folderFinance => 'Finanzen';

  @override
  String get folderHealth => 'Gesundheit';

  @override
  String get folderPersonal => 'Persönlich';

  @override
  String get reportExportLeading => 'Export';

  @override
  String get reportExportAccent => 'Bericht';

  @override
  String get exportReport => 'Bericht exportieren';

  @override
  String get shareReport => 'Bericht teilen';

  @override
  String get subscriptionLeading => 'Wählen Sie Ihr';

  @override
  String get subscriptionAccent => 'Planen';

  @override
  String get mostPopular => 'Am beliebtesten';

  @override
  String get freeTrial => '7-tägige kostenlose Testversion';

  @override
  String get upgradePremium => 'Upgrade auf Premium';

  @override
  String get choosePlan => 'Wählen Sie einen Plan';

  @override
  String get paymentSuccessful => 'Zahlung erfolgreich!';

  @override
  String get thankYouUpgrade => 'Vielen Dank für das Upgrade auf Premium.';

  @override
  String get goToDashboard => 'Gehen Sie zum Dashboard';

  @override
  String get paymentDetails => 'Zahlungsdetails';

  @override
  String get payNow => 'Jetzt bezahlen';

  @override
  String get cardNumber => 'Kartennummer';

  @override
  String get nameOnCard => 'Name auf Karte';

  @override
  String get premiumFeatures => 'Premium-Funktionen';

  @override
  String get faqSearchHint => 'FAQs durchsuchen';

  @override
  String get topicAll => 'Alle';

  @override
  String get topicGettingStarted => 'Erste Schritte';

  @override
  String get topicAi => 'KI';

  @override
  String get topicBilling => 'Abrechnung';

  @override
  String get topicAccount => 'Konto';

  @override
  String get tabAll => 'Alle';

  @override
  String get tabUnread => 'Ungelesen';

  @override
  String get tabArchived => 'Archiviert';

  @override
  String get noArchivedItems => 'Keine archivierten Elemente';

  @override
  String get traitRiskTolerance => 'Risikotoleranz';

  @override
  String get budgetWhyMatters =>
      'Das Budget hilft der KI, finanzielle Kompromisse in Ihrer Empfehlung abzuwägen.';

  @override
  String get timeWhyMatters =>
      'Die Zeitverfügbarkeit bestimmt, wie ehrgeizig Ihr Aktionsplan sein sollte.';

  @override
  String get experienceWhyMatters =>
      'Das Erfahrungsniveau hilft der KI, Ratschläge an Ihren Hintergrund anzupassen.';

  @override
  String get riskWhyMatters =>
      'Die Risikotoleranz bestimmt, wie konservativ oder mutig Ihre Empfehlung sein wird.';

  @override
  String get urgencyWhyMatters =>
      'Die Dringlichkeit beeinflusst, wie schnell Sie auf die Empfehlung reagieren sollten.';

  @override
  String get confidenceReliableRecommend => 'Generell verlässliche Empfehlung';

  @override
  String get confidenceReliableSomeRisks =>
      'Im Allgemeinen zuverlässig mit einigen Risiken';

  @override
  String get confidenceConsiderRisks =>
      'Berücksichtigen Sie Risiken sorgfältig';

  @override
  String get confidenceHighUncertainty =>
      'Hohe Unsicherheit – vorsichtig vorgehen';

  @override
  String get stepResults => 'Ergebnisse';

  @override
  String get urgencyNoRush => 'Keine Eile';

  @override
  String get urgencyModerate => 'Mäßig';

  @override
  String get urgencyUrgent => 'Dringend';

  @override
  String get urgencyCritical => 'Kritisch';

  @override
  String get experienceBeginner => 'Anfänger';

  @override
  String get experienceIntermediate => 'Dazwischenliegend';

  @override
  String get experienceAdvanced => 'Fortschrittlich';

  @override
  String get experienceExpert => 'Experte';

  @override
  String get timeVeryLimited => 'Sehr begrenzt';

  @override
  String get timeLimited => 'Beschränkt';

  @override
  String get timeModerateAvail => 'Mäßig';

  @override
  String get timeHighAvail => 'Hoch';

  @override
  String get timeVeryHigh => 'Sehr hoch';

  @override
  String get riskToleranceLow => 'Niedrig';

  @override
  String get riskToleranceModerate => 'Mäßig';

  @override
  String get riskToleranceHigh => 'Hoch';

  @override
  String get riskToleranceVeryHigh => 'Sehr hoch';

  @override
  String get doNow => 'Tun Sie es jetzt';

  @override
  String get doToday => 'Tun Sie es noch heute';

  @override
  String get scheduleLabel => 'Zeitplan';

  @override
  String get deleteLabel => 'Löschen';

  @override
  String get tipLabel => 'Tipp';

  @override
  String get aiRecommendation => 'KI-Empfehlung';

  @override
  String get comparisonMenu => 'Vergleich';

  @override
  String get clientSelectionVerdictBody =>
      'Acme passt am besten – sagen Sie ja. Mystery Client: höflich ablehnen; Vage Schriftsätze sagen eine Ausweitung des Umfangs voraus.';

  @override
  String get freelancePricingSubtitle => 'KI-gestützte Tarifempfehlungen';

  @override
  String get priceLower => 'Untere';

  @override
  String get priceRecommended => 'Empfohlen';

  @override
  String get priceHigher => 'Höher';

  @override
  String get freelancePricingRecommendationBody =>
      'Preis bei 2.800 \$, um diesen Kunden mit einer gesunden Gewinnspanne zu gewinnen. Wenn sie zurückdrängen, sollten Sie sich auf den Umfang konzentrieren, anstatt den Preis zu senken.';

  @override
  String get productivitySubtitle =>
      'Die KI sortiert, was jetzt zu tun ist, was geplant werden soll und was weggelassen werden soll.';

  @override
  String get productivityTipBody =>
      'Wenn alles dringend ist, ist nichts dringend. Wählen Sie 1–2 Do-Now-Elemente aus und schützen Sie sie wie Besprechungen.';

  @override
  String get careerAdvisorDescription =>
      'Starke Passform basierend auf Ihren Fähigkeiten, Ihrem Kommunikationsstil und Ihrem Wachstumsinteresse.';

  @override
  String get nextSteps => 'Nächste Schritte';

  @override
  String get careerAdvisorNextStepsBody =>
      'Leiten Sie in diesem Quartal eine kleine funktionsübergreifende Initiative, um eine Erfolgsbilanz im PM-Stil aufzubauen.';

  @override
  String get excellent => 'Exzellent';

  @override
  String get good => 'Gut';

  @override
  String get businessIdeaHint =>
      'Zum Beispiel eine Abo-Box für Zimmerpflanzen mit KI-Pflegeerinnerungen';

  @override
  String get marketSize => 'Marktgröße';

  @override
  String get competition => 'Wettbewerb';

  @override
  String get profitability => 'Rentabilität';

  @override
  String get executionEase => 'Einfache Ausführung';

  @override
  String get large => 'Groß';

  @override
  String get businessIdeaVerdictBody =>
      'Starkes Konzept mit klarem Publikum. Konzentrieren Sie sich in den ersten 90 Tagen darauf, 20 zahlende Kunden zu gewinnen, bevor Sie das Marketing skalieren.';

  @override
  String get generateFullPlan => 'Vollständigen Plan erstellen';

  @override
  String get financialCalcSubtitle =>
      'Sehen Sie, wie viel Ihr Geld im Laufe der Zeit anwächst.';

  @override
  String get financialInitialAmount => 'Anfangsbetrag (\$)';

  @override
  String get financialAnnualRate => 'Jährliche Rate (%)';

  @override
  String get financialDuration => 'Dauer (Jahre)';

  @override
  String get financialCalcTipBody =>
      'Selbst kleine monatliche Beiträge übertreffen große einmalige Einzahlungen über einen Zeithorizont von 10+ Jahren.';

  @override
  String get saveDecisionNotesHint =>
      'Alles, was Sie sich über diese Entscheidung merken möchten';

  @override
  String get reportExportSubtitle =>
      'Speichern oder teilen Sie Ihren Entscheidungsbericht';

  @override
  String get completed => 'Vollendet';

  @override
  String get goAhead => 'Fortfahren';

  @override
  String get includeInReport => 'In den Bericht einbeziehen';

  @override
  String get executiveSummary => 'Zusammenfassung';

  @override
  String get analysisDetails => 'Analysedetails';

  @override
  String get notesAndInputs => 'Notizen und Eingaben';

  @override
  String get exportFormat => 'Exportformat';

  @override
  String get pdfBestForSharing => 'Am besten zum Teilen';

  @override
  String get excelDataScores => 'Daten & Ergebnisse';

  @override
  String get wordDocument => 'Dokumentieren';

  @override
  String get imageJpgPng => 'JPG / PNG';

  @override
  String get shareOrSave => 'Teilen oder speichern';

  @override
  String get shareLink => 'Link teilen';

  @override
  String get createShareableLink =>
      'Erstellen Sie einen gemeinsam nutzbaren Link';

  @override
  String get emailReport => 'E-Mail-Bericht';

  @override
  String get sendViaEmail => 'Per E-Mail senden';

  @override
  String get saveToDevice => 'Auf Gerät speichern';

  @override
  String get downloadToDevice => 'Auf das Gerät herunterladen';

  @override
  String get scheduleAutoReports => 'Planen Sie automatische Berichte';

  @override
  String exportedAs(String format) {
    return 'Exportiert als $format';
  }

  @override
  String get subscriptionSubtitle =>
      'Treffen Sie intelligentere Entscheidungen mit dem richtigen Plan für Sie';

  @override
  String get makeSmarterDecisions =>
      'Treffen Sie intelligentere Entscheidungen';

  @override
  String get subscriptionHeroBody =>
      'Nutzen Sie unbegrenzte KI-Analysen, tiefe Einblicke und personalisierte Empfehlungen.';

  @override
  String get planBasic => 'Basic';

  @override
  String get planPremium => 'Prämie';

  @override
  String get planPro => 'Profi';

  @override
  String get perMonth => '/Monat';

  @override
  String get allPlansInclude => 'Alle Pläne beinhalten';

  @override
  String get moneyBackGuarantee => '7-tägige Geld-zurück-Garantie';

  @override
  String get moneyBackGuaranteeBody =>
      'Nicht zufrieden? Erhalten Sie innerhalb von 7 Tagen eine vollständige Rückerstattung.';

  @override
  String get subscribeTermsNote =>
      'Mit der Anmeldung stimmen Sie unseren Allgemeinen Geschäftsbedingungen und Datenschutzbestimmungen zu.';

  @override
  String get securePaymentEncryption =>
      'Sichere Zahlung mit branchenüblicher Verschlüsselung';

  @override
  String get paymentLeading => 'Zahlung';

  @override
  String get paymentAccent => 'Einzelheiten';

  @override
  String get premiumMonthly => 'Premium • Monatlich';

  @override
  String get taxEstimate => 'Steuerschätzung';

  @override
  String get totalToday => 'Insgesamt heute';

  @override
  String get paymentMethod => 'Zahlungsmethode';

  @override
  String get paymentCard => 'Karte';

  @override
  String get paymentPayPal => 'PayPal';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get cardExpiryHint => 'MM/JJ';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'Ende-zu-Ende verschlüsselt. Wir speichern Ihre Karte niemals.';

  @override
  String get premiumFeaturesLeading => 'Prämie';

  @override
  String get premiumFeaturesAccent => 'Merkmale';

  @override
  String get premiumUnlockSubtitle =>
      'Schalten Sie die volle Leistung von Life Navigator frei';

  @override
  String get premiumFeature1Title => 'Unbegrenzte KI-Analyse';

  @override
  String get premiumFeature1Body =>
      'Führen Sie so viele Entscheidungen durch, wie Sie benötigen.';

  @override
  String get premiumFeature2Title => 'Tiefe Einblicke';

  @override
  String get premiumFeature2Body =>
      'Risiko-, Vertrauens-, Ergebnis- und Wirkungsdiagramme.';

  @override
  String get premiumFeature3Title => 'Vergleichen Sie Entscheidungen';

  @override
  String get premiumFeature3Body => 'Sehen Sie Entscheidungen nebeneinander.';

  @override
  String get premiumFeature4Title => 'Berichte exportieren';

  @override
  String get premiumFeature4Body => 'PDF-, Word-, Excel- und Bildexporte.';

  @override
  String get premiumFeature5Title => 'Cloud-Synchronisierung';

  @override
  String get premiumFeature5Body => 'Sicher in der Cloud gesichert.';

  @override
  String get premiumFeature6Title => 'Vorrangiger Support';

  @override
  String get premiumFeature6Body => 'Antworten Sie innerhalb von 24 Stunden.';

  @override
  String get paymentSuccessLeading => 'Zahlung';

  @override
  String get paymentSuccessAccent => 'Erfolgreich!';

  @override
  String get youNowHaveAccessTo => 'Sie haben jetzt Zugriff auf';

  @override
  String get planLabel => 'Planen';

  @override
  String get amountLabel => 'Menge';

  @override
  String get methodLabel => 'Verfahren';

  @override
  String get transactionIdLabel => 'Transaktions-ID';

  @override
  String get unlimitedAi => 'Unbegrenzte KI';

  @override
  String get deepInsightsShort => 'Tiefe Einblicke';

  @override
  String get compareShort => 'Vergleichen';

  @override
  String get exportsShort => 'Exporte';

  @override
  String get cloudSyncShort => 'Cloud-Synchronisierung';

  @override
  String get prioritySupportShort => 'Vorrangiger Support';

  @override
  String get privacyLeading => 'Privatsphäre';

  @override
  String get privacyAccent => 'Politik';

  @override
  String get privacyLastUpdated => 'Letzte Aktualisierung: 18. Mai 2026';

  @override
  String get privacySection1Title => 'Was wir sammeln';

  @override
  String get privacySection1Body =>
      'Wir erfassen nur das, was Sie uns mitteilen – die von Ihnen gespeicherten Entscheidungen, Ihre Kontodaten (Name + E-Mail) und Ihre Präferenzen. Alles andere bleibt auf Ihrem Gerät.';

  @override
  String get privacySection2Title => 'Wie wir es nutzen';

  @override
  String get privacySection2Body =>
      'Um KI-Empfehlungen zu personalisieren, synchronisieren Sie bei Bedarf Ihre Daten und verbessern Sie die App. Wir verkaufen Ihre Daten niemals an Dritte.';

  @override
  String get privacySection3Title => 'Local-First-Speicher';

  @override
  String get privacySection3Body =>
      'Ihre Entscheidungen werden standardmäßig auf Ihrem Gerät gespeichert. Die Cloud-Synchronisierung ist bei der Übertragung und im Ruhezustand aktiviert und verschlüsselt.';

  @override
  String get privacySection4Title => 'Ihre Rechte';

  @override
  String get privacySection4Body =>
      'Sie können alle Ihre Daten jederzeit in den Einstellungen exportieren oder löschen. Wir antworten auf Datenanfragen innerhalb von 7 Tagen.';

  @override
  String get privacySection5Title => 'Kinder';

  @override
  String get privacySection5Body =>
      'AI Life Navigator ist nicht für Kinder unter 13 Jahren gedacht. Wir sammeln wissentlich keine Daten von Kindern.';

  @override
  String get privacySection6Title => 'Kontaktieren Sie uns';

  @override
  String get privacySection6Body =>
      'Fragen oder Bedenken? Senden Sie eine E-Mail an Privacy@lifenavigator.app und wir werden uns innerhalb von zwei Werktagen bei Ihnen melden.';

  @override
  String get termsLeading => 'Bedingungen von';

  @override
  String get termsAccent => 'Service';

  @override
  String get termsLastUpdated => 'Letzte Aktualisierung: 18. Mai 2026';

  @override
  String get termsSection1Title => '1. Akzeptanz';

  @override
  String get termsSection1Body =>
      'Durch die Nutzung von AI Life Navigator stimmen Sie diesen Bedingungen zu. Wenn Sie damit nicht einverstanden sind, nutzen Sie die App bitte nicht.';

  @override
  String get termsSection2Title => '2. Konto';

  @override
  String get termsSection2Body =>
      'Sie sind für die Sicherheit Ihres Kontos verantwortlich. Geben Sie Ihre Anmeldeinformationen nicht weiter.';

  @override
  String get termsSection3Title => '3. KI-Empfehlungen';

  @override
  String get termsSection3Body =>
      'KI-Ergebnisse sind Orientierungshilfen, keine professionelle Beratung. Sie sind für die Entscheidungen verantwortlich, die Sie auf dieser Grundlage treffen.';

  @override
  String get termsSection4Title => '4. Abonnements';

  @override
  String get termsSection4Body =>
      'Premium-Pläne verlängern sich automatisch, bis sie gekündigt werden. Sie können jederzeit über Ihr Shop-Konto kündigen.';

  @override
  String get termsSection5Title => '5. Akzeptable Verwendung';

  @override
  String get termsSection5Body =>
      'Keine missbräuchlichen Inhalte, kein Reverse Engineering, kein Scraping. Verstöße können zur Sperrung des Kontos führen.';

  @override
  String get termsSection6Title => '6. Haftungsbeschränkung';

  @override
  String get termsSection6Body =>
      'Soweit gesetzlich zulässig, ist unsere Haftung auf den Betrag beschränkt, den Sie uns in den letzten 12 Monaten gezahlt haben.';

  @override
  String get termsSection7Title => '7. Änderungen';

  @override
  String get termsSection7Body =>
      'Wir können diese Bedingungen aktualisieren. Wir benachrichtigen Sie über wesentliche Änderungen per In-App-Benachrichtigung oder E-Mail.';

  @override
  String get faqQ1 => 'Wie beginne ich eine neue Entscheidung?';

  @override
  String get faqA1 =>
      'Tippen Sie auf dem Startbildschirm auf die Karte „Neue Analyse starten“, geben Sie Ihrer Entscheidung einen Titel und befolgen Sie die geführten Schritte.';

  @override
  String get faqQ2 => 'Sind meine Daten privat?';

  @override
  String get faqA2 =>
      'Ja. Entscheidungen werden standardmäßig lokal auf Ihrem Gerät gespeichert. Die Cloud-Synchronisierung ist optional und verschlüsselt.';

  @override
  String get faqQ3 => 'Wie genau ist die KI?';

  @override
  String get faqA3 =>
      'Die KI bietet eine strukturierte Anleitung, keine professionelle Beratung. Nutzen Sie es als Denkhilfe zusätzlich zu Ihrem eigenen Urteilsvermögen.';

  @override
  String get faqQ4 => 'Kann die KI auf meine Gespräche zugreifen?';

  @override
  String get faqA4 =>
      'Nein. Es werden nur die Eingaben verwendet, die Sie im Entscheidungsfluss übermitteln. Es wird nichts anderes von Ihrem Gerät gelesen.';

  @override
  String get faqQ5 => 'Wie kann ich mein Abonnement kündigen?';

  @override
  String get faqA5 =>
      'Sie können Ihr Abonnement jederzeit über die App Store-/Google Play-Abonnementseite kündigen. Der Zugriff bleibt bis zum Ende des Zeitraums bestehen.';

  @override
  String get faqQ6 => 'Bieten Sie Rückerstattungen an?';

  @override
  String get faqA6 =>
      'Ja – innerhalb von 7 Tagen nach Ihrem ersten Kauf. E-Mail an support@lifenavigator.app.';

  @override
  String get faqQ7 => 'Wie lösche ich mein Konto?';

  @override
  String get faqA7 =>
      'Einstellungen → Konto → Konto löschen. Alle Ihre Daten werden innerhalb von 30 Tagen entfernt.';

  @override
  String get faqQ8 => 'Kann ich meine Entscheidungen exportieren?';

  @override
  String get faqA8 =>
      'Ja. Öffnen Sie eine beliebige gespeicherte Entscheidung und tippen Sie auf Bericht exportieren, um ihn als PDF, Word, Excel oder Bild herunterzuladen.';

  @override
  String get notificationsLeading => 'Benachrichtigen';

  @override
  String get notificationsAccent => 'Kationen';

  @override
  String get decisionTextRiskFallback =>
      'Führen Sie eine vollständige Analyse durch, um maßgeschneiderte Tipps zur Risikominderung zu erhalten.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'Ihr Gesamtrisikoniveau beträgt $label ($score %). Sehen Sie sich die nachstehende Aufschlüsselung an, um zu verstehen, was zu dieser Bewertung führt.';
  }
}
