import 'package:flutter_sample/constants/export.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController? emailController;
  FocusNode? emailNode;

  /* ===================== On Init ===================== */
  @override
  void onInit() {
    _initializeControllerAndNodes();
    super.onInit();
  }

  /* ===================== Initialize Controllers And Nodes ===================== */
  _initializeControllerAndNodes() {
    emailController = TextEditingController();
    emailNode = FocusNode();
  }

  /* ===================== Forgot Password API Call ===================== */
  forgotPasswordApiCall() async {
    if (formKey.currentState!.validate()) {
      customLoader.show(Get.overlayContext!);
      await APIRepository.forgotPasswordApiCall(email: emailController?.text.trim(), type: keyForgetPassword).then(
            (value) {
          customLoader.hide();
          if (value != null) {
            SuccessModel successModel = value;
            showSnackBar(successModel.message ?? "");
            Get.toNamed(AppRoutes.otpVerificationScreen,
                arguments: {keyEmail: emailController?.text.trim(), keyType: keyForgetPassword});
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
}
