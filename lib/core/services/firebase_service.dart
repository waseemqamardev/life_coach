import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'remote_config_service.dart';

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

  Future<void> init() async {
    try {
      await RemoteConfigService.instance.initialize();
      debugPrint('✅ Firebase Remote Config initialized');
    } catch (e) {
      debugPrint('❌ Failed to initialize Firebase Remote Config: $e');
    }
  }

  Future<VersionUpdateInfo> checkVersionUpdate() async {
    try {
      final config = RemoteConfigService.instance.getForceUpdateConfig();
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      debugPrint('📱 App Version check - Local: $currentVersion, Min Required: ${config.minVersion}, Latest: ${config.latestVersion}');

      if (_isVersionOutdated(currentVersion, config.minVersion) && config.forceUpdate) {
        return VersionUpdateInfo(
          type: UpdateType.force,
          latestVersion: config.latestVersion,
          updateUrl: config.playStoreUrl,
          releaseNotes: 'Critical security and stability updates are required to continue using the application.',
        );
      } else if (_isVersionOutdated(currentVersion, config.latestVersion)) {
        return VersionUpdateInfo(
          type: UpdateType.optional,
          latestVersion: config.latestVersion,
          updateUrl: config.playStoreUrl,
          releaseNotes: 'New features and improvements are available. Update now for the best experience!',
        );
      }
    } catch (e) {
      debugPrint('❌ Error in checkVersionUpdate: $e');
    }

    return VersionUpdateInfo(
      type: UpdateType.none,
      latestVersion: '',
      updateUrl: '',
      releaseNotes: '',
    );
  }

  bool _isVersionOutdated(String current, String target) {
    try {
      final currentClean = current.split('+')[0];
      final targetClean = target.split('+')[0];
      final currentParts = currentClean.split('.').map(int.parse).toList();
      final targetParts = targetClean.split('.').map(int.parse).toList();

      while (currentParts.length < targetParts.length) currentParts.add(0);
      while (targetParts.length < currentParts.length) targetParts.add(0);

      for (int i = 0; i < currentParts.length; i++) {
        if (currentParts[i] < targetParts[i]) return true;
        if (currentParts[i] > targetParts[i]) return false;
      }
    } catch (_) {}
    return false;
  }
}
