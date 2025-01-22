import 'package:flutter_sample/constants/export.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<OtpVerificationController>(() => OtpVerificationController());
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}
