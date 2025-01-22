import 'package:flutter_sample/constants/export.dart';

class MainController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  UserDataModel? userDataModel;
  LanguageModel? selectedLanguage;
  List<LanguageModel> languageList = DummyLists.languageList();
  List screens = [
    HomeScreen(key: UniqueKey(),),
    PersonalisedCardsScreen(key: UniqueKey(),),
    CategoriesScreen(key: UniqueKey(),),
    CategoriesScreen(key: UniqueKey(),),
  ];
  @override
  void onInit() {
    getArguments();
    getRegisterData();
    super.onInit();
  }

  getArguments(){
    if(Get.arguments!=null){
      currentIndex=Get.arguments[keyIndex];
      update();
    }
  }
  logoutAPICall() async {
    customLoader.show(Get.overlayContext!);
    await APIRepository.logoutApiCall().then(
      (value) {
        customLoader.hide();
        if (value != null) {
          SuccessModel successModel = value;
          PreferenceManger.clearLoginData();
          Get.offAllNamed(AppRoutes.loginScreen);
          showSnackBar(successModel.message ?? "");
        }
      },
    ).onError(
      (error, stackTrace) {
        customLoader.hide();

        showErrorSnackBar(error.toString());
      },
    );
  }



  deleteAccountAPICall() async {
    customLoader.show(Get.overlayContext!);
    await APIRepository.deleteAccountApiCall().then(
      (value) {
        customLoader.hide();
        if (value != null) {
          SuccessModel successModel = value;
          PreferenceManger.clearLoginData();
          Get.offAllNamed(AppRoutes.loginScreen);
          showSnackBar(successModel.message ?? "");
        }
      },
    ).onError(
      (error, stackTrace) {
        customLoader.hide();

        showErrorSnackBar(error.toString());
      },
    );
  }

  changeIndex(value){
    currentIndex = value;
    update();
    debugPrint(currentIndex.toString());
  }
  getRegisterData() async {
    await PreferenceManger.getSavedLoginData().then((value) {
      userDataModel=value;
      update();
    },);
  }

}

class LanguageModel {
  int? id;
  String? name;
  String? flag;
  String? languageCode;

  LanguageModel({this.id, this.name, this.flag,this.languageCode});
}
