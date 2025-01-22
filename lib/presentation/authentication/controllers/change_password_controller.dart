import 'package:flutter_sample/constants/export.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  FocusNode? passwordNode;
  FocusNode? confirmPasswordNode;
  RxBool isPasswordChanged = false.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  String? emailId;

  /* ===================== On Init ===================== */
  @override
  void onInit() {
    initializeControllerAndNodes();
    getArguments();
    super.onInit();
  }

  /* ===================== Get Arguments ===================== */
  getArguments() {
    if (Get.arguments != null) {
      emailId = Get.arguments[keyEmail];
    }
  }

  /* ===================== Initialize Controllers And Nodes ===================== */
  initializeControllerAndNodes() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordNode = FocusNode();
    confirmPasswordNode = FocusNode();
  }

  /* ===================== Reset Password API Call ===================== */
  resetPasswordAPICall() async {
    if (formKey.currentState!.validate()) {
      var dataBody = RequestModel.resetPasswordRequestModel(
        email: emailId,
        password: passwordController?.text.trim(),
      );
      await APIRepository.resetPasswordApiCall(dataBody: dataBody).then(
            (value) {
          if (value != null) {
            SuccessModel successModel = value;
            showSnackBar(successModel.message ?? "");
            isPasswordChanged.value = true;
          }
        },
      ).onError(
            (error, stackTrace) {
          showErrorSnackBar(error.toString());
        },
      );
    }
  }
}
