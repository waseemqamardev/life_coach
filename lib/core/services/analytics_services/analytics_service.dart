import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/rendering.dart';
import 'analytics_parameters.dart';

class AnalyticsService {
  AnalyticsService._();
  static final AnalyticsService instance = AnalyticsService._();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Convert parameter values to Firebase-compatible types
  Map<String, Object> _sanitizeParameters(Map<String, Object?> parameters) {
    return parameters.map((key, value) {
      if (value == null) {
        return MapEntry(key, 'null');
      } else if (value is bool) {
        return MapEntry(key, value ? 'true' : 'false');
      } else if (value is int || value is double) {
        return MapEntry(key, value);
      } else if (value is List) {
        return MapEntry(key, value.join(','));
      } else {
        return MapEntry(key, value.toString());
      }
    });
  }

  // -------------------------------
  // Base Method (fully customizable)
  // -------------------------------
  Future<void> logEvent(
    String eventName, {
    Map<String, Object?> parameters = const {},
    bool printLog = true,
  }) async {
    final sanitizedParams = _sanitizeParameters(parameters);

    await _analytics.logEvent(name: eventName, parameters: sanitizedParams);

    if (printLog) {
      debugPrint("📊 Analytics Event → $eventName");
      debugPrint("👉 Params: $sanitizedParams");
    }
  }

  // Custom screen tracking
  Future<void> trackScreen(String screenName) async {
    logEvent(
      "screen_view",
      parameters: {AnalyticsParameters.screenName: screenName},
    );
    await _analytics.logScreenView(
      screenClass: screenName,
      screenName: screenName,
    );
  }
}
