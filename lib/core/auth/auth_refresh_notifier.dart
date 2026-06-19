import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Notifies [GoRouter] when Firebase auth state changes.
class AuthRefreshListenable extends ChangeNotifier {
  AuthRefreshListenable() {
    _subscription =
        FirebaseAuth.instance.authStateChanges().listen((User? _) {
      notifyListeners();
    });
  }

  StreamSubscription<User?>? _subscription;

  void refresh() => notifyListeners();

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
