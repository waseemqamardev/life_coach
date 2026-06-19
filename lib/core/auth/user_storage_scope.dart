import '../services/storage_service.dart';

/// Helpers for profile and session keys scoped to a Firebase [uid].
class UserStorageScope {
  UserStorageScope._();

  static String profileKey(String baseKey, String uid) => '${baseKey}_$uid';

  static String nameKey(String uid) =>
      profileKey(StorageService.kUserName, uid);

  static String emailKey(String uid) =>
      profileKey(StorageService.kUserEmail, uid);

  static String phoneKey(String uid) =>
      profileKey(StorageService.kUserPhone, uid);

  static String photoPathKey(String uid) =>
      profileKey(StorageService.kUserPhotoPath, uid);

  static String readName(String uid) =>
      StorageService.instance.getString(nameKey(uid));

  static String readEmail(String uid) =>
      StorageService.instance.getString(emailKey(uid));

  static String readPhone(String uid) =>
      StorageService.instance.getString(phoneKey(uid));

  static String readPhotoPath(String uid) =>
      StorageService.instance.getString(photoPathKey(uid));

  static Future<void> writeName(String uid, String value) =>
      StorageService.instance.setString(nameKey(uid), value);

  static Future<void> writeEmail(String uid, String value) =>
      StorageService.instance.setString(emailKey(uid), value);

  static Future<void> writePhone(String uid, String value) =>
      StorageService.instance.setString(phoneKey(uid), value);

  static Future<void> writePhotoPath(String uid, String value) =>
      StorageService.instance.setString(photoPathKey(uid), value);

  static Future<void> clearProfile(String uid) async {
    await writeName(uid, '');
    await writeEmail(uid, '');
    await writePhone(uid, '');
    await writePhotoPath(uid, '');
  }
}
