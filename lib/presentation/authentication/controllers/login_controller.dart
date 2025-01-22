import 'package:flutter_sample/constants/export.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController? emailController;
  TextEditingController? passwordController;
  FocusNode? emailNode;
  FocusNode? passwordNode;
  RxBool isPasswordVisible = true.obs;
  List<LanguageModel> languageList = DummyLists.languageList();

  /* ===================== On Init ===================== */
  @override
  void onInit() {
    _initializeController();
    super.onInit();
  }

  /* ===================== Initialize Controllers And Nodes ===================== */
  _initializeController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  /* ===================== Login API Call ===================== */
  loginApiCall() async {
    if (formKey.currentState!.validate()) {
      var dataBody = RequestModel.loginRequestModel(
        email: emailController?.text.trim().toLowerCase(),
        password: passwordController?.text.trim(),
        fcmToken: PreferenceManger.getFcmToken() ?? "Not Found",
      );
      await APIRepository.loginApiCall(dataBody: dataBody).then((value) {
        if (value != null) {
          LoginResponseModel loginResponseModel = value;
          if (loginResponseModel.data?.isVerified == keyFalse) {
            Get.toNamed(
              AppRoutes.otpVerificationScreen,
              arguments: {keyEmail: emailController?.text.trim(), keyType: keyOtpVerify},
            );
          } else {
            PreferenceManger.saveRegisterData(loginResponseModel.data);
            PreferenceManger.saveAuthToken(loginResponseModel.data?.accessToken);
            Get.offAllNamed(AppRoutes.mainScreen);
            showSnackBar(loginResponseModel.message ?? "");
          }
        }
      }).onError((error, stackTrace) {
        showErrorSnackBar(error.toString());
      });
    }
  }
}
