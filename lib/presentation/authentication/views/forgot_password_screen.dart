import 'package:flutter_sample/constants/export.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topImage(),
            _forgotPasswordText(),
            _dontWorryText(),
            _emailTextField(),
            _sendCodeButton(),
            _dontHaveAnAccountButton(),
          ],
        ).marginSymmetric(horizontal: margin_30),
      ),
    );
  }

  /* ===================== Top Image ===================== */
  _topImage() {
    return Align(
      alignment: Alignment.center,
      child: AssetImageWidget(
        imagePath: AppAssets.imagesIcForgotPasswordImage,
        width: width_250,
        height: width_250,
      ).marginOnly(top: margin_50),
    );
  }

  /* ===================== Forgot Password Text ===================== */
  _forgotPasswordText() {
    return Text(
      "${AppStrings.forgotPassword.tr}?", textAlign: TextAlign.left,
      style: TextStyles.poppins36w600()?.copyWith(fontSize: font_32),
    ).marginOnly(top: margin_20);
  }

  /* ===================== Don't Worry Text ===================== */
  _dontWorryText() {
    return Text(
      AppStrings.dontWorryItOccurs.tr,
      style: TextStyles.poppins14w500(),
    ).marginOnly(top: margin_5);
  }

  /* ===================== Email Text Field ===================== */
  _emailTextField() {
    return Form(
      key: controller.formKey,
      child: CustomTextField(
        hintText: AppStrings.email.tr,
        prefixImagePath: AppAssets.imagesIcEmail,
        textController: controller.emailController,
        focusNode: controller.emailNode,
        inputType: TextInputType.emailAddress, validator: (value) {
        return FormValidator.validateEmail(value);
      },
        textInputAction: TextInputAction.next,
      ).marginOnly(top: margin_50),
    );
  }

  /* ===================== Send Code Button ===================== */
  _sendCodeButton() {
    return CustomButton(onTap: () {
      controller.emailNode?.unfocus();
      controller.forgotPasswordApiCall();
    }, title: AppStrings.sendCode.tr, width: Get.width,).marginOnly(top: margin_60);
  }

  /* ===================== Don't Have An Account Button ===================== */
  _dontHaveAnAccountButton() {
    return Center(
      child: Text.rich(
        TextSpan(text: AppStrings.dontHaveAnAccount.tr, style: TextStyles.poppins12w500(), children: [
          TextSpan(
              text: AppStrings.create.tr,
              style: TextStyle(
                fontSize: font_12,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                fontFamily: "Poppins",
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAllNamed(AppRoutes.signUpScreen);
                })
        ]),
        textAlign: TextAlign.center,
      ),
    ).marginOnly(top: margin_20);
  }
}
