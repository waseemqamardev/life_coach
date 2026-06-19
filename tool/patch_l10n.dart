import 'dart:convert';
import 'dart:io';

import 'l10n_core_translations.dart';

/// Merges manual translations + API cache + English template into locale ARBs.
/// Run after: dart run tool/auto_translate_arbs.dart (partial or full)
void main() {
  final Directory dir = Directory('lib/l10n');
  final File enFile = File('${dir.path}/app_en.arb');
  final Map<String, dynamic> en =
      jsonDecode(enFile.readAsStringSync()) as Map<String, dynamic>;

  final Directory cacheDir = Directory('tool/l10n_cache');

  for (final MapEntry<String, Map<String, String>> entry
      in kCoreTranslations.entries) {
    final Map<String, String> localeMap = entry.value;
    Map<String, String> cache = <String, String>{};
    final File cacheFile = File('${cacheDir.path}/${entry.key}.json');
    if (cacheFile.existsSync()) {
      cache = Map<String, String>.from(
        jsonDecode(cacheFile.readAsStringSync()) as Map<String, dynamic>,
      );
    }

    final Map<String, dynamic> out = <String, dynamic>{'@@locale': entry.key};
    for (final String key in en.keys) {
      if (key.startsWith('@') || key == '@@locale') {
        if (key.startsWith('@') && key != '@@locale') out[key] = en[key];
        continue;
      }
      out[key] = localeMap[key] ?? cache[key] ?? en[key];
    }
    File('${dir.path}/app_${entry.key}.arb').writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(out)}\n',
    );
    stdout.writeln('Patched app_${entry.key}.arb');
  }
}
