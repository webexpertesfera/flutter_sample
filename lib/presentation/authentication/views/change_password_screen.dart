import 'package:flutter_sample/constants/export.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Obx(() => SingleChildScrollView(
        child: controller.isPasswordChanged.value == true
            ? _passwordChangedView() // Show success view if the password is changed
            : Column(
          children: [
            _topImage(), // Top image for reset password
            _createNewPasswordText(), // Title text
            _yourPasswordMustBeUniqueText(), // Subtitle text
            _form(), // Form containing password fields
            _resetPasswordButton(), // Button to trigger password reset
            _loginButton(), // Option to navigate to login screen
          ],
        ).marginSymmetric(horizontal: margin_30),
      )),
    );
  }

  /* ===================== Top Image ===================== */
  _topImage() {
    return Align(
      alignment: Alignment.center,
      child: AssetImageWidget(
        imagePath: AppAssets.imagesIcResetPassword,
        height: width_250,
      ).marginOnly(top: margin_50),
    );
  }

  /* ===================== Title and Subtitle ===================== */
  _createNewPasswordText() {
    return Text(
      AppStrings.createNewPassword.tr,
      style: TextStyles.poppins36w600(),
    ).marginOnly(top: margin_10);
  }
  /* ===================== Your Password Must Be Unique Text ===================== */

  _yourPasswordMustBeUniqueText() {
    return Text(
      AppStrings.yourNewPasswordMustBeUnique.tr,
      style: TextStyles.poppins14w500(),
    ).marginOnly(top: margin_5);
  }

  /* ===================== Form ===================== */
  _form() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          _passwordTextField(), // New password field
          _confirmPasswordTextField(), // Confirm password field
        ],
      ),
    );
  }
/* ===================== Password Text Field ===================== */
  _passwordTextField() {
    return CustomTextField(
      isObscure: controller.isPasswordVisible.value, // Toggles password visibility
      hintText: AppStrings.newPassword.tr,
      prefixImagePath: AppAssets.imagesIcPassword, // Password icon
      textController: controller.passwordController,
      focusNode: controller.passwordNode,
      onFieldSubmitted: (value) {
        controller.confirmPasswordNode?.requestFocus();
      },
      suffix: GetInkwell(
          onTap: () {
            controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
          },
          child: Icon(
            controller.isPasswordVisible.value ? Icons.visibility_off_rounded : Icons.visibility,
            color: AppColors.iconColor,
          )),
      inputType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return FormValidator.validatePassword(value); // Custom password validation
      },
    ).marginOnly(top: margin_30);
  }
/* ===================== Confirm Password Text Field ===================== */
  _confirmPasswordTextField() {
    return CustomTextField(
      isObscure: controller.isConfirmPasswordVisible.value, // Toggles confirm password visibility
      hintText: AppStrings.confirmPassword.tr,
      prefixImagePath: AppAssets.imagesIcPassword,
      textController: controller.confirmPasswordController,
      focusNode: controller.confirmPasswordNode,
      inputType: TextInputType.visiblePassword,
      suffix: GetInkwell(
          onTap: () {
            controller.isConfirmPasswordVisible.value = !controller.isConfirmPasswordVisible.value;
          },
          child: Icon(
            controller.isConfirmPasswordVisible.value ? Icons.visibility_off_rounded : Icons.visibility,
            color: AppColors.iconColor,
          )),
      textInputAction: TextInputAction.done,
      validator: (value) {
        return FormValidator.validateConfirmPassword(
            value: value, password: controller.passwordController?.text.trim());
      },
    ).marginOnly(top: margin_20);
  }

  /* ===================== Reset Password Button ===================== */
  _resetPasswordButton() {
    return CustomButton(
      onTap: () {
        controller.resetPasswordAPICall(); // Trigger API call for resetting password
      },
      title: AppStrings.resetPassword.tr,
      width: Get.width,
    ).marginOnly(top: margin_30);
  }
/* ===================== Login Button ===================== */
  _loginButton() {
    return Text.rich(
      TextSpan(
        text: AppStrings.or.tr,
        children: [
          TextSpan(
              text: AppStrings.signIn.tr,
              style: TextStyles.poppins12w500()?.copyWith(fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAllNamed(AppRoutes.loginScreen); // Navigate to login screen
                })
        ],
        style: TextStyles.poppins12w500(),
      ),
    ).marginOnly(top: margin_10);
  }

  /* ===================== Password Changed Success View ===================== */
  _passwordChangedView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _successImage(), // Success icon
        _passwordChangedText(), // Title
        _yourOtpHasBeenVerified(), // Description
        _backToLoginButton(), // Button to navigate back to login screen
      ],
    ).marginSymmetric(horizontal: margin_30);
  }
/* ===================== Success Image ===================== */
  _successImage() {
    return AssetImageWidget(
      imagePath: AppAssets.imagesIcSuccess,
      width: width_100,
      height: width_100,
    ).marginOnly(top: Get.height * 0.25);
  }
/* ===================== Password Changed Text ===================== */
  _passwordChangedText() {
    return Text(
      AppStrings.passwordChanged.tr,
      textAlign: TextAlign.center,
      style: TextStyles.poppins36w600()?.copyWith(fontSize: font_28),
    ).marginOnly(top: margin_40);
  }
/* ===================== Your Otp Has been Verified Text ===================== */
  _yourOtpHasBeenVerified() {
    return Text(
      AppStrings.yourPasswordHasBeenChanged.tr,
      textAlign: TextAlign.center,
      style: TextStyles.poppins14w500(),
    ).marginOnly(top: margin_10);
  }
/* ===================== Back to Login Button ===================== */
  _backToLoginButton() {
    return CustomButton(
      onTap: () {
        Get.offAllNamed(AppRoutes.loginScreen); // Navigate to login screen
      },
      title: AppStrings.backToSignIn.tr,
      width: Get.width,
    ).marginOnly(top: margin_40);
  }
}
