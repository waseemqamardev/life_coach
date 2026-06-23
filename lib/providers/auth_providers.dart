import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/auth/auth_refresh_notifier.dart';
import '../core/auth/user_storage_scope.dart';
import '../core/services/profile_photo_service.dart';
import '../core/services/storage_service.dart';
import '../data/local/local_database.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/services/auth_service.dart';

typedef UserContextChangedCallback = void Function();
typedef UserDecisionsRefreshCallback = void Function();

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>((Ref ref) => AuthRepository());

final Provider<AuthService> authServiceProvider = Provider<AuthService>(
  (Ref ref) => AuthService(ref.watch(authRepositoryProvider)),
);

final Provider<AuthRefreshListenable> authRefreshListenableProvider =
    Provider<AuthRefreshListenable>((Ref ref) {
  final AuthRefreshListenable listenable = AuthRefreshListenable();
  ref.onDispose(listenable.dispose);
  return listenable;
});

class AuthState {
  const AuthState({
    required this.isLoggedIn,
    this.uid,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.photoPath = '',
    this.isEmailVerified = false,
    this.hasPasswordProvider = false,
  });

  final bool isLoggedIn;
  final String? uid;
  final String name;
  final String email;
  final String phone;
  final String photoPath;
  final bool isEmailVerified;
  final bool hasPasswordProvider;

  AuthState copyWith({
    bool? isLoggedIn,
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? photoPath,
    bool? isEmailVerified,
    bool? hasPasswordProvider,
  }) =>
      AuthState(
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        photoPath: photoPath ?? this.photoPath,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        hasPasswordProvider:
            hasPasswordProvider ?? this.hasPasswordProvider,
      );
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(
    this._service,
    this._refreshListenable,
    this._onUserContextChanged,
    this._refreshUserDecisions,
  ) : super(_initialState()) {
    _subscription = _service.authStateChanges.listen(_onAuthUserChanged);
    final User? user = _service.currentUser;
    if (user != null) {
      unawaited(_syncUser(user));
    }
  }

  final AuthService _service;
  final AuthRefreshListenable _refreshListenable;
  final UserContextChangedCallback _onUserContextChanged;
  final UserDecisionsRefreshCallback _refreshUserDecisions;
  StreamSubscription<User?>? _subscription;

  static AuthState _initialState() {
    final bool loggedIn =
        StorageService.instance.getBool(StorageService.kIsLoggedIn);
    final String uid =
        StorageService.instance.getString(StorageService.kLastActiveUid);

    if (loggedIn && uid.isNotEmpty) {
      return AuthState(
        isLoggedIn: true,
        uid: uid,
        name: UserStorageScope.readName(uid),
        email: UserStorageScope.readEmail(uid),
        phone: UserStorageScope.readPhone(uid),
        photoPath: UserStorageScope.readPhotoPath(uid),
      );
    }

    return const AuthState(isLoggedIn: false);
  }

  Future<void> _onAuthUserChanged(User? user) async {
    if (user == null) {
      await _syncLoggedOut();
    } else {
      await _syncUser(user);
    }
    _refreshListenable.refresh();
  }

  Future<void> _syncUser(User user) async {
    final String uid = user.uid;
    final String previousUid =
        StorageService.instance.getString(StorageService.kLastActiveUid);
    final bool accountSwitched =
        previousUid.isNotEmpty && previousUid != uid;

    await LocalDatabase.instance.switchUser(uid);
    ProfilePhotoService.instance.setActiveUser(uid);

    await StorageService.instance.setBool(StorageService.kIsLoggedIn, true);
    await StorageService.instance.setString(StorageService.kLastActiveUid, uid);

    if (accountSwitched || previousUid.isEmpty) {
      _onUserContextChanged();
    } else {
      _refreshUserDecisions();
    }

    String name = UserStorageScope.readName(uid);
    String email = UserStorageScope.readEmail(uid);
    String phone = UserStorageScope.readPhone(uid);
    String photoPath = UserStorageScope.readPhotoPath(uid);

    if (name.isEmpty && user.displayName?.trim().isNotEmpty == true) {
      name = user.displayName!.trim();
      await UserStorageScope.writeName(uid, name);
    }
    if (email.isEmpty && user.email?.trim().isNotEmpty == true) {
      email = user.email!.trim();
      await UserStorageScope.writeEmail(uid, email);
    }

    state = state.copyWith(
      isLoggedIn: true,
      uid: uid,
      name: name,
      email: email,
      phone: phone,
      photoPath: photoPath,
      isEmailVerified: user.emailVerified,
      hasPasswordProvider: AuthRepository.hasPasswordProvider(user),
    );
  }

