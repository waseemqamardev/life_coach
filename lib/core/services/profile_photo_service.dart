import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Persists profile photos per Firebase user [uid].
class ProfilePhotoService {
  ProfilePhotoService._();
  static final ProfilePhotoService instance = ProfilePhotoService._();

  String? _activeUid;

  void setActiveUser(String? uid) => _activeUid = uid;

  String? get activeUid => _activeUid;

  Future<String> _photoDirectoryPath() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final Directory photoDir = Directory('${appDir.path}/profile_photos');
    if (!await photoDir.exists()) {
      await photoDir.create(recursive: true);
    }
    return photoDir.path;
  }

  String _requireUid() {
    final String? uid = _activeUid;
    if (uid == null || uid.isEmpty) {
      throw StateError('No active user for profile photo operations.');
    }
    return uid;
  }

  Future<String> photoFilePath({String? uid}) async {
    final String resolvedUid = uid ?? _requireUid();
    final String dir = await _photoDirectoryPath();
    return '$dir/profile_photo_$resolvedUid.jpg';
  }

  Future<String> pendingPhotoFilePath({String? uid}) async {
    final String resolvedUid = uid ?? _requireUid();
    final String dir = await _photoDirectoryPath();
    return '$dir/profile_photo_pending_$resolvedUid.jpg';
  }

  Future<String> stagePhoto(File source, {String? uid}) async {
    final String destPath = await pendingPhotoFilePath(uid: uid);
    await source.copy(destPath);
    return destPath;
  }

  Future<String> commitPendingPhoto({String? uid}) async {
    final String pendingPath = await pendingPhotoFilePath(uid: uid);
    final String finalPath = await photoFilePath(uid: uid);
    final File pending = File(pendingPath);
    if (await pending.exists()) {
      await pending.copy(finalPath);
      await pending.delete();
    }
    return finalPath;
  }

  Future<void> discardPendingPhoto({String? uid}) async {
    final File pending = File(await pendingPhotoFilePath(uid: uid));
    if (await pending.exists()) {
      await pending.delete();
    }
  }

  Future<void> deletePhoto({String? uid}) async {
    await discardPendingPhoto(uid: uid);
    final File file = File(await photoFilePath(uid: uid));
    if (await file.exists()) {
      await file.delete();
    }
  }
}
