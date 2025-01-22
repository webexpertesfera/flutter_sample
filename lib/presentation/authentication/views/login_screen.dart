import 'package:flutter_sample/constants/export.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
          child: Obx(
                () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _languagePopupMenuButton(),
                _topImage(),
                _diveBackInText(),
                _signInToYourText(),
                _form(),
                _forgotPasswordButton(),
                _signInButton(),
                _dontHaveAnAccountButton(),
              ],
            ).marginSymmetric(horizontal: margin_30),
          )).marginOnly(top: margin_50),
    );
  }

  /* ===================== Top Image ===================== */
  _topImage() {
    return Align(
      alignment: Alignment.center,
      child: AssetImageWidget(
        imagePath: AppAssets.imagesIcLoginImage,
        width: width_250,
        height: width_250,
      ).marginOnly(top: margin_15),
    );
  }

  /* ===================== Dive Back In Text ===================== */
  _diveBackInText() {
    return Text(
      AppStrings.diveBackIn.tr,
      style: TextStyles.poppins36w600(),
    ).marginOnly(top: margin_20);
  }

  /* ===================== Sign In To Your Account Text ===================== */
  _signInToYourText() {
    return Text(
      AppStrings.signInToYourAccount.tr,
      style: TextStyles.poppins14w500(),
    ).marginOnly(top: margin_5);
  }

  /* ===================== Form ===================== */
  _form() {
    return Form(
        key: controller.formKey,
        child: Column(
          children: [
            _emailTextField(),
            _passwordTextField(),
          ],
        ));
  }

  /* ===================== Email Text Field ===================== */
  _emailTextField() {
    return CustomTextField(
      hintText: AppStrings.email.tr,
      prefixImagePath: AppAssets.imagesIcEmail,
      textController: controller.emailController,
      focusNode: controller.emailNode,
      onFieldSubmitted: (value) {
        controller.passwordNode?.requestFocus();
      },
      validator: (value) {
        return FormValidator.validateEmail(value);
      },
      inputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    ).marginOnly(top: margin_40);
  }

  /* ===================== Password Text Field ===================== */
  _passwordTextField() {
    return CustomTextField(
      hintText: AppStrings.password.tr,
      isObscure: controller.isPasswordVisible.value,
      prefixImagePath: AppAssets.imagesIcPassword,
      textController: controller.passwordController,
      focusNode: controller.passwordNode,
      suffix: GetInkwell(
          onTap: () {
            controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
          },
          child: Icon(
            controller.isPasswordVisible.value == true ? Icons.visibility_off_rounded : Icons.visibility,
            color: AppColors.iconColor,
          )).directionalMarginOnly(right: margin_15),
      inputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.passwordCantBeEmpty.tr;
        }
      },
      textInputAction: TextInputAction.done,
    ).marginOnly(top: margin_20);
  }

  /* ===================== Forgot Password Button ===================== */
  _forgotPasswordButton() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GetInkwell(
        onTap: () {
          Get.toNamed(AppRoutes.forgotPasswordScreen);
        },
        child: Text(
          AppStrings.forgotYourPassword.tr,
          style: TextStyles.poppins14w500(),
        ).marginOnly(top: margin_10),
      ),
    );
  }

  /* ===================== Sign In Button ===================== */
  _signInButton() {
    return CustomButton(
      onTap: () {
        // Get.offAllNamed(AppRoutes.mainScreen);
        controller.loginApiCall();
      },
      title: AppStrings.signIn.tr,
      width: Get.width,
    ).marginOnly(top: margin_50);
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
                decoration: TextDecoration.underline, // Underlining the text
                fontWeight: FontWeight.w600,
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
    ).marginOnly(top: margin_20, bottom: margin_30);
  }

  /* ===================== Language Popup Menu Button ===================== */
  _languagePopupMenuButton() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: PopupMenuButton(
          color: AppColors.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius_10), side: BorderSide(color: AppColors.borderColor, width: 1)),
          offset: Offset(0, 40),
          itemBuilder: (context) {
            return controller.languageList
                .map((e) => PopupMenuItem(
                onTap: () async {
                  onLanguageChange(e);
                  // debugPrint(Get.locale.toString());
                  // PreferenceManger.setLanguage(e.languageCode);
                  // Get.updateLocale(Locale(e.languageCode ?? ""));
                  // debugPrint(Get.locale.toString());
                },
                height: height_20,
                padding: EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_10),
                child: Row(
                  children: [
                    AssetImageWidget(
                      imagePath: e.flag,
                      width: width_30,
                      height: width_20,
                    ),
                    Text(
                      e.name ?? "",
                      style: TextStyles.poppins14w500(),
                    ).directionalMarginOnly(left: margin_10)
                  ],
                )))
                .toList();
          },
          child: AssetImageWidget(
            imagePath: AppAssets.imagesIcLanguage,
            width: width_32,
          )),
    );
  }
}