  Future<void> _syncLoggedOut() async {
    await LocalDatabase.instance.switchUser(null);
    ProfilePhotoService.instance.setActiveUser(null);

    await StorageService.instance.setBool(StorageService.kIsLoggedIn, false);
    _onUserContextChanged();

    state = state.copyWith(
      isLoggedIn: false,
      uid: null,
      name: '',
      email: '',
      phone: '',
      photoPath: '',
      isEmailVerified: false,
      hasPasswordProvider: false,
    );
  }

  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) =>
      _service.signInWithEmailPassword(email, password);

  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password, {
    String? displayName,
  }) async {
    final UserCredential credential = await _service.signUpWithEmailPassword(
      email,
      password,
      displayName: displayName,
    );
    await _service.sendEmailVerification();
    return credential;
  }

  Future<UserCredential?> signInWithGoogle() => _service.signInWithGoogle();

  Future<void> sendPasswordResetEmail(String email) =>
      _service.sendPasswordResetEmail(email);

  Future<void> sendEmailVerification() => _service.sendEmailVerification();

  Future<bool> reloadUser() async {
    await _service.reloadUser();
    final User? user = _service.currentUser;
    if (user != null) {
      await _syncUser(user);
    }
    _refreshListenable.refresh();
    return user?.emailVerified ?? false;
  }

  Future<void> continueAsGuest() async {
    const String guestUid = 'guest';
    await LocalDatabase.instance.switchUser(guestUid);
    ProfilePhotoService.instance.setActiveUser(guestUid);

    await StorageService.instance.setBool(StorageService.kIsLoggedIn, true);
    await StorageService.instance.setString(StorageService.kLastActiveUid, guestUid);

    await UserStorageScope.writeName(guestUid, 'Guest User');
    await UserStorageScope.writeEmail(guestUid, 'guest@ailifenavigator.local');

    _onUserContextChanged();

    state = const AuthState(
      isLoggedIn: true,
      uid: guestUid,
      name: 'Guest User',
      email: 'guest@ailifenavigator.local',
      isEmailVerified: true,
      hasPasswordProvider: false,
    );

    _refreshListenable.refresh();
  }

  Future<void> signOut() async {
    if (state.uid == 'guest') {
      await _syncLoggedOut();
      _refreshListenable.refresh();
    } else {
      await _service.signOut();
    }
  }

  Future<void> changePassword(
    String currentPassword,
    String newPassword,
  ) =>
      _service.changePassword(currentPassword, newPassword);

  Future<void> deleteAccount({
    String? password,
    bool wipeLocalData = false,
  }) async {
    final String? uid = state.uid ?? _service.currentUser?.uid;
    if (wipeLocalData && uid != null && uid.isNotEmpty) {
      await LocalDatabase.instance.clearUserData(uid);
      await UserStorageScope.clearProfile(uid);
      await ProfilePhotoService.instance.deletePhoto(uid: uid);
    }
    await _service.deleteAccount(password: password);
    await _service.signOut();
  }

  Future<void> logout() => signOut();

  Future<void> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? photoPath,
    bool clearPhoto = false,
  }) async {
    final String? uid = state.uid;
    if (uid == null || uid.isEmpty) return;

    if (name != null) {
      await UserStorageScope.writeName(uid, name);
      try {
        await _service.updateDisplayName(name);
      } catch (_) {
        // Local profile remains saved even if Firebase display name update fails.
      }
    }
    if (email != null) {
      await UserStorageScope.writeEmail(uid, email);
    }
    if (phone != null) {
      await UserStorageScope.writePhone(uid, phone);
    }
    if (clearPhoto) {
      await ProfilePhotoService.instance.deletePhoto(uid: uid);
      await UserStorageScope.writePhotoPath(uid, '');
    } else if (photoPath != null) {
      await UserStorageScope.writePhotoPath(uid, photoPath);
    }
    state = state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      phone: phone ?? state.phone,
      photoPath: clearPhoto ? '' : (photoPath ?? state.photoPath),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
