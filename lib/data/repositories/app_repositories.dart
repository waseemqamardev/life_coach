import '../models/ai/decision_report.dart';
import '../models/ai/insight_report.dart';
import '../models/chat/chat_session.dart';
import '../models/decision.dart';
import '../local/local_database.dart';

enum DecisionSort { newest, oldest, highestScore, highestRisk }

class DecisionRepository {
  DecisionRepository(this._db);
  final LocalDatabase _db;

  List<Decision> getAll({DecisionSort sort = DecisionSort.newest}) {
    final List<Decision> items = _db.allDecisions();
    switch (sort) {
      case DecisionSort.oldest:
        return items.reversed.toList();
      case DecisionSort.highestScore:
        return items
          ..sort((Decision a, Decision b) => b.overallScore.compareTo(a.overallScore));
      case DecisionSort.highestRisk:
        return items
          ..sort((Decision a, Decision b) => b.riskScore.compareTo(a.riskScore));
      case DecisionSort.newest:
        return items;
    }
  }

  List<Decision> search(String query) {
    final String q = query.trim().toLowerCase();
    if (q.isEmpty) return getAll();
    return getAll().where((Decision d) {
      return d.title.toLowerCase().contains(q) ||
          d.description.toLowerCase().contains(q) ||
          d.category.toLowerCase().contains(q) ||
          d.recommendation.toLowerCase().contains(q);
    }).toList();
  }

  List<Decision> filterByCategory(String category) {
    if (category.isEmpty || category.toLowerCase() == 'all') return getAll();
    return getAll()
        .where((Decision d) => d.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  Decision? getById(String id) => _db.getDecision(id);

  DecisionReport? getReport(String decisionId) => _db.getReport(decisionId);

  Future<void> saveDecision(Decision decision, {DecisionReport? report}) async {
    await _db.saveDecision(decision);
    if (report != null) {
      await _db.saveReport(decision.id, report);
    }
  }

  Future<void> delete(String id) => _db.deleteDecision(id);

  Future<void> deleteMany(Iterable<String> ids) => _db.deleteDecisions(ids);

  Future<void> deleteAll() => _db.deleteAllDecisions();
}

class ChatRepository {
  ChatRepository(this._db);
  final LocalDatabase _db;

  List<ChatSessionModel> getAll() => _db.allChatSessions();

  ChatSessionModel? getById(String id) => _db.getChatSession(id);

  Future<void> save(ChatSessionModel session) => _db.saveChatSession(session);

  Future<void> delete(String id) => _db.deleteChatSession(id);

  Future<void> deleteAll() => _db.deleteAllChatSessions();
}

class InsightRepository {
  InsightRepository(this._db);
  final LocalDatabase _db;

  InsightReport? getLatest() => _db.getLatestInsight();

  Future<void> save(InsightReport report) => _db.saveInsight(report);

  Future<void> deleteAll() => _db.deleteAllInsights();
}
