import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Runtime configuration loaded from `.env` (not committed to git).
class AppEnv {
  AppEnv._();

  static String get geminiApiKey {
    if (!dotenv.isInitialized) return '';
    return dotenv.env['GEMINI_API_KEY']?.trim() ?? '';
  }

  static bool get hasGeminiKey => geminiApiKey.isNotEmpty;

  /// Web OAuth client ID from Firebase (required for Google Sign-In ID tokens).
  static String get googleWebClientId {
    if (!dotenv.isInitialized) return '';
    return dotenv.env['GOOGLE_WEB_CLIENT_ID']?.trim() ?? '';
  }

  static const String geminiModel = 'gemini-2.5-flash';

  /// Fallback models if the primary model is unavailable for this API key.
  static const List<String> geminiModelFallbacks = <String>[
    'gemini-2.5-pro',
    'gemini-2.0-flash',
    'gemini-1.5-flash',
  ];

  static List<String> get geminiModels =>
      <String>[geminiModel, ...geminiModelFallbacks];
}
