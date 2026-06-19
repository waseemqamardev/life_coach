import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repositories/auth_repository.dart';

/// Thin domain wrapper around [AuthRepository].
class AuthService {
  AuthService(this._repository);

  final AuthRepository _repository;

  Stream<User?> get authStateChanges => _repository.authStateChanges;

  User? get currentUser => _repository.currentUser;

  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) =>
      _repository.signInWithEmailPassword(email, password);

  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password, {
    String? displayName,
  }) =>
      _repository.signUpWithEmailPassword(
        email,
        password,
        displayName: displayName,
      );

  Future<UserCredential?> signInWithGoogle() => _repository.signInWithGoogle();

  Future<void> updateDisplayName(String name) =>
      _repository.updateDisplayName(name);

  Future<void> sendPasswordResetEmail(String email) =>
      _repository.sendPasswordResetEmail(email);

  Future<void> sendEmailVerification() => _repository.sendEmailVerification();

  Future<void> reloadUser() => _repository.reloadUser();

  Future<void> signOut() => _repository.signOut();

  Future<void> changePassword(String currentPassword, String newPassword) =>
      _repository.changePassword(currentPassword, newPassword);

  Future<void> deleteAccount({String? password}) =>
      _repository.deleteAccount(password: password);
}
