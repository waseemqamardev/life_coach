class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    this.phone = '',
    this.photoPath = '',
    this.language = 'en',
    this.themeMode = 'system',
    this.notificationsEnabled = true,
  });

  final String name;
  final String email;
  final String phone;
  final String photoPath;
  final String language;
  final String themeMode;
  final bool notificationsEnabled;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      photoPath: json['photoPath']?.toString() ?? '',
      language: json['language']?.toString() ?? 'en',
      themeMode: json['themeMode']?.toString() ?? 'system',
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'phone': phone,
        'photoPath': photoPath,
        'language': language,
        'themeMode': themeMode,
        'notificationsEnabled': notificationsEnabled,
      };

  UserProfile copyWith({
    String? name,
    String? email,
    String? phone,
    String? photoPath,
    String? language,
    String? themeMode,
    bool? notificationsEnabled,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoPath: photoPath ?? this.photoPath,
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
