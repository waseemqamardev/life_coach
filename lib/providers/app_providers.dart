import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ai/gemini_client.dart';
import '../data/local/local_database.dart';
import '../data/models/ai/decision_report.dart';
import '../data/models/ai/insight_report.dart';
import '../data/models/chat/chat_session.dart';
import '../data/models/decision.dart';
import '../data/repositories/app_repositories.dart';
import '../data/repositories/profile_repository.dart';
import '../domain/services/chat_service.dart';
import '../domain/services/clarifying_questions_service.dart';
import '../domain/services/decision_analysis_service.dart';
import '../domain/services/insight_service.dart';
import '../data/models/ai/clarifying_question.dart';

// ---- Infrastructure ---------------------------------------------------
final Provider<LocalDatabase> localDatabaseProvider =
    Provider<LocalDatabase>((Ref ref) => LocalDatabase.instance);

final Provider<DecisionRepository> decisionRepositoryProvider =
    Provider<DecisionRepository>(
  (Ref ref) => DecisionRepository(ref.watch(localDatabaseProvider)),
);

final Provider<ChatRepository> chatRepositoryProvider =
    Provider<ChatRepository>(
  (Ref ref) => ChatRepository(ref.watch(localDatabaseProvider)),
);

final Provider<InsightRepository> insightRepositoryProvider =
    Provider<InsightRepository>(
  (Ref ref) => InsightRepository(ref.watch(localDatabaseProvider)),
);

final Provider<ProfileRepository> profileRepositoryProvider =
    Provider<ProfileRepository>((Ref ref) => ProfileRepository());

// ---- Domain services --------------------------------------------------
final Provider<DecisionAnalysisService> decisionAnalysisServiceProvider =
    Provider<DecisionAnalysisService>(
  (Ref ref) => DecisionAnalysisService(
    repository: ref.watch(decisionRepositoryProvider),
  ),
);

final Provider<ClarifyingQuestionsService> clarifyingQuestionsServiceProvider =
    Provider<ClarifyingQuestionsService>(
  (Ref ref) => ClarifyingQuestionsService(),
);

final Provider<ChatService> chatServiceProvider = Provider<ChatService>(
  (Ref ref) => ChatService(repository: ref.watch(chatRepositoryProvider)),
);

final Provider<InsightService> insightServiceProvider =
    Provider<InsightService>(
  (Ref ref) => InsightService(
    decisionRepository: ref.watch(decisionRepositoryProvider),
    insightRepository: ref.watch(insightRepositoryProvider),
  ),
);

// ---- Analysis workflow state ------------------------------------------
enum AnalysisStatus { idle, loading, success, error }

class AnalysisWorkflowState {
  const AnalysisWorkflowState({
    this.status = AnalysisStatus.idle,
    this.errorMessage = '',
  });

  final AnalysisStatus status;
  final String errorMessage;

