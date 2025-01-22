import 'package:flutter_sample/constants/export.dart';

class OtpVerificationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController? pinController;
  RxInt timerValue = 45.obs;
  RxBool isOtpVerified = false.obs;
  Timer? timerr;
  String? emailId;
  String? verificationType;

  /* ===================== On Init ===================== */
  @override
  void onInit() {
    pinController = TextEditingController();
    getArguments();
    resendTimer();
    super.onInit();
  }

  /* ===================== Get Arguments ===================== */
  getArguments() {
    if (Get.arguments != null) {
      if (Get.arguments[keyEmail] != null) {
        emailId = Get.arguments[keyEmail];
      }

      if (Get.arguments[keyType] != null) {
        verificationType = Get.arguments[keyType];
      }
    }
  }

  /* ===================== Resend Timer ===================== */
  resendTimer() {
    // Cancel any existing timer and reset its reference to null
    timerr?.cancel();
    timerr = null;
    // Initialize the timer value to 45 seconds
    timerValue.value = 45;
    // Start a periodic timer that executes every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      // Assign the current timer to the global timerr variable
      timerr = timer;
      // Decrease the timer value by 1 each second
      timerValue.value = timerValue.value - 1;
      // If the timer value reaches 0, stop the timer
      if (timerValue.value == 0) {
        timerr?.cancel();
      }
    });
  }


  /* ===================== OTP Verify API Call ===================== */
  otpVerifyApiCall() async {
    if (formKey.currentState!.validate()) {
      var dataBody = RequestModel.otpVerifyRequestModel(
          email: emailId, otp: pinController?.text.trim(), type: verificationType);
      await APIRepository.otpVerificationApiCall(dataBody: dataBody).then(
            (value) {
          if (value != null) {
            LoginResponseModel loginResponseModel = value;
            isOtpVerified.value = true;
            Future.delayed(
              Duration(seconds: 3),
                  () {
                if (loginResponseModel.data == null) {
                  Get.offNamed(AppRoutes.changePasswordScreen, arguments: {keyEmail: emailId});
                } else {
                  PreferenceManger.saveAuthToken(loginResponseModel.data?.accessToken);
                  PreferenceManger.saveRegisterData(loginResponseModel.data);
                  Get.offAllNamed(AppRoutes.mainScreen);
                }
              },
            );
          }
        },
      ).onError(
            (error, stackTrace) {
          showErrorSnackBar(error.toString());
        },
      );
    }
  }

  /* ===================== Resend OTP API Call ===================== */
  resendOTPApiCall() async {
    customLoader.show(Get.overlayContext!);
    await APIRepository.forgotPasswordApiCall(email: emailId, type: keyResendOtp).then(
          (value) {
        customLoader.hide();
        if (value != null) {
          SuccessModel successModel = value;
          pinController?.clear();
          formKey.currentState?.reset();
          resendTimer();
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

  /* ===================== Dispose ===================== */
  @override
  void dispose() {
    timerr?.cancel();
    timerr = null;
    super.dispose();
  }

  /* ===================== On Close ===================== */
  @override
  void onClose() {
    timerr?.cancel();
    timerr = null;
    super.onClose();
  }
}
