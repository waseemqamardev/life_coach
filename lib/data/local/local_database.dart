import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../core/services/storage_service.dart';
import '../models/ai/decision_report.dart';
import '../models/ai/insight_report.dart';
import '../models/chat/chat_session.dart';
import '../models/decision.dart';

/// Hive persistence scoped per Firebase user [uid].
class LocalDatabase {
  LocalDatabase._();
  static final LocalDatabase instance = LocalDatabase._();

  static const String decisionsBox = 'decisions_box';
  static const String reportsBox = 'decision_reports_box';
  static const String chatBox = 'chat_sessions_box';
  static const String insightsBox = 'insight_snapshots_box';

  Box<Decision>? _decisions;
  Box<String>? _reports;
  Box<String>? _chatSessions;
  Box<String>? _insights;

  String? _activeUid;
  bool _prepared = false;

  String? get activeUid => _activeUid;

  bool get isReady => _activeUid != null && _decisions != null;

  String _scopedName(String base, String uid) => '${base}_$uid';

  Future<void> prepare() async {
    if (_prepared) return;
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DecisionAdapter());
    }
    _prepared = true;
  }

  Future<void> switchUser(String? uid) async {
    await prepare();
    await _closeBoxes();

    if (uid == null || uid.isEmpty) {
      _activeUid = null;
      return;
    }

    _activeUid = uid;
    await _migrateLegacyGlobalBoxes(uid);

    _decisions = await Hive.openBox<Decision>(_scopedName(decisionsBox, uid));
    _reports = await Hive.openBox<String>(_scopedName(reportsBox, uid));
    _chatSessions = await Hive.openBox<String>(_scopedName(chatBox, uid));
    _insights = await Hive.openBox<String>(_scopedName(insightsBox, uid));
  }

  Future<void> _closeBoxes() async {
    await _decisions?.close();
    await _reports?.close();
    await _chatSessions?.close();
    await _insights?.close();
    _decisions = null;
    _reports = null;
    _chatSessions = null;
    _insights = null;
  }

  Future<void> _migrateLegacyGlobalBoxes(String uid) async {
    if (StorageService.instance.getBool(StorageService.kLegacyHiveMigrated)) {
      return;
    }

    if (!await Hive.boxExists(decisionsBox) &&
        !await Hive.boxExists(reportsBox) &&
        !await Hive.boxExists(chatBox) &&
        !await Hive.boxExists(insightsBox)) {
      await StorageService.instance
          .setBool(StorageService.kLegacyHiveMigrated, true);
      return;
    }

    final Box<Decision> userDecisions =
        await Hive.openBox<Decision>(_scopedName(decisionsBox, uid));
    final Box<String> userReports =
        await Hive.openBox<String>(_scopedName(reportsBox, uid));
    final Box<String> userChat =
        await Hive.openBox<String>(_scopedName(chatBox, uid));
    final Box<String> userInsights =
        await Hive.openBox<String>(_scopedName(insightsBox, uid));

    if (await Hive.boxExists(decisionsBox)) {
      final Box<Decision> legacy = await Hive.openBox<Decision>(decisionsBox);
      for (final dynamic key in legacy.keys) {
        final Decision? value = legacy.get(key);
        if (value != null) {
          await userDecisions.put(key, value);
        }
      }
      await legacy.close();
      await Hive.deleteBoxFromDisk(decisionsBox);
    }

    if (await Hive.boxExists(reportsBox)) {
      final Box<String> legacy = await Hive.openBox<String>(reportsBox);
      for (final dynamic key in legacy.keys) {
        final String? value = legacy.get(key);
        if (value != null) {
          await userReports.put(key, value);
        }
      }
      await legacy.close();
      await Hive.deleteBoxFromDisk(reportsBox);
    }

    if (await Hive.boxExists(chatBox)) {
      final Box<String> legacy = await Hive.openBox<String>(chatBox);
      for (final dynamic key in legacy.keys) {
        final String? value = legacy.get(key);
        if (value != null) {
          await userChat.put(key, value);
        }
      }
      await legacy.close();
      await Hive.deleteBoxFromDisk(chatBox);
    }

    if (await Hive.boxExists(insightsBox)) {
      final Box<String> legacy = await Hive.openBox<String>(insightsBox);
      for (final dynamic key in legacy.keys) {
        final String? value = legacy.get(key);
        if (value != null) {
          await userInsights.put(key, value);
        }
      }
      await legacy.close();
      await Hive.deleteBoxFromDisk(insightsBox);
    }

    await userDecisions.close();
    await userReports.close();
    await userChat.close();
    await userInsights.close();

    await StorageService.instance
        .setBool(StorageService.kLegacyHiveMigrated, true);
  }

  List<Decision> allDecisions() {
    if (!isReady) return <Decision>[];
    return _decisions!.values.toList()
      ..sort((Decision a, Decision b) => b.createdAt.compareTo(a.createdAt));
  }

  Decision? getDecision(String id) {
    if (!isReady) return null;
    return _decisions!.get(id);
  }

  Future<void> saveDecision(Decision decision) async {
    if (!isReady) {
      throw StateError(
        'Decision storage is not ready. Wait for sign-in to finish before saving.',
      );
    }
    await _decisions!.put(decision.id, decision);
  }

  Future<void> deleteDecision(String id) async {
    if (!isReady) return;
    await _decisions!.delete(id);
    await _reports!.delete(id);
  }

  Future<void> deleteDecisions(Iterable<String> ids) async {
    for (final String id in ids) {
      await deleteDecision(id);
    }
  }

  Future<void> deleteAllDecisions() async {
    if (!isReady) return;
    await _decisions!.clear();
    await _reports!.clear();
  }

  Future<void> saveReport(String decisionId, DecisionReport report) async {
    if (!isReady) return;
    await _reports!.put(decisionId, jsonEncode(report.toJson()));
  }

  DecisionReport? getReport(String decisionId) {
    if (!isReady) return null;
    final String? raw = _reports!.get(decisionId);
    if (raw == null || raw.isEmpty) return null;
    return DecisionReport.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    );
  }

  List<ChatSessionModel> allChatSessions() {
    if (!isReady) return <ChatSessionModel>[];
    return _chatSessions!.values
        .map(
          (String raw) => ChatSessionModel.fromJson(
            jsonDecode(raw) as Map<String, dynamic>,
          ),
        )
        .toList()
      ..sort(
        (ChatSessionModel a, ChatSessionModel b) =>
            b.updatedAt.compareTo(a.updatedAt),
      );
  }

  ChatSessionModel? getChatSession(String id) {
    if (!isReady) return null;
    final String? raw = _chatSessions!.get(id);
    if (raw == null) return null;
    return ChatSessionModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveChatSession(ChatSessionModel session) async {
    if (!isReady) return;
    await _chatSessions!.put(session.id, jsonEncode(session.toJson()));
  }

  Future<void> deleteChatSession(String id) async {
    if (!isReady) return;
    await _chatSessions!.delete(id);
  }

  Future<void> deleteAllChatSessions() async {
    if (!isReady) return;
    await _chatSessions!.clear();
  }

  InsightReport? getLatestInsight() {
    if (!isReady || _insights!.isEmpty) return null;
    final String raw = _insights!.values.last;
    return InsightReport.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveInsight(InsightReport report) async {
    if (!isReady) return;
    await _insights!.put(report.id, jsonEncode(report.toJson()));
  }

  Future<void> deleteAllInsights() async {
    if (!isReady) return;
    await _insights!.clear();
  }

  /// Deletes all Hive data for a specific user account.
  Future<void> clearUserData(String uid) async {
    await prepare();
    final String? previousUid = _activeUid;
    if (_activeUid == uid) {
      await _closeBoxes();
      _activeUid = null;
    }

    for (final String base in <String>[
      decisionsBox,
      reportsBox,
      chatBox,
      insightsBox,
    ]) {
      final String name = _scopedName(base, uid);
      if (await Hive.boxExists(name)) {
        await Hive.deleteBoxFromDisk(name);
      }
    }

    if (previousUid == uid) {
      await switchUser(null);
    }
  }

  /// Clears data for the currently active scoped user.
  Future<void> clearAllUserData() async {
    final String? uid = _activeUid;
    if (uid == null) return;
    await deleteAllDecisions();
    await deleteAllChatSessions();
    await deleteAllInsights();
  }
}
