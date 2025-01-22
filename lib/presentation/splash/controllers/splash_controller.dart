import 'package:flutter_sample/constants/export.dart';

class SplashController extends GetxController {
  /* ===================== On Init ===================== */
  @override
  void onInit() {
    super.onInit();
  }

  /* ===================== On Ready ===================== */
  @override
  void onReady() {
    navigateSplash();
    super.onReady();
  }

  /* ===================== Navigate To Splash ===================== */
  void navigateSplash() async {
    Future.delayed(
      Duration(milliseconds: 3000),
          () async {
        print("isComingFromNotification ${PushNotificationManager.isComingFromNotification}");
        if (PushNotificationManager.isComingFromNotification == false) {
          await APIRepository.profileAPICall().then(
                (value) {
              if (value != null) {
                LoginResponseModel loginResponseModel = value;
                PreferenceManger.saveRegisterData(loginResponseModel.data);
                Get.offAllNamed(AppRoutes.mainScreen);
              }
            },
          ).onError(
                (error, stackTrace) {
              Get.offAllNamed(AppRoutes.loginScreen);
              // showErrorSnackBar(error.toString());
            },
          );
        }
      },
    );
  }
}
