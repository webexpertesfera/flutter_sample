import 'package:flutter_sample/constants/export.dart';

class TranslationService extends Translations{

  static Locale? get locale =>PreferenceManger.getLanguage()??Locale("en");

  static const fallbackLocale = Locale('en');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en_US,
    'he_IL': he_IL,
  };
}