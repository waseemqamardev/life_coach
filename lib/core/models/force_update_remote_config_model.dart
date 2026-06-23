class ForceUpdateRemoteConfigModel {
  final String minVersion;
  final String latestVersion;
  final bool forceUpdate;
  final String playStoreUrl;

  ForceUpdateRemoteConfigModel({
    required this.minVersion,
    required this.latestVersion,
    required this.forceUpdate,
    required this.playStoreUrl,
  });

  factory ForceUpdateRemoteConfigModel.fromAndroidConfig(Map<String, dynamic> json) {
    final Map<String, dynamic> android = Map<String, dynamic>.from(json['android'] as Map? ?? {});
    return ForceUpdateRemoteConfigModel(
      minVersion: android['min_version'] as String? ?? '1.0.0',
      latestVersion: android['latest_version'] as String? ?? '1.0.0',
      forceUpdate: android['force_update'] as bool? ?? false,
      playStoreUrl: android['playstore_url'] as String? ?? '',
    );
  }
}
