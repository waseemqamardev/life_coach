import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/config/app_env.dart';

/// Wraps [FirebaseAuth] and [GoogleSignIn] for email/password and Google flows.
class AuthRepository {
  AuthRepository({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _auth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  bool _googleInitialized = false;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) return;
    final String serverClientId = AppEnv.googleWebClientId;
    await _googleSignIn.initialize(
      serverClientId: serverClientId.isNotEmpty ? serverClientId : null,
    );
    _googleInitialized = true;
  }

  Future<void> updateDisplayName(String name) async {
    final User? user = _auth.currentUser;
    if (user == null) return;
    final String trimmed = name.trim();
    if (trimmed.isEmpty) return;
    await user.updateDisplayName(trimmed);
    await user.reload();
  }

  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) {
    return _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password, {
    String? displayName,
  }) async {
    final UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    if (displayName != null && displayName.trim().isNotEmpty) {
      await credential.user?.updateDisplayName(displayName.trim());
    }
    return credential;
  }

  /// Returns `null` when the user cancels Google sign-in.
  Future<UserCredential?> signInWithGoogle() async {
    await _ensureGoogleInitialized();
    try {
      final GoogleSignInAccount account = await _googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = account.authentication;
      final String? idToken = googleAuth.idToken;
      if (idToken == null || idToken.isEmpty) {
        throw FirebaseAuthException(
          code: 'invalid-credential',
          message:
              'Google sign-in did not return an ID token. Add GOOGLE_WEB_CLIENT_ID to .env and enable Google sign-in in Firebase.',
        );
      }
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: idToken,
      );
      return _auth.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email.trim());
  }

  Future<void> sendEmailVerification() async {
    final User? user = _auth.currentUser;
    if (user == null) return;
    await user.sendEmailVerification();
  }

  Future<void> reloadUser() async {
    await _auth.currentUser?.reload();
  }

  Future<void> signOut() async {
    await _ensureGoogleInitialized();
    await Future.wait(<Future<void>>[
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<void> changePassword(String currentPassword, String newPassword) async {
    final User? user = _auth.currentUser;
    if (user == null || user.email == null) {
      throw FirebaseAuthException(code: 'user-not-found');
    }
    final AuthCredential credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );
    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(newPassword);
  }

  Future<void> deleteAccount({String? password}) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(code: 'user-not-found');
    }

    if (_hasPasswordProvider(user)) {
      if (password == null || password.isEmpty) {
        throw FirebaseAuthException(code: 'missing-password');
      }
      await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        ),
      );
    } else if (_hasGoogleProvider(user)) {
      await _ensureGoogleInitialized();
      final GoogleSignInAccount account = await _googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = account.authentication;
      await user.reauthenticateWithCredential(
        GoogleAuthProvider.credential(idToken: googleAuth.idToken),
      );
    }

    await user.delete();
  }

  static bool hasPasswordProvider(User? user) => _hasPasswordProvider(user);

  static bool hasGoogleProvider(User? user) => _hasGoogleProvider(user);

  static bool _hasPasswordProvider(User? user) {
    if (user == null) return false;
    return user.providerData
        .any((UserInfo info) => info.providerId == 'password');
  }

  static bool _hasGoogleProvider(User? user) {
    if (user == null) return false;
    return user.providerData
        .any((UserInfo info) => info.providerId == 'google.com');
  }
}
