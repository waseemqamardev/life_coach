import 'package:flutter/widgets.dart';

import 'screen_tracking_service.dart';

/// Crashlytics + Analytics for [StatefulWidget] screens.
mixin ScreenTrackerMixin<T extends StatefulWidget> on State<T> {
  String get screenName;

  DateTime? _screenEnteredAt;

  @override
  void initState() {
    super.initState();
    _screenEnteredAt = DateTime.now();
    ScreenTrackingService.instance.logScreenAppear(screenName);
  }

  @override
  void dispose() {
    if (_screenEnteredAt != null) {
      final seconds = DateTime.now().difference(_screenEnteredAt!).inSeconds;
      ScreenTrackingService.instance.logScreenTimeSpent(screenName, seconds);
    }
    super.dispose();
  }
}
