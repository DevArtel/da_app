import 'app_localizations.dart';

/// The translations for English (`en`).
class UiLocalizationsEn extends UiLocalizations {
  UiLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String counterValue(Object value) {
    return 'Value is $value';
  }
}
