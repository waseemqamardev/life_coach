import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_constants.dart';
import '../../data/repositories/auth_repository.dart';

/// Redirect rules for authenticated vs public routes.
String? authGuardRedirect(GoRouterState state) {
  final User? user = FirebaseAuth.instance.currentUser;
  final String location = state.matchedLocation;

  const Set<String> publicRoutes = <String>{
    AppRoutes.splash,
    AppRoutes.language,
    AppRoutes.onboarding,
    AppRoutes.login,
    AppRoutes.signup,
    AppRoutes.forgotPassword,
    AppRoutes.emailVerification,
  };

  const Set<String> authRoutes = <String>{
    AppRoutes.login,
    AppRoutes.signup,
    AppRoutes.forgotPassword,
    AppRoutes.emailVerification,
    AppRoutes.otp,
    AppRoutes.resetPassword,
  };

  if (user == null) {
    if (publicRoutes.contains(location)) return null;
    return AppRoutes.login;
  }

  final bool isPasswordUser = AuthRepository.hasPasswordProvider(user);
  if (isPasswordUser && !user.emailVerified) {
    if (location == AppRoutes.emailVerification) return null;
    return AppRoutes.emailVerification;
  }

  if (authRoutes.contains(location)) {
    return AppRoutes.home;
  }

  return null;
}
