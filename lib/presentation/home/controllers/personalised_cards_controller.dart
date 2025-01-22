import 'package:flutter_sample/constants/export.dart';


class PersonalisedCardsController extends GetxController{
List<OrderDataModel> personalizedBoardsList=[];
bool isLoading=false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchPersonalizedBoardsListApiCall();
    super.onReady();
  }

  fetchPersonalizedBoardsListApiCall() async {
    isLoading=true;
    customLoader.show(Get.overlayContext!);
    update();
    await APIRepository.personalizedBoardsListAPICall().then((value) {
      isLoading=false;
      customLoader.hide();
      update();

      if(value!=null) {
        PersonalizedBoardsListResponseModel personalizedBoardsListResponseModel=value;
        personalizedBoardsList=personalizedBoardsListResponseModel.data?.purchasedBoard??[];
        update();
      }
    },).onError((error, stackTrace) {
      isLoading=false;
      customLoader.hide();
      update();

showErrorSnackBar(error.toString());
    },);
  }

}