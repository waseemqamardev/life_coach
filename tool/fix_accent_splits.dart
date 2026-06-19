import 'dart:convert';
import 'dart:io';

/// Re-splits Leading/Accent pairs from full translated title keys.
void main() {
  const Map<String, (String leadingKey, String accentKey)> fullTitles =
      <String, (String, String)>{
    'notifications': ('notificationsLeading', 'notificationsAccent'),
    'privacyPolicy': ('privacyLeading', 'privacyAccent'),
    'termsOfService': ('termsLeading', 'termsAccent'),
    'forgotPassword': ('forgotPasswordLeading', 'forgotPasswordAccent'),
  };

  for (final String loc in <String>[
    'ur', 'ar', 'hi', 'bn', 'zh', 'fr', 'de', 'es', 'ja', 'ko', 'pt', 'ru', 'tr',
    'id', 'it',
  ]) {
    final File f = File('lib/l10n/app_$loc.arb');
    final Map<String, dynamic> arb =
        jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;

    for (final MapEntry<String, (String, String)> e in fullTitles.entries) {
      final String? full = arb[e.key] as String?;
      if (full == null || full.isEmpty) continue;
      final (String leadingKey, String accentKey) = e.value;
      final (String leading, String accent) = _splitTitle(full);
      arb[leadingKey] = leading;
      arb[accentKey] = accent;
    }

    f.writeAsStringSync('${const JsonEncoder.withIndent('  ').convert(arb)}\n');
    stdout.writeln('Updated accent splits: $loc');
  }
}

(String, String) _splitTitle(String title) {
  final String trimmed = title.trim();
  if (trimmed.length <= 1) return (trimmed, '');
  if (trimmed.contains(' ')) {
    final int idx = trimmed.lastIndexOf(' ');
    return (trimmed.substring(0, idx), trimmed.substring(idx + 1));
  }
  final int splitAt = (trimmed.length * 0.55).ceil().clamp(1, trimmed.length - 1);
  return (trimmed.substring(0, splitAt), trimmed.substring(splitAt));
}