  AnalysisWorkflowState copyWith({
    AnalysisStatus? status,
    String? errorMessage,
  }) {
    return AnalysisWorkflowState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AnalysisRunOutcome {
  const AnalysisRunOutcome._({
    this.result,
    this.exception,
    this.errorMessage = '',
  });

  factory AnalysisRunOutcome.success(AnalysisResult result) =>
      AnalysisRunOutcome._(result: result);

  factory AnalysisRunOutcome.failure({
    required String message,
    AiException? exception,
  }) =>
      AnalysisRunOutcome._(
        errorMessage: message,
        exception: exception,
      );

  final AnalysisResult? result;
  final AiException? exception;
  final String errorMessage;

  bool get isSuccess => result != null;
}

class AnalysisWorkflowNotifier extends StateNotifier<AnalysisWorkflowState> {
  AnalysisWorkflowNotifier(this._service) : super(const AnalysisWorkflowState());

  final DecisionAnalysisService _service;

  Future<AnalysisRunOutcome> run(Decision decision, Locale locale) async {
    state = state.copyWith(status: AnalysisStatus.loading, errorMessage: '');
    try {
      final AnalysisResult result =
          await _service.analyze(decision, locale: locale);
      state = state.copyWith(status: AnalysisStatus.success, errorMessage: '');
      return AnalysisRunOutcome.success(result);
    } on AiException catch (e) {
      state = state.copyWith(
        status: AnalysisStatus.error,
        errorMessage: e.userMessage,
      );
      return AnalysisRunOutcome.failure(
        message: e.userMessage,
        exception: e,
      );
    } catch (e) {
      final String message = e.toString();
      state = state.copyWith(
        status: AnalysisStatus.error,
        errorMessage: message,
      );
      return AnalysisRunOutcome.failure(message: message);
    }
  }

  void reset() => state = const AnalysisWorkflowState();
}

final StateNotifierProvider<AnalysisWorkflowNotifier, AnalysisWorkflowState>
    analysisWorkflowProvider =
    StateNotifierProvider<AnalysisWorkflowNotifier, AnalysisWorkflowState>(
  (Ref ref) => AnalysisWorkflowNotifier(
    ref.watch(decisionAnalysisServiceProvider),
  ),
);

// ---- Clarifying questions workflow ------------------------------------
enum ClarifyingQuestionsStatus { idle, loading, success, error }

class ClarifyingQuestionsState {
  const ClarifyingQuestionsState({
    this.status = ClarifyingQuestionsStatus.idle,
    this.questions = const <ClarifyingQuestion>[],
    this.errorMessage = '',
    this.usedFallback = false,
  });

  final ClarifyingQuestionsStatus status;
  final List<ClarifyingQuestion> questions;
  final String errorMessage;
  final bool usedFallback;

  ClarifyingQuestionsState copyWith({
    ClarifyingQuestionsStatus? status,
    List<ClarifyingQuestion>? questions,
    String? errorMessage,
    bool? usedFallback,
  }) {
    return ClarifyingQuestionsState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      errorMessage: errorMessage ?? this.errorMessage,
      usedFallback: usedFallback ?? this.usedFallback,
    );
  }
}

class ClarifyingQuestionsNotifier
    extends StateNotifier<ClarifyingQuestionsState> {
  ClarifyingQuestionsNotifier(this._service)
      : super(const ClarifyingQuestionsState());

  final ClarifyingQuestionsService _service;

  Future<void> load(Decision decision, Locale locale) async {
    state = state.copyWith(
      status: ClarifyingQuestionsStatus.loading,
      errorMessage: '',
      questions: const <ClarifyingQuestion>[],
    );
    try {
      final ClarifyingQuestionsResult result =
          await _service.generate(decision, locale: locale);
      if (result.questions.isEmpty) {
        state = state.copyWith(
          status: ClarifyingQuestionsStatus.error,
          errorMessage: 'Could not prepare questions. Please try again.',
        );
        return;
      }
      state = state.copyWith(
        status: ClarifyingQuestionsStatus.success,
        questions: result.questions,
        usedFallback: result.usedFallback,
      );
    } on AiException catch (e) {
      state = state.copyWith(
        status: ClarifyingQuestionsStatus.error,
        errorMessage: e.userMessage,
      );
    } catch (e) {
      state = state.copyWith(
        status: ClarifyingQuestionsStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() => state = const ClarifyingQuestionsState();
}

final StateNotifierProvider<ClarifyingQuestionsNotifier,
        ClarifyingQuestionsState>
    clarifyingQuestionsProvider = StateNotifierProvider<
        ClarifyingQuestionsNotifier, ClarifyingQuestionsState>(
  (Ref ref) => ClarifyingQuestionsNotifier(
    ref.watch(clarifyingQuestionsServiceProvider),
  ),
);

// ---- Insights state ---------------------------------------------------
class InsightsNotifier extends StateNotifier<AsyncValue<InsightReport?>> {
  InsightsNotifier(this._service) : super(const AsyncValue.loading()) {
    _load();
  }

  final InsightService _service;

  Future<void> _load() async {
    state = AsyncValue.data(_service.getLatest());
  }

  Future<void> refresh({bool useGemini = true}) async {
    state = const AsyncValue.loading();
    try {
      final InsightReport report = await _service.generate(useGemini: useGemini);
      state = AsyncValue.data(report);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final StateNotifierProvider<InsightsNotifier, AsyncValue<InsightReport?>>
    insightsProvider =
    StateNotifierProvider<InsightsNotifier, AsyncValue<InsightReport?>>(
  (Ref ref) => InsightsNotifier(ref.watch(insightServiceProvider)),
);

// ---- Chat sessions state ----------------------------------------------
class ChatSessionsNotifier extends StateNotifier<List<ChatSessionModel>> {
  ChatSessionsNotifier(this._service) : super(_service.allSessions());

  final ChatService _service;

  void refresh() => state = _service.allSessions();

  Future<void> deleteSession(String id) async {
    await _service.deleteSession(id);
    refresh();
  }

  Future<void> deleteAll() async {
    await _service.deleteAllSessions();
    refresh();
  }
}

final StateNotifierProvider<ChatSessionsNotifier, List<ChatSessionModel>>
    chatSessionsProvider =
    StateNotifierProvider<ChatSessionsNotifier, List<ChatSessionModel>>(
  (Ref ref) => ChatSessionsNotifier(ref.watch(chatServiceProvider)),
);

// ---- Decision report cache (by id) ------------------------------------
final ProviderFamily<DecisionReport?, String> decisionReportProvider =
    Provider.family<DecisionReport?, String>(
  (Ref ref, String decisionId) {
    return ref.watch(decisionRepositoryProvider).getReport(decisionId);
  },
);

// ---- History query state ----------------------------------------------
class HistoryQuery {
  const HistoryQuery({
    this.search = '',
    this.category = '',
    this.sort = DecisionSort.newest,
  });

  final String search;
  final String category;
  final DecisionSort sort;
}

class HistoryQueryNotifier extends StateNotifier<HistoryQuery> {
  HistoryQueryNotifier() : super(const HistoryQuery());

  void setSearch(String value) => state = HistoryQuery(search: value);
  void setCategory(String value) =>
      state = HistoryQuery(search: state.search, category: value, sort: state.sort);
  void setSort(DecisionSort sort) =>
      state = HistoryQuery(search: state.search, category: state.category, sort: sort);
}

final StateNotifierProvider<HistoryQueryNotifier, HistoryQuery>
    historyQueryProvider =
    StateNotifierProvider<HistoryQueryNotifier, HistoryQuery>(
  (Ref ref) => HistoryQueryNotifier(),
);

final Provider<List<Decision>> filteredDecisionsProvider =
    Provider<List<Decision>>((Ref ref) {
  final DecisionRepository repo = ref.watch(decisionRepositoryProvider);
  final HistoryQuery query = ref.watch(historyQueryProvider);
  List<Decision> items = query.search.isEmpty
      ? repo.getAll(sort: query.sort)
      : repo.search(query.search);
  if (query.category.isNotEmpty) {
    items = items
        .where((Decision d) =>
            d.category.toLowerCase() == query.category.toLowerCase())
        .toList();
  }
  return items;
});
