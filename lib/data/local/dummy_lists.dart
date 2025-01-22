import 'package:flutter_sample/constants/export.dart';

class DummyLists{
  static languageList(){
    List<LanguageModel> languageList = [
      LanguageModel(id: 1, name: AppStrings.english, flag: AppAssets.imagesIcEnglish,languageCode: "en"),
      LanguageModel(id: 2, name: AppStrings.hebrew, flag: AppAssets.imagesIcHebrew,languageCode: "he"),
    ];
    return languageList;
  }
}