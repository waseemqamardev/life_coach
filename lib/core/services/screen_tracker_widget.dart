import 'package:flutter/material.dart';

import 'screen_tracking_service.dart';

abstract class TrackableStatelessWidget extends StatelessWidget {
  const TrackableStatelessWidget({super.key});

  String get screenName;

  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return TrackedScreen(
      screenName: screenName,
      child: buildScreen(context),
    );
  }
}

class TrackedScreen extends StatefulWidget {
  final String screenName;
  final Widget child;

  const TrackedScreen({
    super.key,
    required this.screenName,
    required this.child,
  });

  @override
  State<TrackedScreen> createState() => _TrackedScreenState();
}

class _TrackedScreenState extends State<TrackedScreen> {
  late final DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    ScreenTrackingService.instance.logScreenAppear(widget.screenName);
  }

  @override
  void dispose() {
    final duration = DateTime.now().difference(_startTime).inSeconds;
    ScreenTrackingService.instance.logScreenTimeSpent(
      widget.screenName,
      duration,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
