import 'dart:convert';
import 'dart:io';

import 'l10n_core_translations.dart';

/// Cleans bad MyMemory quota strings, then re-translates via Google Translate.
/// Run: dart run tool/fix_translations.dart
void main() async {
  final Directory dir = Directory('lib/l10n');
  final Map<String, dynamic> en =
      jsonDecode(File('${dir.path}/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;

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

  final List<String> keys = en.keys
      .where((String k) => !k.startsWith('@') && k != '@@locale')
      .toList();

  final Directory cacheDir = Directory('tool/l10n_cache');
  if (!cacheDir.existsSync()) cacheDir.createSync(recursive: true);

  for (final MapEntry<String, String> locale in localePairs.entries) {
    stdout.writeln('\n=== ${locale.key.toUpperCase()} ===');
    final File cacheFile = File('${cacheDir.path}/${locale.key}.json');
    Map<String, String> cache = <String, String>{};

    final Map<String, String>? manual = kCoreTranslations[locale.key];
    if (manual != null) cache.addAll(manual);

    if (cacheFile.existsSync()) {
      try {
        final Map<String, dynamic> raw =
            jsonDecode(cacheFile.readAsStringSync()) as Map<String, dynamic>;
        for (final MapEntry<String, dynamic> e in raw.entries) {
          final String v = e.value as String;
          if (!_isBadTranslation(v, en[e.key] as String? ?? '')) {
            cache[e.key] = v;
          }
        }
      } catch (_) {}
    }

    int fixed = 0;
    for (final String key in keys) {
      final String english = en[key] as String;
      final String? existing = cache[key];
      if (existing != null && !_isBadTranslation(existing, english)) {
        continue;
      }

      cache[key] = await _translateGoogle(english, locale.value);
      cacheFile.writeAsStringSync(
        '${const JsonEncoder.withIndent('  ').convert(cache)}\n',
      );
      fixed++;
      if (fixed % 25 == 0) stdout.writeln('  $fixed fixed...');
      await Future<void>.delayed(const Duration(milliseconds: 80));
    }

    _writeArb(dir, locale.key, en, cache);
    stdout.writeln('Wrote app_${locale.key}.arb ($fixed keys updated)');
  }

  stdout.writeln('\nDone. Run: flutter gen-l10n && dart run tool/check_l10n.dart');
}

bool _isBadTranslation(String value, String english) {
  if (value.contains('MYMEMORY WARNING')) return true;
  if (value.contains('mymemory.translated.net')) return true;
  return false;
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

Future<String> _translateGoogle(String text, String targetLang) async {
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
    'https://translate.googleapis.com/translate_a/single'
    '?client=gtx&sl=en&tl=${Uri.encodeComponent(targetLang)}&dt=t'
    '&q=${Uri.encodeComponent(protected.length > 450 ? protected.substring(0, 450) : protected)}',
  );

  for (int attempt = 0; attempt < 3; attempt++) {
    try {
      final HttpClientRequest req = await _client.getUrl(uri);
      req.headers.set('User-Agent', 'Mozilla/5.0');
      final HttpClientResponse res = await req.close();
      if (res.statusCode != 200) {
        await Future<void>.delayed(Duration(milliseconds: 300 * (attempt + 1)));
        continue;
      }
      final String body = await res.transform(utf8.decoder).join();
      final dynamic parsed = jsonDecode(body);
      final List<dynamic> parts = parsed[0] as List<dynamic>;
      String translated = parts.map((dynamic p) => p[0] as String).join();
      if (_isBadTranslation(translated, text)) continue;

      for (int j = 0; j < placeholders.length; j++) {
        translated = translated.replaceAll('__PH${j}__', placeholders[j]);
        translated = translated.replaceAll('__ PH${j}__', placeholders[j]);
      }
      return translated;
    } catch (_) {
      await Future<void>.delayed(Duration(milliseconds: 300 * (attempt + 1)));
    }
  }
  return text;
}
