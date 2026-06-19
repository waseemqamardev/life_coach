import 'dart:convert';
import 'dart:io';

import 'l10n_core_translations.dart';

/// Builds locale ARB files: manual translations first, then English fallback.
void main() {
  final Directory dir = Directory('lib/l10n');
  final Map<String, dynamic> en =
      jsonDecode(File('${dir.path}/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;

  for (final MapEntry<String, Map<String, String>> entry
      in kCoreTranslations.entries) {
    final Map<String, String> localeMap = entry.value;
    final Map<String, dynamic> out = <String, dynamic>{'@@locale': entry.key};
    for (final String key in en.keys) {
      if (key.startsWith('@') || key == '@@locale') {
        if (key.startsWith('@') && key != '@@locale') out[key] = en[key];
        continue;
      }
      out[key] = localeMap[key] ?? en[key];
    }
    File('${dir.path}/app_${entry.key}.arb').writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(out)}\n',
    );
    stdout.writeln('Built app_${entry.key}.arb');
  }
}
