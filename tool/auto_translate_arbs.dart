import 'dart:convert';
import 'dart:io';

import 'l10n_core_translations.dart';

/// Fully translates all app_en.arb keys into 15 locale ARB files.
/// Uses manual maps + cache + MyMemory API. Resumes from tool/l10n_cache/.
/// Run: dart run tool/auto_translate_arbs.dart
void main() async {
  final Directory dir = Directory('lib/l10n');
  final Map<String, dynamic> en =
      jsonDecode(File('${dir.path}/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;

  // Urdu and Arabic first (RTL priority), then rest.
  const Map<String, String> localePairs = <String, String>{
    'ur': 'ur',
    'ar': 'ar',
    'hi': 'hi',
    'bn': 'bn',
    'zh': 'zh-CN',
    'fr': 'fr',
    'de': 'de',
    'es': 'es',
    'ja': 'ja',
    'ko': 'ko',
    'pt': 'pt',
    'ru': 'ru',
    'tr': 'tr',
    'id': 'id',
    'it': 'it',
  };

  final Directory cacheDir = Directory('tool/l10n_cache');
  if (!cacheDir.existsSync()) cacheDir.createSync(recursive: true);

  final List<String> keys = en.keys
      .where((String k) => !k.startsWith('@') && k != '@@locale')
      .toList();

  stdout.writeln('Translating ${keys.length} keys × ${localePairs.length} locales...');

  for (final MapEntry<String, String> locale in localePairs.entries) {
    stdout.writeln('\n=== ${locale.key.toUpperCase()} ===');
    final File cacheFile = File('${cacheDir.path}/${locale.key}.json');
    Map<String, String> cache = <String, String>{};

    // Seed from manual translations.
    final Map<String, String>? manual = kCoreTranslations[locale.key];
    if (manual != null) cache.addAll(manual);

    if (cacheFile.existsSync()) {
      try {
        cache.addAll(Map<String, String>.from(
          jsonDecode(cacheFile.readAsStringSync()) as Map<String, dynamic>,
        ));
      } catch (_) {
        stdout.writeln('  (cache corrupt, rebuilding)');
      }
    }

    // Seed from existing ARB if already translated.
    final File existingArb = File('${dir.path}/app_${locale.key}.arb');
    if (existingArb.existsSync()) {
      final Map<String, dynamic> existingMap =
          jsonDecode(existingArb.readAsStringSync()) as Map<String, dynamic>;
      for (final String key in keys) {
        if (existingMap[key] != null && existingMap[key] != en[key]) {
          cache[key] = existingMap[key] as String;
        }
      }
    }

    int done = 0;
    int skipped = 0;
    for (final String key in keys) {
      if (cache.containsKey(key) && cache[key] != en[key]) {
        skipped++;
        continue;
      }
      final String english = en[key] as String;
      cache[key] = await _translateWithRetry(english, locale.value);
      cacheFile.writeAsStringSync(
        '${const JsonEncoder.withIndent('  ').convert(cache)}\n',
      );
      done++;
      if (done % 25 == 0) stdout.writeln('  $done translated, $skipped skipped...');
      await Future<void>.delayed(const Duration(milliseconds: 120));
    }

    _writeArb(dir, locale.key, en, cache);
    stdout.writeln('Wrote app_${locale.key}.arb ($done new, $skipped skipped)');
  }

  stdout.writeln('\nAll locales complete. Run: flutter gen-l10n');
}

void _writeArb(
  Directory dir,
  String localeCode,
  Map<String, dynamic> en,
  Map<String, String> cache,
) {
  final Map<String, dynamic> out = <String, dynamic>{'@@locale': localeCode};
  for (final String key in en.keys) {
    if (key.startsWith('@') || key == '@@locale') {
      if (key.startsWith('@') && key != '@@locale') out[key] = en[key];
      continue;
    }
    out[key] = cache[key] ?? en[key];
  }
  File('${dir.path}/app_$localeCode.arb').writeAsStringSync(
    '${const JsonEncoder.withIndent('  ').convert(out)}\n',
  );
}

final HttpClient _client = HttpClient();

Future<String> _translateWithRetry(String text, String targetLang) async {
  for (int attempt = 0; attempt < 4; attempt++) {
    final String result = await _translate(text, targetLang);
    if (result != text || text.length < 4) return result;
    await Future<void>.delayed(Duration(milliseconds: 500 * (attempt + 1)));
  }
  return text;
}

Future<String> _translate(String text, String targetLang) async {
  if (text.trim().isEmpty) return text;

  final List<String> placeholders = <String>[];
  String protected = text;
  final RegExp ph = RegExp(r'\{[a-zA-Z]+\}');
  int i = 0;
  for (final RegExpMatch m in ph.allMatches(text)) {
    placeholders.add(m.group(0)!);
    protected = protected.replaceFirst(m.group(0)!, '__PH${i}__');
    i++;
  }

  final Uri uri = Uri.parse(
    'https://api.mymemory.translated.net/get'
    '?q=${Uri.encodeComponent(protected.length > 450 ? protected.substring(0, 450) : protected)}'
    '&langpair=en|$targetLang',
  );

  try {
    final HttpClientRequest req = await _client.getUrl(uri);
    final HttpClientResponse res = await req.close();
    final String body = await res.transform(utf8.decoder).join();
    final Map<String, dynamic> json =
        jsonDecode(body) as Map<String, dynamic>;
    final Map<String, dynamic> responseData =
        json['responseData'] as Map<String, dynamic>;
    String translated = responseData['translatedText'] as String;

    if (translated.contains('MYMEMORY WARNING') ||
        translated.contains('mymemory.translated.net')) {
      return text;
    }
    if (translated.toUpperCase() == protected.toUpperCase()) {
      final String status = json['responseStatus']?.toString() ?? '';
      if (status != '200') return text;
    }

    for (int j = 0; j < placeholders.length; j++) {
      translated = translated.replaceAll('__PH${j}__', placeholders[j]);
      translated = translated.replaceAll('__ PH${j}__', placeholders[j]);
    }
    return translated;
  } catch (e) {
    return text;
  }
}
