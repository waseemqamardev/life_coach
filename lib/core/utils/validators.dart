import '../../l10n/app_localizations.dart';

/// Reusable validators for TextFormFields. Return `null` on success and an
/// error message string on failure.
class Validators {
  Validators._();

  static String? required(
    String? value,
    AppLocalizations l10n, {
    String? field,
  }) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired(field ?? l10n.fieldDescription);
    }
    return null;
  }

  static String? email(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) return l10n.emailRequired;
    final RegExp regex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
    if (!regex.hasMatch(value.trim())) return l10n.emailInvalid;
    return null;
  }

  static String? password(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.passwordRequired;
    if (value.length < 6) return l10n.passwordMinLength;
    return null;
  }

  static String? Function(String?) confirmPassword(
    String original,
    AppLocalizations l10n,
  ) {
    return (String? value) {
      if (value == null || value.isEmpty) return l10n.confirmPasswordRequired;
      if (value != original) return l10n.passwordsDoNotMatch;
      return null;
    };
  }

  static String? otp(String? value, AppLocalizations l10n, {int length = 6}) {
    if (value == null || value.trim().isEmpty) return l10n.otpRequired;
    if (value.trim().length != length || int.tryParse(value.trim()) == null) {
      return l10n.otpInvalid(length);
    }
    return null;
  }

  static String? minLength(
    String? value,
    int min,
    AppLocalizations l10n, {
    String? field,
  }) {
    if (value == null || value.trim().length < min) {
      return l10n.fieldMinLength(field ?? l10n.fieldDescription, min);
    }
    return null;
  }
}
