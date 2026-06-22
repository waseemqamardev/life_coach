// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Navigateur de vie IA';

  @override
  String get navHome => 'Accueil';

  @override
  String get navChatbot => 'Chat IA';

  @override
  String get navInsights => 'Connaissances';

  @override
  String get navHistory => 'Histoire';

  @override
  String get continueButton => 'Continuer';

  @override
  String get nextButton => 'Suivant';

  @override
  String get backButton => 'Dos';

  @override
  String get saveButton => 'Sauvegarder';

  @override
  String get analyzeButton => 'Analyser';

  @override
  String get tryAgain => 'Essayer à nouveau';

  @override
  String get viewAll => 'Tout afficher';

  @override
  String get searchHint => 'Recherche...';

  @override
  String get selectLanguage => 'Sélectionner';

  @override
  String get languageWord => 'Langue';

  @override
  String get searchLanguageHint => 'Rechercher la langue ici...';

  @override
  String get noLanguagesFound => 'Aucune langue trouvée';

  @override
  String get settings => 'Paramètres';

  @override
  String get accountSettings => 'Paramétrage du compte';

  @override
  String get languages => 'Langues';

  @override
  String get theme => 'Thème';

  @override
  String get notifications => 'Notifications';

  @override
  String get privacyPolicy => 'politique de confidentialité';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get helpSupport => 'Aide et assistance';

  @override
  String get logout => 'Déconnexion';

  @override
  String get welcomeBack => 'Content de te revoir!';

  @override
  String get emailAddress => 'Adresse email';

  @override
  String get password => 'Mot de passe';

  @override
  String get login => 'Connexion';

  @override
  String get signUp => 'Inscription';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get rememberMe => 'Souviens-toi de moi';

  @override
  String goodMorning(String name) {
    return 'Bonjour, $name 👋';
  }

  @override
  String get homeSubtitle =>
      'Obtenez des conseils IA pour votre prochaine décision importante.';

  @override
  String get startNewAnalysis => 'Démarrer une nouvelle analyse';

  @override
  String get startAnalysisSubtitle =>
      'Démarrez une analyse guidée et recevez une recommandation personnalisée.';

  @override
  String get decisionOverview => 'Aperçu de la décision';

  @override
  String get riskScore => 'Score de risque';

  @override
  String get successChance => 'Chances de réussite';

  @override
  String get activePlans => 'Forfaits actifs';

  @override
  String get inProgress => 'En cours';

  @override
  String get recentInsights => 'Aperçus récents';

  @override
  String get stepDefine => 'Définir';

  @override
  String get stepAnalyze => 'Analyser';

  @override
  String get stepQuestions => 'Questions';

  @override
  String get stepResult => 'Résultat';

  @override
  String get defineYourProblem => 'Définissez votre';

  @override
  String get problemWord => 'Problème';

  @override
  String get tellUsMore => 'Parlez-nous de votre décision';

  @override
  String get wizardHint =>
      'Plus vous fournissez de détails, mieux notre IA pourra vous analyser et vous guider.';

  @override
  String get describeDecision => 'Décrivez votre décision';

  @override
  String get quickTips => 'Conseils rapides';

  @override
  String get beSpecific => 'Soyez précis';

  @override
  String get includeContext => 'Inclure le contexte';

  @override
  String get mentionGoal => 'Mentionner l\'objectif';

  @override
  String get choosingBetween => 'Entre quoi choisissez-vous ?';

  @override
  String get optionsHint =>
      'Énumérez jusqu’à 5 options. L’IA pèsera chacun par rapport à vos objectifs.';

  @override
  String get addAnotherOption => 'Ajouter une autre option';

  @override
  String get continueToAnalysis => 'Continuer vers l\'analyse';

  @override
  String get aiQuestionsTitle => 'IA';

  @override
  String get questionsWord => 'Questions';

  @override
  String get preparingQuestions => 'Préparation de questions personnalisées…';

  @override
  String basedOnDecision(String title) {
    return 'Sur la base de votre décision : $title';
  }

  @override
  String get basedOnWizard =>
      'Basé sur ce que vous avez partagé dans l\'assistant';

  @override
  String get aiNavigator => 'Navigateur de vie IA';

  @override
  String get aiQuestionsHint =>
      'Répondez honnêtement : vos réponses façonnent l’analyse de l’IA.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'L\'IA a généré ces questions spécifiquement pour \"$title\".';
  }

  @override
  String questionOf(int current, int total) {
    return 'Question $current de $total';
  }

  @override
  String get whyThisMatters => 'Pourquoi est-ce important ?';

  @override
  String get whyQuestionsMatter =>
      'Vos réponses aident l’IA à se concentrer sur ce qui est le plus pertinent pour votre situation.';

  @override
  String get securePrivate => 'Vos données sont sécurisées et privées';

  @override
  String get processingAnalyzing => 'Analyser vos options...';

  @override
  String get processingRisk => 'Calculer les facteurs de risque...';

  @override
  String get processingOutcomes => 'Prédire les résultats...';

  @override
  String get processingPlan => 'Construire un plan d\'action...';

  @override
  String get processingFinalizing => 'Résultat final';

  @override
  String get decisionResult => 'Décision';

  @override
  String get resultWord => 'Résultat';

  @override
  String get recommendedChoice => 'Choix recommandé';

  @override
  String get benefitScore => 'Score des avantages';

  @override
  String get confidence => 'Confiance';

  @override
  String get fitScore => 'Score d\'ajustement';

  @override
  String get resultBreakdown => 'Répartition des résultats';

  @override
  String get finalRecommendation => 'Recommandation finale';

  @override
  String get outcomePrediction => 'Prédiction des résultats';

  @override
  String get confidenceMeter => 'Compteur de confiance';

  @override
  String get actionPlan => 'Plan d\'action';

  @override
  String get prosCons => 'Avantages et inconvénients';

  @override
  String get tipFromAi => 'Astuce de l\'IA';

  @override
  String get saveReport => 'Enregistrer le rapport';

  @override
  String get startNewDecision => 'Commencer une nouvelle décision';

  @override
  String get decisionWord => 'Décision';

  @override
  String get comparisonWord => 'Comparaison';

  @override
  String get whyRecommended => 'Pourquoi est-ce recommandé ?';

  @override
  String get riskBreakdown => 'Répartition des risques';

  @override
  String get riskInterpretation => 'Interprétation des risques';

  @override
  String get howToImprove => 'Comment s\'améliorer';

  @override
  String get overallConfidence => 'Confiance globale';

  @override
  String get confidenceBreakdown => 'Panne de confiance';

  @override
  String get successLikelihood => 'Probabilité de réussite';

  @override
  String get outcomeBreakdown => 'Répartition des résultats';

  @override
  String get keyOutcomeFactors => 'Facteurs de résultats clés';

  @override
  String get prosTitle => 'Avantages de cette décision';

  @override
  String get consTitle => 'Inconvénients de cette décision';

  @override
  String get overallProsCons => 'Avantages et inconvénients globaux';

  @override
  String get bestOverallFit => 'Meilleur ajustement global';

  @override
  String get bestOverallChoice => 'Meilleur choix global';

  @override
  String get recommendedChoiceLabel => 'Choix recommandé';

  @override
  String get yourActionPlan => 'Votre plan d\'action';

  @override
  String get aiInsight => 'Aperçu de l\'IA';

  @override
  String get keyComparison => 'Comparaison clé';

  @override
  String get overallScore => 'Note globale';

  @override
  String get keyPoints => 'Points clés';

  @override
  String get analysisFailed =>
      'L\'analyse a échoué. Vérifiez votre connexion Internet et votre clé API.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY est manquant. Ajoutez-le à .env et redémarrez l\'application.';

  @override
  String get noDescription => 'Aucune description fournie.';

  @override
  String get history => 'Histoire';

  @override
  String get about => 'À propos';

  @override
  String get profile => 'Profil';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get low => 'Faible';

  @override
  String get medium => 'Moyen';

  @override
  String get high => 'Haut';

  @override
  String get lowRisk => 'Faible risque';

  @override
  String get mediumRisk => 'Risque moyen';

  @override
  String get highRisk => 'Risque élevé';

  @override
  String get notAssessed => 'Non évalué';

  @override
  String get couldNotLoadQuestions => 'Impossible de charger les questions';

  @override
  String get noQuestionsGenerated => 'Aucune question n\'a été générée.';

  @override
  String get onboardingTitle1 =>
      'Prenez des décisions plus intelligentes grâce à l\'IA';

  @override
  String get onboardingSubtitle1 =>
      'Obtenez des conseils personnalisés pour les choix importants de la vie.';

  @override
  String get onboardingTitle2 => 'Analyser les risques et les résultats';

  @override
  String get onboardingSubtitle2 =>
      'Comprenez les compromis avant de vous engager.';

  @override
  String get onboardingTitle3 => 'Suivre un plan d\'action clair';

  @override
  String get onboardingSubtitle3 =>
      'Transformez les informations en prochaines étapes pratiques.';

  @override
  String get getStarted => 'Commencer';

  @override
  String get skip => 'Passer';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get lightMode => 'Mode lumière';

  @override
  String get systemDefault => 'Système par défaut';

  @override
  String get generalSettings => 'Paramètres généraux';

  @override
  String get support => 'Soutien';

  @override
  String get legal => 'Légal';

  @override
  String get languageChanged => 'Langue mise à jour';

  @override
  String get yourOptions => 'Vos options';

  @override
  String get recommended => 'Recommandé';

  @override
  String get compareOptions => 'Comparez les options';

  @override
  String get plan => 'Plan';

  @override
  String get prepare => 'Préparer';

  @override
  String get execute => 'Exécuter';

  @override
  String get positiveOutcome => 'Résultat positif';

  @override
  String get neutralOutcome => 'Résultat neutre';

  @override
  String get negativeOutcome => 'Résultat négatif';

  @override
  String get overallRiskScore => 'Score de risque global';

  @override
  String get yourDecisionRiskLevel => 'Votre niveau de risque décisionnel';

  @override
  String get overallPrediction => 'Prédiction globale';

  @override
  String get overallProsConsTitle => 'Avantages et inconvénients globaux';

  @override
  String get emptyHistory => 'Aucune décision enregistrée pour l\'instant';

  @override
  String get startFirstDecision =>
      'Commencez votre première analyse de décision';

  @override
  String get chatbotTitle => 'Chatbot IA';

  @override
  String get insightsTitle => 'Connaissances';

  @override
  String get dailySuggestion => 'Suggestions quotidiennes';

  @override
  String get aboutTagline =>
      'Aide à la décision intelligente alimentée par l\'IA : évaluez les options, les risques et les prochaines étapes.';

  @override
  String get aboutBody =>
      'AI Life Navigator vous aide à prendre des décisions de vie et de carrière avec des questions structurées, une analyse des risques et des plans d\'action clairs.';

  @override
  String get personalInformation => 'Informations personnelles';

  @override
  String get appSetting => 'Paramètres de l\'application';

  @override
  String get securityPrivacy => 'Sécurité et confidentialité';

  @override
  String get aboutUs => 'À propos de nous';

  @override
  String get howToUse => 'Comment utiliser';

  @override
  String get appTheme => 'Thème de l\'application';

  @override
  String get shareApp => 'Partager';

  @override
  String get rateUs => 'Évaluez-nous';

  @override
  String get pleaseAddOption => 'Veuillez ajouter au moins une option';

  @override
  String get noReportToSave => 'Aucun rapport de décision à sauvegarder.';

  @override
  String get reportSaved => 'Rapport enregistré dans l\'historique.';

  @override
  String get pendingAnalysis => 'Analyse en attente';

  @override
  String get untitledDecision => 'Décision sans titre';

  @override
  String get describeDecisionHint =>
      'Décrivez votre situation, vos contraintes et à quoi ressemble le succès.';

  @override
  String optionLabel(String letter) {
    return 'Option $letter';
  }

  @override
  String get goodChance => 'Bonne occasion';

  @override
  String get fairChance => 'Chance équitable';

  @override
  String get poorChance => 'Mauvaise chance';

  @override
  String get couldNotPrepareQuestions =>
      'Impossible de préparer les questions. Veuillez réessayer.';

  @override
  String get greetingFallbackName => 'là';

  @override
  String get dontHaveAccount => 'Vous n\'avez pas de compte ?';

  @override
  String get alreadyHaveAccount => 'Vous avez déjà un compte ?';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get welcome => 'Accueillir!';

  @override
  String get orContinueWith => 'ou continuez avec';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'Vie';

  @override
  String get navigator => 'Navigateur';

  @override
  String get authTagline => 'Assistant de prise de décision IA';

  @override
  String get chatbotReadySubtitle => 'Prêt à naviguer dans votre vie';

  @override
  String get chatbotInputHint => 'Commencez votre discussion ici...';

  @override
  String get chatbotErrorMessage =>
      'Désolé, je n\'ai pas pu accéder au service AI. Veuillez vérifier votre connexion et réessayer.';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete =>
      'Sélectionnez les décisions à supprimer.';

  @override
  String get total => 'Total';

  @override
  String get highScore => 'Score élevé';

  @override
  String get justNow => 'Tout à l\' heure';

  @override
  String minutesAgo(int count) {
    return 'il y a $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'Il y a $count heure';
  }

  @override
  String hoursAgoPlural(int count) {
    return 'Il y a $count heures';
  }

  @override
  String daysAgo(int count) {
    return 'Il y a $count jours';
  }

  @override
  String daysAgoPlural(int count) {
    return 'Il y a $count jours';
  }

  @override
  String scoreLabel(int score) {
    return 'Note $score';
  }

  @override
  String get themeCustomizeSubtitle =>
      'Personnalisez l\'apparence et la convivialité de votre application';

  @override
  String get lightModeSubtitle => 'Expérience propre et lumineuse';

  @override
  String get darkModeSubtitle => 'Agréable pour les yeux en basse lumière';

  @override
  String get systemDefaultSubtitle =>
      'Utiliser les préférences de thème de l\'appareil';

  @override
  String get preview => 'Aperçu';

  @override
  String get applyTheme => 'Appliquer le thème';

  @override
  String get shareAppMessage => 'Partagez Life Navigator avec vos amis.';

  @override
  String get rateAppThanks => 'Merci d\'avoir évalué Life Navigator !';

  @override
  String fieldRequired(String field) {
    return '$field est requis';
  }

  @override
  String get emailRequired => 'L\'e-mail est requis';

  @override
  String get emailInvalid => 'Veuillez entrer un email valide';

  @override
  String get passwordRequired => 'Le mot de passe est requis';

  @override
  String get passwordMinLength =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get confirmPasswordRequired => 'Veuillez confirmer votre mot de passe';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get otpRequired => 'OTP est requis';

  @override
  String otpInvalid(int length) {
    return 'Veuillez saisir un code à $length chiffres valide.';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field doit contenir au moins $min caractères';
  }

  @override
  String get fieldDescription => 'Description';

  @override
  String get fieldTitle => 'Titre';

  @override
  String get fullName => 'Nom et prénom';

  @override
  String get confirmPassword => 'Confirmez le mot de passe';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get acceptTermsRequired =>
      'Veuillez accepter les conditions et la politique de confidentialité.';

  @override
  String get signupTitleLeading => 'Créez votre';

  @override
  String get account => 'Compte';

  @override
  String get signupSubtitle =>
      'Rejoignez Life Navigator et prenez des décisions plus judicieuses chaque jour.';

  @override
  String get iAgreeToThe => 'J\'accepte le';

  @override
  String get forgotPasswordLeading => 'Oublié';

  @override
  String get forgotPasswordAccent => 'Mot de passe?';

  @override
  String get forgotPasswordSubtitle =>
      'Entrez votre email et nous vous enverrons un lien pour réinitialiser votre mot de passe.';

  @override
  String get enterEmailHint => 'Entrez votre adresse e-mail';

  @override
  String get forgotPasswordInfo =>
      'Nous enverrons un lien de réinitialisation de mot de passe à votre adresse e-mail.';

  @override
  String get sendVerificationCode => 'Envoyer le code de vérification';

  @override
  String get sendPasswordResetLink => 'Envoyer le lien de réinitialisation';

  @override
  String get emailVerificationTitle => 'Vérifier l\'e-mail';

  @override
  String get emailVerificationSubtitle =>
      'Nous avons envoyé un lien de vérification à votre adresse e-mail. Ouvrez-le pour activer votre compte.';

  @override
  String get emailVerificationSpamHint =>
      'Vérifiez votre dossier spam ou courrier indésirable si vous ne voyez pas l\'e-mail au bout de quelques minutes.';

  @override
  String get emailVerificationWaiting =>
      'En attente de vérification… nous vérifierons automatiquement.';

  @override
  String get emailVerificationResend => 'Renvoyer l\'e-mail de vérification';

  @override
  String get emailVerificationResent =>
      'E-mail de vérification envoyé à nouveau.';

  @override
  String get authErrorWrongPassword =>
      'Email ou mot de passe incorrect. Veuillez réessayer.';

  @override
  String get authErrorEmailInUse =>
      'Cet e-mail est déjà enregistré. Essayez plutôt de vous connecter.';

  @override
  String get authErrorWeakPassword =>
      'Le mot de passe est trop faible. Utilisez au moins 6 caractères.';

  @override
  String get authErrorUserNotFound => 'Aucun compte trouvé avec cet email.';

  @override
  String get authErrorTooManyRequests =>
      'Trop de tentatives. Veuillez patienter et réessayer.';

  @override
  String get authErrorGeneric =>
      'Quelque chose s\'est mal passé. Veuillez réessayer.';

  @override
  String get authErrorGoogleCancelled => 'La connexion à Google a été annulée.';

  @override
  String get passwordResetEmailSent =>
      'E-mail de réinitialisation du mot de passe envoyé. Vérifiez votre boîte de réception.';

  @override
  String get changePassword => 'Changer le mot de passe';

  @override
  String get changePasswordSubtitle =>
      'Entrez votre mot de passe actuel et choisissez-en un nouveau.';

  @override
  String get currentPassword => 'Mot de passe actuel';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get deleteAccountConfirm =>
      'Cela supprime définitivement votre compte et ne peut être annulé.';

  @override
  String get deleteAccountSuccess =>
      'Supprimez également les décisions locales et les discussions stockées sur cet appareil.';

  @override
  String get accountDeleted => 'Votre compte a été supprimé.';

  @override
  String get rememberPassword => 'Vous vous souvenez de votre mot de passe ?';

  @override
  String get passwordUpdatedLogin =>
      'Mot de passe mis à jour. Veuillez vous connecter.';

  @override
  String get resetLeading => 'Réinitialiser';

  @override
  String get resetPasswordSubtitle =>
      'Créez un nouveau mot de passe pour votre compte.';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get confirmNewPassword => 'Confirmer le nouveau mot de passe';

  @override
  String get passwordHint =>
      'Utilisez au moins 6 caractères avec un mélange dont vous vous souvenez.';

  @override
  String get updating => 'Mise à jour...';

  @override
  String get updatePassword => 'Mettre à jour le mot de passe';

  @override
  String get backTo => 'Retour à';

  @override
  String newCodeSentTo(String email) {
    return 'Nouveau code envoyé à $email';
  }

  @override
  String get invalidVerificationCode =>
      'Code de vérification invalide. Veuillez réessayer.';

  @override
  String otpResetSubtitle(String email) {
    return 'Entrez le code de réinitialisation à 6 chiffres envoyé à $email';
  }

  @override
  String otpVerifySubtitle(String email) {
    return 'Saisissez le code de vérification à 6 chiffres envoyé à $email';
  }

  @override
  String get verifyLeading => 'Vérifier';

  @override
  String get verifyEmailLeading => 'Vérifiez votre';

  @override
  String get codeWord => 'Code';

  @override
  String get emailWord => 'E-mail';

  @override
  String resendCodeIn(int seconds) {
    return 'Renvoyer le code dans ${seconds}s';
  }

  @override
  String get didntReceiveCode => 'Vous n\'avez pas reçu le code ?';

  @override
  String get resendCode => 'Renvoyer le code';

  @override
  String get verifying => 'Vérification...';

  @override
  String get verifyCode => 'Vérifier le code';

  @override
  String get verifyAndContinue => 'Vérifier et continuer';

  @override
  String get wrongEmail => 'Mauvais e-mail ?';

  @override
  String get goBack => 'Retourner';

  @override
  String get logOut => 'Se déconnecter';

  @override
  String get logoutConfirmMessage =>
      'Êtes-vous sûr de vouloir vous déconnecter de cette application ?';

  @override
  String get logoutConfirmYes => 'Oui, déconnectez-vous';

  @override
  String get insightsHeroDescription =>
      'Des suggestions et des informations quotidiennes adaptées à vos décisions.';

  @override
  String recommendedPrefix(String text) {
    return 'Recommandé : $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'Effectuez une analyse pour obtenir une interprétation personnalisée des risques.';

  @override
  String get startDecisionQuestion =>
      'Pour quelle décision souhaitez-vous de l\'aide ?';

  @override
  String get startDecisionSubtitle =>
      'Décrivez votre décision et obtenez des informations et des recommandations basées sur l\'IA.';

  @override
  String get decisionTitle => 'Titre de la décision';

  @override
  String get decisionTitleHint => 'par ex. Dois-je changer de carrière ?';

  @override
  String get decisionCategory => 'Catégorie de décision';

  @override
  String get importanceLevel => 'Niveau d\'importance';

  @override
  String get impactMinor => 'Impact mineur';

  @override
  String get impactModerate => 'Impact modéré';

  @override
  String get impactHigh => 'Fort impact';

  @override
  String get categoryCareer => 'Carrière';

  @override
  String get categoryFinance => 'Finance';

  @override
  String get categoryHealth => 'Santé';

  @override
  String get categoryRelations => 'Rapports';

  @override
  String get categoryEducation => 'Éducation';

  @override
  String get categoryOther => 'Autre';

  @override
  String get addYourOptionsLeading => 'Ajoutez votre';

  @override
  String get optionsWord => 'Possibilités';

  @override
  String get describeOptionHint => 'Décrivez cette option';

  @override
  String get goalSelection => 'Sélection des objectifs';

  @override
  String get goalSelectionSubtitle =>
      'Sélectionnez les options de votre décision qui comptent le plus pour vous.';

  @override
  String get selectAtLeastOneGoal =>
      'Veuillez sélectionner au moins un objectif';

  @override
  String get goalTipBody =>
      'Vous pourrez toujours ajuster vos priorités plus tard dans votre profil.';

  @override
  String get goalGrowth => 'Croissance';

  @override
  String get goalFinancialGain => 'Gain financier';

  @override
  String get goalRiskReduction => 'Réduction des risques';

  @override
  String get goalPersonalSatisfaction => 'Satisfaction personnelle';

  @override
  String get goalTimeEfficiency => 'Efficacité du temps';

  @override
  String get goalWorkLifeBalance => 'Équilibre travail-vie personnelle';

  @override
  String get goalStability => 'Stabilité';

  @override
  String get goalImpact => 'Impact';

  @override
  String get budgetInput => 'Contribution budgétaire';

  @override
  String get budgetSubtitle =>
      'Sélectionnez votre budget estimé pour cette décision.';

  @override
  String get budgetImpactLevel => 'Niveau d\'impact budgétaire';

  @override
  String get budgetLessThan5k => 'Moins de 5 000 \$';

  @override
  String get enterYourBudget => 'Entrez votre budget';

  @override
  String get timeAvailability => 'Disponibilité horaire';

  @override
  String get timeAvailabilitySubtitle =>
      'Sélectionnez votre disponibilité horaire pour cette décision.';

  @override
  String get experienceLevel => 'Niveau d\'expérience';

  @override
  String get experienceSubtitle =>
      'Cela aide notre IA à comprendre votre parcours et votre expertise.';

  @override
  String get riskTolerance => 'Tolérance au risque';

  @override
  String get riskToleranceSubtitle =>
      'Sélectionnez votre niveau de tolérance au risque pour cette décision.';

  @override
  String get timeUrgency => 'Urgence du temps';

  @override
  String get urgencySubtitle => 'Sélectionnez l\'urgence de votre décision.';

  @override
  String get financialRisk => 'Risque financier';

  @override
  String get marketRisk => 'Risque de marché';

  @override
  String get timeRisk => 'Risque de temps';

  @override
  String get executionRisk => 'Risque d\'exécution';

  @override
  String get personalRisk => 'Risque personnel';

  @override
  String get overallFit => 'Ajustement global';

  @override
  String get firstOption => 'Première option';

  @override
  String get secondOption => 'Deuxième option';

  @override
  String get versus => 'Contre';

  @override
  String get confidenceInterpretation => 'Interprétation de la confiance';

  @override
  String get financialImpact => 'Impact financier';

  @override
  String get riskLevel => 'Niveau de risque';

  @override
  String get timeInvestment => 'Investissement en temps';

  @override
  String get longTermSustainability => 'Durabilité à long terme';

  @override
  String get personalGrowth => 'Croissance personnelle';

  @override
  String get outcomeConsistency => 'Cohérence des résultats';

  @override
  String get riskAssessment => 'L\'évaluation des risques';

  @override
  String get historicalSimilarity => 'Similitude historique';

  @override
  String get relevanceMatch => 'Correspondance par pertinence';

  @override
  String get dataQuality => 'Qualité des données';

  @override
  String get confidenceVeryHigh => 'Très élevé';

  @override
  String get confidenceModerate => 'Modéré';

  @override
  String get confidenceVeryLow => 'Très faible';

  @override
  String get onboardingAiPowered => 'Alimenté par l\'IA';

  @override
  String get onboardingSmartAnalysis =>
      'Une analyse intelligente pour de meilleures décisions';

  @override
  String get onboardingRiskAnalysis => 'Analyse des risques';

  @override
  String get onboardingActionablePlans => 'Plans d\'action';

  @override
  String get onboardingTrustedGuidance => 'Des conseils fiables';

  @override
  String get onboardingDefineGoalLeading => 'Définissez votre';

  @override
  String get goalWord => 'But';

  @override
  String get onboardingChooseJourney =>
      'Choisissez le parcours de vie pour lequel vous souhaitez être guidé';

  @override
  String get onboardingCareerPath => 'Cheminement de carrière';

  @override
  String get onboardingCareerPathDesc =>
      'Explorez les marchés et les compétences futurs';

  @override
  String get onboardingMajorPurchase => 'Achat majeur';

  @override
  String get onboardingMajorPurchaseDesc =>
      'Comparez les options pour un nouvel achat';

  @override
  String get onboardingLifeChanges => 'Changements de vie';

  @override
  String get onboardingLifeChangesDesc =>
      'Planifier un déménagement ou une nouvelle phase';

  @override
  String get onboardingPersonalGrowth => 'Croissance personnelle';

  @override
  String get onboardingPersonalGrowthDesc =>
      'Identifier les changements de compétences et de mentalités';

  @override
  String get onboardingReadyLeading => 'Prêt à';

  @override
  String get navigateWord => 'Naviguer';

  @override
  String get onboardingReadySubtitle =>
      'Votre assistant personnalisé est prêt à vous aider';

  @override
  String get onboardingActionableGuidance => 'Conseils pratiques';

  @override
  String get onboardingActionableGuidanceDesc =>
      'Obtenez des conseils pour votre réussite';

  @override
  String get onboardingProgressTracking => 'Suivi des progrès';

  @override
  String get onboardingProgressTrackingDesc =>
      'Surveillez les étapes de votre voyage';

  @override
  String get onboardingAdjustOnTheFly => 'Ajustez à la volée';

  @override
  String get onboardingAdjustDesc =>
      'Réévaluer les plans au fur et à mesure de la vie';

  @override
  String get onboardingShareLearn => 'Partager et apprendre';

  @override
  String get onboardingShareLearnDesc => 'Partagez et apprenez de vos parcours';

  @override
  String get myProfileLeading => 'Mon';

  @override
  String get preferences => 'Préférences';

  @override
  String get personalityPreferences => 'Préférences de personnalité';

  @override
  String get saveChanges => 'Enregistrer les modifications';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get tapToChangePhoto => 'Appuyez ici pour changer de photo';

  @override
  String get photoPickerComingSoon =>
      'Le sélecteur de photos sera bientôt disponible.';

  @override
  String get pickImageSourceTitle => 'Changer la photo de profil';

  @override
  String get pickFromCamera => 'Prendre une photo';

  @override
  String get pickFromGallery => 'Choisissez dans la galerie';

  @override
  String get removePhoto => 'Supprimer la photo';

  @override
  String get cameraPermissionDenied =>
      'L\'autorisation de l\'appareil photo est requise pour prendre une photo.';

  @override
  String get galleryPermissionDenied =>
      'L\'autorisation de la photothèque est requise pour choisir une photo.';

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String get savePreferences => 'Enregistrer les préférences';

  @override
  String get preferencesSaved => 'Préférences enregistrées.';

  @override
  String get personalitySubtitle => 'Aidez l’IA à mieux vous comprendre';

  @override
  String get focusAreas => 'Domaines d\'intervention';

  @override
  String get emptyTitleLeading => 'Rien';

  @override
  String get emptyTitleAccent => 'Ici encore';

  @override
  String get emptyQuietTitle => 'C\'est calme ici';

  @override
  String get emptyHistoryHint =>
      'Commencez votre première décision et votre historique apparaîtra ici.';

  @override
  String get startADecision => 'Commencer une décision';

  @override
  String get helpHereToHelp => 'Nous sommes là pour vous aider';

  @override
  String get faq => 'FAQ';

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get errorTitle => 'Quelque chose s\'est mal passé';

  @override
  String get errorSubtitle =>
      'Nous avons rencontré une erreur inattendue. Veuillez réessayer.';

  @override
  String get contactSupport => 'Contacter l\'assistance';

  @override
  String get noInternetTitle => 'Aucune connexion';

  @override
  String get noInternetSubtitle =>
      'Veuillez vérifier votre connexion Internet et réessayer.';

  @override
  String get retryConnection => 'Réessayer la connexion';

  @override
  String get offlineMode => 'Passer en mode hors ligne';

  @override
  String get permissionTitle => 'Autorisations des applications';

  @override
  String get permissionSubtitle =>
      'Accordez des autorisations pour la meilleure expérience.';

  @override
  String get grantAll => 'Accorder tout';

  @override
  String get notNow => 'Pas maintenant';

  @override
  String get updateAvailable => 'Mise à jour disponible';

  @override
  String get updateSubtitle =>
      'Une nouvelle version est disponible avec des améliorations.';

  @override
  String get updateNow => 'Mettre à jour maintenant';

  @override
  String get remindLater => 'Rappelez-moi plus tard';

  @override
  String get loadingMessage => 'Préparer les choses...';

  @override
  String get decisionDetailLeading => 'Décision';

  @override
  String get detailWord => 'Détail';

  @override
  String get decisionNotFound => 'Décision non trouvée';

  @override
  String get overall => 'Dans l\'ensemble';

  @override
  String get pros => 'Avantages';

  @override
  String get cons => 'Inconvénients';

  @override
  String get notes => 'Remarques';

  @override
  String get saveAtLeastTwoToCompare =>
      'Enregistrez au moins deux décisions pour comparer.';

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
  String get moderate => 'Modéré';

  @override
  String get veryHigh => 'Très élevé';

  @override
  String get veryLow => 'Très faible';

  @override
  String get next => 'Suivant';

  @override
  String get later => 'Plus tard';

  @override
  String get useWord => 'Utiliser';

  @override
  String get aboutUsLeading => 'À propos';

  @override
  String get aboutUsAccent => 'Nous';

  @override
  String get howToUseLeading => 'Comment';

  @override
  String get versionLabel => 'Version 1.0.0';

  @override
  String get dailyDecision => 'Décision quotidienne';

  @override
  String get personalityDescription =>
      'Ces paramètres personnalisent le ton et la profondeur des recommandations.';

  @override
  String get traitOptimism => 'Optimisme';

  @override
  String get traitPatience => 'Patience';

  @override
  String get traitDetailFocus => 'Focus sur les détails';

  @override
  String get categoryTravel => 'Voyage';

  @override
  String get helpResponseTime => 'Délai de réponse moyen : moins de 24 heures';

  @override
  String get helpGetInTouch => 'Entrer en contact';

  @override
  String get helpLiveChat => 'Chat en direct';

  @override
  String get helpLiveChatSub => 'Discutez avec notre équipe en temps réel';

  @override
  String get helpCall => 'Appel';

  @override
  String get helpCallSub =>
      'Du lundi au vendredi, de 9h à 17h (heure du Pacifique)';

  @override
  String get helpSubmitTicket => 'Soumettre un billet';

  @override
  String get helpSubmitTicketSub => 'Obtenez un ticket d\'assistance suivi';

  @override
  String get helpQuickLinks => 'Liens rapides';

  @override
  String get faqSubtitle => 'Réponses aux questions courantes';

  @override
  String get aboutSubtitle => 'Version, crédits et liens';

  @override
  String get helpOpenLiveChat => 'Ouvrir le chat en direct';

  @override
  String get helpLiveChatSoon =>
      'Ouverture du chat en direct bientôt — nous vous répondrons par e-mail dans les 24 heures.';

  @override
  String get moreOptionsComingSoon => 'Plus d\'options à venir';

  @override
  String get insightCompoundTitle => 'Composez vos décisions';

  @override
  String get insightCompoundMessage =>
      'Les décisions prises aujourd’hui façonnent les opportunités dans 6 mois. Choisissez celui qui ouvre le plus de portes.';

  @override
  String get insightParalysisTitle => 'Attention à la paralysie de l\'analyse';

  @override
  String get insightParalysisMessage =>
      'Si vous y réfléchissez depuis plus d’une semaine sans nouvelles informations, vous avez de quoi vous décider.';

  @override
  String get insightRiskStressTitle => 'Le risque n’est pas synonyme de stress';

  @override
  String get insightRiskStressMessage =>
      'Une décision à haut risque peut toujours être peu stressante si vous avez un plan B clair. Concevez toujours votre solution de repli.';

  @override
  String get insightFutureYouTitle => 'Avenir, vous votez aussi';

  @override
  String get insightFutureYouMessage =>
      'Avant de décider, demandez-vous : est-ce que votre futur, dans 5 ans, vous remercierait pour cela ?';

  @override
  String streakDays(int count) {
    return '$count jours consécutifs';
  }

  @override
  String get streakKeepGoing =>
      'Continuez – faites en sorte que la décision d’aujourd’hui compte.';

  @override
  String get todaysDecisionPrompt => 'L\'invite de décision d\'aujourd\'hui';

  @override
  String get dailyDecisionExerciseSub =>
      'Un exercice de décision rapide de 60 secondes';

  @override
  String get dailyDecisionQuestion =>
      'Faut-il dire oui ou non à cette opportunité ?';

  @override
  String get dailyDecisionScenario =>
      'Un collègue vous invite à un projet parallèle. C\'est passionnant mais cela prend 10 heures par semaine.';

  @override
  String get seeAiAnalysis => 'Voir l\'analyse de l\'IA';

  @override
  String get errorWhatYouCanDo => 'Ce que tu peux faire';

  @override
  String get errorTip1 => 'Vérifiez votre connexion Internet';

  @override
  String get errorTip2 => 'Réessayez l\'action dans un instant';

  @override
  String get errorTip3 => 'Redémarrez l\'application';

  @override
  String get errorTip4 => 'Contactez le support si cela continue à se produire';

  @override
  String get noInternetYouCanStill => 'Vous pouvez toujours';

  @override
  String get offlineTip1 =>
      'Afficher les décisions enregistrées et l\'historique';

  @override
  String get offlineTip2 => 'Lisez vos notes et plans d’action';

  @override
  String get offlineTip3 => 'Parcourir les FAQ et À propos';

  @override
  String get permissionNotificationsDesc =>
      'Recevez des rappels et des invites de décision quotidiennes';

  @override
  String get permissionLocation => 'Emplacement';

  @override
  String get permissionLocationDesc =>
      'Utilisé uniquement pour les suggestions basées sur la localisation';

  @override
  String get permissionStorage => 'Stockage';

  @override
  String get permissionStorageDesc =>
      'Enregistrez vos rapports et exports localement';

  @override
  String get permissionSettingsNote =>
      'Vous pouvez modifier les autorisations à tout moment depuis les paramètres';

  @override
  String updateVersionReady(String version) {
    return 'La version $version est prête à être installée';
  }

  @override
  String get whatsNew => 'Quoi de neuf';

  @override
  String get updateFeature1 => 'Analyse IA plus rapide (accélération 2x)';

  @override
  String get updateFeature2 => 'Nouveau module Conseiller de carrière';

  @override
  String get updateFeature3 => 'Contraste amélioré en mode sombre';

  @override
  String get updateFeature4 =>
      'Corrections de bugs et améliorations de la stabilité';

  @override
  String get loadingSubtitle =>
      'Cela ne prend généralement que quelques secondes';

  @override
  String get howToUseStep1Title => 'Définissez votre décision';

  @override
  String get howToUseStep1Body =>
      'Commencez par décrire votre décision, votre catégorie et ce qui compte le plus pour vous.';

  @override
  String get howToUseStep2Title => 'Analysez vos options';

  @override
  String get howToUseStep2Body =>
      'Répondez à des questions guidées sur les objectifs, l’urgence, le budget et la tolérance au risque.';

  @override
  String get howToUseStep3Title => 'Examiner les résultats de l\'IA';

  @override
  String get howToUseStep3Body =>
      'Consultez votre recommandation, votre score de risque, vos avantages et vos inconvénients, ainsi qu\'un plan d\'action étape par étape.';

  @override
  String get howToUseStep4Title => 'Enregistrez et suivez les progrès';

  @override
  String get howToUseStep4Body =>
      'Enregistrez les décisions dans l’historique et revisitez les informations chaque fois que vous avez besoin de conseils.';

  @override
  String get clientSelectionLeading => 'Client';

  @override
  String get clientSelectionAccent => 'Sélection';

  @override
  String get whichClientQuestion => 'À quel client devriez-vous dire oui ?';

  @override
  String get clientSelectionSubtitle =>
      'L\'IA évalue les opportunités clients en fonction de l\'adéquation, des frais et du risque.';

  @override
  String get freelancePricingLeading => 'Free-lance';

  @override
  String get freelancePricingAccent => 'Tarifs';

  @override
  String get recommendedPrice => 'Prix ​​conseillé';

  @override
  String get pricingScore => 'Note de prix';

  @override
  String get priceComparison => 'Comparaison des prix';

  @override
  String get priceDrivers => 'Facteurs de prix';

  @override
  String get marketRate => 'Taux du marché';

  @override
  String get experienceLabel => 'Expérience';

  @override
  String get timelineLabel => 'Chronologie';

  @override
  String get complexityLabel => 'Complexité';

  @override
  String get projectValue => 'Valeur du projet';

  @override
  String get sendProposal => 'Envoyer une proposition';

  @override
  String get proposalSent => 'Proposition envoyée au client.';

  @override
  String get productivityLeading => 'Productivité';

  @override
  String get productivityAccent => 'Planificateur';

  @override
  String get eisenhowerPriority => 'Priorité d\'Eisenhower';

  @override
  String get startFocusBlock => 'Démarrer le bloc de focus';

  @override
  String get focusBlockStarted =>
      'Le bloc de focus a commencé – bonne chance !';

  @override
  String get careerAdvisorLeading => 'Carrière';

  @override
  String get careerAdvisorAccent => 'Conseiller';

  @override
  String get careerFitScore => 'Score d’adéquation à la carrière';

  @override
  String get topPathProductManager => 'Voie supérieure : chef de produit';

  @override
  String get skillMatch => 'Correspondance des compétences';

  @override
  String get strategyLabel => 'Stratégie';

  @override
  String get communicationLabel => 'Communication';

  @override
  String get analyticsLabel => 'Analytique';

  @override
  String get technicalLabel => 'Technique';

  @override
  String get build90DayPlan => 'Construire un plan de 90 jours';

  @override
  String get businessIdeaLeading => 'Entreprise';

  @override
  String get businessIdeaAccent => 'Idée';

  @override
  String get describeBusinessIdea => 'Décrivez votre idée d\'entreprise';

  @override
  String get businessIdeaSubtitle =>
      'L’IA évaluera la viabilité, l’adéquation au marché et le risque.';

  @override
  String get viabilityScore => 'Score de viabilité';

  @override
  String get scoreBreakdown => 'Répartition des scores';

  @override
  String get aiVerdict => 'Verdict de l\'IA';

  @override
  String get fullPlanGenerated => 'Plan complet généré et enregistré.';

  @override
  String get financialCalcLeading => 'Financier';

  @override
  String get financialCalcAccent => 'Calculatrice';

  @override
  String get compoundGrowth => 'Croissance composée';

  @override
  String get futureValue => 'Valeur future';

  @override
  String get saveToDecisions => 'Enregistrer dans les décisions';

  @override
  String get saveDecisionLeading => 'Sauvegarder';

  @override
  String get saveDecisionAccent => 'Décision';

  @override
  String get decisionSaved => 'Décision enregistrée.';

  @override
  String get folderLabel => 'Dossier';

  @override
  String get folderDefault => 'Défaut';

  @override
  String get folderCareer => 'Carrière';

  @override
  String get folderFinance => 'Finance';

  @override
  String get folderHealth => 'Santé';

  @override
  String get folderPersonal => 'Personnel';

  @override
  String get reportExportLeading => 'Exporter';

  @override
  String get reportExportAccent => 'Rapport';

  @override
  String get exportReport => 'Exporter le rapport';

  @override
  String get shareReport => 'Partager le rapport';

  @override
  String get subscriptionLeading => 'Choisissez votre';

  @override
  String get subscriptionAccent => 'Plan';

  @override
  String get mostPopular => 'Les plus populaires';

  @override
  String get freeTrial => 'Essai gratuit de 7 jours';

  @override
  String get upgradePremium => 'Passer à Premium';

  @override
  String get choosePlan => 'Choisissez un forfait';

  @override
  String get paymentSuccessful => 'Paiement réussi !';

  @override
  String get thankYouUpgrade => 'Merci d\'être passé à Premium.';

  @override
  String get goToDashboard => 'Aller au tableau de bord';

  @override
  String get paymentDetails => 'Détails du paiement';

  @override
  String get payNow => 'Payez maintenant';

  @override
  String get cardNumber => 'Numéro de carte';

  @override
  String get nameOnCard => 'Nom sur la carte';

  @override
  String get premiumFeatures => 'Fonctionnalités premium';

  @override
  String get faqSearchHint => 'Rechercher dans la FAQ';

  @override
  String get topicAll => 'Tous';

  @override
  String get topicGettingStarted => 'Commencer';

  @override
  String get topicAi => 'IA';

  @override
  String get topicBilling => 'Facturation';

  @override
  String get topicAccount => 'Compte';

  @override
  String get tabAll => 'Tous';

  @override
  String get tabUnread => 'Non lu';

  @override
  String get tabArchived => 'Archivé';

  @override
  String get noArchivedItems => 'Aucun élément archivé';

  @override
  String get traitRiskTolerance => 'Tolérance au risque';

  @override
  String get budgetWhyMatters =>
      'Le budget aide l\'IA à peser les compromis financiers dans votre recommandation.';

  @override
  String get timeWhyMatters =>
      'Le temps disponible détermine l’ambition de votre plan d’action.';

  @override
  String get experienceWhyMatters =>
      'Le niveau d’expérience aide l’IA à calibrer les conseils en fonction de votre expérience.';

  @override
  String get riskWhyMatters =>
      'La tolérance au risque détermine le degré de prudence ou d’audace de votre recommandation.';

  @override
  String get urgencyWhyMatters =>
      'L’urgence affecte la rapidité avec laquelle vous devez donner suite à la recommandation.';

  @override
  String get confidenceReliableRecommend =>
      'Recommandation généralement fiable';

  @override
  String get confidenceReliableSomeRisks =>
      'Généralement fiable avec certains risques';

  @override
  String get confidenceConsiderRisks => 'Considérez attentivement les risques';

  @override
  String get confidenceHighUncertainty =>
      'Forte incertitude – procédez avec prudence';

  @override
  String get stepResults => 'Résultats';

  @override
  String get urgencyNoRush => 'Pas de précipitation';

  @override
  String get urgencyModerate => 'Modéré';

  @override
  String get urgencyUrgent => 'Urgent';

  @override
  String get urgencyCritical => 'Critique';

  @override
  String get experienceBeginner => 'Débutant';

  @override
  String get experienceIntermediate => 'Intermédiaire';

  @override
  String get experienceAdvanced => 'Avancé';

  @override
  String get experienceExpert => 'Expert';

  @override
  String get timeVeryLimited => 'Très limité';

  @override
  String get timeLimited => 'Limité';

  @override
  String get timeModerateAvail => 'Modéré';

  @override
  String get timeHighAvail => 'Haut';

  @override
  String get timeVeryHigh => 'Très élevé';

  @override
  String get riskToleranceLow => 'Faible';

  @override
  String get riskToleranceModerate => 'Modéré';

  @override
  String get riskToleranceHigh => 'Haut';

  @override
  String get riskToleranceVeryHigh => 'Très élevé';

  @override
  String get doNow => 'Fais maintenant';

  @override
  String get doToday => 'Faire aujourd\'hui';

  @override
  String get scheduleLabel => 'Calendrier';

  @override
  String get deleteLabel => 'Supprimer';

  @override
  String get tipLabel => 'Conseil';

  @override
  String get aiRecommendation => 'Recommandation IA';

  @override
  String get comparisonMenu => 'Comparaison';

  @override
  String get clientSelectionVerdictBody =>
      'Acme est la solution la plus adaptée – dites oui. Client mystère : refusez poliment ; de vagues mémoires prédisent une dérive de la portée.';

  @override
  String get freelancePricingSubtitle =>
      'Recommandations de tarifs basées sur l\'IA';

  @override
  String get priceLower => 'Inférieur';

  @override
  String get priceRecommended => 'Recommandé';

  @override
  String get priceHigher => 'Plus haut';

  @override
  String get freelancePricingRecommendationBody =>
      'Prix ​​à 2 800\$ pour gagner ce client avec une marge saine. S’ils repoussent, fixez-vous sur la portée plutôt que de baisser les prix.';

  @override
  String get productivitySubtitle =>
      'L\'IA détermine ce qu\'il faut faire maintenant, ce qu\'il faut planifier et ce qu\'il faut abandonner.';

  @override
  String get productivityTipBody =>
      'If everything is urgent, nothing is. Choisissez 1 à 2 éléments à faire maintenant et protégez-les comme des réunions.';

  @override
  String get careerAdvisorDescription =>
      'Forte adéquation basée sur vos compétences, votre style de communication et votre intérêt pour le développement.';

  @override
  String get nextSteps => 'Prochaines étapes';

  @override
  String get careerAdvisorNextStepsBody =>
      'Diriger une petite initiative interfonctionnelle ce trimestre pour établir un historique de style PM.';

  @override
  String get excellent => 'Excellent';

  @override
  String get good => 'Bien';

  @override
  String get businessIdeaHint =>
      'Par exemple, une boîte d\'abonnement pour les plantes d\'intérieur avec des rappels d\'entretien IA';

  @override
  String get marketSize => 'Taille du marché';

  @override
  String get competition => 'Concours';

  @override
  String get profitability => 'Rentabilité';

  @override
  String get executionEase => 'Facilité d\'exécution';

  @override
  String get large => 'Grand';

  @override
  String get businessIdeaVerdictBody =>
      'Strong concept with a clear audience. Concentrez-vous les 90 premiers jours sur l’acquisition de 20 clients payants avant de développer le marketing.';

  @override
  String get generateFullPlan => 'Générer un plan complet';

  @override
  String get financialCalcSubtitle =>
      'Voyez combien votre argent augmente au fil du temps.';

  @override
  String get financialInitialAmount => 'Montant initial (\$)';

  @override
  String get financialAnnualRate => 'Taux annuel (%)';

  @override
  String get financialDuration => 'Durée (années)';

  @override
  String get financialCalcTipBody =>
      'Même de petites cotisations mensuelles sont supérieures aux dépôts ponctuels importants sur un horizon de plus de 10 ans.';

  @override
  String get saveDecisionNotesHint =>
      'Tout ce dont vous voulez vous souvenir à propos de cette décision';

  @override
  String get reportExportSubtitle =>
      'Enregistrez ou partagez votre rapport de décision';

  @override
  String get completed => 'Complété';

  @override
  String get goAhead => 'Poursuivre';

  @override
  String get includeInReport => 'Inclure dans le rapport';

  @override
  String get executiveSummary => 'Résumé exécutif';

  @override
  String get analysisDetails => 'Détails de l\'analyse';

  @override
  String get notesAndInputs => 'Notes et entrées';

  @override
  String get exportFormat => 'Format d\'exportation';

  @override
  String get pdfBestForSharing => 'Idéal pour le partage';

  @override
  String get excelDataScores => 'Données et scores';

  @override
  String get wordDocument => 'Document';

  @override
  String get imageJpgPng => 'JPG/PNG';

  @override
  String get shareOrSave => 'Partager ou Enregistrer';

  @override
  String get shareLink => 'Partager le lien';

  @override
  String get createShareableLink => 'Créer un lien partageable';

  @override
  String get emailReport => 'Rapport par courrier électronique';

  @override
  String get sendViaEmail => 'Envoyer par email';

  @override
  String get saveToDevice => 'Enregistrer sur l\'appareil';

  @override
  String get downloadToDevice => 'Télécharger sur l\'appareil';

  @override
  String get scheduleAutoReports => 'Planifier des rapports automatiques';

  @override
  String exportedAs(String format) {
    return 'Exporté sous $format';
  }

  @override
  String get subscriptionSubtitle =>
      'Prenez des décisions plus judicieuses avec le plan qui vous convient';

  @override
  String get makeSmarterDecisions => 'Prenez des décisions plus intelligentes';

  @override
  String get subscriptionHeroBody =>
      'Bénéficiez d’analyses IA illimitées, d’informations approfondies et de recommandations personnalisées.';

  @override
  String get planBasic => 'Basique';

  @override
  String get planPremium => 'Prime';

  @override
  String get planPro => 'Pro';

  @override
  String get perMonth => '/mois';

  @override
  String get allPlansInclude => 'Tous les forfaits incluent';

  @override
  String get moneyBackGuarantee => 'Garantie de remboursement de 7 jours';

  @override
  String get moneyBackGuaranteeBody =>
      'Pas satisfait ? Obtenez un remboursement complet dans les 7 jours.';

  @override
  String get subscribeTermsNote =>
      'En vous abonnant, vous acceptez nos conditions et notre politique de confidentialité.';

  @override
  String get securePaymentEncryption =>
      'Paiement sécurisé avec cryptage conforme aux normes de l\'industrie';

  @override
  String get paymentLeading => 'Paiement';

  @override
  String get paymentAccent => 'Détails';

  @override
  String get premiumMonthly => 'Prime • Mensuelle';

  @override
  String get taxEstimate => 'Estimation fiscale';

  @override
  String get totalToday => 'Total aujourd\'hui';

  @override
  String get paymentMethod => 'Mode de paiement';

  @override
  String get paymentCard => 'Carte';

  @override
  String get paymentPayPal => 'Paypal';

  @override
  String get paymentGooglePay => 'Google Payer';

  @override
  String get paymentApplePay => 'Apple Payer';

  @override
  String get cardExpiryHint => 'MM/AA';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'Chiffré de bout en bout. We never store your card.';

  @override
  String get premiumFeaturesLeading => 'Prime';

  @override
  String get premiumFeaturesAccent => 'Caractéristiques';

  @override
  String get premiumUnlockSubtitle =>
      'Libérez toute la puissance de Life Navigator';

  @override
  String get premiumFeature1Title => 'Analyse IA illimitée';

  @override
  String get premiumFeature1Body =>
      'Exécutez autant de décisions que nécessaire.';

  @override
  String get premiumFeature2Title => 'Informations approfondies';

  @override
  String get premiumFeature2Body =>
      'Graphiques de risque, de confiance, de résultat et d’impact.';

  @override
  String get premiumFeature3Title => 'Comparez les décisions';

  @override
  String get premiumFeature3Body => 'Voir les décisions côte à côte.';

  @override
  String get premiumFeature4Title => 'Exporter des rapports';

  @override
  String get premiumFeature4Body => 'Exportations PDF, Word, Excel et images.';

  @override
  String get premiumFeature5Title => 'Synchronisation dans le cloud';

  @override
  String get premiumFeature5Body => 'Sauvegarde sécurisée sur le cloud.';

  @override
  String get premiumFeature6Title => 'Assistance prioritaire';

  @override
  String get premiumFeature6Body => 'Réponse dans les 24 heures.';

  @override
  String get paymentSuccessLeading => 'Paiement';

  @override
  String get paymentSuccessAccent => 'Réussi!';

  @override
  String get youNowHaveAccessTo => 'Vous avez désormais accès à';

  @override
  String get planLabel => 'Plan';

  @override
  String get amountLabel => 'Montant';

  @override
  String get methodLabel => 'Méthode';

  @override
  String get transactionIdLabel => 'ID de transaction';

  @override
  String get unlimitedAi => 'IA illimitée';

  @override
  String get deepInsightsShort => 'Informations approfondies';

  @override
  String get compareShort => 'Comparer';

  @override
  String get exportsShort => 'Exportations';

  @override
  String get cloudSyncShort => 'Synchronisation dans le cloud';

  @override
  String get prioritySupportShort => 'Assistance prioritaire';

  @override
  String get privacyLeading => 'Confidentialité';

  @override
  String get privacyAccent => 'Politique';

  @override
  String get privacyLastUpdated => 'Dernière mise à jour : 18 mai 2026';

  @override
  String get privacySection1Title => 'Ce que nous collectons';

  @override
  String get privacySection1Body =>
      'Nous collectons uniquement ce que vous nous fournissez : les décisions que vous enregistrez, les détails de votre compte (nom + e-mail) et vos préférences. Tout le reste reste sur votre appareil.';

  @override
  String get privacySection2Title => 'Comment nous l\'utilisons';

  @override
  String get privacySection2Body =>
      'Pour personnaliser les recommandations de l\'IA, synchronisez vos données si vous le souhaitez et améliorez l\'application. Nous ne vendons jamais vos données à des tiers.';

  @override
  String get privacySection3Title => 'Stockage local d\'abord';

  @override
  String get privacySection3Body =>
      'Vos décisions sont stockées sur votre appareil par défaut. La synchronisation cloud est facultative et chiffrée en transit et au repos.';

  @override
  String get privacySection4Title => 'Vos droits';

  @override
  String get privacySection4Body =>
      'Vous pouvez exporter ou supprimer toutes vos données à tout moment depuis les paramètres. Nous répondons aux demandes de données dans les 7 jours.';

  @override
  String get privacySection5Title => 'Enfants';

  @override
  String get privacySection5Body =>
      'AI Life Navigator n\'est pas destiné aux enfants de moins de 13 ans. Nous ne collectons pas sciemment de données auprès des enfants.';

  @override
  String get privacySection6Title => 'Contactez-nous';

  @override
  String get privacySection6Body =>
      'Des questions ou des préoccupations ? Envoyez un e-mail à Privacy@lifenavigator.app et nous vous répondrons dans les deux jours ouvrables.';

  @override
  String get termsLeading => 'Conditions de';

  @override
  String get termsAccent => 'Service';

  @override
  String get termsLastUpdated => 'Dernière mise à jour : 18 mai 2026';

  @override
  String get termsSection1Title => '1. Acceptation';

  @override
  String get termsSection1Body =>
      'En utilisant AI Life Navigator, vous acceptez ces conditions. Si vous n\'êtes pas d\'accord, veuillez ne pas utiliser l\'application.';

  @override
  String get termsSection2Title => '2. Compte';

  @override
  String get termsSection2Body =>
      'Vous êtes responsable de la sécurité de votre compte. Ne partagez pas vos informations d\'identification.';

  @override
  String get termsSection3Title => '3. Recommandations en matière d\'IA';

  @override
  String get termsSection3Body =>
      'Les résultats de l’IA sont des conseils et non des conseils professionnels. Vous êtes responsable des décisions que vous prenez sur cette base.';

  @override
  String get termsSection4Title => '4. Abonnements';

  @override
  String get termsSection4Body =>
      'Les forfaits Premium se renouvellent automatiquement jusqu\'à leur annulation. Vous pouvez annuler à tout moment depuis votre compte magasin.';

  @override
  String get termsSection5Title => '5. Utilisation acceptable';

  @override
  String get termsSection5Body =>
      'Pas de contenu abusif, pas de rétro-ingénierie, pas de scraping. Les violations peuvent entraîner la suspension du compte.';

  @override
  String get termsSection6Title => '6. Limitation de responsabilité';

  @override
  String get termsSection6Body =>
      'Dans la mesure permise par la loi, notre responsabilité est limitée au montant que vous nous avez payé au cours des 12 mois précédents.';

  @override
  String get termsSection7Title => '7. Modifications';

  @override
  String get termsSection7Body =>
      'Nous pouvons mettre à jour ces conditions. Nous vous informerons des changements importants via une notification dans l\'application ou par e-mail.';

  @override
  String get faqQ1 => 'Comment démarrer une nouvelle décision ?';

  @override
  String get faqA1 =>
      'Appuyez sur la carte « Démarrer une nouvelle analyse » sur l\'écran d\'accueil, donnez un titre à votre décision et suivez les étapes guidées.';

  @override
  String get faqQ2 => 'Mes données sont-elles privées ?';

  @override
  String get faqA2 =>
      'Oui. Les décisions sont stockées localement sur votre appareil par défaut. La synchronisation cloud est facultative et cryptée.';

  @override
  String get faqQ3 => 'Quelle est la précision de l’IA ?';

  @override
  String get faqA3 =>
      'L’IA fournit des orientations structurées et non des conseils professionnels. Utilisez-le comme aide à la réflexion parallèlement à votre propre jugement.';

  @override
  String get faqQ4 => 'L\'IA peut-elle accéder à mes conversations ?';

  @override
  String get faqA4 =>
      'Non. Seules les entrées que vous soumettez dans le flux de décision sont utilisées. Rien d\'autre de votre appareil n\'est lu.';

  @override
  String get faqQ5 => 'Comment résilier mon abonnement ?';

  @override
  String get faqA5 =>
      'Annulez à tout moment depuis la page d\'abonnement App Store / Google Play. L\'accès se poursuit jusqu\'à la fin de la période.';

  @override
  String get faqQ6 => 'Proposez-vous des remboursements ?';

  @override
  String get faqA6 =>
      'Oui, dans les 7 jours suivant votre premier achat. Envoyez un e-mail à support@lifenavigator.app.';

  @override
  String get faqQ7 => 'Comment supprimer mon compte ?';

  @override
  String get faqA7 =>
      'Paramètres → Compte → Supprimer le compte. Toutes vos données sont supprimées dans les 30 jours.';

  @override
  String get faqQ8 => 'Puis-je exporter mes décisions ?';

  @override
  String get faqA8 =>
      'Oui. Ouvrez n\'importe quelle décision enregistrée et appuyez sur Exporter le rapport pour le télécharger au format PDF, Word, Excel ou image.';

  @override
  String get notificationsLeading => 'Notification';

  @override
  String get notificationsAccent => 'cations';

  @override
  String get decisionTextRiskFallback =>
      'Exécutez une analyse complète pour obtenir des conseils personnalisés de réduction des risques.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'Your overall risk level is $label ($score%). Consultez la répartition ci-dessous pour comprendre ce qui détermine ce score.';
  }

  @override
  String get urgencyNoRushSub =>
      'Prenez le temps de chercher et de comparer les options.';

  @override
  String get urgencyNoRushTag => 'Calendrier flexible';

  @override
  String get urgencyModerateSub => 'Décidez dans les prochaines semaines.';

  @override
  String get urgencyModerateTag => 'Quelques semaines';

  @override
  String get urgencyUrgentSub =>
      'Vous avez besoin d\'une décision d\'ici quelques jours.';

  @override
  String get urgencyUrgentTag => 'Dans quelques jours';

  @override
  String get urgencyCriticalSub => 'Une action immédiate est requise.';

  @override
  String get urgencyCriticalTag => 'Immédiat';

  @override
  String get urgencyWhyMattersDesc =>
      'L\'urgence influe sur les facteurs auxquels l\'IA accorde plus d\'importance : décisions rapides et signaux clairs.';

  @override
  String get budgetRange1 => '1k € - 5k €';

  @override
  String get budgetRange2 => '5k € - 20k €';

  @override
  String get budgetRange3 => '20k € - 50k €';

  @override
  String get budgetRange4 => '50k € +';

  @override
  String get budgetWhyMattersDesc =>
      'Votre budget aide l\'IA à évaluer les options et à vous recommander des solutions rentables.';

  @override
  String get riskToleranceLowSub =>
      'Préfère des résultats stables et prévisibles.';

  @override
  String get riskToleranceLowTag => 'Stable & sûr';

  @override
  String get riskToleranceModerateSub => 'Accepte des compromis équilibrés.';

  @override
  String get riskToleranceModerateTag => 'Risque équilibré';

  @override
  String get riskToleranceHighSub =>
      'Ouvert à des variations plus importantes pour plus de gains.';

  @override
  String get riskToleranceHighTag => 'Axé sur la croissance';

  @override
  String get riskToleranceVeryHighSub =>
      'À l\'aise avec une incertitude majeure.';

  @override
  String get riskToleranceVeryHighTag => 'Gain maximal';

  @override
  String get riskWhyMattersDesc =>
      'La tolérance au risque aide l\'IA à équilibrer les récompenses potentielles par rapport aux inconvénients possibles.';

  @override
  String get experienceBeginnerSub =>
      'Nouveau dans ce domaine ; en cours d\'acquisition de connaissances.';

  @override
  String get experienceBeginnerTag => 'Idéal pour apprendre';

  @override
  String get experienceIntermediateSub =>
      'Une certaine expérience et un contexte pertinents.';

  @override
  String get experienceIntermediateTag => 'Options équilibrées';

  @override
  String get experienceAdvancedSub => 'Solide expérience dans ce domaine.';

  @override
  String get experienceAdvancedTag => 'Axé sur la croissance';

  @override
  String get experienceExpertSub =>
      'Expertise approfondie et expérience avérée.';

  @override
  String get experienceExpertTag => 'Résultats maximaux';

  @override
  String get experienceWhyMattersDesc =>
      'Votre niveau d\'expérience aide l\'IA à personnaliser la complexité et la profondeur des recommandations.';

  @override
  String get timeVeryLimitedSub =>
      'Seulement quelques heures par semaine de disponibles.';

  @override
  String get timeVeryLimitedTag => 'Heures minimales';

  @override
  String get timeLimitedSub => 'Quelques soirées ou week-ends libres.';

  @override
  String get timeLimitedTag => 'Objectif à temps partiel';

  @override
  String get timeModerateAvailSub => 'Un temps régulier chaque semaine.';

  @override
  String get timeModerateAvailTag => 'Engagement régulier';

  @override
  String get timeHighAvailSub =>
      'Peut consacrer des heures hebdomadaires importantes.';

  @override
  String get timeHighAvailTag => 'Forte disponibilité';

  @override
  String get timeVeryHighSub =>
      'Cela peut être votre objectif principal maintenant.';

  @override
  String get timeVeryHighTag => 'Plein focus';

  @override
  String get timeWhyMattersDesc =>
      'Votre disponibilité de temps aide l\'IA à recommander des plans réalistes que vous pouvez suivre.';
}
