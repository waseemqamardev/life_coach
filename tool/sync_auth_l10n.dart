import 'dart:convert';
import 'dart:io';

/// Syncs new/changed l10n keys into all locale ARBs.
/// Run: dart run tool/sync_auth_l10n.dart
void main() async {
  final Directory dir = Directory('lib/l10n');
  final Map<String, dynamic> en =
      jsonDecode(File('${dir.path}/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;

  const List<String> keysToSync = <String>[
    'forgotPasswordSubtitle',
    'forgotPasswordInfo',
    'sendPasswordResetLink',
    'emailVerificationTitle',
    'emailVerificationSubtitle',
    'emailVerificationSpamHint',
    'emailVerificationWaiting',
    'emailVerificationResend',
    'emailVerificationResent',
    'authErrorWrongPassword',
    'authErrorEmailInUse',
    'authErrorWeakPassword',
    'authErrorUserNotFound',
    'authErrorTooManyRequests',
    'authErrorGeneric',
    'authErrorGoogleCancelled',
    'passwordResetEmailSent',
    'changePassword',
    'changePasswordSubtitle',
    'currentPassword',
    'deleteAccount',
    'deleteAccountConfirm',
    'deleteAccountSuccess',
    'accountDeleted',
    'pickImageSourceTitle',
    'pickFromCamera',
    'pickFromGallery',
    'removePhoto',
    'cameraPermissionDenied',
    'galleryPermissionDenied',
    'openSettings',
  ];

  const Set<String> forceRetranslate = <String>{
    'forgotPasswordSubtitle',
    'forgotPasswordInfo',
    'sendPasswordResetLink',
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

  final Directory cacheDir = Directory('tool/l10n_cache');
  if (!cacheDir.existsSync()) cacheDir.createSync(recursive: true);

  for (final MapEntry<String, String> locale in localePairs.entries) {
    stdout.writeln('=== ${locale.key} ===');
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

    int updated = 0;
    for (final String key in keysToSync) {
      final String english = en[key] as String;
      final String? arbVal = arb[key] as String?;

      if (!forceRetranslate.contains(key) &&
          arbVal != null &&
          arbVal != english) {
        cache[key] = arbVal;
        continue;
      }

      cache[key] = await translateGoogle(english, locale.value);
      updated++;
      await Future<void>.delayed(const Duration(milliseconds: 80));
    }

    cacheFile.writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(cache)}\n',
    );

    final Map<String, dynamic> out = <String, dynamic>{'@@locale': locale.key};
    for (final String key in en.keys) {
      if (key.startsWith('@') || key == '@@locale') {
        if (key.startsWith('@') && key != '@@locale') out[key] = en[key];
        continue;
      }
      out[key] = cache[key] ?? arb[key] ?? en[key];
    }
    arbFile.writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(out)}\n',
    );
    stdout.writeln('Updated $updated keys in app_${locale.key}.arb');
  }

  stdout.writeln('Done. Run: flutter gen-l10n');
}

final HttpClient _client = HttpClient();

Future<String> translateGoogle(String text, String targetLang) async {
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
