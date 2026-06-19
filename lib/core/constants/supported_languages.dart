import 'package:flutter/material.dart';

import '../../generated/assets.dart';

/// All 16 supported app languages (display metadata + locale mapping).
class SupportedLanguage {
  const SupportedLanguage({
    required this.id,
    required this.locale,
    required this.label,
    required this.iconAsset,
    this.rtl = false,
    this.aiName = 'English',
  });

  final String id;
  final Locale locale;
  final String label;
  final String iconAsset;
  final bool rtl;
  final String aiName;

  static const List<SupportedLanguage> all = <SupportedLanguage>[
    SupportedLanguage(
      id: 'en-US',
      locale: Locale('en', 'US'),
      label: 'US (English)',
      iconAsset: Assets.iconsEng,
      aiName: 'English',
    ),
    SupportedLanguage(
      id: 'ar',
      locale: Locale('ar'),
      label: 'Arabic (العربية)',
      iconAsset: Assets.iconsSaudi,
      rtl: true,
      aiName: 'Arabic',
    ),
    SupportedLanguage(
      id: 'bn',
      locale: Locale('bn'),
      label: 'Bengali (বাংলা)',
      iconAsset: Assets.iconsBangladesh,
      aiName: 'Bengali',
    ),
    SupportedLanguage(
      id: 'zh',
      locale: Locale('zh'),
      label: 'Chinese (中文)',
      iconAsset: Assets.iconsChinese,
      aiName: 'Chinese',
    ),
    SupportedLanguage(
      id: 'fr',
      locale: Locale('fr'),
      label: 'French (Français)',
      iconAsset: Assets.iconsFrench,
      aiName: 'French',
    ),
    SupportedLanguage(
      id: 'de',
      locale: Locale('de'),
      label: 'German (Deutsch)',
      iconAsset: Assets.iconsGerman,
      aiName: 'German',
    ),
    SupportedLanguage(
      id: 'hi',
      locale: Locale('hi'),
      label: 'Hindi (हिन्दी)',
      iconAsset: Assets.iconsIndia,
      aiName: 'Hindi',
    ),
    SupportedLanguage(
      id: 'id',
      locale: Locale('id'),
      label: 'Indonesian (Bahasa Indonesia)',
      iconAsset: Assets.iconsIndonessian,
      aiName: 'Indonesian',
    ),
    SupportedLanguage(
      id: 'it',
      locale: Locale('it'),
      label: 'Italian (Italiano)',
      iconAsset: Assets.iconsItaly,
      aiName: 'Italian',
    ),
    SupportedLanguage(
      id: 'ja',
      locale: Locale('ja'),
      label: 'Japanese (日本語)',
      iconAsset: Assets.iconsJapanee,
      aiName: 'Japanese',
    ),
    SupportedLanguage(
      id: 'ko',
      locale: Locale('ko'),
      label: 'Korean (한국어)',
      iconAsset: Assets.iconsKorea,
      aiName: 'Korean',
    ),
    SupportedLanguage(
      id: 'ur',
      locale: Locale('ur'),
      label: 'Urdu (اردو)',
      iconAsset: Assets.iconsIndia,
      rtl: true,
      aiName: 'Urdu',
    ),
    SupportedLanguage(
      id: 'pt',
      locale: Locale('pt'),
      label: 'Portuguese (Português)',
      iconAsset: Assets.iconsPortuguees,
      aiName: 'Portuguese',
    ),
    SupportedLanguage(
      id: 'ru',
      locale: Locale('ru'),
      label: 'Russian (Русский)',
      iconAsset: Assets.iconsRussian,
      aiName: 'Russian',
    ),
    SupportedLanguage(
      id: 'es',
      locale: Locale('es'),
      label: 'Spanish (Español)',
      iconAsset: Assets.iconsSpain,
      aiName: 'Spanish',
    ),
    SupportedLanguage(
      id: 'tr',
      locale: Locale('tr'),
      label: 'Turkish (Türkçe)',
      iconAsset: Assets.iconsTurkey,
      aiName: 'Turkish',
    ),
  ];

  static SupportedLanguage? byId(String id) {
    for (final SupportedLanguage lang in all) {
      if (lang.id == id) return lang;
    }
    return null;
  }

  static Locale localeFromId(String id) =>
      byId(id)?.locale ?? const Locale('en', 'US');

  static String idFromLocale(Locale locale) {
    for (final SupportedLanguage lang in all) {
      if (lang.locale.languageCode == locale.languageCode &&
          (lang.locale.countryCode == null ||
              lang.locale.countryCode == locale.countryCode)) {
        return lang.id;
      }
    }
    return 'en-US';
  }

  static bool isRtl(Locale locale) {
    final SupportedLanguage? lang = byId(idFromLocale(locale));
    return lang?.rtl ?? false;
  }

  static String aiLanguageName(Locale locale) {
    final SupportedLanguage? lang = byId(idFromLocale(locale));
    return lang?.aiName ?? 'English';
  }

  static List<Locale> get locales =>
      all.map((SupportedLanguage l) => l.locale).toList();
}
