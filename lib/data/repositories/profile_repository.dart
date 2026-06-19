import '../../core/services/storage_service.dart';
import '../models/profile/user_profile.dart';

class ProfileRepository {
  Future<UserProfile> load() async {
    return UserProfile(
      name: StorageService.instance.getString(StorageService.kUserName),
      email: StorageService.instance.getString(StorageService.kUserEmail),
      phone: StorageService.instance.getString(StorageService.kUserPhone),
      photoPath:
          StorageService.instance.getString(StorageService.kUserPhotoPath),
      language: StorageService.instance.getString(
        StorageService.kLanguage,
        defaultValue: 'en',
      ),
      themeMode: StorageService.instance.getString(
        StorageService.kThemeMode,
        defaultValue: 'system',
      ),
    );
  }

  Future<void> save(UserProfile profile) async {
    await StorageService.instance.setString(StorageService.kUserName, profile.name);
    await StorageService.instance.setString(StorageService.kUserEmail, profile.email);
    await StorageService.instance.setString(StorageService.kUserPhone, profile.phone);
    await StorageService.instance.setString(
      StorageService.kUserPhotoPath,
      profile.photoPath,
    );
    await StorageService.instance.setString(StorageService.kLanguage, profile.language);
    await StorageService.instance.setString(StorageService.kThemeMode, profile.themeMode);
  }
}
