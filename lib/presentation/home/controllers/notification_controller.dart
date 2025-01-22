import 'package:flutter_sample/constants/export.dart';

class NotificationController extends GetxController {
  RxList<NotificationDataModel> notificationList = <NotificationDataModel>[].obs;
RxBool isLoading=false.obs;
  @override
  void onReady() {
    fetchNotificationListAPICall();
    super.onReady();
  }

  fetchNotificationListAPICall() {
    isLoading.value=true;
    customLoader.show(Get.overlayContext!);
    APIRepository.notificationListAPICall().then(
      (value) {
        isLoading.value=false;
        customLoader.hide();

        if (value != null) {
          NotificationListResponseModel notificationListResponseModel = value;
          notificationList.value = notificationListResponseModel.data ?? [];
          notificationList.refresh();
        }
      },
    ).onError(
      (error, stackTrace) {
        isLoading.value=false;
        customLoader.hide();

        showErrorSnackBar(error.toString());
      },
    );
  }
  clearNotificationListAPICall() {
    customLoader.show(Get.overlayContext!);
    APIRepository.clearNotificationListAPICall().then(
      (value) {
        customLoader.hide();
        if (value != null) {
       SuccessModel successModel = value;
          notificationList.clear();
          notificationList.refresh();
        }
      },
    ).onError(
      (error, stackTrace) {
        customLoader.hide();

        showErrorSnackBar(error.toString());
      },
    );
  }

}
