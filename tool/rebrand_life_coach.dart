import 'dart:convert';
import 'dart:io';

/// Replaces Life Navigator branding with Life Coach across all ARB files.
/// Run: dart run tool/rebrand_life_coach.dart
void main() {
  const String enPath = 'lib/l10n/app_en.arb';
  final Map<String, dynamic> en =
      jsonDecode(File(enPath).readAsStringSync()) as Map<String, dynamic>;

  // English source updates (template).
  en['appTitle'] = 'Life Coach';
  en['aiNavigator'] = 'Life Coach';
  en['life'] = 'Life';
  en['navigator'] = 'Coach';
  en['authTagline'] = 'AI Goal Planner';
  en['aboutBody'] =
      'Life Coach helps you set goals, build habits, and make smarter decisions with AI-powered planning and clear action steps.';
  en['shareAppMessage'] = 'Share Life Coach with your friends.';
  en['rateAppThanks'] = 'Thanks for rating Life Coach!';
  en['signupSubtitle'] =
      'Join Life Coach and plan your goals with AI every day.';
  en['premiumUnlockSubtitle'] = 'Unlock the full power of Life Coach';
  en['privacySection5Body'] =
      'Life Coach is not intended for children under 13. We do not knowingly collect data from children.';
  en['termsSection1Body'] =
      'By using Life Coach you agree to these Terms. If you do not agree, please do not use the app.';
  en['privacySection6Body'] =
      'Questions or concerns? Email privacy@lifecoach.app and we will get back to you within two business days.';
  en['faqA6'] =
      'Yes — within 7 days of your first purchase. Email support@lifecoach.app.';

  File(enPath).writeAsStringSync(
    '${const JsonEncoder.withIndent('  ').convert(en)}\n',
  );

  const Map<String, Map<String, String>> localeBrand = <String, Map<String, String>>{
    'ur': <String, String>{
      'navigator': 'کوچ',
      'authTagline': 'AI گول پلانر',
    },
    'ar': <String, String>{
      'navigator': 'مدرب',
      'authTagline': 'مخطط الأهداف بالذكاء الاصطناعي',
    },
    'hi': <String, String>{
      'navigator': 'कोच',
      'authTagline': 'AI गोल प्लानर',
    },
    'bn': <String, String>{
      'navigator': 'কোচ',
      'authTagline': 'AI গোল প্ল্যানার',
    },
    'zh': <String, String>{
      'navigator': '教练',
      'authTagline': 'AI 目标规划师',
    },
    'fr': <String, String>{
      'navigator': 'Coach',
      'authTagline': 'Planificateur d\'objectifs IA',
    },
    'de': <String, String>{
      'navigator': 'Coach',
      'authTagline': 'KI-Zielplaner',
    },
    'es': <String, String>{
      'navigator': 'Coach',
      'authTagline': 'Planificador de objetivos con IA',
    },
    'ja': <String, String>{
      'navigator': 'コーチ',
      'authTagline': 'AIゴールプランナー',
    },
    'ko': <String, String>{
      'navigator': '코치',
      'authTagline': 'AI 목표 플래너',
    },
    'pt': <String, String>{
      'navigator': 'Coach',
      'authTagline': 'Planejador de metas com IA',
    },
    'ru': <String, String>{
      'navigator': 'Коуч',
      'authTagline': 'ИИ-планировщик целей',
    },
    'tr': <String, String>{
      'navigator': 'Koç',
      'authTagline': 'AI Hedef Planlayıcı',
    },
    'id': <String, String>{
      'navigator': 'Coach',
      'authTagline': 'Perencana Tujuan AI',
    },
    'it': <String, String>{
      'navigator': 'Coach',
      'authTagline': 'Pianificatore obiettivi IA',
    },
  };

  final Directory dir = Directory('lib/l10n');
  for (final File f in dir
      .listSync()
      .whereType<File>()
      .where((File f) => f.path.contains(RegExp(r'app_[a-z]{2}\.arb$')))) {
    String content = f.readAsStringSync();
    content = content
        .replaceAll('AI Life Navigator', 'Life Coach')
        .replaceAll('Life Navigator', 'Life Coach')
        .replaceAll('lifenavigator.app', 'lifecoach.app')
        .replaceAll('LifeNavigator', 'LifeCoach');

    final Map<String, dynamic> map =
        jsonDecode(content) as Map<String, dynamic>;
    final String loc = map['@@locale'] as String;

    map['appTitle'] = 'Life Coach';
    map['aiNavigator'] = 'Life Coach';

    if (loc == 'en') {
      // Already set via en map above — re-read en file.
      final Map<String, dynamic> freshEn =
          jsonDecode(File(enPath).readAsStringSync()) as Map<String, dynamic>;
      for (final String key in <String>[
        'life',
        'navigator',
        'authTagline',
        'aboutBody',
        'shareAppMessage',
        'rateAppThanks',
        'signupSubtitle',
        'premiumUnlockSubtitle',
        'privacySection5Body',
        'termsSection1Body',
        'privacySection6Body',
        'faqA6',
      ]) {
        map[key] = freshEn[key];
      }
    } else {
      final Map<String, String>? brand = localeBrand[loc];
      if (brand != null) {
        map['navigator'] = brand['navigator'];
        map['authTagline'] = brand['authTagline'];
      }
    }

    f.writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    stdout.writeln('Updated ${f.path}');
  }

  stdout.writeln('Done. Run: flutter gen-l10n');
}
