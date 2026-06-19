import 'package:flutter/material.dart';

import '../constants/supported_languages.dart';

/// Shared instruction for Gemini prompts based on app locale.
class AiLocale {
  AiLocale._();

  static String responseLanguageInstruction(Locale locale) {
    final String name = SupportedLanguage.aiLanguageName(locale);
    return 'Respond entirely in $name. Use natural, clear language for the user.';
  }
}
