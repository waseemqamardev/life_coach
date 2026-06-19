import 'dart:convert';
import 'dart:io';

void main() {
  final Map<String, dynamic> en =
      jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;
  final List<String> keys = en.keys
      .where((String k) => !k.startsWith('@') && k != '@@locale')
      .toList();
  for (final String loc in <String>[
    'ur', 'ar', 'hi', 'fr', 'de', 'es', 'zh', 'ja', 'ko', 'pt', 'ru', 'tr',
    'id', 'it', 'bn',
  ]) {
    final Map<String, dynamic> m =
        jsonDecode(File('lib/l10n/app_$loc.arb').readAsStringSync())
            as Map<String, dynamic>;
    final List<String> same = <String>[];
    for (final String k in keys) {
      if (m[k] == en[k]) same.add(k);
    }
    if (same.isEmpty) continue;
    stdout.writeln('=== $loc (${same.length}) ===');
    for (final String k in same) {
      stdout.writeln('  $k: ${en[k]}');
    }
  }
}
