import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../l10n/app_localizations.dart';

/// Maps Firebase and Google sign-in errors to localized user messages.
class AuthExceptionMapper {
  AuthExceptionMapper._();

  static String message(Object error, AppLocalizations l10n) {
    if (error is GoogleSignInException &&
        error.code == GoogleSignInExceptionCode.canceled) {
      return l10n.authErrorGoogleCancelled;
    }
    if (error is FirebaseAuthException) {
      return _firebaseMessage(error, l10n);
    }
    return l10n.authErrorGeneric;
  }

  static String _firebaseMessage(
    FirebaseAuthException error,
    AppLocalizations l10n,
  ) {
    switch (error.code) {
      case 'wrong-password':
      case 'invalid-credential':
      case 'invalid-login-credentials':
        return l10n.authErrorWrongPassword;
      case 'email-already-in-use':
        return l10n.authErrorEmailInUse;
      case 'weak-password':
        return l10n.authErrorWeakPassword;
      case 'user-not-found':
        return l10n.authErrorUserNotFound;
      case 'too-many-requests':
        return l10n.authErrorTooManyRequests;
      case 'missing-password':
        return l10n.passwordRequired;
      default:
        return l10n.authErrorGeneric;
    }
  }
}
