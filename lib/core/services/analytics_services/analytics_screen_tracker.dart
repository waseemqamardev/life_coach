import 'package:flutter/material.dart';

import '../screen_tracking_service.dart';

/// Logs time spent on screen when disposed.
/// Pair with [CrashlyticsScreenTracker] on the same [State].
mixin AnalyticsScreenTracker<T extends StatefulWidget> on State<T> {
  String get screenName;

  DateTime? _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
  }

  @override
  void dispose() {
    if (_startTime != null) {
      final duration = DateTime.now().difference(_startTime!).inSeconds;
      ScreenTrackingService.instance.logScreenTimeSpent(screenName, duration);
    }
    super.dispose();
  }
}
