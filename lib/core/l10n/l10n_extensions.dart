import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  String get pressBackAgainToExit {
    final String locale = Localizations.localeOf(this).languageCode;
    switch (locale) {
      case 'ar':
        return 'اضغط على زر الرجوع مرة أخرى للخروج';
      case 'ur':
        return 'باہر نکلنے کے لیے دوبارہ پیچھے کا بٹن دبائیں۔';
      case 'bn':
        return 'প্রস্থান করতে আবার পিছনে টিপুন';
      case 'es':
        return 'Presione atrás de nuevo para salir';
      case 'fr':
        return 'Appuyez à nouveau sur retour pour quitter';
      case 'de':
        return 'Drücken Sie erneut Zurück, um zu beenden';
      case 'hi':
        return 'बाहर निकलने के लिए फिर से वापस दबाएं';
      case 'id':
        return 'Tekan kembali sekali lagi untuk keluar';
      case 'it':
        return 'Premi di nuovo indietro per uscire';
      case 'ja':
        return '戻るボタンをもう一度押すと終了します';
      case 'ko':
        return '나가려면 뒤로 가기 버튼을 한 번 더 누르세요';
      case 'pt':
        return 'Pressione voltar novamente para sair';
      case 'ru':
        return 'Нажмите назад еще раз для выхода';
      case 'tr':
        return 'Çıkmak için tekrar geri basın';
      case 'zh':
        return '再次按返回键退出';
      default:
        return 'Press back again to exit';
    }
  }

  String get exitApp {
    final String locale = Localizations.localeOf(this).languageCode;
    switch (locale) {
      case 'ar':
        return 'الخروج من التطبيق';
      case 'ur':
        return 'ایپ سے باہر نکلیں';
      case 'bn':
        return 'অ্যাপ থেকে প্রস্থান করুন';
      case 'es':
        return 'Salir de la aplicación';
      case 'fr':
        return 'Quitter l\'application';
      case 'de':
        return 'App beenden';
      case 'it':
        return 'Esci dall\'applicazione';
      case 'pt':
        return 'Sair do aplicativo';
      case 'ru':
        return 'Выйти из приложения';
      case 'tr':
        return 'Uygulamadan Çık';
      case 'zh':
        return '退出应用';
      case 'ja':
        return 'アプリを終了する';
      case 'ko':
        return '앱 종료';
      case 'hi':
        return 'ऐप से बाहर निकलें';
      case 'id':
        return 'Keluar dari Aplikasi';
      default:
        return 'Exit App';
    }
  }

  String get exitConfirmMessage {
    final String locale = Localizations.localeOf(this).languageCode;
    switch (locale) {
      case 'ar':
        return 'هل أنت متأكد أنك تريد الخروج من التطبيق؟';
      case 'ur':
        return 'کیا آپ واقعی ایپ سے باہر نکلنا چاہتے ہیں؟';
      case 'bn':
        return 'আপনি কি নিশ্চিত যে আপনি অ্যাপ থেকে প্রস্থান করতে চান?';
      case 'es':
        return '¿Está seguro de que desea salir de la aplicación?';
      case 'fr':
        return 'Êtes-vous sûr de vouloir quitter l\'application ?';
      case 'de':
        return 'Möchten Sie die App wirklich beenden?';
      case 'it':
        return 'Sei sicuro di voler uscire dall\'applicazione?';
      case 'pt':
        return 'Tem certeza de que deseja sair do aplicativo?';
      case 'ru':
        return 'Вы действительно хотите выйти из приложения?';
      case 'tr':
        return 'Uygulamadan çıkmak istediğinizden emin misiniz?';
      case 'zh':
        return '您确定要退出应用吗？';
      case 'ja':
        return 'アプリを終了してもよろしいですか？';
      case 'ko':
        return '앱을 종료하시겠습니까?';
      case 'hi':
        return 'क्या आप वाकई ऐप से बाहर निकलना चाहते हैं?';
      case 'id':
        return 'Apakah Anda yakin ingin keluar dari aplikasi?';
      default:
        return 'Are you sure you want to exit the app?';
    }
  }

  String get exitConfirmYes {
    final String locale = Localizations.localeOf(this).languageCode;
    switch (locale) {
      case 'ar':
        return 'نعم، خروج';
      case 'ur':
        return 'ہاں، باہر نکلیں';
      case 'bn':
        return 'হ্যাঁ, প্রস্থান';
      case 'es':
        return 'Sí, Salir';
      case 'fr':
        return 'Oui, Quitter';
      case 'de':
        return 'Ja, Beenden';
      case 'it':
        return 'Sì, Esci';
      case 'pt':
        return 'Sim, Sair';
      case 'ru':
        return 'Да, выйти';
      case 'tr':
        return 'Evet, Çık';
      case 'zh':
        return '是的，退出';
      case 'ja':
        return 'はい、終了します';
      case 'ko':
        return '네, 종료';
      case 'hi':
        return 'हाँ, बाहर लिखें';
      case 'id':
        return 'Ya, Keluar';
      default:
        return 'Yes, Exit';
    }
  }
}

extension AppLocalizationsHelpers on AppLocalizations {
  List<String> get wizardSteps =>
      <String>[stepDefine, stepAnalyze, stepQuestions, stepResult];

  String riskLevelLabel(int score) {
    if (score <= 35) return lowRisk;
    if (score >= 60) return highRisk;
    return mediumRisk;
  }

  String successChanceLabel(int score) {
    if (score >= 70) return goodChance;
    if (score >= 40) return fairChance;
    return poorChance;
  }

  String scoreTier(int score) {
    if (score <= 35) return low;
    if (score <= 65) return medium;
    return high;
  }

  String confidenceTier(int score) {
    if (score >= 70) return high;
    if (score >= 40) return medium;
    return low;
  }

  String relativeTime(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return justNow;
    if (diff.inMinutes < 60) return minutesAgo(diff.inMinutes.clamp(1, 59));
    if (diff.inHours < 24) {
      return diff.inHours == 1
          ? hoursAgo(1)
          : hoursAgoPlural(diff.inHours);
    }
    return diff.inDays == 1 ? daysAgo(1) : daysAgoPlural(diff.inDays);
  }
}
