import 'dart:developer' as developer;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum UpdateType { none, optional, force }

class VersionUpdateInfo {
  final UpdateType type;
  final String latestVersion;
  final String updateUrl;
  final String releaseNotes;

  VersionUpdateInfo({
    required this.type,
    required this.latestVersion,
    required this.updateUrl,
    required this.releaseNotes,
  });
}

class AppFirebaseService {
  AppFirebaseService._();
  static final AppFirebaseService instance = AppFirebaseService._();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    try {
      // 1. Crashlytics settings
      if (!kIsWeb) {
        await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
        // Pass all uncaught errors from the framework to Crashlytics.
        FlutterError.onError = _crashlytics.recordFlutterFatalError;
        PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
          _crashlytics.recordError(error, stack, fatal: true);
          return true;
        };
      }

      // 2. Remote Config settings
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: kDebugMode ? Duration.zero : const Duration(hours: 4),
      ));

      // Set defaults for version updates
      await _remoteConfig.setDefaults(<String, dynamic>{
        'latest_version': '2.0.0',
        'min_required_version': '1.0.0',
        'force_update': false,
        'update_url': "https://play.google.com/store/apps/details?id=com.lifecoach.habits.goalplanner.focus",
        'release_notes': 'Bug fixes and performance improvements.',
      });



      // Fetch and activate
      await _remoteConfig.fetchAndActivate();
      developer.log('Firebase Service initialized successfully.');
    } catch (e, stack) {
      developer.log('Failed to initialize Firebase Service', error: e, stackTrace: stack);
    }
  }

  // Log events using Analytics
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
    } catch (e) {
      developer.log('Failed to log event $name: $e');
    }
  }

  // Log screen views
  Future<void> logScreenView(String screenName) async {
    try {
      await _analytics.logScreenView(screenName: screenName);
    } catch (e) {
      developer.log('Failed to log screen view $screenName: $e');
    }
  }

  // Error logging with Crashlytics
  Future<void> recordError(Object error, StackTrace? stackTrace, {String? reason}) async {
    try {
      if (!kIsWeb) {
        await _crashlytics.recordError(error, stackTrace, reason: reason);
      } else {
        developer.log('Error recorded: $error', stackTrace: stackTrace);
      }
    } catch (_) {}
  }

  // Version update check logic
  Future<VersionUpdateInfo> checkVersionUpdate() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final String currentVersion = packageInfo.version;

      final String latestVersion = _remoteConfig.getString('latest_version');
      final String minRequiredVersion = _remoteConfig.getString('min_required_version');
      final String updateUrl = _remoteConfig.getString('update_url');
      final String releaseNotes = _remoteConfig.getString('release_notes');
      final bool forceUpdateParam = _remoteConfig.getBool('force_update');

      developer.log('Current version: $currentVersion, Latest: $latestVersion, Min Required: $minRequiredVersion');

      final bool isCurrentOlderThanLatest = _compareVersion(currentVersion, latestVersion) < 0;
      final bool isCurrentOlderThanMin = _compareVersion(currentVersion, minRequiredVersion) < 0;

      if (isCurrentOlderThanMin || (isCurrentOlderThanLatest && forceUpdateParam)) {
        return VersionUpdateInfo(
          type: UpdateType.force,
          latestVersion: latestVersion,
          updateUrl: updateUrl,
          releaseNotes: releaseNotes,
        );
      } else if (isCurrentOlderThanLatest) {
        return VersionUpdateInfo(
          type: UpdateType.optional,
          latestVersion: latestVersion,
          updateUrl: updateUrl,
          releaseNotes: releaseNotes,
        );
      }
    } catch (e, stack) {
      recordError(e, stack, reason: 'Failed during checkVersionUpdate');
    }

    return VersionUpdateInfo(
      type: UpdateType.none,
      latestVersion: '',
      updateUrl: '',
      releaseNotes: '',
    );
  }

  // Helper to compare semantic versions: -1 if v1 < v2, 1 if v1 > v2, 0 if equal
  int _compareVersion(String version1, String version2) {
    final List<int> v1 = version1.split('.').map((String e) => int.tryParse(e) ?? 0).toList();
    final List<int> v2 = version2.split('.').map((String e) => int.tryParse(e) ?? 0).toList();

    for (int i = 0; i < 3; i++) {
      final int val1 = i < v1.length ? v1[i] : 0;
      final int val2 = i < v2.length ? v2[i] : 0;
      if (val1 < val2) return -1;
      if (val1 > val2) return 1;
    }
    return 0;
  }
}
