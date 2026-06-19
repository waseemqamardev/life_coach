import 'dart:convert';
import 'dart:io';

/// Re-translates keys still identical to English (excluding international tokens).
/// Run: dart run tool/fix_remaining_english.dart
void main() async {
  final Map<String, dynamic> en =
      jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;

  const Set<String> keepAsIs = <String>{
    'cardCvvHint',
    'cardExpiryHint',
    'imageJpgPng',
    'paymentPayPal',
    'paymentGooglePay',
    'paymentApplePay',
    'versionLabel',
  };

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
  final Directory dir = Directory('lib/l10n');

  for (final MapEntry<String, String> locale in localePairs.entries) {
    final File cacheFile = File('${cacheDir.path}/${locale.key}.json');
    Map<String, String> cache = <String, String>{};
    if (cacheFile.existsSync()) {
      cache = Map<String, String>.from(
        jsonDecode(cacheFile.readAsStringSync()) as Map<String, dynamic>,
      );
    }

    final File arbFile = File('${dir.path}/app_${locale.key}.arb');
    final Map<String, dynamic> arb =
        jsonDecode(arbFile.readAsStringSync()) as Map<String, dynamic>;

    int fixed = 0;
    for (final String key in keys) {
      if (keepAsIs.contains(key)) continue;
      final String english = en[key] as String;
      final String current = arb[key] as String? ?? english;

      final bool isRtl = locale.key == 'ur' || locale.key == 'ar';
      final bool isCjk = <String>['zh', 'ja', 'ko', 'hi', 'bn'].contains(locale.key);

      // Romance/Germanic cognates are fine when short.
      if (!isRtl && !isCjk && current == english && english.length < 12) {
        continue;
      }
      if (current != english) continue;

      final String translated = await _translateGoogle(english, locale.value);
      if (translated != english) {
        cache[key] = translated;
        arb[key] = translated;
        fixed++;
      }
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }

    if (fixed > 0) {
      cacheFile.writeAsStringSync(
        '${const JsonEncoder.withIndent('  ').convert(cache)}\n',
      );
      arbFile.writeAsStringSync(
        '${const JsonEncoder.withIndent('  ').convert(arb)}\n',
      );
      stdout.writeln('${locale.key}: fixed $fixed keys');
    }
  }
  stdout.writeln('Done.');
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

  try {
    final HttpClientRequest req = await _client.getUrl(uri);
    req.headers.set('User-Agent', 'Mozilla/5.0');
    final HttpClientResponse res = await req.close();
    if (res.statusCode != 200) return text;
    final String body = await res.transform(utf8.decoder).join();
    final dynamic parsed = jsonDecode(body);
    String translated =
        (parsed[0] as List<dynamic>).map((dynamic p) => p[0] as String).join();
    for (int j = 0; j < placeholders.length; j++) {
      translated = translated.replaceAll('__PH${j}__', placeholders[j]);
    }
    return translated;
  } catch (_) {
    return text;
  }
}
