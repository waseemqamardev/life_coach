import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/local/local_database.dart';
import '../../data/models/decision.dart';

/// SharedPreferences for lightweight prefs + Hive via [LocalDatabase].
class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  late final SharedPreferences _sp;
  bool _initialised = false;

  LocalDatabase get db => LocalDatabase.instance;

  Future<void> init() async {
    if (_initialised) return;
    await Hive.initFlutter();
    await LocalDatabase.instance.prepare();
    _sp = await SharedPreferences.getInstance();

    // Open the last signed-in user's Hive boxes before providers load decisions.
    if (getBool(kIsLoggedIn)) {
      final String uid = getString(kLastActiveUid);
      if (uid.isNotEmpty) {
        await LocalDatabase.instance.switchUser(uid);
      }
    }

    _initialised = true;
  }

  // ---- Decisions (delegates to LocalDatabase) ---------------------------
  List<Decision> allDecisions() => db.allDecisions();

  Future<void> saveDecision(Decision d) async {
    await db.saveDecision(d);
  }

  Future<void> deleteDecision(String id) async {
    await db.deleteDecision(id);
  }

  Decision? getDecision(String id) => db.getDecision(id);

  // ---- Prefs ----------------------------------------------------------
  bool getBool(String key, {bool defaultValue = false}) =>
      _sp.getBool(key) ?? defaultValue;

  Future<void> setBool(String key, bool value) async {
    await _sp.setBool(key, value);
  }

  String getString(String key, {String defaultValue = ''}) =>
      _sp.getString(key) ?? defaultValue;

  Future<void> setString(String key, String value) async {
    await _sp.setString(key, value);
  }

  static const String kOnboardingSeen = 'onboarding_seen';
  static const String kThemeMode = 'theme_mode';
  static const String kIsLoggedIn = 'is_logged_in';
  static const String kUserName = 'user_name';
  static const String kUserEmail = 'user_email';
  static const String kUserPhone = 'user_phone';
  static const String kUserPhotoPath = 'user_photo_path';
  static const String kLanguage = 'language';
  static const String kLanguageChosen = 'language_chosen';
  static const String kLastActiveUid = 'last_active_uid';
  static const String kLegacyHiveMigrated = 'legacy_hive_migrated';
}
