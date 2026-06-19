import 'dart:convert';
import 'dart:io';

void main() {
  final Map<String, dynamic> en =
      jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;
  final List<String> keys = en.keys
      .where((String k) => !k.startsWith('@') && k != '@@locale')
      .toList();
  stdout.writeln('Total keys: ${keys.length}');
  for (final String loc
      in <String>['ur', 'ar', 'hi', 'fr', 'de', 'es', 'zh', 'ja', 'ko', 'pt', 'ru', 'tr', 'id', 'it', 'bn']) {
    final Map<String, dynamic> m =
        jsonDecode(File('lib/l10n/app_$loc.arb').readAsStringSync())
            as Map<String, dynamic>;
    int same = 0;
    int bad = 0;
    for (final String k in keys) {
      final String? v = m[k] as String?;
      if (v == null) continue;
      if (v.contains('MYMEMORY WARNING')) {
        bad++;
        continue;
      }
      if (v == en[k]) same++;
    }
    stdout.writeln(
      '$loc: ${keys.length - same - bad}/${keys.length} translated '
      '($same English, $bad corrupted)',
    );
  }
}
