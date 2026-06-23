import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'remote_config_service.dart';

import '../models/force_update_remote_config_model.dart';
import '../../shared/widgets/version_update_dialog.dart';

class ForceUpdateManager {
  static final ForceUpdateManager _instance = ForceUpdateManager._internal();

  factory ForceUpdateManager() {
    return _instance;
  }

  ForceUpdateManager._internal();

  final RemoteConfigService _remoteConfigService = RemoteConfigService.instance;

  /// Compares version strings (e.g., "1.0.0" < "1.0.1")
  /// Returns true if currentVersion < remoteVersion
  bool _isVersionOutdated(String currentVersion, String remoteVersion) {
    try {
      final currentParts = currentVersion.split('.').map(int.parse).toList();
      final remoteParts = remoteVersion.split('.').map(int.parse).toList();

      // Pad with zeros if lengths differ
      while (currentParts.length < remoteParts.length) {
        currentParts.add(0);
      }
      while (remoteParts.length < currentParts.length) {
        remoteParts.add(0);
      }

      // Compare each part
      for (int i = 0; i < currentParts.length; i++) {
        if (currentParts[i] < remoteParts[i]) {
          return true;
        } else if (currentParts[i] > remoteParts[i]) {
          return false;
        }
      }

      return false; // Versions are equal
    } catch (e) {
      debugPrint('❌ Error comparing versions: $e');
      return false;
    }
  }

  /// Checks for force update and shows dialog if needed
  /// Should be called early in the app lifecycle
  Future<void> checkAndShowUpdateIfNeeded(BuildContext context) async {
    try {
      debugPrint('🔄 Checking for force updates...');

      // 1. Get force update config
      final config = _remoteConfigService.getForceUpdateConfig();

      // 2. If force_update is false, skip check
      if (!config.forceUpdate) {
        debugPrint('✅ Force update is disabled in config');
        return;
      }

      debugPrint('⚠️ Force update is enabled in config');

      // 3. Get current app version
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      debugPrint(
          '📱 Current version: $currentVersion, Remote version: ${config.latestVersion}');

      // 4. Check if update is needed
      if (_isVersionOutdated(currentVersion, config.latestVersion)) {
        debugPrint('🔴 Update is required!');

        // 5. Show undismissible dialog
        if (context.mounted) {
          await _showForceUpdateDialog(context, config);
        }
      } else {
        debugPrint('✅ App is up to date');
      }
    } catch (e) {
      debugPrint('❌ Error checking for updates: $e');
    }
  }

  Future<void> _showForceUpdateDialog(
      BuildContext context,
      ForceUpdateRemoteConfigModel config,
      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (context) => VersionUpdateDialog(
        latestVersion: config.latestVersion,
        updateUrl: config.playStoreUrl,
        releaseNotes: 'Critical security and stability updates are required to continue using the application.',
        forceUpdate: true,
      ),
    );
  }

  /// Opens the Play Store with the given URL
  Future<void> _openPlayStore(String playStoreUrl) async {
    try {
      debugPrint('🌐 Opening Play Store: $playStoreUrl');

      if (await canLaunchUrl(Uri.parse(playStoreUrl))) {
        await launchUrl(
          Uri.parse(playStoreUrl),
          mode: LaunchMode.externalApplication,
        );
      } else {
        debugPrint('❌ Could not launch Play Store URL');
      }
    } catch (e) {
      debugPrint('❌ Error opening Play Store: $e');
    }
  }
}