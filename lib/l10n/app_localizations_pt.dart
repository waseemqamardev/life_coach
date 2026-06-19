// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Navegador de vida AI';

  @override
  String get navHome => 'Início';

  @override
  String get navChatbot => 'Chat IA';

  @override
  String get navInsights => 'Percepções';

  @override
  String get navHistory => 'História';

  @override
  String get continueButton => 'Continuar';

  @override
  String get nextButton => 'Próximo';

  @override
  String get backButton => 'Voltar';

  @override
  String get saveButton => 'Salvar';

  @override
  String get analyzeButton => 'Analisar';

  @override
  String get tryAgain => 'Tente novamente';

  @override
  String get viewAll => 'Ver tudo';

  @override
  String get searchHint => 'Procurar...';

  @override
  String get selectLanguage => 'Selecione';

  @override
  String get languageWord => 'Linguagem';

  @override
  String get searchLanguageHint => 'Pesquise o idioma aqui...';

  @override
  String get noLanguagesFound => 'Nenhum idioma encontrado';

  @override
  String get settings => 'Configurações';

  @override
  String get accountSettings => 'Configuração de conta';

  @override
  String get languages => 'Idiomas';

  @override
  String get theme => 'Tema';

  @override
  String get notifications => 'Notificações';

  @override
  String get privacyPolicy => 'política de Privacidade';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String get helpSupport => 'Ajuda e suporte';

  @override
  String get logout => 'Sair';

  @override
  String get welcomeBack => 'Bem vindo de volta!';

  @override
  String get emailAddress => 'Endereço de email';

  @override
  String get password => 'Senha';

  @override
  String get login => 'Entrar';

  @override
  String get signUp => 'Cadastrar';

  @override
  String get forgotPassword => 'Esqueceu sua senha?';

  @override
  String get rememberMe => 'Lembre de mim';

  @override
  String goodMorning(String name) {
    return 'Bom dia, $name 👋';
  }

  @override
  String get homeSubtitle =>
      'Obtenha orientação baseada em IA para sua próxima decisão importante.';

  @override
  String get startNewAnalysis => 'Iniciar nova análise';

  @override
  String get startAnalysisSubtitle =>
      'Inicie uma análise guiada e receba uma recomendação personalizada.';

  @override
  String get decisionOverview => 'Visão geral da decisão';

  @override
  String get riskScore => 'Pontuação de risco';

  @override
  String get successChance => 'Chance de sucesso';

  @override
  String get activePlans => 'Planos Ativos';

  @override
  String get inProgress => 'Em andamento';

  @override
  String get recentInsights => 'Informações recentes';

  @override
  String get stepDefine => 'Definir';

  @override
  String get stepAnalyze => 'Analisar';

  @override
  String get stepQuestions => 'Perguntas';

  @override
  String get stepResult => 'Resultado';

  @override
  String get defineYourProblem => 'Defina o seu';

  @override
  String get problemWord => 'Problema';

  @override
  String get tellUsMore => 'Conte-nos mais sobre sua decisão';

  @override
  String get wizardHint =>
      'Quanto mais detalhes você fornecer, melhor nossa IA poderá analisar e orientar você.';

  @override
  String get describeDecision => 'Descreva sua decisão';

  @override
  String get quickTips => 'Dicas rápidas';

  @override
  String get beSpecific => 'Seja específico';

  @override
  String get includeContext => 'Incluir Contexto';

  @override
  String get mentionGoal => 'Mencionar meta';

  @override
  String get choosingBetween => 'O que você está escolhendo entre?';

  @override
  String get optionsHint =>
      'Liste até 5 opções. A IA pesará cada um em relação aos seus objetivos.';

  @override
  String get addAnotherOption => 'Adicionar outra opção';

  @override
  String get continueToAnalysis => 'Continuar para análise';

  @override
  String get aiQuestionsTitle => 'IA';

  @override
  String get questionsWord => 'Questões';

  @override
  String get preparingQuestions => 'Preparando perguntas personalizadas…';

  @override
  String basedOnDecision(String title) {
    return 'Com base na sua decisão: $title';
  }

  @override
  String get basedOnWizard => 'Com base no que você compartilhou no assistente';

  @override
  String get aiNavigator => 'Navegador de vida AI';

  @override
  String get aiQuestionsHint =>
      'Responda honestamente – suas respostas moldam a análise de IA.';

  @override
  String aiQuestionsPersonalized(String title) {
    return 'A IA gerou essas perguntas especificamente para \"$title\".';
  }

  @override
  String questionOf(int current, int total) {
    return 'Pergunta $current de $total';
  }

  @override
  String get whyThisMatters => 'Por que isso é importante?';

  @override
  String get whyQuestionsMatter =>
      'Suas respostas ajudam a IA a se concentrar no que é mais relevante para sua situação.';

  @override
  String get securePrivate => 'Seus dados estão seguros e privados';

  @override
  String get processingAnalyzing => 'Analisando suas opções...';

  @override
  String get processingRisk => 'Calculando fatores de risco...';

  @override
  String get processingOutcomes => 'Prevendo resultados...';

  @override
  String get processingPlan => 'Construindo plano de ação...';

  @override
  String get processingFinalizing => 'Finalizando Resultado';

  @override
  String get decisionResult => 'Decisão';

  @override
  String get resultWord => 'Resultado';

  @override
  String get recommendedChoice => 'Escolha recomendada';

  @override
  String get benefitScore => 'Pontuação de benefício';

  @override
  String get confidence => 'Confiança';

  @override
  String get fitScore => 'Pontuação de ajuste';

  @override
  String get resultBreakdown => 'Detalhamento do resultado';

  @override
  String get finalRecommendation => 'Recomendação Final';

  @override
  String get outcomePrediction => 'Previsão de resultados';

  @override
  String get confidenceMeter => 'Medidor de confiança';

  @override
  String get actionPlan => 'Plano de Ação';

  @override
  String get prosCons => 'Prós e Contras';

  @override
  String get tipFromAi => 'Dica da IA';

  @override
  String get saveReport => 'Salvar relatório';

  @override
  String get startNewDecision => 'Iniciar nova decisão';

  @override
  String get decisionWord => 'Decisão';

  @override
  String get comparisonWord => 'Comparação';

  @override
  String get whyRecommended => 'Por que isso é recomendado?';

  @override
  String get riskBreakdown => 'Análise de risco';

  @override
  String get riskInterpretation => 'Interpretação de Risco';

  @override
  String get howToImprove => 'Como melhorar';

  @override
  String get overallConfidence => 'Confiança geral';

  @override
  String get confidenceBreakdown => 'Quebra de confiança';

  @override
  String get successLikelihood => 'Probabilidade de sucesso';

  @override
  String get outcomeBreakdown => 'Análise dos resultados';

  @override
  String get keyOutcomeFactors => 'Principais fatores de resultado';

  @override
  String get prosTitle => 'Prós desta decisão';

  @override
  String get consTitle => 'Contras desta decisão';

  @override
  String get overallProsCons => 'Prós e contras gerais';

  @override
  String get bestOverallFit => 'Melhor ajuste geral';

  @override
  String get bestOverallChoice => 'Melhor escolha geral';

  @override
  String get recommendedChoiceLabel => 'Escolha recomendada';

  @override
  String get yourActionPlan => 'Seu plano de ação';

  @override
  String get aiInsight => 'Visão de IA';

  @override
  String get keyComparison => 'Comparação de chaves';

  @override
  String get overallScore => 'Pontuação geral';

  @override
  String get keyPoints => 'Pontos-chave';

  @override
  String get analysisFailed =>
      'A análise falhou. Verifique sua internet e chave API.';

  @override
  String get missingApiKey =>
      'GEMINI_API_KEY está faltando. Adicione-o a .env e reinicie o aplicativo.';

  @override
  String get noDescription => 'Nenhuma descrição fornecida.';

  @override
  String get history => 'História';

  @override
  String get about => 'Sobre';

  @override
  String get profile => 'Perfil';

  @override
  String get editProfile => 'Editar perfil';

  @override
  String get low => 'Baixo';

  @override
  String get medium => 'Médio';

  @override
  String get high => 'Alto';

  @override
  String get lowRisk => 'Baixo risco';

  @override
  String get mediumRisk => 'Risco Médio';

  @override
  String get highRisk => 'Alto risco';

  @override
  String get notAssessed => 'Não avaliado';

  @override
  String get couldNotLoadQuestions => 'Não foi possível carregar as perguntas';

  @override
  String get noQuestionsGenerated => 'Nenhuma pergunta foi gerada.';

  @override
  String get onboardingTitle1 => 'Tome decisões mais inteligentes com IA';

  @override
  String get onboardingSubtitle1 =>
      'Obtenha orientação personalizada para as escolhas importantes da vida.';

  @override
  String get onboardingTitle2 => 'Analise riscos e resultados';

  @override
  String get onboardingSubtitle2 =>
      'Entenda as compensações antes de se comprometer.';

  @override
  String get onboardingTitle3 => 'Siga um plano de ação claro';

  @override
  String get onboardingSubtitle3 =>
      'Transforme insights em próximas etapas práticas.';

  @override
  String get getStarted => 'Começar';

  @override
  String get skip => 'Pular';

  @override
  String get darkMode => 'Modo escuro';

  @override
  String get lightMode => 'Modo claro';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get generalSettings => 'Configurações Gerais';

  @override
  String get support => 'Apoiar';

  @override
  String get legal => 'Jurídico';

  @override
  String get languageChanged => 'Idioma atualizado';

  @override
  String get yourOptions => 'Suas opções';

  @override
  String get recommended => 'Recomendado';

  @override
  String get compareOptions => 'Comparar opções';

  @override
  String get plan => 'Plano';

  @override
  String get prepare => 'Preparar';

  @override
  String get execute => 'Executar';

  @override
  String get positiveOutcome => 'Resultado Positivo';

  @override
  String get neutralOutcome => 'Resultado Neutro';

  @override
  String get negativeOutcome => 'Resultado Negativo';

  @override
  String get overallRiskScore => 'Pontuação geral de risco';

  @override
  String get yourDecisionRiskLevel => 'Seu nível de risco de decisão';

  @override
  String get overallPrediction => 'Previsão geral';

  @override
  String get overallProsConsTitle => 'Prós e contras gerais';

  @override
  String get emptyHistory => 'Nenhuma decisão salva ainda';

  @override
  String get startFirstDecision => 'Comece sua primeira análise de decisão';

  @override
  String get chatbotTitle => 'Bot de bate-papo com IA';

  @override
  String get insightsTitle => 'Percepções';

  @override
  String get dailySuggestion => 'Sugestão Diária';

  @override
  String get aboutTagline =>
      'Suporte a decisões inteligentes com tecnologia de IA — avalie opções, riscos e próximas etapas.';

  @override
  String get aboutBody =>
      'AI Life Navigator ajuda você a tomar decisões de vida e carreira com perguntas estruturadas, análise de risco e planos de ação claros.';

  @override
  String get personalInformation => 'Informações pessoais';

  @override
  String get appSetting => 'Configuração do aplicativo';

  @override
  String get securityPrivacy => 'Segurança e privacidade';

  @override
  String get aboutUs => 'Sobre nós';

  @override
  String get howToUse => 'Como usar';

  @override
  String get appTheme => 'Tema do aplicativo';

  @override
  String get shareApp => 'Compartilhar';

  @override
  String get rateUs => 'Avalie-nos';

  @override
  String get pleaseAddOption => 'Adicione pelo menos uma opção';

  @override
  String get noReportToSave => 'Nenhum relatório de decisão para salvar.';

  @override
  String get reportSaved => 'Relatório salvo no histórico.';

  @override
  String get pendingAnalysis => 'Análise pendente';

  @override
  String get untitledDecision => 'Decisão sem título';

  @override
  String get describeDecisionHint =>
      'Descreva sua situação, restrições e como é o sucesso.';

  @override
  String optionLabel(String letter) {
    return 'Opção $letter';
  }

  @override
  String get goodChance => 'Boa chance';

  @override
  String get fairChance => 'Chance Justa';

  @override
  String get poorChance => 'Pouca chance';

  @override
  String get couldNotPrepareQuestions =>
      'Não foi possível preparar perguntas. Por favor, tente novamente.';

  @override
  String get greetingFallbackName => 'lá';

  @override
  String get dontHaveAccount => 'Não tem uma conta?';

  @override
  String get alreadyHaveAccount => 'Já tem uma conta?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get welcome => 'Bem-vindo!';

  @override
  String get orContinueWith => 'ou continuar com';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get life => 'Vida';

  @override
  String get navigator => 'Navegador';

  @override
  String get authTagline => 'Assistente de tomada de decisões de IA';

  @override
  String get chatbotReadySubtitle => 'Pronto para navegar em sua vida';

  @override
  String get chatbotInputHint => 'Comece seu bate-papo aqui...';

  @override
  String get chatbotErrorMessage =>
      'Desculpe, não consegui acessar o serviço de IA. Verifique sua conexão e tente novamente.';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get selectDecisionsToDelete =>
      'Selecione as decisões a serem excluídas.';

  @override
  String get total => 'Total';

  @override
  String get highScore => 'Pontuação alta';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String minutesAgo(int count) {
    return '$count minutos atrás';
  }

  @override
  String hoursAgo(int count) {
    return '$count hora atrás';
  }

  @override
  String hoursAgoPlural(int count) {
    return '$count horas atrás';
  }

  @override
  String daysAgo(int count) {
    return '$count dia atrás';
  }

  @override
  String daysAgoPlural(int count) {
    return '$count dias atrás';
  }

  @override
  String scoreLabel(int score) {
    return 'Pontuação $score';
  }

  @override
  String get themeCustomizeSubtitle =>
      'Personalize a aparência do seu aplicativo';

  @override
  String get lightModeSubtitle => 'Experiência limpa e brilhante';

  @override
  String get darkModeSubtitle => 'Fácil para os olhos com pouca luz';

  @override
  String get systemDefaultSubtitle =>
      'Use a preferência de tema do dispositivo';

  @override
  String get preview => 'Visualização';

  @override
  String get applyTheme => 'Aplicar tema';

  @override
  String get shareAppMessage => 'Compartilhe o Life Navigator com seus amigos.';

  @override
  String get rateAppThanks => 'Obrigado por avaliar o Life Navigator!';

  @override
  String fieldRequired(String field) {
    return '$field é obrigatório';
  }

  @override
  String get emailRequired => 'O e-mail é obrigatório';

  @override
  String get emailInvalid => 'Por favor insira um e-mail válido';

  @override
  String get passwordRequired => 'A senha é obrigatória';

  @override
  String get passwordMinLength => 'A senha deve ter pelo menos 6 caracteres';

  @override
  String get confirmPasswordRequired => 'Por favor confirme sua senha';

  @override
  String get passwordsDoNotMatch => 'As senhas não coincidem';

  @override
  String get otpRequired => 'OTP é obrigatório';

  @override
  String otpInvalid(int length) {
    return 'Insira um código válido de $length dígitos';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field deve ter pelo menos $min caracteres';
  }

  @override
  String get fieldDescription => 'Descrição';

  @override
  String get fieldTitle => 'Título';

  @override
  String get fullName => 'Nome completo';

  @override
  String get confirmPassword => 'Confirme sua senha';

  @override
  String get createAccount => 'Criar uma conta';

  @override
  String get acceptTermsRequired =>
      'Por favor, aceite os Termos e a Política de Privacidade.';

  @override
  String get signupTitleLeading => 'Crie o seu';

  @override
  String get account => 'Conta';

  @override
  String get signupSubtitle =>
      'Junte-se ao Life Navigator e tome decisões mais inteligentes todos os dias.';

  @override
  String get iAgreeToThe => 'Eu concordo com o';

  @override
  String get forgotPasswordLeading => 'Esquecido';

  @override
  String get forgotPasswordAccent => 'Senha?';

  @override
  String get forgotPasswordSubtitle =>
      'Digite seu e-mail e enviaremos um link para redefinir sua senha.';

  @override
  String get enterEmailHint => 'Digite seu endereço de e-mail';

  @override
  String get forgotPasswordInfo =>
      'Enviaremos um link de redefinição de senha para o seu endereço de e-mail.';

  @override
  String get sendVerificationCode => 'Enviar código de verificação';

  @override
  String get sendPasswordResetLink => 'Enviar link de redefinição';

  @override
  String get emailVerificationTitle => 'Verificar e-mail';

  @override
  String get emailVerificationSubtitle =>
      'Enviamos um link de verificação para seu e-mail. Abra-o para ativar sua conta.';

  @override
  String get emailVerificationSpamHint =>
      'Verifique sua pasta de spam ou lixo eletrônico se você não vir o e-mail em alguns minutos.';

  @override
  String get emailVerificationWaiting =>
      'Aguardando verificação… verificaremos automaticamente.';

  @override
  String get emailVerificationResend => 'Reenviar e-mail de verificação';

  @override
  String get emailVerificationResent =>
      'E-mail de verificação enviado novamente.';

  @override
  String get authErrorWrongPassword =>
      'E-mail ou senha incorretos. Por favor, tente novamente.';

  @override
  String get authErrorEmailInUse =>
      'Este e-mail já está registado. Tente fazer login.';

  @override
  String get authErrorWeakPassword =>
      'A senha é muito fraca. Use pelo menos 6 caracteres.';

  @override
  String get authErrorUserNotFound =>
      'Nenhuma conta encontrada com este e-mail.';

  @override
  String get authErrorTooManyRequests =>
      'Muitas tentativas. Aguarde e tente novamente.';

  @override
  String get authErrorGeneric => 'Algo deu errado. Por favor, tente novamente.';

  @override
  String get authErrorGoogleCancelled => 'O login do Google foi cancelado.';

  @override
  String get passwordResetEmailSent =>
      'E-mail de redefinição de senha enviado. Verifique sua caixa de entrada.';

  @override
  String get changePassword => 'Alterar a senha';

  @override
  String get changePasswordSubtitle =>
      'Digite sua senha atual e escolha uma nova.';

  @override
  String get currentPassword => 'Senha atual';

  @override
  String get deleteAccount => 'Excluir conta';

  @override
  String get deleteAccountConfirm =>
      'Esta ação exclui permanentemente sua conta e não pode ser desfeita.';

  @override
  String get deleteAccountSuccess =>
      'Exclua também as decisões locais e o bate-papo armazenados neste dispositivo.';

  @override
  String get accountDeleted => 'Sua conta foi excluída.';

  @override
  String get rememberPassword => 'Lembra da sua senha?';

  @override
  String get passwordUpdatedLogin => 'Senha atualizada. Faça login.';

  @override
  String get resetLeading => 'Reiniciar';

  @override
  String get resetPasswordSubtitle => 'Crie uma nova senha para sua conta.';

  @override
  String get newPassword => 'Nova Senha';

  @override
  String get confirmNewPassword => 'Confirme a nova senha';

  @override
  String get passwordHint =>
      'Use pelo menos 6 caracteres com uma mistura que você consiga lembrar.';

  @override
  String get updating => 'Atualizando...';

  @override
  String get updatePassword => 'Atualizar senha';

  @override
  String get backTo => 'Voltar para';

  @override
  String newCodeSentTo(String email) {
    return 'Novo código enviado para $email';
  }

  @override
  String get invalidVerificationCode =>
      'Código de verificação inválido. Por favor, tente novamente.';

  @override
  String otpResetSubtitle(String email) {
    return 'Digite o código de redefinição de 6 dígitos enviado para $email';
  }

  @override
  String otpVerifySubtitle(String email) {
    return 'Digite o código de verificação de 6 dígitos enviado para $email';
  }

  @override
  String get verifyLeading => 'Verificar';

  @override
  String get verifyEmailLeading => 'Verifique o seu';

  @override
  String get codeWord => 'Código';

  @override
  String get emailWord => 'E-mail';

  @override
  String resendCodeIn(int seconds) {
    return 'Reenviar código em ${seconds}s';
  }

  @override
  String get didntReceiveCode => 'Não recebeu o código?';

  @override
  String get resendCode => 'Reenviar código';

  @override
  String get verifying => 'Verificando...';

  @override
  String get verifyCode => 'Verifique o código';

  @override
  String get verifyAndContinue => 'Verifique e continue';

  @override
  String get wrongEmail => 'E-mail errado?';

  @override
  String get goBack => 'Volte';

  @override
  String get logOut => 'Sair';

  @override
  String get logoutConfirmMessage =>
      'Tem certeza de que deseja sair deste aplicativo?';

  @override
  String get logoutConfirmYes => 'Sim, sair';

  @override
  String get insightsHeroDescription =>
      'Sugestões diárias e insights adaptados às suas decisões.';

  @override
  String recommendedPrefix(String text) {
    return 'Recomendado: $text';
  }

  @override
  String get riskInterpretationEmpty =>
      'Conclua uma análise para ver uma interpretação de risco personalizada.';

  @override
  String get startDecisionQuestion => 'Em qual decisão você deseja ajuda?';

  @override
  String get startDecisionSubtitle =>
      'Descreva sua decisão e obtenha insights e recomendações baseados em IA.';

  @override
  String get decisionTitle => 'Título da Decisão';

  @override
  String get decisionTitleHint => 'por exemplo Devo mudar de carreira?';

  @override
  String get decisionCategory => 'Categoria de decisão';

  @override
  String get importanceLevel => 'Nível de importância';

  @override
  String get impactMinor => 'Impacto Menor';

  @override
  String get impactModerate => 'Impacto moderado';

  @override
  String get impactHigh => 'Alto Impacto';

  @override
  String get categoryCareer => 'Carreira';

  @override
  String get categoryFinance => 'Financiar';

  @override
  String get categoryHealth => 'Saúde';

  @override
  String get categoryRelations => 'Relações';

  @override
  String get categoryEducation => 'Educação';

  @override
  String get categoryOther => 'Outro';

  @override
  String get addYourOptionsLeading => 'Adicione o seu';

  @override
  String get optionsWord => 'Opções';

  @override
  String get describeOptionHint => 'Descreva esta opção';

  @override
  String get goalSelection => 'Seleção de metas';

  @override
  String get goalSelectionSubtitle =>
      'Selecione as opções de decisão que são mais importantes para você.';

  @override
  String get selectAtLeastOneGoal => 'Selecione pelo menos uma meta';

  @override
  String get goalTipBody =>
      'Você sempre pode ajustar suas prioridades posteriormente em seu perfil.';

  @override
  String get goalGrowth => 'Crescimento';

  @override
  String get goalFinancialGain => 'Ganho Financeiro';

  @override
  String get goalRiskReduction => 'Redução de Risco';

  @override
  String get goalPersonalSatisfaction => 'Satisfação Pessoal';

  @override
  String get goalTimeEfficiency => 'Eficiência de tempo';

  @override
  String get goalWorkLifeBalance =>
      'Equilíbrio entre vida profissional e pessoal';

  @override
  String get goalStability => 'Estabilidade';

  @override
  String get goalImpact => 'Impacto';

  @override
  String get budgetInput => 'Entrada do orçamento';

  @override
  String get budgetSubtitle =>
      'Selecione seu orçamento estimado para esta decisão.';

  @override
  String get budgetImpactLevel => 'Nível de impacto orçamentário';

  @override
  String get budgetLessThan5k => 'Menos de US\$ 5 mil';

  @override
  String get enterYourBudget => 'Insira seu orçamento';

  @override
  String get timeAvailability => 'Disponibilidade de tempo';

  @override
  String get timeAvailabilitySubtitle =>
      'Selecione sua disponibilidade de tempo para esta decisão.';

  @override
  String get experienceLevel => 'Nível de experiência';

  @override
  String get experienceSubtitle =>
      'Isso ajuda nossa IA a compreender sua experiência e experiência.';

  @override
  String get riskTolerance => 'Tolerância ao Risco';

  @override
  String get riskToleranceSubtitle =>
      'Selecione seu nível de tolerância ao risco para esta decisão.';

  @override
  String get timeUrgency => 'Urgência de Tempo';

  @override
  String get urgencySubtitle => 'Selecione a urgência da sua decisão.';

  @override
  String get financialRisk => 'Risco Financeiro';

  @override
  String get marketRisk => 'Risco de Mercado';

  @override
  String get timeRisk => 'Risco de tempo';

  @override
  String get executionRisk => 'Risco de Execução';

  @override
  String get personalRisk => 'Risco Pessoal';

  @override
  String get overallFit => 'Ajuste geral';

  @override
  String get firstOption => 'Primeira opção';

  @override
  String get secondOption => 'Segunda opção';

  @override
  String get versus => 'Contra';

  @override
  String get confidenceInterpretation => 'Interpretação de Confiança';

  @override
  String get financialImpact => 'Impacto Financeiro';

  @override
  String get riskLevel => 'Nível de risco';

  @override
  String get timeInvestment => 'Investimento de tempo';

  @override
  String get longTermSustainability => 'Sustentabilidade a longo prazo';

  @override
  String get personalGrowth => 'Crescimento Pessoal';

  @override
  String get outcomeConsistency => 'Consistência de Resultados';

  @override
  String get riskAssessment => 'Avaliação de risco';

  @override
  String get historicalSimilarity => 'Semelhança Histórica';

  @override
  String get relevanceMatch => 'Correspondência de Relevância';

  @override
  String get dataQuality => 'Qualidade de dados';

  @override
  String get confidenceVeryHigh => 'Muito alto';

  @override
  String get confidenceModerate => 'Moderado';

  @override
  String get confidenceVeryLow => 'Muito baixo';

  @override
  String get onboardingAiPowered => 'Alimentado por IA';

  @override
  String get onboardingSmartAnalysis =>
      'Análise inteligente para melhores decisões';

  @override
  String get onboardingRiskAnalysis => 'Análise de Risco';

  @override
  String get onboardingActionablePlans => 'Planos Acionáveis';

  @override
  String get onboardingTrustedGuidance => 'Orientação confiável';

  @override
  String get onboardingDefineGoalLeading => 'Defina o seu';

  @override
  String get goalWord => 'Meta';

  @override
  String get onboardingChooseJourney =>
      'Escolha a jornada de vida para a qual você deseja orientação';

  @override
  String get onboardingCareerPath => 'Plano de carreira';

  @override
  String get onboardingCareerPathDesc =>
      'Explore mercados e habilidades futuras';

  @override
  String get onboardingMajorPurchase => 'Compra principal';

  @override
  String get onboardingMajorPurchaseDesc =>
      'Compare opções para uma nova compra';

  @override
  String get onboardingLifeChanges => 'Mudanças na vida';

  @override
  String get onboardingLifeChangesDesc => 'Planeje uma mudança ou nova fase';

  @override
  String get onboardingPersonalGrowth => 'Crescimento Pessoal';

  @override
  String get onboardingPersonalGrowthDesc =>
      'Identifique habilidades e mudanças de mentalidade';

  @override
  String get onboardingReadyLeading => 'Pronto para';

  @override
  String get navigateWord => 'Navegar';

  @override
  String get onboardingReadySubtitle =>
      'Seu assistente personalizado está pronto para ajudar';

  @override
  String get onboardingActionableGuidance => 'Orientação acionável';

  @override
  String get onboardingActionableGuidanceDesc =>
      'Obtenha orientação para o seu sucesso';

  @override
  String get onboardingProgressTracking => 'Acompanhamento do progresso';

  @override
  String get onboardingProgressTrackingDesc => 'Monitore marcos em sua jornada';

  @override
  String get onboardingAdjustOnTheFly => 'Ajuste na hora';

  @override
  String get onboardingAdjustDesc =>
      'Reavalie os planos conforme a vida acontece';

  @override
  String get onboardingShareLearn => 'Compartilhe e aprenda';

  @override
  String get onboardingShareLearnDesc =>
      'Compartilhe e aprenda com seus caminhos';

  @override
  String get myProfileLeading => 'Meu';

  @override
  String get preferences => 'Preferências';

  @override
  String get personalityPreferences => 'Preferências de Personalidade';

  @override
  String get saveChanges => 'Salvar alterações';

  @override
  String get phoneNumber => 'Número de telefone';

  @override
  String get tapToChangePhoto => 'Toque aqui para alterar a foto';

  @override
  String get photoPickerComingSoon => 'Seletor de fotos em breve.';

  @override
  String get pickImageSourceTitle => 'Alterar foto do perfil';

  @override
  String get pickFromCamera => 'Tirar foto';

  @override
  String get pickFromGallery => 'Escolha na galeria';

  @override
  String get removePhoto => 'Remover foto';

  @override
  String get cameraPermissionDenied =>
      'É necessária permissão da câmera para tirar uma foto.';

  @override
  String get galleryPermissionDenied =>
      'É necessária permissão da biblioteca de fotos para escolher uma foto.';

  @override
  String get openSettings => 'Abra Configurações';

  @override
  String get savePreferences => 'Salvar preferências';

  @override
  String get preferencesSaved => 'Preferências salvas.';

  @override
  String get personalitySubtitle => 'Ajude a IA a entender você melhor';

  @override
  String get focusAreas => 'Áreas de foco';

  @override
  String get emptyTitleLeading => 'Nada';

  @override
  String get emptyTitleAccent => 'Aqui ainda';

  @override
  String get emptyQuietTitle => 'Está quieto aqui';

  @override
  String get emptyHistoryHint =>
      'Comece sua primeira decisão e seu histórico aparecerá aqui.';

  @override
  String get startADecision => 'Iniciar uma decisão';

  @override
  String get helpHereToHelp => 'Estamos aqui para ajudar';

  @override
  String get faq => 'Perguntas frequentes';

  @override
  String get noResults => 'Nenhum resultado';

  @override
  String get errorTitle => 'Algo deu errado';

  @override
  String get errorSubtitle =>
      'Encontramos um erro inesperado. Por favor, tente novamente.';

  @override
  String get contactSupport => 'Contate o suporte';

  @override
  String get noInternetTitle => 'Sem conexão';

  @override
  String get noInternetSubtitle =>
      'Verifique sua conexão com a Internet e tente novamente.';

  @override
  String get retryConnection => 'Tentar novamente a conexão';

  @override
  String get offlineMode => 'Vá para o modo off-line';

  @override
  String get permissionTitle => 'Permissões de aplicativos';

  @override
  String get permissionSubtitle =>
      'Conceda permissões para a melhor experiência.';

  @override
  String get grantAll => 'Conceder tudo';

  @override
  String get notNow => 'Agora não';

  @override
  String get updateAvailable => 'Atualização disponível';

  @override
  String get updateSubtitle => 'Uma nova versão está disponível com melhorias.';

  @override
  String get updateNow => 'Atualizar agora';

  @override
  String get remindLater => 'Lembre-me mais tarde';

  @override
  String get loadingMessage => 'Preparando as coisas...';

  @override
  String get decisionDetailLeading => 'Decisão';

  @override
  String get detailWord => 'Detalhe';

  @override
  String get decisionNotFound => 'Decisão não encontrada';

  @override
  String get overall => 'Geral';

  @override
  String get pros => 'Prós';

  @override
  String get cons => 'Contras';

  @override
  String get notes => 'Notas';

  @override
  String get saveAtLeastTwoToCompare =>
      'Salve pelo menos duas decisões para comparar.';

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
  String get veryHigh => 'Muito alto';

  @override
  String get veryLow => 'Muito baixo';

  @override
  String get next => 'Próximo';

  @override
  String get later => 'Mais tarde';

  @override
  String get useWord => 'Usar';

  @override
  String get aboutUsLeading => 'Sobre';

  @override
  String get aboutUsAccent => 'Nós';

  @override
  String get howToUseLeading => 'Como fazer';

  @override
  String get versionLabel => 'Versão 1.0.0';

  @override
  String get dailyDecision => 'Decisão Diária';

  @override
  String get personalityDescription =>
      'Essas configurações personalizam o tom e a profundidade das recomendações.';

  @override
  String get traitOptimism => 'Otimismo';

  @override
  String get traitPatience => 'Paciência';

  @override
  String get traitDetailFocus => 'Foco detalhado';

  @override
  String get categoryTravel => 'Viagem';

  @override
  String get helpResponseTime => 'Tempo médio de resposta: menos de 24 horas';

  @override
  String get helpGetInTouch => 'Entre em contato';

  @override
  String get helpLiveChat => 'Bate-papo ao vivo';

  @override
  String get helpLiveChatSub => 'Converse com nossa equipe em tempo real';

  @override
  String get helpCall => 'Chamar';

  @override
  String get helpCallSub =>
      'De segunda a sexta, das 9h às 17h (horário do Pacífico)';

  @override
  String get helpSubmitTicket => 'Envie um tíquete';

  @override
  String get helpSubmitTicketSub => 'Obtenha um ticket de suporte rastreado';

  @override
  String get helpQuickLinks => 'Links rápidos';

  @override
  String get faqSubtitle => 'Perguntas comuns respondidas';

  @override
  String get aboutSubtitle => 'Versão, créditos e links';

  @override
  String get helpOpenLiveChat => 'Abra o bate-papo ao vivo';

  @override
  String get helpLiveChatSoon =>
      'O chat ao vivo abrirá em breve – enviaremos um e-mail de volta dentro de 24 horas.';

  @override
  String get moreOptionsComingSoon => 'Mais opções em breve';

  @override
  String get insightCompoundTitle => 'Componha suas decisões';

  @override
  String get insightCompoundMessage =>
      'As decisões tomadas hoje moldam as oportunidades daqui a 6 meses. Escolha aquele que abre mais portas.';

  @override
  String get insightParalysisTitle => 'Cuidado com a paralisia da análise';

  @override
  String get insightParalysisMessage =>
      'Se você está pensando nisso há mais de uma semana, sem nenhuma informação nova, você já tem o suficiente para decidir.';

  @override
  String get insightRiskStressTitle => 'Risco não é igual a estresse';

  @override
  String get insightRiskStressMessage =>
      'Uma decisão de alto risco ainda pode ser de baixo estresse se você tiver um plano B claro. Sempre elabore seu substituto.';

  @override
  String get insightFutureYouTitle => 'Futuro, você também vota';

  @override
  String get insightFutureYouMessage =>
      'Antes de decidir, pergunte: você do futuro, daqui a 5 anos, agradeceria a você presente por isso?';

  @override
  String streakDays(int count) {
    return 'Sequência de $count dias';
  }

  @override
  String get streakKeepGoing => 'Continue - faça valer a decisão de hoje.';

  @override
  String get todaysDecisionPrompt => 'Prompt de decisão de hoje';

  @override
  String get dailyDecisionExerciseSub =>
      'Um rápido exercício de decisão de 60 segundos';

  @override
  String get dailyDecisionQuestion =>
      'Você deveria dizer sim ou não a esta oportunidade?';

  @override
  String get dailyDecisionScenario =>
      'Um colega convida você para um projeto paralelo. É emocionante, mas leva 10 horas por semana.';

  @override
  String get seeAiAnalysis => 'Veja análise de IA';

  @override
  String get errorWhatYouCanDo => 'O que você pode fazer';

  @override
  String get errorTip1 => 'Verifique sua conexão com a internet';

  @override
  String get errorTip2 => 'Tente a ação novamente em alguns instantes';

  @override
  String get errorTip3 => 'Reinicie o aplicativo';

  @override
  String get errorTip4 =>
      'Entre em contato com o suporte se isso continuar acontecendo';

  @override
  String get noInternetYouCanStill => 'Você ainda pode';

  @override
  String get offlineTip1 => 'Ver decisões salvas e histórico';

  @override
  String get offlineTip2 => 'Leia suas notas e planos de ação';

  @override
  String get offlineTip3 => 'Navegue pelas perguntas frequentes e sobre';

  @override
  String get permissionNotificationsDesc =>
      'Receba lembretes e avisos diários de decisão';

  @override
  String get permissionLocation => 'Localização';

  @override
  String get permissionLocationDesc =>
      'Usado apenas para sugestões baseadas em localização';

  @override
  String get permissionStorage => 'Armazenar';

  @override
  String get permissionStorageDesc =>
      'Salve seus relatórios e exportações localmente';

  @override
  String get permissionSettingsNote =>
      'Você pode alterar as permissões a qualquer momento em Configurações';

  @override
  String updateVersionReady(String version) {
    return 'A versão $version está pronta para instalação';
  }

  @override
  String get whatsNew => 'O que há de novo';

  @override
  String get updateFeature1 => 'Análise de IA mais rápida (aceleração 2x)';

  @override
  String get updateFeature2 => 'Novo módulo de Consultor de Carreira';

  @override
  String get updateFeature3 => 'Contraste aprimorado do modo escuro';

  @override
  String get updateFeature4 => 'Correções de bugs e melhorias de estabilidade';

  @override
  String get loadingSubtitle => 'Isso geralmente leva apenas alguns segundos';

  @override
  String get howToUseStep1Title => 'Defina sua decisão';

  @override
  String get howToUseStep1Body =>
      'Comece descrevendo sua decisão, categoria e o que é mais importante para você.';

  @override
  String get howToUseStep2Title => 'Analise suas opções';

  @override
  String get howToUseStep2Body =>
      'Responda a perguntas orientadas sobre metas, urgência, orçamento e tolerância a riscos.';

  @override
  String get howToUseStep3Title => 'Revise os resultados de IA';

  @override
  String get howToUseStep3Body =>
      'Veja sua recomendação, pontuação de risco, prós e contras e um plano de ação passo a passo.';

  @override
  String get howToUseStep4Title => 'Salve e acompanhe o progresso';

  @override
  String get howToUseStep4Body =>
      'Salve as decisões no histórico e revise os insights sempre que precisar de orientação.';

  @override
  String get clientSelectionLeading => 'Cliente';

  @override
  String get clientSelectionAccent => 'Seleção';

  @override
  String get whichClientQuestion => 'Para qual cliente você deve dizer sim?';

  @override
  String get clientSelectionSubtitle =>
      'A IA avalia as oportunidades do cliente por adequação, taxa e risco.';

  @override
  String get freelancePricingLeading => 'Freelance';

  @override
  String get freelancePricingAccent => 'Preços';

  @override
  String get recommendedPrice => 'Preço recomendado';

  @override
  String get pricingScore => 'Pontuação de preços';

  @override
  String get priceComparison => 'Comparação de preços';

  @override
  String get priceDrivers => 'Drivers de preço';

  @override
  String get marketRate => 'Taxa de mercado';

  @override
  String get experienceLabel => 'Experiência';

  @override
  String get timelineLabel => 'Linha do tempo';

  @override
  String get complexityLabel => 'Complexidade';

  @override
  String get projectValue => 'Valor do projeto';

  @override
  String get sendProposal => 'Enviar proposta';

  @override
  String get proposalSent => 'Proposta enviada ao cliente.';

  @override
  String get productivityLeading => 'Produtividade';

  @override
  String get productivityAccent => 'Planejador';

  @override
  String get eisenhowerPriority => 'Prioridade de Eisenhower';

  @override
  String get startFocusBlock => 'Iniciar bloco de foco';

  @override
  String get focusBlockStarted => 'Bloqueio de foco iniciado – boa sorte!';

  @override
  String get careerAdvisorLeading => 'Carreira';

  @override
  String get careerAdvisorAccent => 'Conselheiro';

  @override
  String get careerFitScore => 'Pontuação de adequação à carreira';

  @override
  String get topPathProductManager => 'Caminho superior: Gerente de Produto';

  @override
  String get skillMatch => 'Partida de habilidade';

  @override
  String get strategyLabel => 'Estratégia';

  @override
  String get communicationLabel => 'Comunicação';

  @override
  String get analyticsLabel => 'Análise';

  @override
  String get technicalLabel => 'Técnico';

  @override
  String get build90DayPlan => 'Crie um plano de 90 dias';

  @override
  String get businessIdeaLeading => 'Negócios';

  @override
  String get businessIdeaAccent => 'Ideia';

  @override
  String get describeBusinessIdea => 'Descreva sua ideia de negócio';

  @override
  String get businessIdeaSubtitle =>
      'A IA avaliará a viabilidade, a adequação ao mercado e o risco.';

  @override
  String get viabilityScore => 'Pontuação de viabilidade';

  @override
  String get scoreBreakdown => 'Divisão de pontuação';

  @override
  String get aiVerdict => 'Veredicto de IA';

  @override
  String get fullPlanGenerated => 'Plano completo gerado e salvo.';

  @override
  String get financialCalcLeading => 'Financeiro';

  @override
  String get financialCalcAccent => 'Calculadora';

  @override
  String get compoundGrowth => 'Crescimento Composto';

  @override
  String get futureValue => 'Valor Futuro';

  @override
  String get saveToDecisions => 'Salvar nas decisões';

  @override
  String get saveDecisionLeading => 'Salvar';

  @override
  String get saveDecisionAccent => 'Decisão';

  @override
  String get decisionSaved => 'Decisão salva.';

  @override
  String get folderLabel => 'Pasta';

  @override
  String get folderDefault => 'Padrão';

  @override
  String get folderCareer => 'Carreira';

  @override
  String get folderFinance => 'Financiar';

  @override
  String get folderHealth => 'Saúde';

  @override
  String get folderPersonal => 'Pessoal';

  @override
  String get reportExportLeading => 'Exportar';

  @override
  String get reportExportAccent => 'Relatório';

  @override
  String get exportReport => 'Relatório de exportação';

  @override
  String get shareReport => 'Compartilhar relatório';

  @override
  String get subscriptionLeading => 'Escolha o seu';

  @override
  String get subscriptionAccent => 'Plano';

  @override
  String get mostPopular => 'Mais populares';

  @override
  String get freeTrial => 'Avaliação gratuita de 7 dias';

  @override
  String get upgradePremium => 'Atualizar para Premium';

  @override
  String get choosePlan => 'Escolha um plano';

  @override
  String get paymentSuccessful => 'Pagamento realizado com sucesso!';

  @override
  String get thankYouUpgrade => 'Obrigado por atualizar para Premium.';

  @override
  String get goToDashboard => 'Vá para o painel';

  @override
  String get paymentDetails => 'Detalhes de pagamento';

  @override
  String get payNow => 'Pague agora';

  @override
  String get cardNumber => 'Número do cartão';

  @override
  String get nameOnCard => 'Nome no cartão';

  @override
  String get premiumFeatures => 'Recursos premium';

  @override
  String get faqSearchHint => 'Pesquisar perguntas frequentes';

  @override
  String get topicAll => 'Todos';

  @override
  String get topicGettingStarted => 'Começando';

  @override
  String get topicAi => 'IA';

  @override
  String get topicBilling => 'Cobrança';

  @override
  String get topicAccount => 'Conta';

  @override
  String get tabAll => 'Todos';

  @override
  String get tabUnread => 'Não lido';

  @override
  String get tabArchived => 'Arquivado';

  @override
  String get noArchivedItems => 'Nenhum item arquivado';

  @override
  String get traitRiskTolerance => 'Tolerância ao Risco';

  @override
  String get budgetWhyMatters =>
      'O orçamento ajuda a IA a avaliar as compensações financeiras em sua recomendação.';

  @override
  String get timeWhyMatters =>
      'A disponibilidade de tempo determina o quão ambicioso deve ser o seu plano de ação.';

  @override
  String get experienceWhyMatters =>
      'O nível de experiência ajuda a IA a calibrar os conselhos de acordo com seu histórico.';

  @override
  String get riskWhyMatters =>
      'A tolerância ao risco determina quão conservadora ou ousada será sua recomendação.';

  @override
  String get urgencyWhyMatters =>
      'A urgência afeta a rapidez com que você deve agir de acordo com a recomendação.';

  @override
  String get confidenceReliableRecommend => 'Recomendação geralmente confiável';

  @override
  String get confidenceReliableSomeRisks =>
      'Geralmente confiável com alguns riscos';

  @override
  String get confidenceConsiderRisks => 'Considere os riscos com cuidado';

  @override
  String get confidenceHighUncertainty =>
      'Alta incerteza – proceda com cautela';

  @override
  String get stepResults => 'Resultados';

  @override
  String get urgencyNoRush => 'Sem pressa';

  @override
  String get urgencyModerate => 'Moderado';

  @override
  String get urgencyUrgent => 'Urgente';

  @override
  String get urgencyCritical => 'Crítico';

  @override
  String get experienceBeginner => 'Novato';

  @override
  String get experienceIntermediate => 'Intermediário';

  @override
  String get experienceAdvanced => 'Avançado';

  @override
  String get experienceExpert => 'Especialista';

  @override
  String get timeVeryLimited => 'Muito limitado';

  @override
  String get timeLimited => 'Limitado';

  @override
  String get timeModerateAvail => 'Moderado';

  @override
  String get timeHighAvail => 'Alto';

  @override
  String get timeVeryHigh => 'Muito alto';

  @override
  String get riskToleranceLow => 'Baixo';

  @override
  String get riskToleranceModerate => 'Moderado';

  @override
  String get riskToleranceHigh => 'Alto';

  @override
  String get riskToleranceVeryHigh => 'Muito alto';

  @override
  String get doNow => 'Faça agora';

  @override
  String get doToday => 'Faça hoje';

  @override
  String get scheduleLabel => 'Agendar';

  @override
  String get deleteLabel => 'Excluir';

  @override
  String get tipLabel => 'Dica';

  @override
  String get aiRecommendation => 'Recomendação de IA';

  @override
  String get comparisonMenu => 'Comparação';

  @override
  String get clientSelectionVerdictBody =>
      'Acme é a opção mais forte – diga sim. Cliente Mistério: recusar educadamente; resumos vagos preveem aumento de escopo.';

  @override
  String get freelancePricingSubtitle =>
      'Recomendações de taxas baseadas em IA';

  @override
  String get priceLower => 'Mais baixo';

  @override
  String get priceRecommended => 'Recomendado';

  @override
  String get priceHigher => 'Mais alto';

  @override
  String get freelancePricingRecommendationBody =>
      'Preço de \$ 2.800 para conquistar este cliente com uma margem saudável. Se eles recuarem, ancore-se no escopo em vez de reduzir o preço.';

  @override
  String get productivitySubtitle =>
      'A IA classifica o que fazer agora, o que agendar e o que abandonar.';

  @override
  String get productivityTipBody =>
      'Se tudo é urgente, nada é. Escolha de 1 a 2 itens do tipo “faça agora” e proteja-os como se fossem reuniões.';

  @override
  String get careerAdvisorDescription =>
      'Ajuste forte com base em suas habilidades, estilo de comunicação e interesse de crescimento.';

  @override
  String get nextSteps => 'Próximas etapas';

  @override
  String get careerAdvisorNextStepsBody =>
      'Lidere uma pequena iniciativa multifuncional neste trimestre para construir um histórico de estilo PM.';

  @override
  String get excellent => 'Excelente';

  @override
  String get good => 'Bom';

  @override
  String get businessIdeaHint =>
      'por exemplo, uma caixa de assinatura para plantas de interior com lembretes de cuidados de IA';

  @override
  String get marketSize => 'Tamanho do mercado';

  @override
  String get competition => 'Concorrência';

  @override
  String get profitability => 'Rentabilidade';

  @override
  String get executionEase => 'Facilidade de execução';

  @override
  String get large => 'Grande';

  @override
  String get businessIdeaVerdictBody =>
      'Conceito forte com um público claro. Concentre-se nos primeiros 90 dias em conquistar 20 clientes pagantes antes de expandir o marketing.';

  @override
  String get generateFullPlan => 'Gerar plano completo';

  @override
  String get financialCalcSubtitle =>
      'Veja quanto seu dinheiro cresce ao longo do tempo.';

  @override
  String get financialInitialAmount => 'Valor Inicial (\$)';

  @override
  String get financialAnnualRate => 'Taxa Anual (%)';

  @override
  String get financialDuration => 'Duração (anos)';

  @override
  String get financialCalcTipBody =>
      'Mesmo as pequenas contribuições mensais superaram os grandes depósitos únicos num horizonte de mais de 10 anos.';

  @override
  String get saveDecisionNotesHint =>
      'Qualquer coisa que você queira lembrar sobre esta decisão';

  @override
  String get reportExportSubtitle =>
      'Salve ou compartilhe seu relatório de decisão';

  @override
  String get completed => 'Concluído';

  @override
  String get goAhead => 'Vá em frente';

  @override
  String get includeInReport => 'Incluir no relatório';

  @override
  String get executiveSummary => 'Sumário executivo';

  @override
  String get analysisDetails => 'Detalhes da análise';

  @override
  String get notesAndInputs => 'Notas e entradas';

  @override
  String get exportFormat => 'Formato de exportação';

  @override
  String get pdfBestForSharing => 'Melhor para compartilhar';

  @override
  String get excelDataScores => 'Dados e pontuações';

  @override
  String get wordDocument => 'Documento';

  @override
  String get imageJpgPng => 'JPG/PNG';

  @override
  String get shareOrSave => 'Compartilhe ou salve';

  @override
  String get shareLink => 'Compartilhar link';

  @override
  String get createShareableLink => 'Crie um link compartilhável';

  @override
  String get emailReport => 'Relatório por e-mail';

  @override
  String get sendViaEmail => 'Enviar por e-mail';

  @override
  String get saveToDevice => 'Salvar no dispositivo';

  @override
  String get downloadToDevice => 'Baixar para o dispositivo';

  @override
  String get scheduleAutoReports => 'Agendar relatórios automáticos';

  @override
  String exportedAs(String format) {
    return 'Exportado como $format';
  }

  @override
  String get subscriptionSubtitle =>
      'Tome decisões mais inteligentes com o plano certo para você';

  @override
  String get makeSmarterDecisions => 'Tome decisões mais inteligentes';

  @override
  String get subscriptionHeroBody =>
      'Desbloqueie análises ilimitadas de IA, insights profundos e recomendações personalizadas.';

  @override
  String get planBasic => 'Básico';

  @override
  String get planPremium => 'Prêmio';

  @override
  String get planPro => 'Pró';

  @override
  String get perMonth => '/mês';

  @override
  String get allPlansInclude => 'Todos os planos incluem';

  @override
  String get moneyBackGuarantee =>
      'Garantia de devolução do dinheiro em 7 dias';

  @override
  String get moneyBackGuaranteeBody =>
      'Não está satisfeito? Obtenha um reembolso total em 7 dias.';

  @override
  String get subscribeTermsNote =>
      'Ao se inscrever você concorda com nossos Termos e Política de Privacidade.';

  @override
  String get securePaymentEncryption =>
      'Pagamento seguro com criptografia padrão do setor';

  @override
  String get paymentLeading => 'Pagamento';

  @override
  String get paymentAccent => 'Detalhes';

  @override
  String get premiumMonthly => 'Prêmio • Mensal';

  @override
  String get taxEstimate => 'Estimativa de imposto';

  @override
  String get totalToday => 'Total hoje';

  @override
  String get paymentMethod => 'Método de pagamento';

  @override
  String get paymentCard => 'Cartão';

  @override
  String get paymentPayPal => 'PayPal';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentApplePay => 'Apple Pague';

  @override
  String get cardExpiryHint => 'MM/AA';

  @override
  String get cardCvvHint => 'CVV';

  @override
  String get encryptedPaymentFooter =>
      'Criptografado de ponta a ponta. Nunca armazenamos seu cartão.';

  @override
  String get premiumFeaturesLeading => 'Prêmio';

  @override
  String get premiumFeaturesAccent => 'Características';

  @override
  String get premiumUnlockSubtitle =>
      'Desbloqueie todo o poder do Life Navigator';

  @override
  String get premiumFeature1Title => 'Análise de IA ilimitada';

  @override
  String get premiumFeature1Body =>
      'Execute quantas decisões forem necessárias.';

  @override
  String get premiumFeature2Title => 'Insights profundos';

  @override
  String get premiumFeature2Body =>
      'Gráficos de risco, confiança, resultados e impacto.';

  @override
  String get premiumFeature3Title => 'Comparar decisões';

  @override
  String get premiumFeature3Body => 'Veja as decisões lado a lado.';

  @override
  String get premiumFeature4Title => 'Exportar relatórios';

  @override
  String get premiumFeature4Body =>
      'Exportações de PDF, Word, Excel e imagens.';

  @override
  String get premiumFeature5Title => 'Sincronização na nuvem';

  @override
  String get premiumFeature5Body => 'Backup seguro na nuvem.';

  @override
  String get premiumFeature6Title => 'Suporte Prioritário';

  @override
  String get premiumFeature6Body => 'Responda dentro de 24 horas.';

  @override
  String get paymentSuccessLeading => 'Pagamento';

  @override
  String get paymentSuccessAccent => 'Bem-sucedido!';

  @override
  String get youNowHaveAccessTo => 'Agora você tem acesso a';

  @override
  String get planLabel => 'Plano';

  @override
  String get amountLabel => 'Quantia';

  @override
  String get methodLabel => 'Método';

  @override
  String get transactionIdLabel => 'ID da transação';

  @override
  String get unlimitedAi => 'IA ilimitada';

  @override
  String get deepInsightsShort => 'Insights profundos';

  @override
  String get compareShort => 'Comparar';

  @override
  String get exportsShort => 'Exportações';

  @override
  String get cloudSyncShort => 'Sincronização na nuvem';

  @override
  String get prioritySupportShort => 'Suporte Prioritário';

  @override
  String get privacyLeading => 'Privacidade';

  @override
  String get privacyAccent => 'Política';

  @override
  String get privacyLastUpdated => 'Última atualização: 18 de maio de 2026';

  @override
  String get privacySection1Title => 'O que coletamos';

  @override
  String get privacySection1Body =>
      'Coletamos apenas o que você nos fornece: as decisões que você salva, os detalhes da sua conta (nome + e-mail) e suas preferências. Todo o resto permanece no seu dispositivo.';

  @override
  String get privacySection2Title => 'Como usamos';

  @override
  String get privacySection2Body =>
      'Para personalizar as recomendações de IA, sincronize seus dados, se desejar, e melhore o aplicativo. Nunca vendemos seus dados a terceiros.';

  @override
  String get privacySection3Title => 'Armazenamento local';

  @override
  String get privacySection3Body =>
      'Suas decisões são armazenadas no seu dispositivo por padrão. A sincronização na nuvem é opcional e criptografada em trânsito e em repouso.';

  @override
  String get privacySection4Title => 'Seus direitos';

  @override
  String get privacySection4Body =>
      'Você pode exportar ou excluir todos os seus dados a qualquer momento em Configurações. Respondemos às solicitações de dados no prazo de 7 dias.';

  @override
  String get privacySection5Title => 'Crianças';

  @override
  String get privacySection5Body =>
      'O AI Life Navigator não se destina a crianças menores de 13 anos. Não coletamos intencionalmente dados de crianças.';

  @override
  String get privacySection6Title => 'Contate-nos';

  @override
  String get privacySection6Body =>
      'Dúvidas ou preocupações? Envie um e-mail para privacy@lifenavigator.app e entraremos em contato com você dentro de dois dias úteis.';

  @override
  String get termsLeading => 'Termos de';

  @override
  String get termsAccent => 'Serviço';

  @override
  String get termsLastUpdated => 'Última atualização: 18 de maio de 2026';

  @override
  String get termsSection1Title => '1. Aceitação';

  @override
  String get termsSection1Body =>
      'Ao usar o AI Life Navigator você concorda com estes Termos. Se você não concorda, não use o aplicativo.';

  @override
  String get termsSection2Title => '2. Conta';

  @override
  String get termsSection2Body =>
      'Você é responsável por manter sua conta segura. Não compartilhe suas credenciais.';

  @override
  String get termsSection3Title => '3. Recomendações de IA';

  @override
  String get termsSection3Body =>
      'Os resultados da IA ​​são orientação, não aconselhamento profissional. Você é responsável pelas decisões que toma com base nelas.';

  @override
  String get termsSection4Title => '4. Assinaturas';

  @override
  String get termsSection4Body =>
      'Os planos premium são renovados automaticamente até serem cancelados. Você pode cancelar a qualquer momento na sua conta da loja.';

  @override
  String get termsSection5Title => '5. Uso aceitável';

  @override
  String get termsSection5Body =>
      'Sem conteúdo abusivo, sem engenharia reversa, sem raspagem. As violações podem resultar na suspensão da conta.';

  @override
  String get termsSection6Title => '6. Limitação de responsabilidade';

  @override
  String get termsSection6Body =>
      'Na extensão máxima permitida por lei, a nossa responsabilidade está limitada ao valor que você nos pagou nos 12 meses anteriores.';

  @override
  String get termsSection7Title => '7. Mudanças';

  @override
  String get termsSection7Body =>
      'Poderemos atualizar estes Termos. Iremos notificá-lo sobre alterações materiais por meio de aviso no aplicativo ou e-mail.';

  @override
  String get faqQ1 => 'Como inicio uma nova decisão?';

  @override
  String get faqA1 =>
      'Toque no cartão \"Iniciar nova análise\" na tela inicial, dê um título à sua decisão e siga as etapas guiadas.';

  @override
  String get faqQ2 => 'Meus dados são privados?';

  @override
  String get faqA2 =>
      'Sim. As decisões são armazenadas localmente no seu dispositivo por padrão. A sincronização na nuvem é opcional e criptografada.';

  @override
  String get faqQ3 => 'Quão precisa é a IA?';

  @override
  String get faqA3 =>
      'A IA fornece orientação estruturada, não aconselhamento profissional. Use-o como uma ajuda para pensar junto com seu próprio julgamento.';

  @override
  String get faqQ4 => 'A IA pode acessar minhas conversas?';

  @override
  String get faqA4 =>
      'Não. Somente as entradas enviadas no fluxo de decisão são usadas. Nada mais do seu dispositivo é lido.';

  @override
  String get faqQ5 => 'Como cancelo minha assinatura?';

  @override
  String get faqA5 =>
      'Cancele a qualquer momento na página de assinatura da App Store/Google Play. O acesso continua até o término do período.';

  @override
  String get faqQ6 => 'Vocês oferecem reembolsos?';

  @override
  String get faqA6 =>
      'Sim – dentro de 7 dias após sua primeira compra. Envie um e-mail para support@lifenavigator.app.';

  @override
  String get faqQ7 => 'Como excluo minha conta?';

  @override
  String get faqA7 =>
      'Configurações → Conta → Excluir conta. Todos os seus dados são removidos em 30 dias.';

  @override
  String get faqQ8 => 'Posso exportar minhas decisões?';

  @override
  String get faqA8 =>
      'Sim. Abra qualquer decisão salva e toque em Exportar relatório para fazer download como PDF, Word, Excel ou imagem.';

  @override
  String get notificationsLeading => 'Notificação';

  @override
  String get notificationsAccent => 'cátions';

  @override
  String get decisionTextRiskFallback =>
      'Execute uma análise completa para obter dicas personalizadas de redução de riscos.';

  @override
  String decisionTextRiskInterpretation(String label, int score) {
    return 'Seu nível de risco geral é $label ($score%). Revise o detalhamento abaixo para entender o que impulsiona essa pontuação.';
  }
}
