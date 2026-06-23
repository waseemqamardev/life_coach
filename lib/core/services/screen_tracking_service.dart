import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'analytics_services/analytics_service.dart';

/// Central place for screen-level Crashlytics + Analytics logging.
class ScreenTrackingService {
  ScreenTrackingService._();
  static final ScreenTrackingService instance = ScreenTrackingService._();

  void logScreenAppear(String screenName) {
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.setCustomKey('screen', screenName);
      FirebaseCrashlytics.instance.log('Navigated to $screenName');
    }
    AnalyticsService.instance.trackScreen(screenName);
  }

  void logScreenTimeSpent(String screenName, int durationSeconds) {
    AnalyticsService.instance.logEvent(
      'screen_time_spent',
      parameters: {
        'screen_name': screenName,
        'duration_seconds': durationSeconds,
      },
    );
  }
}
