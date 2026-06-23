import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import '../models/force_update_remote_config_model.dart';

class RemoteConfigService {
  RemoteConfigService._();
  static final RemoteConfigService instance = RemoteConfigService._();
  final remoteConfig = FirebaseRemoteConfig.instance;

  // Map<String, AdsModel> adsConfig = {};

  /// 🔹 Initialize remote config and load ads + vat
  Future<void> initialize() async {
    try {
      debugPrint('🔄 Initializing Remote Config...');
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 20),
        minimumFetchInterval: Duration.zero,
      ));

      // Set offline defaults
      await remoteConfig.setDefaults({
      //  'ads_debug_json':   json.encode(OfflineAdsDefault.offlineAdsDebug),
        //'ads_release_json': json.encode(OfflineAdsDefault.offlineAdsRelease),
        'force_update_json': json.encode(_offlineForceUpdateDefaults),
      });

      // Fetch & activate
      await remoteConfig.fetch();
      await remoteConfig.activate();

      // await _loadAdsConfig();

      debugPrint('✅ Remote config initialized successfully!');
    } catch (e) {
      debugPrint('❌ Remote config failed: $e');

      // Ads fallback
      // adsConfig.clear();
      // final fallback = kDebugMode
      //     ? OfflineAdsDefault.offlineAdsDebug
      //     : OfflineAdsDefault.offlineAdsRelease;
      // fallback.forEach((key, value) {
      //   adsConfig[key] = AdsModel.fromJson(value);
      // });

    }
  }

  /// 🔹 Load ads JSON
  // Future<void> _loadAdsConfig() async {
  //   try {
  //     final key = kDebugMode ? 'ads_debug_json' : 'ads_release_json';
  //     final adsJsonString = remoteConfig.getString(key);
  //     if (adsJsonString.isEmpty) throw 'Remote config empty';
  //
  //     final Map<String, dynamic> jsonData = json.decode(adsJsonString);
  //     adsConfig.clear();
  //     jsonData.forEach((key, value) {
  //       adsConfig[key] = AdsModel.fromJson(value);
  //     });
  //
  //     debugPrint('✅ Ads config loaded: ${adsConfig.keys}');
  //   } catch (e) {
  //     debugPrint('⚠️ Failed to load remote ads, using offline fallback: $e');
  //     final fallback = kDebugMode
  //         ? OfflineAdsDefault.offlineAdsDebug
  //         : OfflineAdsDefault.offlineAdsRelease;
  //     adsConfig.clear();
  //     fallback.forEach((key, value) {
  //       adsConfig[key] = AdsModel.fromJson(value);
  //     });
  //   }
  // }





  /// 🔹 Get single ad config
  // AdsModel? getAd(String key) => adsConfig[key];

  // ------------------- FORCE UPDATE -------------------
  static final Map<String, dynamic> _offlineForceUpdateDefaults = {
    "android": {
      "min_version": "1.0.0",
      "latest_version": "2.0.0+5",
      "force_update": false,
      "playstore_url":
      "https://play.google.com/store/apps/details?id=com.invoicemaker.billingapp.receiptmaker.estimate",
    },
  };

  ForceUpdateRemoteConfigModel getForceUpdateConfig() {
    try {
      final configJson = remoteConfig.getValue('force_update_json');
      final fullConfig = json.decode(configJson.asString());
      return ForceUpdateRemoteConfigModel.fromAndroidConfig(fullConfig);
    } catch (e) {
      debugPrint('⚠️ Using offline force update defaults: $e');
      return ForceUpdateRemoteConfigModel.fromAndroidConfig(
          _offlineForceUpdateDefaults);
    }
  }
}