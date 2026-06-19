import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/supported_languages.dart';
import '../core/services/storage_service.dart';
import '../data/models/ai/decision_report.dart';
import '../data/models/decision.dart';
import '../data/repositories/app_repositories.dart';
import 'app_providers.dart';
import 'auth_providers.dart';
export 'auth_providers.dart';

void _invalidateUserScopedProviders(Ref ref) {
  ref.read(draftDecisionProvider.notifier).clear();
  ref.read(compareSelectionProvider.notifier).clear();
  ref.invalidate(decisionsProvider);
  ref.read(clarifyingQuestionsProvider.notifier).reset();
  ref.invalidate(chatSessionsProvider);
  ref.invalidate(insightsProvider);
  ref.invalidate(analysisWorkflowProvider);
}

void _refreshUserDecisions(Ref ref) {
  ref.read(decisionsProvider.notifier).refresh();
}

final Provider<String?> activeUserIdProvider = Provider<String?>((Ref ref) {
  return ref.watch(authProvider.select((AuthState s) => s.uid));
});

final StateNotifierProvider<AuthNotifier, AuthState> authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (Ref ref) => AuthNotifier(
    ref.watch(authServiceProvider),
    ref.watch(authRefreshListenableProvider),
    () => _invalidateUserScopedProviders(ref),
    () => _refreshUserDecisions(ref),
  ),
);

// ---- Theme provider ---------------------------------------------------
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(_initial());

  static ThemeMode _initial() {
    final String stored =
        StorageService.instance.getString(StorageService.kThemeMode);
    switch (stored) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setMode(ThemeMode mode) async {
    state = mode;
    await StorageService.instance.setString(
      StorageService.kThemeMode,
      mode.name,
    );
  }
}

final StateNotifierProvider<ThemeModeNotifier, ThemeMode> themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
        (Ref ref) => ThemeModeNotifier());

// ---- Locale provider --------------------------------------------------
class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(_initial());

  static Locale _initial() {
    final String stored = StorageService.instance.getString(
      StorageService.kLanguage,
      defaultValue: 'en-US',
    );
    return SupportedLanguage.localeFromId(stored);
  }

  Future<void> setLanguageId(String id) async {
    final Locale locale = SupportedLanguage.localeFromId(id);
    state = locale;
    await StorageService.instance.setString(StorageService.kLanguage, id);
  }
}

final StateNotifierProvider<LocaleNotifier, Locale> localeProvider =
    StateNotifierProvider<LocaleNotifier, Locale>(
  (Ref ref) => LocaleNotifier(),
);

final Provider<bool> isRtlLocaleProvider = Provider<bool>((Ref ref) {
  return SupportedLanguage.isRtl(ref.watch(localeProvider));
});

final Provider<String> aiLanguageNameProvider = Provider<String>((Ref ref) {
  return SupportedLanguage.aiLanguageName(ref.watch(localeProvider));
});

// ---- Decisions provider -----------------------------------------------
class DecisionsNotifier extends StateNotifier<List<Decision>> {
  DecisionsNotifier(this._repository) : super(_repository.getAll());

  final DecisionRepository _repository;

  void refresh() => state = _repository.getAll();

  Future<void> save(Decision d, {DecisionReport? report}) async {
    await _repository.saveDecision(d, report: report);
    refresh();
  }

  Future<void> remove(String id) async {
    await _repository.delete(id);
    refresh();
  }

  Future<void> removeMany(Iterable<String> ids) async {
    await _repository.deleteMany(ids);
    refresh();
  }

  Future<void> removeAll() async {
    await _repository.deleteAll();
    refresh();
  }

  Decision? get(String id) => _repository.getById(id);

  DecisionReport? report(String id) => _repository.getReport(id);
}

final StateNotifierProvider<DecisionsNotifier, List<Decision>>
    decisionsProvider =
    StateNotifierProvider<DecisionsNotifier, List<Decision>>(
  (Ref ref) {
    ref.watch(activeUserIdProvider);
    final DecisionsNotifier notifier =
        DecisionsNotifier(ref.watch(decisionRepositoryProvider));
    ref.listen<String?>(activeUserIdProvider, (String? previous, String? next) {
      if (previous != next) {
        notifier.refresh();
      }
    });
    return notifier;
  },
);

// ---- Current draft decision (during the flow) -------------------------
class DraftDecisionNotifier extends StateNotifier<Decision?> {
  DraftDecisionNotifier() : super(null);

  void start(Decision d) => state = d;

  void update(Decision Function(Decision d) f) {
    if (state == null) return;
    state = f(state!);
  }

  void clear() => state = null;
}

final StateNotifierProvider<DraftDecisionNotifier, Decision?> draftDecisionProvider =
    StateNotifierProvider<DraftDecisionNotifier, Decision?>(
        (Ref ref) => DraftDecisionNotifier());

/// Full Gemini report for the in-progress draft decision.
final Provider<DecisionReport?> draftDecisionReportProvider =
    Provider<DecisionReport?>((Ref ref) {
  final Decision? draft = ref.watch(draftDecisionProvider);
  if (draft == null) return null;
  return ref.watch(decisionReportProvider(draft.id));
});

// ---- History compare selection (exactly 2 decisions) ----------------
class CompareSelectionNotifier extends StateNotifier<List<String>> {
  CompareSelectionNotifier() : super(const <String>[]);

  void setSelection(Iterable<String> ids) {
    state = List<String>.from(ids);
  }

  void clear() => state = const <String>[];
}

final StateNotifierProvider<CompareSelectionNotifier, List<String>>
    compareSelectionProvider =
    StateNotifierProvider<CompareSelectionNotifier, List<String>>(
  (Ref ref) => CompareSelectionNotifier(),
);
