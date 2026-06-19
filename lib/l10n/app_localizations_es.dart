// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Navegador de vida AI';

  @override
  String get navHome => 'Inicio';

  @override
  String get navChatbot => 'Chat IA';

  @override
  String get navInsights => 'Perspectivas';

  @override
  String get navHistory => 'Historia';

  @override
  String get continueButton => 'Continuar';

  @override
  String get nextButton => 'Siguiente';

  @override
  String get backButton => 'Atrás';

  @override
  String get saveButton => 'Ahorrar';

  @override
  String get analyzeButton => 'Analizar';

  @override
  String get tryAgain => 'Intentar otra vez';

  @override
  String get viewAll => 'Ver todo';

  @override
  String get searchHint => 'Buscar...';

  @override
  String get selectLanguage => 'Seleccionar';

  @override
  String get languageWord => 'Idioma';

  @override
  String get searchLanguageHint => 'Buscar idioma aquí...';

  @override
  String get noLanguagesFound => 'No se encontraron idiomas';

  @override
  String get settings => 'Ajustes';

  @override
  String get accountSettings => 'Configuración de cuenta';

  @override
  String get languages => 'Idiomas';

  @override
  String get theme => 'Tema';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get privacyPolicy => 'política de privacidad';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get helpSupport => 'Ayuda y soporte';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get welcomeBack => '¡Bienvenido de nuevo!';

  @override
  String get emailAddress => 'Dirección de correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get forgotPassword => '¿Has olvidado tu contraseña?';

  @override
  String get rememberMe => 'Acuérdate de mí';

  @override
  String goodMorning(String name) {
    return 'Buenos días, $name 👋';
  }

  @override
  String get homeSubtitle =>
      'Obtenga orientación basada en IA para su próxima decisión importante.';

  @override
  String get startNewAnalysis => 'Iniciar nuevo análisis';

  @override
  String get startAnalysisSubtitle =>
      'Inicie un análisis guiado y reciba una recomendación personalizada.';

  @override
  String get decisionOverview => 'Resumen de decisiones';

  @override
  String get riskScore => 'Puntuación de riesgo';

  @override
  String get successChance => 'Oportunidad de éxito';

  @override
  String get activePlans => 'Planes Activos';

  @override
  String get inProgress => 'En curso';

  @override
  String get recentInsights => 'Perspectivas recientes';

  @override
  String get stepDefine => 'Definir';

  @override
  String get stepAnalyze => 'Analizar';

  @override
  String get stepQuestions => 'Preguntas';

  @override
  String get stepResult => 'Resultado';

  @override
  String get defineYourProblem => 'Defina su';

  @override
  String get problemWord => 'Problema';

  @override
  String get tellUsMore => 'Cuéntanos más sobre tu decisión';

  @override
  String get wizardHint =>
      'Cuantos más detalles proporciones, mejor podrá analizarte y guiarte nuestra IA.';

  @override
  String get describeDecision => 'Describe tu decisión';

  @override
  String get quickTips => 'Consejos rápidos';

  @override
  String get beSpecific => 'Sea específico';

  @override
  String get includeContext => 'Incluir contexto';

  @override
  String get mentionGoal => 'Mencionar objetivo';

  @override
  String get choosingBetween => '¿Entre qué estás eligiendo?';

  @override
  String get optionsHint =>
      'Enumere hasta 5 opciones. La IA comparará cada uno con tus objetivos.';

  @override
  String get addAnotherOption => 'Agregar otra opción';

  @override
  String get continueToAnalysis => 'Continuar al análisis';

  @override
  String get aiQuestionsTitle => 'AI';

  @override
  String get questionsWord => 'Preguntas';

  @override
  String get preparingQuestions => 'Preparando preguntas personalizadas…';

  @override
  String basedOnDecision(String title) {
    return 'Según su decisión: $title';
  }

  @override
  String get basedOnWizard => 'Según lo que compartiste en el asistente';

  @override
  String get aiNavigator => 'Navegador de vida AI';

  @override
  String get aiQuestionsHint =>
      'Responda honestamente: sus respuestas dan forma al análisis de la IA.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'La IA generó estas preguntas específicamente para \"$title\".';
  }

  @override
  String questionOf(int current, int total) {
    return 'Pregunta $current de $total';
  }

  @override
  String get whyThisMatters => '¿Por qué esto importa?';

  @override
  String get whyQuestionsMatter =>
      'Tus respuestas ayudan a la IA a centrarse en lo que es más relevante para tu situación.';

  @override
  String get securePrivate => 'Tus datos son seguros y privados';

  @override
  String get processingAnalyzing => 'Analizando tus opciones...';

  @override
  String get processingRisk => 'Calculando los factores de riesgo...';

  @override
  String get processingOutcomes => 'Predecir resultados...';

  @override
  String get processingPlan => 'Plan de acción de construcción...';

  @override
  String get processingFinalizing => 'Resultado final';

  @override
  String get decisionResult => 'Decisión';

  @override
  String get resultWord => 'Resultado';

  @override
  String get recommendedChoice => 'Elección recomendada';

  @override
  String get benefitScore => 'Puntuación de beneficios';

  @override
  String get confidence => 'Confianza';

  @override
  String get fitScore => 'Puntuación de ajuste';

  @override
  String get resultBreakdown => 'Desglose de resultados';

  @override
  String get finalRecommendation => 'Recomendación final';

  @override
  String get outcomePrediction => 'Predicción de resultados';

  @override
  String get confidenceMeter => 'Medidor de confianza';

  @override
  String get actionPlan => 'Plan de acción';

  @override
  String get prosCons => 'Pros y contras';

  @override
  String get tipFromAi => 'Consejo de la IA';

  @override
  String get saveReport => 'Guardar informe';

  @override
  String get startNewDecision => 'Iniciar nueva decisión';

  @override
  String get decisionWord => 'Decisión';

  @override
  String get comparisonWord => 'Comparación';

  @override
  String get whyRecommended => '¿Por qué se recomienda esto?';

  @override
  String get riskBreakdown => 'Desglose de riesgos';

  @override
  String get riskInterpretation => 'Interpretación de riesgos';

  @override
  String get howToImprove => 'Cómo mejorar';

  @override
  String get overallConfidence => 'Confianza general';

  @override
  String get confidenceBreakdown => 'Ruptura de confianza';

  @override
  String get successLikelihood => 'Probabilidad de éxito';

  @override
  String get outcomeBreakdown => 'Desglose de resultados';

  @override
  String get keyOutcomeFactors => 'Factores clave de resultado';

  @override
  String get prosTitle => 'Ventajas de esta decisión';

  @override
  String get consTitle => 'Contras de esta decisión';

  @override
  String get overallProsCons => 'Pros y contras generales';

  @override
  String get bestOverallFit => 'Mejor ajuste general';

  @override
  String get bestOverallChoice => 'La mejor elección general';

  @override
  String get recommendedChoiceLabel => 'Elección recomendada';

  @override
  String get yourActionPlan => 'Tu plan de acción';

  @override
  String get aiInsight => 'Información de IA';

  @override
  String get keyComparison => 'Comparación clave';

  @override
  String get overallScore => 'Puntuación general';

  @override
  String get keyPoints => 'Puntos clave';

  @override
  String get analysisFailed =>
      'El análisis falló. Verifique su clave de Internet y API.';

  @override
  String get missingApiKey =>
      'Falta GEMINI_API_KEY. Agréguelo a .env y reinicie la aplicación.';

  @override
  String get noDescription => 'No se proporciona descripción.';

  @override
  String get history => 'Historia';

  @override
  String get about => 'Acerca de';

  @override
  String get profile => 'Perfil';

  @override
  String get editProfile => 'Editar perfil';

  @override
  String get low => 'Bajo';

  @override
  String get medium => 'Medio';

  @override
  String get high => 'Alto';

  @override
  String get lowRisk => 'Bajo riesgo';

  @override
  String get mediumRisk => 'Riesgo medio';

  @override
  String get highRisk => 'Alto riesgo';

  @override
  String get notAssessed => 'No evaluado';

  @override
  String get couldNotLoadQuestions => 'No se pudieron cargar las preguntas';

  @override
  String get noQuestionsGenerated => 'No se generaron preguntas.';

  @override
  String get onboardingTitle1 => 'Tome decisiones más inteligentes con IA';

  @override
  String get onboardingSubtitle1 =>
      'Obtenga orientación personalizada para las decisiones importantes de la vida.';

  @override
  String get onboardingTitle2 => 'Analizar riesgos y resultados';

  @override
  String get onboardingSubtitle2 =>
      'Comprenda las compensaciones antes de comprometerse.';

  @override
  String get onboardingTitle3 => 'Siga un plan de acción claro';

  @override
  String get onboardingSubtitle3 =>
      'Convierta los conocimientos en próximos pasos prácticos.';

  @override
  String get getStarted => 'Empezar';

  @override
  String get skip => 'Omitir';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get lightMode => 'Modo de luz';

  @override
  String get systemDefault => 'Valor predeterminado del sistema';

  @override
  String get generalSettings => 'Configuraciones generales';

  @override
  String get support => 'Apoyo';

  @override
  String get legal => 'Legal';

  @override
  String get languageChanged => 'Idioma actualizado';

  @override
  String get yourOptions => 'Tus opciones';

  @override
  String get recommended => 'Recomendado';

  @override
  String get compareOptions => 'Comparar opciones';

  @override
  String get plan => 'Plan';

  @override
  String get prepare => 'Preparar';

  @override
  String get execute => 'Ejecutar';

  @override
  String get positiveOutcome => 'Resultado positivo';

  @override
  String get neutralOutcome => 'Resultado neutral';

  @override
  String get negativeOutcome => 'Resultado negativo';

  @override
  String get overallRiskScore => 'Puntuación de riesgo general';

  @override
  String get yourDecisionRiskLevel => 'Su nivel de riesgo de decisión';

  @override
  String get overallPrediction => 'Predicción general';

  @override
  String get overallProsConsTitle => 'Pros y contras generales';

  @override
  String get emptyHistory => 'Aún no hay decisiones guardadas';

  @override
  String get startFirstDecision => 'Comience su primer análisis de decisión';

  @override
  String get chatbotTitle => 'Chatbot de IA';

  @override
  String get insightsTitle => 'Perspectivas';

  @override
  String get dailySuggestion => 'Sugerencia diaria';

  @override
  String get aboutTagline =>
      'Soporte de decisiones inteligente impulsado por IA: evalúe opciones, riesgos y próximos pasos.';

  @override
  String get aboutBody =>
      'AI Life Navigator lo ayuda a tomar decisiones de vida y carrera con preguntas estructuradas, análisis de riesgos y planes de acción claros.';

  @override
  String get personalInformation => 'Información personal';

  @override
  String get appSetting => 'Configuración de la aplicación';

  @override
  String get securityPrivacy => 'Seguridad y privacidad';

  @override
  String get aboutUs => 'Sobre nosotros';

  @override
  String get howToUse => 'Cómo utilizar';

  @override
  String get appTheme => 'Tema de la aplicación';

  @override
  String get shareApp => 'Compartir';

  @override
  String get rateUs => 'Califícanos';

  @override
  String get pleaseAddOption => 'Por favor agregue al menos una opción';

  @override
  String get noReportToSave => 'No hay informe de decisión para guardar.';

  @override
  String get reportSaved => 'Informe guardado en Historial.';

  @override
  String get pendingAnalysis => 'Análisis pendiente';

  @override
  String get untitledDecision => 'Decisión sin título';

  @override
  String get describeDecisionHint =>
      'Describe tu situación, tus limitaciones y cómo se ve el éxito.';

  @override
  String optionLabel(String letter) {
    return 'Opción $letter';
  }

  @override
  String get goodChance => 'Buena oportunidad';

  @override
  String get fairChance => 'Oportunidad justa';

  @override
  String get poorChance => 'Poca probabilidad';

  @override
  String get couldNotPrepareQuestions =>
      'No se pudieron preparar las preguntas. Por favor inténtalo de nuevo.';

  @override
  String get greetingFallbackName => 'allá';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta?';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get welcome => '¡Bienvenido!';

  @override
  String get orContinueWith => 'o continuar con';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'Vida';

  @override
  String get navigator => 'Navegador';

  @override
  String get authTagline => 'Asistente de toma de decisiones de IA';

  @override
  String get chatbotReadySubtitle => 'Listo para navegar tu vida';

  @override
  String get chatbotInputHint => 'Inicie su chat aquí...';

  @override
  String get chatbotErrorMessage =>
      'Lo siento, no pude comunicarme con el servicio de IA. Por favor verifique su conexión e inténtelo nuevamente.';

  @override
  String get selectAll => 'Seleccionar todo';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete => 'Seleccione decisiones para eliminar.';

  @override
  String get total => 'Total';

  @override
  String get highScore => 'Puntuación alta';

  @override
  String get justNow => 'En este momento';

  @override
  String minutesAgo(int count) {
    return '$count hace minutos';
  }

  @override
  String hoursAgo(int count) {
    return '$count hace horas';
  }

  @override
  String hoursAgoPlural(int count) {
    return 'Hace $count horas';
  }

  @override
  String daysAgo(int count) {
    return 'Hace $count día';
  }

  @override
  String daysAgoPlural(int count) {
    return 'Hace $count días';
  }

  @override
  String scoreLabel(int score) {
    return 'Puntuación $score';
  }

  @override
  String get themeCustomizeSubtitle =>
      'Personaliza la apariencia de tu aplicación';

  @override
  String get lightModeSubtitle => 'Experiencia limpia y brillante';

  @override
  String get darkModeSubtitle => 'Agradable a la vista con poca luz.';

  @override
  String get systemDefaultSubtitle =>
      'Usar preferencia de tema del dispositivo';

  @override
  String get preview => 'Avance';

  @override
  String get applyTheme => 'Aplicar tema';

  @override
  String get shareAppMessage => 'Comparte Life Navigator con tus amigos.';

  @override
  String get rateAppThanks => '¡Gracias por calificar Life Navigator!';

  @override
  String fieldRequired(String field) {
    return '$field es obligatorio';
  }

  @override
  String get emailRequired => 'Se requiere correo electrónico';

  @override
  String get emailInvalid => 'Por favor introduce un correo electrónico válido';

  @override
  String get passwordRequired => 'Se requiere contraseña';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get confirmPasswordRequired => 'Por favor confirma tu contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get otpRequired => 'Se requiere OTP';

  @override
  String otpInvalid(int length) {
    return 'Ingrese un código válido de $length dígitos';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field debe tener al menos $min caracteres';
  }

  @override
  String get fieldDescription => 'Descripción';

  @override
  String get fieldTitle => 'Título';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get confirmPassword => 'confirmar Contraseña';

  @override
  String get createAccount => 'Crear una cuenta';

  @override
  String get acceptTermsRequired =>
      'Por favor acepte los Términos y Política de Privacidad.';

  @override
  String get signupTitleLeading => 'Crea tu';

  @override
  String get account => 'Cuenta';

  @override
  String get signupSubtitle =>
      'Únase a Life Navigator y tome decisiones más inteligentes todos los días.';

  @override
  String get iAgreeToThe => 'Estoy de acuerdo con el';

  @override
  String get forgotPasswordLeading => 'Olvidó';

  @override
  String get forgotPasswordAccent => '¿Contraseña?';

  @override
  String get forgotPasswordSubtitle =>
      'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.';

  @override
  String get enterEmailHint => 'Introduce tu dirección de correo electrónico';

  @override
  String get forgotPasswordInfo =>
      'Le enviaremos un enlace para restablecer su contraseña a su dirección de correo electrónico.';

  @override
  String get sendVerificationCode => 'Enviar código de verificación';

  @override
  String get sendPasswordResetLink => 'Enviar enlace de reinicio';

  @override
  String get emailVerificationTitle => 'Verificar correo electrónico';

  @override
  String get emailVerificationSubtitle =>
      'Le enviamos un enlace de verificación a su correo electrónico. Ábrelo para activar tu cuenta.';

  @override
  String get emailVerificationSpamHint =>
      'Revise su carpeta de spam o basura si no ve el correo electrónico en unos minutos.';

  @override
  String get emailVerificationWaiting =>
      'Esperando verificación… lo comprobaremos automáticamente.';

  @override
  String get emailVerificationResend =>
      'Reenviar correo electrónico de verificación';

  @override
  String get emailVerificationResent =>
      'Correo electrónico de verificación enviado nuevamente.';

  @override
  String get authErrorWrongPassword =>
      'Correo electrónico o contraseña incorrectos. Por favor inténtalo de nuevo.';

  @override
  String get authErrorEmailInUse =>
      'Este correo electrónico ya está registrado. Intenta iniciar sesión en su lugar.';

  @override
  String get authErrorWeakPassword =>
      'La contraseña es demasiado débil. Utilice al menos 6 caracteres.';

  @override
  String get authErrorUserNotFound =>
      'No se encontró ninguna cuenta con este correo electrónico.';

  @override
  String get authErrorTooManyRequests =>
      'Demasiados intentos. Espere e inténtelo de nuevo.';

  @override
  String get authErrorGeneric =>
      'Algo salió mal. Por favor inténtalo de nuevo.';

  @override
  String get authErrorGoogleCancelled =>
      'El inicio de sesión de Google fue cancelado.';

  @override
  String get passwordResetEmailSent =>
      'Correo electrónico de restablecimiento de contraseña enviado. Revisa tu bandeja de entrada.';

  @override
  String get changePassword => 'Cambiar la contraseña';

  @override
  String get changePasswordSubtitle =>
      'Ingrese su contraseña actual y elija una nueva.';

  @override
  String get currentPassword => 'Contraseña actual';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get deleteAccountConfirm =>
      'Esto elimina permanentemente su cuenta y no se puede deshacer.';

  @override
  String get deleteAccountSuccess =>
      'También elimine las decisiones locales y el chat almacenado en este dispositivo.';

  @override
  String get accountDeleted => 'Tu cuenta ha sido eliminada.';

  @override
  String get rememberPassword => '¿Recuerdas tu contraseña?';

  @override
  String get passwordUpdatedLogin =>
      'Contraseña actualizada. Por favor inicia sesión.';

  @override
  String get resetLeading => 'Reiniciar';

  @override
  String get resetPasswordSubtitle =>
      'Cree una nueva contraseña para su cuenta.';

  @override
  String get newPassword => 'Nueva contraseña';

  @override
  String get confirmNewPassword => 'Confirmar nueva contraseña';

  @override
  String get passwordHint =>
      'Utilice al menos 6 caracteres con una combinación que pueda recordar.';

  @override
  String get updating => 'Actualizando...';

  @override
  String get updatePassword => 'Actualizar contraseña';

  @override
  String get backTo => 'Volver a';

  @override
  String newCodeSentTo(String email) {
    return 'Nuevo código enviado a $email';
  }

  @override
  String get invalidVerificationCode =>
      'Código de verificación no válido. Por favor inténtalo de nuevo.';

  @override
  String otpResetSubtitle(String email) {
    return 'Ingrese el código de reinicio de 6 dígitos enviado a $email';
  }

  @override
  String otpVerifySubtitle(String email) {
    return 'Ingrese el código de verificación de 6 dígitos enviado a $email';
  }

  @override
  String get verifyLeading => 'Verificar';

  @override
  String get verifyEmailLeading => 'Verifica tu';

  @override
  String get codeWord => 'Código';

  @override
  String get emailWord => 'Correo electrónico';

  @override
  String resendCodeIn(int seconds) {
    return 'Reenviar código en ${seconds}s';
  }

  @override
  String get didntReceiveCode => '¿No recibiste el código?';

  @override
  String get resendCode => 'Reenviar código';

  @override
  String get verifying => 'Verificando...';

  @override
  String get verifyCode => 'Verificar código';

  @override
  String get verifyAndContinue => 'Verificar y continuar';

  @override
  String get wrongEmail => '¿Correo electrónico incorrecto?';

  @override
  String get goBack => 'Volver';

  @override
  String get logOut => 'Finalizar la sesión';

  @override
  String get logoutConfirmMessage =>
      '¿Estás seguro de que deseas cerrar sesión en esta aplicación?';

  @override
  String get logoutConfirmYes => 'Sí, cerrar sesión';

  @override
  String get insightsHeroDescription =>
      'Sugerencias e insights diarios adaptados a sus decisiones.';

  @override
  String recommendedPrefix(String text) {
    return 'Recomendado: $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'Complete un análisis para ver una interpretación de riesgo personalizada.';

  @override
  String get startDecisionQuestion => '¿Con qué decisión quieres ayuda?';

  @override
  String get startDecisionSubtitle =>
      'Describe tu decisión y obtén información y recomendaciones basadas en IA.';

  @override
  String get decisionTitle => 'Título de la decisión';

  @override
  String get decisionTitleHint => 'p.ej. ¿Debería cambiar de carrera?';

  @override
  String get decisionCategory => 'Categoría de decisión';

  @override
  String get importanceLevel => 'Nivel de importancia';

  @override
  String get impactMinor => 'Impacto menor';

  @override
  String get impactModerate => 'Impacto moderado';

  @override
  String get impactHigh => 'Alto Impacto';

  @override
  String get categoryCareer => 'Carrera';

  @override
  String get categoryFinance => 'Finanzas';

  @override
  String get categoryHealth => 'Salud';

  @override
  String get categoryRelations => 'Relaciones';

  @override
  String get categoryEducation => 'Educación';

  @override
  String get categoryOther => 'Otro';

  @override
  String get addYourOptionsLeading => 'Añade tu';

  @override
  String get optionsWord => 'Opciones';

  @override
  String get describeOptionHint => 'Describe esta opción';

  @override
  String get goalSelection => 'Selección de objetivos';

  @override
  String get goalSelectionSubtitle =>
      'Seleccione las opciones para su decisión que más le importen.';

  @override
  String get selectAtLeastOneGoal =>
      'Por favor seleccione al menos un objetivo';

  @override
  String get goalTipBody =>
      'Siempre puedes ajustar tus prioridades más adelante en tu perfil.';

  @override
  String get goalGrowth => 'Crecimiento';

  @override
  String get goalFinancialGain => 'Ganancia financiera';

  @override
  String get goalRiskReduction => 'Reducción de riesgos';

  @override
  String get goalPersonalSatisfaction => 'Satisfacción personal';

  @override
  String get goalTimeEfficiency => 'Eficiencia del tiempo';

  @override
  String get goalWorkLifeBalance =>
      'Equilibrio entre la vida personal y laboral';

  @override
  String get goalStability => 'Estabilidad';

  @override
  String get goalImpact => 'Impacto';

  @override
  String get budgetInput => 'Entrada de presupuesto';

  @override
  String get budgetSubtitle =>
      'Seleccione su presupuesto estimado para esta decisión.';

  @override
  String get budgetImpactLevel => 'Nivel de impacto presupuestario';

  @override
  String get budgetLessThan5k => 'Menos de 5.000 dólares';

  @override
  String get enterYourBudget => 'Ingrese su presupuesto';

  @override
  String get timeAvailability => 'Disponibilidad de tiempo';

  @override
  String get timeAvailabilitySubtitle =>
      'Seleccione su disponibilidad horaria para esta decisión.';

  @override
  String get experienceLevel => 'Nivel de experiencia';

  @override
  String get experienceSubtitle =>
      'Esto ayuda a nuestra IA a comprender sus antecedentes y experiencia.';

  @override
  String get riskTolerance => 'Tolerancia al riesgo';

  @override
  String get riskToleranceSubtitle =>
      'Seleccione su nivel de tolerancia al riesgo para esta decisión.';

  @override
  String get timeUrgency => 'Urgencia del tiempo';

  @override
  String get urgencySubtitle => 'Seleccione la urgencia de su decisión.';

  @override
  String get financialRisk => 'Riesgo financiero';

  @override
  String get marketRisk => 'Riesgo de mercado';

  @override
  String get timeRisk => 'Riesgo de tiempo';

  @override
  String get executionRisk => 'Riesgo de ejecución';

  @override
  String get personalRisk => 'Riesgo personal';

  @override
  String get overallFit => 'Ajuste general';

  @override
  String get firstOption => 'Primera opción';

  @override
  String get secondOption => 'Segunda opción';

  @override
  String get versus => 'contra';

  @override
  String get confidenceInterpretation => 'Interpretación de confianza';

  @override
  String get financialImpact => 'Impacto financiero';

  @override
  String get riskLevel => 'Nivel de riesgo';

  @override
  String get timeInvestment => 'Inversión de tiempo';

  @override
  String get longTermSustainability => 'Sostenibilidad a largo plazo';

  @override
  String get personalGrowth => 'Crecimiento personal';

  @override
  String get outcomeConsistency => 'Consistencia de resultados';

  @override
  String get riskAssessment => 'Evaluación de riesgos';

  @override
  String get historicalSimilarity => 'Similitud histórica';

  @override
  String get relevanceMatch => 'Coincidencia de relevancia';

  @override
  String get dataQuality => 'Calidad de datos';

  @override
  String get confidenceVeryHigh => 'muy alto';

  @override
  String get confidenceModerate => 'Moderado';

  @override
  String get confidenceVeryLow => 'Muy bajo';

  @override
  String get onboardingAiPowered => 'Impulsado por IA';

  @override
  String get onboardingSmartAnalysis =>
      'Análisis inteligente para mejores decisiones';

  @override
  String get onboardingRiskAnalysis => 'Análisis de riesgos';

  @override
  String get onboardingActionablePlans => 'Planes viables';

  @override
  String get onboardingTrustedGuidance => 'Orientación confiable';

  @override
  String get onboardingDefineGoalLeading => 'Defina su';

  @override
  String get goalWord => 'Meta';

  @override
  String get onboardingChooseJourney =>
      'Elija el viaje de vida en el que desea orientación';

  @override
  String get onboardingCareerPath => 'Trayectoria profesional';

  @override
  String get onboardingCareerPathDesc =>
      'Explorar mercados y habilidades futuros';

  @override
  String get onboardingMajorPurchase => 'Compra importante';

  @override
  String get onboardingMajorPurchaseDesc =>
      'Compara opciones para una nueva compra';

  @override
  String get onboardingLifeChanges => 'Cambios de vida';

  @override
  String get onboardingLifeChangesDesc =>
      'Planificar una reubicación o nueva fase';

  @override
  String get onboardingPersonalGrowth => 'Crecimiento personal';

  @override
  String get onboardingPersonalGrowthDesc =>
      'Identificar habilidades y cambios de mentalidad';

  @override
  String get onboardingReadyLeading => 'Preparado para';

  @override
  String get navigateWord => 'Navegar por';

  @override
  String get onboardingReadySubtitle =>
      'Tu asistente personalizado está listo para ayudarte';

  @override
  String get onboardingActionableGuidance => 'Orientación práctica';

  @override
  String get onboardingActionableGuidanceDesc =>
      'Obtenga orientación para su éxito';

  @override
  String get onboardingProgressTracking => 'Seguimiento del progreso';

  @override
  String get onboardingProgressTrackingDesc =>
      'Supervise los hitos de su viaje';

  @override
  String get onboardingAdjustOnTheFly => 'Ajustar sobre la marcha';

  @override
  String get onboardingAdjustDesc =>
      'Reevaluar los planes a medida que avanza la vida.';

  @override
  String get onboardingShareLearn => 'Comparte y aprende';

  @override
  String get onboardingShareLearnDesc => 'Comparte y aprende de tus caminos';

  @override
  String get myProfileLeading => 'Mi';

  @override
  String get preferences => 'Preferencias';

  @override
  String get personalityPreferences => 'Preferencias de personalidad';

  @override
  String get saveChanges => 'Guardar cambios';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get tapToChangePhoto => 'Toca aquí para cambiar la foto';

  @override
  String get photoPickerComingSoon => 'Selector de fotos próximamente.';

  @override
  String get pickImageSourceTitle => 'Cambiar foto de perfil';

  @override
  String get pickFromCamera => 'tomar foto';

  @override
  String get pickFromGallery => 'Elige de la galería';

  @override
  String get removePhoto => 'Quitar foto';

  @override
  String get cameraPermissionDenied =>
      'Se requiere permiso de la cámara para tomar una foto.';

  @override
  String get galleryPermissionDenied =>
      'Se requiere permiso de la biblioteca de fotografías para elegir una fotografía.';

  @override
  String get openSettings => 'Abrir configuración';

  @override
  String get savePreferences => 'Guardar preferencias';

  @override
  String get preferencesSaved => 'Preferencias guardadas.';

  @override
  String get personalitySubtitle => 'Ayuda a la IA a entenderte mejor';

  @override
  String get focusAreas => 'Áreas de enfoque';

  @override
  String get emptyTitleLeading => 'Nada';

  @override
  String get emptyTitleAccent => 'aquí todavía';

  @override
  String get emptyQuietTitle => 'Está tranquilo aquí';

  @override
  String get emptyHistoryHint =>
      'Comienza tu primera decisión y tu historial aparecerá aquí.';

  @override
  String get startADecision => 'Iniciar una decisión';

  @override
  String get helpHereToHelp => 'Estamos aquí para ayudar';

  @override
  String get faq => 'Preguntas frecuentes';

  @override
  String get noResults => 'Sin resultados';

  @override
  String get errorTitle => 'algo salió mal';

  @override
  String get errorSubtitle =>
      'Nos topamos con un error inesperado. Por favor inténtalo de nuevo.';

  @override
  String get contactSupport => 'Contactar con soporte';

  @override
  String get noInternetTitle => 'Sin conexión';

  @override
  String get noInternetSubtitle =>
      'Por favor verifique su conexión a Internet e inténtelo nuevamente.';

  @override
  String get retryConnection => 'Reintentar conexión';

  @override
  String get offlineMode => 'Ir al modo sin conexión';

  @override
  String get permissionTitle => 'Permisos de aplicaciones';

  @override
  String get permissionSubtitle => 'Otorga permisos para la mejor experiencia.';

  @override
  String get grantAll => 'Conceder todo';

  @override
  String get notNow => 'Ahora no';

  @override
  String get updateAvailable => 'Actualización disponible';

  @override
  String get updateSubtitle => 'Hay una nueva versión disponible con mejoras.';

  @override
  String get updateNow => 'Actualizar ahora';

  @override
  String get remindLater => 'Recuérdamelo más tarde';

  @override
  String get loadingMessage => 'Preparando las cosas...';

  @override
  String get decisionDetailLeading => 'Decisión';

  @override
  String get detailWord => 'Detalle';

  @override
  String get decisionNotFound => 'Decisión no encontrada';

  @override
  String get overall => 'En general';

  @override
  String get pros => 'Ventajas';

  @override
  String get cons => 'Contras';

  @override
  String get notes => 'Notas';

  @override
  String get saveAtLeastTwoToCompare =>
      'Guarde al menos dos decisiones para comparar.';

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
  String get moderate => 'Moderado';

  @override
  String get veryHigh => 'muy alto';

  @override
  String get veryLow => 'Muy bajo';

  @override
  String get next => 'Próximo';

  @override
  String get later => 'Más tarde';

  @override
  String get useWord => 'Usar';

  @override
  String get aboutUsLeading => 'Acerca de';

  @override
  String get aboutUsAccent => 'A nosotros';

  @override
  String get howToUseLeading => 'Cómo';

  @override
  String get versionLabel => 'Versión 1.0.0';

  @override
  String get dailyDecision => 'Decisión diaria';

  @override
  String get personalityDescription =>
      'Estas configuraciones personalizan el tono y la profundidad de las recomendaciones.';

  @override
  String get traitOptimism => 'Optimismo';

  @override
  String get traitPatience => 'Paciencia';

  @override
  String get traitDetailFocus => 'Enfoque detallado';

  @override
  String get categoryTravel => 'Viajar';

  @override
  String get helpResponseTime => 'Tiempo medio de respuesta: menos de 24 horas';

  @override
  String get helpGetInTouch => 'Ponte en contacto';

  @override
  String get helpLiveChat => 'Chat en vivo';

  @override
  String get helpLiveChatSub => 'Chatea con nuestro equipo en tiempo real';

  @override
  String get helpCall => 'Llamar';

  @override
  String get helpCallSub =>
      'Lunes a viernes, de 9 a. m. a 5 p. m., hora del Pacífico';

  @override
  String get helpSubmitTicket => 'Enviar un boleto';

  @override
  String get helpSubmitTicketSub =>
      'Obtenga un ticket de soporte con seguimiento';

  @override
  String get helpQuickLinks => 'Enlaces rápidos';

  @override
  String get faqSubtitle => 'Preguntas comunes respondidas';

  @override
  String get aboutSubtitle => 'Versión, créditos y enlaces.';

  @override
  String get helpOpenLiveChat => 'Abrir chat en vivo';

  @override
  String get helpLiveChatSoon =>
      'El chat en vivo se abrirá pronto: le enviaremos un correo electrónico dentro de las 24 horas.';

  @override
  String get moreOptionsComingSoon => 'Más opciones próximamente';

  @override
  String get insightCompoundTitle => 'Complica tus decisiones';

  @override
  String get insightCompoundMessage =>
      'Las decisiones que se toman hoy dan forma a las oportunidades dentro de seis meses. Elige el que abra más puertas.';

  @override
  String get insightParalysisTitle => 'Cuidado con la parálisis del análisis';

  @override
  String get insightParalysisMessage =>
      'Si has estado pensando en ello durante más de una semana sin información nueva, tienes suficiente para decidir.';

  @override
  String get insightRiskStressTitle => 'El riesgo no es igual al estrés';

  @override
  String get insightRiskStressMessage =>
      'Una decisión de alto riesgo aún puede generar poco estrés si tiene un plan B claro. Diseñe siempre su alternativa.';

  @override
  String get insightFutureYouTitle => 'Futuro-tú también votas';

  @override
  String get insightFutureYouMessage =>
      'Antes de decidir, pregunte: ¿el futuro, dentro de 5 años, le agradecería al presente por esto?';

  @override
  String streakDays(int count) {
    return 'Racha de $count días';
  }

  @override
  String get streakKeepGoing => 'Continúe: haga que la decisión de hoy cuente.';

  @override
  String get todaysDecisionPrompt => 'El mensaje de decisión de hoy';

  @override
  String get dailyDecisionExerciseSub =>
      'Un ejercicio de decisión rápido de 60 segundos';

  @override
  String get dailyDecisionQuestion =>
      '¿Deberías decir sí o no a esta oportunidad?';

  @override
  String get dailyDecisionScenario =>
      'Un colega te invita a un proyecto paralelo. Es emocionante pero requiere 10 horas a la semana.';

  @override
  String get seeAiAnalysis => 'Ver análisis de IA';

  @override
  String get errorWhatYouCanDo => 'que puedes hacer';

  @override
  String get errorTip1 => 'Comprueba tu conexión a Internet';

  @override
  String get errorTip2 => 'Intente la acción nuevamente en un momento.';

  @override
  String get errorTip3 => 'Reinicia la aplicación';

  @override
  String get errorTip4 =>
      'Póngase en contacto con el soporte si esto continúa sucediendo';

  @override
  String get noInternetYouCanStill => 'todavía puedes';

  @override
  String get offlineTip1 => 'Ver decisiones guardadas e historial';

  @override
  String get offlineTip2 => 'Lea sus notas y planes de acción.';

  @override
  String get offlineTip3 => 'Explorar preguntas frecuentes y acerca de';

  @override
  String get permissionNotificationsDesc =>
      'Reciba recordatorios e indicaciones diarias para tomar decisiones';

  @override
  String get permissionLocation => 'Ubicación';

  @override
  String get permissionLocationDesc =>
      'Se utiliza solo para sugerencias basadas en la ubicación';

  @override
  String get permissionStorage => 'Almacenamiento';

  @override
  String get permissionStorageDesc =>
      'Guarde sus informes y exportaciones localmente';

  @override
  String get permissionSettingsNote =>
      'Puede cambiar los permisos en cualquier momento desde Configuración';

  @override
  String updateVersionReady(String version) {
    return 'La versión $version está lista para instalar';
  }

  @override
  String get whatsNew => 'Qué hay de nuevo';

  @override
  String get updateFeature1 => 'Análisis de IA más rápido (aceleración 2x)';

  @override
  String get updateFeature2 => 'Nuevo módulo de Asesoramiento Profesional';

  @override
  String get updateFeature3 => 'Contraste del modo oscuro mejorado';

  @override
  String get updateFeature4 =>
      'Corrección de errores y mejoras de estabilidad.';

  @override
  String get loadingSubtitle => 'Esto suele tardar sólo unos segundos.';

  @override
  String get howToUseStep1Title => 'Define tu decisión';

  @override
  String get howToUseStep1Body =>
      'Empiece por describir su decisión, categoría y lo que más le importa.';

  @override
  String get howToUseStep2Title => 'Analiza tus opciones';

  @override
  String get howToUseStep2Body =>
      'Responda preguntas guiadas sobre objetivos, urgencia, presupuesto y tolerancia al riesgo.';

  @override
  String get howToUseStep3Title => 'Revisar los resultados de la IA';

  @override
  String get howToUseStep3Body =>
      'Vea su recomendación, puntuación de riesgo, pros y contras y un plan de acción paso a paso.';

  @override
  String get howToUseStep4Title => 'Guardar y seguir el progreso';

  @override
  String get howToUseStep4Body =>
      'Guarde las decisiones en el Historial y revise los conocimientos siempre que necesite orientación.';

  @override
  String get clientSelectionLeading => 'Cliente';

  @override
  String get clientSelectionAccent => 'Selección';

  @override
  String get whichClientQuestion => '¿A qué cliente deberías decirle que sí?';

  @override
  String get clientSelectionSubtitle =>
      'La IA califica las oportunidades de los clientes según su idoneidad, tarifa y riesgo.';

  @override
  String get freelancePricingLeading => 'Independiente';

  @override
  String get freelancePricingAccent => 'Precios';

  @override
  String get recommendedPrice => 'Precio recomendado';

  @override
  String get pricingScore => 'Puntuación de precios';

  @override
  String get priceComparison => 'Comparación de precios';

  @override
  String get priceDrivers => 'Controladores de precios';

  @override
  String get marketRate => 'Tasa de mercado';

  @override
  String get experienceLabel => 'Experiencia';

  @override
  String get timelineLabel => 'Línea de tiempo';

  @override
  String get complexityLabel => 'Complejidad';

  @override
  String get projectValue => 'Valor del proyecto';

  @override
  String get sendProposal => 'Enviar propuesta';

  @override
  String get proposalSent => 'Propuesta enviada al cliente.';

  @override
  String get productivityLeading => 'Productividad';

  @override
  String get productivityAccent => 'Planificador';

  @override
  String get eisenhowerPriority => 'prioridad eisenhower';

  @override
  String get startFocusBlock => 'Iniciar bloque de enfoque';

  @override
  String get focusBlockStarted =>
      'Se inició el bloque de enfoque: ¡buena suerte!';

  @override
  String get careerAdvisorLeading => 'Carrera';

  @override
  String get careerAdvisorAccent => 'Tutor';

  @override
  String get careerFitScore => 'Puntuación de ajuste profesional';

  @override
  String get topPathProductManager => 'Ruta principal: Gerente de producto';

  @override
  String get skillMatch => 'Partido de habilidad';

  @override
  String get strategyLabel => 'Estrategia';

  @override
  String get communicationLabel => 'Comunicación';

  @override
  String get analyticsLabel => 'Analítica';

  @override
  String get technicalLabel => 'Técnico';

  @override
  String get build90DayPlan => 'Construya un plan de 90 días';

  @override
  String get businessIdeaLeading => 'Negocio';

  @override
  String get businessIdeaAccent => 'Idea';

  @override
  String get describeBusinessIdea => 'Describe tu idea de negocio';

  @override
  String get businessIdeaSubtitle =>
      'La IA calificará la viabilidad, la adecuación al mercado y el riesgo.';

  @override
  String get viabilityScore => 'Puntuación de viabilidad';

  @override
  String get scoreBreakdown => 'Desglose de puntuación';

  @override
  String get aiVerdict => 'Veredicto de IA';

  @override
  String get fullPlanGenerated => 'Plan completo generado y guardado.';

  @override
  String get financialCalcLeading => 'Financiero';

  @override
  String get financialCalcAccent => 'Calculadora';

  @override
  String get compoundGrowth => 'Crecimiento compuesto';

  @override
  String get futureValue => 'Valor futuro';

  @override
  String get saveToDecisions => 'Guardar en Decisiones';

  @override
  String get saveDecisionLeading => 'Ahorrar';

  @override
  String get saveDecisionAccent => 'Decisión';

  @override
  String get decisionSaved => 'Decisión salvada.';

  @override
  String get folderLabel => 'Carpeta';

  @override
  String get folderDefault => 'Por defecto';

  @override
  String get folderCareer => 'Carrera';

  @override
  String get folderFinance => 'Finanzas';

  @override
  String get folderHealth => 'Salud';

  @override
  String get folderPersonal => 'Personal';

  @override
  String get reportExportLeading => 'Exportar';

  @override
  String get reportExportAccent => 'Informe';

  @override
  String get exportReport => 'Informe de exportación';

  @override
  String get shareReport => 'Compartir informe';

  @override
  String get subscriptionLeading => 'Elige tu';

  @override
  String get subscriptionAccent => 'Plan';

  @override
  String get mostPopular => 'Más Popular';

  @override
  String get freeTrial => 'Prueba gratuita de 7 días';

  @override
  String get upgradePremium => 'Actualizar a Premium';

  @override
  String get choosePlan => 'Elige un plan';

  @override
  String get paymentSuccessful => '¡Pago exitoso!';

  @override
  String get thankYouUpgrade => 'Gracias por actualizar a Premium.';

  @override
  String get goToDashboard => 'Ir al panel';

  @override
  String get paymentDetails => 'Detalles de pago';

  @override
  String get payNow => 'Paga ahora';

  @override
  String get cardNumber => 'Número de tarjeta';

  @override
  String get nameOnCard => 'Nombre en la tarjeta';

  @override
  String get premiumFeatures => 'Funciones premium';

  @override
  String get faqSearchHint => 'Preguntas frecuentes sobre búsqueda';

  @override
  String get topicAll => 'Todo';

  @override
  String get topicGettingStarted => 'Empezando';

  @override
  String get topicAi => 'AI';

  @override
  String get topicBilling => 'Facturación';

  @override
  String get topicAccount => 'Cuenta';

  @override
  String get tabAll => 'Todo';

  @override
  String get tabUnread => 'No leído';

  @override
  String get tabArchived => 'Archivado';

  @override
  String get noArchivedItems => 'No hay elementos archivados';

  @override
  String get traitRiskTolerance => 'Tolerancia al riesgo';

  @override
  String get budgetWhyMatters =>
      'El presupuesto ayuda a la IA a sopesar las compensaciones financieras en su recomendación.';

  @override
  String get timeWhyMatters =>
      'La disponibilidad de tiempo determina cuán ambicioso debe ser su plan de acción.';

  @override
  String get experienceWhyMatters =>
      'El nivel de experiencia ayuda a la IA a calibrar los consejos según sus antecedentes.';

  @override
  String get riskWhyMatters =>
      'La tolerancia al riesgo determina qué tan conservadora o audaz será su recomendación.';

  @override
  String get urgencyWhyMatters =>
      'La urgencia afecta la rapidez con la que se debe actuar según la recomendación.';

  @override
  String get confidenceReliableRecommend =>
      'Recomendación generalmente confiable';

  @override
  String get confidenceReliableSomeRisks =>
      'Generalmente confiable con algunos riesgos.';

  @override
  String get confidenceConsiderRisks => 'Considere los riesgos cuidadosamente';

  @override
  String get confidenceHighUncertainty =>
      'Alta incertidumbre: proceda con cautela';

  @override
  String get stepResults => 'Resultados';

  @override
  String get urgencyNoRush => 'Sin prisas';

  @override
  String get urgencyModerate => 'Moderado';

  @override
  String get urgencyUrgent => 'Urgente';

  @override
  String get urgencyCritical => 'Crítico';

  @override
  String get experienceBeginner => 'Principiante';

  @override
  String get experienceIntermediate => 'Intermedio';

  @override
  String get experienceAdvanced => 'Avanzado';

  @override
  String get experienceExpert => 'Experto';

  @override
  String get timeVeryLimited => 'Muy limitado';

  @override
  String get timeLimited => 'Limitado';

  @override
  String get timeModerateAvail => 'Moderado';

  @override
  String get timeHighAvail => 'Alto';

  @override
  String get timeVeryHigh => 'muy alto';

  @override
  String get riskToleranceLow => 'Bajo';

  @override
  String get riskToleranceModerate => 'Moderado';

  @override
  String get riskToleranceHigh => 'Alto';

  @override
  String get riskToleranceVeryHigh => 'muy alto';

  @override
  String get doNow => 'hazlo ahora';

  @override
  String get doToday => 'hacer hoy';

  @override
  String get scheduleLabel => 'Cronograma';

  @override
  String get deleteLabel => 'Borrar';

  @override
  String get tipLabel => 'Consejo';

  @override
  String get aiRecommendation => 'Recomendación de IA';

  @override
  String get comparisonMenu => 'Comparación';

  @override
  String get clientSelectionVerdictBody =>
      'Acme es la mejor opción: diga sí. Cliente misterioso: rechazar cortésmente; resúmenes vagos predicen un cambio de alcance.';

  @override
  String get freelancePricingSubtitle =>
      'Recomendaciones de tarifas basadas en IA';

  @override
  String get priceLower => 'Más bajo';

  @override
  String get priceRecommended => 'Recomendado';

  @override
  String get priceHigher => 'Más alto';

  @override
  String get freelancePricingRecommendationBody =>
      'Precio de \$2,800 para ganar este cliente con un margen saludable. Si retroceden, anclarse en el alcance en lugar de bajar el precio.';

  @override
  String get productivitySubtitle =>
      'La IA ordena qué hacer ahora, qué programar y qué descartar.';

  @override
  String get productivityTipBody =>
      'Si todo es urgente, nada lo es. Elija 1 o 2 elementos para hacer ahora y protéjalos como si fueran reuniones.';

  @override
  String get careerAdvisorDescription =>
      'Fuerte ajuste basado en sus habilidades, estilo de comunicación e interés de crecimiento.';

  @override
  String get nextSteps => 'Próximos pasos';

  @override
  String get careerAdvisorNextStepsBody =>
      'Liderar una pequeña iniciativa multifuncional este trimestre para construir un historial estilo PM.';

  @override
  String get excellent => 'Excelente';

  @override
  String get good => 'Bien';

  @override
  String get businessIdeaHint =>
      'por ejemplo, una caja de suscripción para plantas de interior con recordatorios de cuidados de IA';

  @override
  String get marketSize => 'Tamaño del mercado';

  @override
  String get competition => 'Competencia';

  @override
  String get profitability => 'Rentabilidad';

  @override
  String get executionEase => 'Facilidad de ejecución';

  @override
  String get large => 'Grande';

  @override
  String get businessIdeaVerdictBody =>
      'Concepto fuerte con una audiencia clara. Concéntrese los primeros 90 días en conseguir 20 clientes de pago antes de ampliar el marketing.';

  @override
  String get generateFullPlan => 'Generar plan completo';

  @override
  String get financialCalcSubtitle =>
      'Vea hasta qué punto crece su dinero con el tiempo.';

  @override
  String get financialInitialAmount => 'Monto inicial (\$)';

  @override
  String get financialAnnualRate => 'Tasa Anual (%)';

  @override
  String get financialDuration => 'Duración (años)';

  @override
  String get financialCalcTipBody =>
      'Incluso las pequeñas contribuciones mensuales superan a los grandes depósitos únicos en un horizonte de más de 10 años.';

  @override
  String get saveDecisionNotesHint =>
      'Cualquier cosa que quieras recordar sobre esta decisión.';

  @override
  String get reportExportSubtitle => 'Guarde o comparta su informe de decisión';

  @override
  String get completed => 'Terminado';

  @override
  String get goAhead => 'Adelante';

  @override
  String get includeInReport => 'Incluir en el informe';

  @override
  String get executiveSummary => 'Resumen ejecutivo';

  @override
  String get analysisDetails => 'Detalles del análisis';

  @override
  String get notesAndInputs => 'Notas y aportes';

  @override
  String get exportFormat => 'Formato de exportación';

  @override
  String get pdfBestForSharing => 'Lo mejor para compartir';

  @override
  String get excelDataScores => 'Datos y puntuaciones';

  @override
  String get wordDocument => 'Documento';

  @override
  String get imageJpgPng => 'JPEG/PNG';

  @override
  String get shareOrSave => 'Compartir o guardar';

  @override
  String get shareLink => 'Compartir enlace';

  @override
  String get createShareableLink => 'Crear un enlace para compartir';

  @override
  String get emailReport => 'Informe por correo electrónico';

  @override
  String get sendViaEmail => 'Enviar por correo electrónico';

  @override
  String get saveToDevice => 'Guardar en dispositivo';

  @override
  String get downloadToDevice => 'Descargar al dispositivo';

  @override
  String get scheduleAutoReports => 'Programar informes automáticos';

  @override
  String exportedAs(String format) {
    return 'Exportado como $format';
  }

  @override
  String get subscriptionSubtitle =>
      'Tome decisiones más inteligentes con el plan adecuado para usted';

  @override
  String get makeSmarterDecisions => 'Tome decisiones más inteligentes';

  @override
  String get subscriptionHeroBody =>
      'Desbloquee análisis de IA ilimitados, conocimientos profundos y recomendaciones personalizadas.';

  @override
  String get planBasic => 'Básico';

  @override
  String get planPremium => 'De primera calidad';

  @override
  String get planPro => 'Pro';

  @override
  String get perMonth => '/mes';

  @override
  String get allPlansInclude => 'Todos los planes incluyen';

  @override
  String get moneyBackGuarantee => 'Garantía de devolución de dinero de 7 días';

  @override
  String get moneyBackGuaranteeBody =>
      '¿No estás satisfecho? Obtenga un reembolso completo dentro de los 7 días.';

  @override
  String get subscribeTermsNote =>
      'Al suscribirte, aceptas nuestros Términos y Política de Privacidad.';

  @override
  String get securePaymentEncryption =>
      'Pago seguro con cifrado estándar de la industria';

  @override
  String get paymentLeading => 'Pago';

  @override
  String get paymentAccent => 'Detalles';

  @override
  String get premiumMonthly => 'Prima • Mensual';

  @override
  String get taxEstimate => 'estimación de impuestos';

  @override
  String get totalToday => 'Total hoy';

  @override
  String get paymentMethod => 'Método de pago';

  @override
  String get paymentCard => 'Tarjeta';

  @override
  String get paymentPayPal => 'PayPal';

  @override
  String get paymentGooglePay => 'pago de google';

  @override
  String get paymentApplePay => 'pago de manzana';

  @override
  String get cardExpiryHint => 'MM/AA';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'Cifrado de extremo a extremo. Nunca almacenamos su tarjeta.';

  @override
  String get premiumFeaturesLeading => 'De primera calidad';

  @override
  String get premiumFeaturesAccent => 'Características';

  @override
  String get premiumUnlockSubtitle =>
      'Desbloquea todo el poder de Life Navigator';

  @override
  String get premiumFeature1Title => 'Análisis de IA ilimitado';

  @override
  String get premiumFeature1Body => 'Ejecute tantas decisiones como necesite.';

  @override
  String get premiumFeature2Title => 'Conocimientos profundos';

  @override
  String get premiumFeature2Body =>
      'Gráficos de riesgo, confianza, resultados e impacto.';

  @override
  String get premiumFeature3Title => 'Comparar decisiones';

  @override
  String get premiumFeature3Body =>
      'Vea las decisiones una al lado de la otra.';

  @override
  String get premiumFeature4Title => 'Exportar informes';

  @override
  String get premiumFeature4Body =>
      'Exportaciones de PDF, Word, Excel e imágenes.';

  @override
  String get premiumFeature5Title => 'Sincronización en la nube';

  @override
  String get premiumFeature5Body => 'Copia de seguridad segura en la nube.';

  @override
  String get premiumFeature6Title => 'Soporte prioritario';

  @override
  String get premiumFeature6Body => 'Responda dentro de las 24 horas.';

  @override
  String get paymentSuccessLeading => 'Pago';

  @override
  String get paymentSuccessAccent => '¡Exitoso!';

  @override
  String get youNowHaveAccessTo => 'Ahora tienes acceso a';

  @override
  String get planLabel => 'Plan';

  @override
  String get amountLabel => 'Cantidad';

  @override
  String get methodLabel => 'Método';

  @override
  String get transactionIdLabel => 'ID de transacción';

  @override
  String get unlimitedAi => 'IA ilimitada';

  @override
  String get deepInsightsShort => 'Conocimientos profundos';

  @override
  String get compareShort => 'Comparar';

  @override
  String get exportsShort => 'Exportaciones';

  @override
  String get cloudSyncShort => 'Sincronización en la nube';

  @override
  String get prioritySupportShort => 'Soporte prioritario';

  @override
  String get privacyLeading => 'Privacidad';

  @override
  String get privacyAccent => 'Política';

  @override
  String get privacyLastUpdated => 'Última actualización: 18 de mayo de 2026';

  @override
  String get privacySection1Title => 'lo que recopilamos';

  @override
  String get privacySection1Body =>
      'Recopilamos solo lo que usted nos proporciona: las decisiones que guarda, los detalles de su cuenta (nombre + correo electrónico) y sus preferencias. Todo lo demás permanece en tu dispositivo.';

  @override
  String get privacySection2Title => 'como lo usamos';

  @override
  String get privacySection2Body =>
      'Para personalizar las recomendaciones de IA, sincronice sus datos si lo desea y mejore la aplicación. Nunca vendemos tus datos a terceros.';

  @override
  String get privacySection3Title => 'Almacenamiento local primero';

  @override
  String get privacySection3Body =>
      'Sus decisiones se almacenan en su dispositivo de forma predeterminada. La sincronización en la nube es voluntaria y está cifrada en tránsito y en reposo.';

  @override
  String get privacySection4Title => 'Tus derechos';

  @override
  String get privacySection4Body =>
      'Puedes exportar o eliminar todos tus datos en cualquier momento desde Configuración. Respondemos a las solicitudes de datos en un plazo de 7 días.';

  @override
  String get privacySection5Title => 'Niños';

  @override
  String get privacySection5Body =>
      'AI Life Navigator no está destinado a niños menores de 13 años. No recopilamos datos de niños de forma intencionada.';

  @override
  String get privacySection6Title => 'Contáctenos';

  @override
  String get privacySection6Body =>
      '¿Preguntas o inquietudes? Envíe un correo electrónico a privacidad@lifenavigator.app y nos comunicaremos con usted dentro de dos días hábiles.';

  @override
  String get termsLeading => 'Términos de';

  @override
  String get termsAccent => 'Servicio';

  @override
  String get termsLastUpdated => 'Última actualización: 18 de mayo de 2026';

  @override
  String get termsSection1Title => '1. Aceptación';

  @override
  String get termsSection1Body =>
      'Al utilizar AI Life Navigator, acepta estos Términos. Si no está de acuerdo, no utilice la aplicación.';

  @override
  String get termsSection2Title => '2. Cuenta';

  @override
  String get termsSection2Body =>
      'Usted es responsable de mantener su cuenta segura. No compartas tus credenciales.';

  @override
  String get termsSection3Title => '3. Recomendaciones de IA';

  @override
  String get termsSection3Body =>
      'Los resultados de la IA son orientación, no asesoramiento profesional. Eres responsable de las decisiones que tomas en base a ellas.';

  @override
  String get termsSection4Title => '4. Suscripciones';

  @override
  String get termsSection4Body =>
      'Los planes premium se renuevan automáticamente hasta su cancelación. Puede cancelar en cualquier momento desde su cuenta de tienda.';

  @override
  String get termsSection5Title => '5. Uso aceptable';

  @override
  String get termsSection5Body =>
      'Sin contenido abusivo, sin ingeniería inversa, sin scraping. Las violaciones pueden resultar en la suspensión de la cuenta.';

  @override
  String get termsSection6Title => '6. Limitación de responsabilidad';

  @override
  String get termsSection6Body =>
      'En la medida máxima permitida por la ley, nuestra responsabilidad se limita al monto que usted nos pagó en los 12 meses anteriores.';

  @override
  String get termsSection7Title => '7. Cambios';

  @override
  String get termsSection7Body =>
      'Podemos actualizar estos Términos. Le notificaremos sobre cambios materiales mediante un aviso en la aplicación o por correo electrónico.';

  @override
  String get faqQ1 => '¿Cómo comienzo una nueva decisión?';

  @override
  String get faqA1 =>
      'Toque la tarjeta \"Iniciar nuevo análisis\" en la pantalla de inicio, asigne un título a su decisión y siga los pasos guiados.';

  @override
  String get faqQ2 => '¿Mis datos son privados?';

  @override
  String get faqA2 =>
      'Sí. Las decisiones se almacenan localmente en su dispositivo de forma predeterminada. La sincronización en la nube es voluntaria y encriptada.';

  @override
  String get faqQ3 => '¿Qué tan precisa es la IA?';

  @override
  String get faqA3 =>
      'La IA proporciona orientación estructurada, no asesoramiento profesional. Úselo como ayuda para pensar junto con su propio juicio.';

  @override
  String get faqQ4 => '¿Puede la IA acceder a mis conversaciones?';

  @override
  String get faqA4 =>
      'No. Solo se utilizan los datos que usted envía en el flujo de decisión. No se lee nada más de su dispositivo.';

  @override
  String get faqQ5 => '¿Cómo cancelo mi suscripción?';

  @override
  String get faqA5 =>
      'Cancele en cualquier momento desde la página de suscripción de App Store/Google Play. El acceso continúa hasta finalizar el periodo.';

  @override
  String get faqQ6 => '¿Ofrecen reembolsos?';

  @override
  String get faqA6 =>
      'Sí, dentro de los 7 días posteriores a su primera compra. Envíe un correo electrónico a support@lifenavigator.app.';

  @override
  String get faqQ7 => '¿Cómo elimino mi cuenta?';

  @override
  String get faqA7 =>
      'Configuración → Cuenta → Eliminar cuenta. Todos sus datos se eliminan dentro de los 30 días.';

  @override
  String get faqQ8 => '¿Puedo exportar mis decisiones?';

  @override
  String get faqA8 =>
      'Sí. Abra cualquier decisión guardada y toque Exportar informe para descargarlo como PDF, Word, Excel o imagen.';

  @override
  String get notificationsLeading => 'Notificar';

  @override
  String get notificationsAccent => 'cationes';

  @override
  String get decisionTextRiskFallback =>
      'Realice un análisis completo para obtener consejos personalizados para la reducción de riesgos.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'Su nivel de riesgo general es $label ($score%). Revise el desglose a continuación para comprender qué impulsa esta puntuación.';
  }
}
