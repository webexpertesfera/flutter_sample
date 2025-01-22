import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/constants/export.dart';

class SignupScreen extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [

              _topImageAndWelcomeTexts(),
              _form(),
              _signUpButton(),
              _haveAnAccountButton(),
            ],
          ).marginSymmetric(horizontal: margin_30),
        ),
      ).marginOnly(top: margin_50),
    );
  }

/* ===================== Top Image And Welcome Texts ===================== */
  _topImageAndWelcomeTexts() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        _topImage(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeText(),
            _registerHereText(),
            _registerYourAccountText(),
          ],
        )
      ],
    ).directionalMarginOnly(top: margin_40);
  }
/* ===================== Top Image ===================== */
  _topImage() {
    return Align(
      alignment: Alignment.center,
      child: AssetImageWidget(
        imagePath: AppAssets.imagesIcSignupImage,
        width: width_250,
        height: width_250,
      ),
    );
  }
/* ===================== Welcome Texts ===================== */
  _welcomeText() {
    return Text(
      AppStrings.welcome.tr,
      style: TextStyles.poppins36w600(),
    );
  }
  /* ===================== Register Here ===================== */

  _registerHereText() {
    return Text(
      AppStrings.registerHere.tr,
      style: TextStyles.poppins36w600(),
    );
  }

  /* ===================== Register Your account Text ===================== */
  _registerYourAccountText() {
    return Text(
      AppStrings.registerYourAccount.tr,
      style: TextStyles.poppins14w500(),
    );
  }
/* ===================== Form ===================== */
  _form() {
    return Form(
        key: controller.formKey,
        child: Column(
          children: [
            _firstNameTextField(),
            _lastNameTextField(),
            _usernameTextField(),
            _dobTextField(),
            _genderDropDown(),
            _passwordTextField(),
            _confirmPasswordTextField(),
          ],
        ));
  }

  /* ===================== First Name Text Field ===================== */
  _firstNameTextField() {
    return CustomTextField(
      hintText: AppStrings.firstName.tr,
      prefixImagePath: AppAssets.imagesIcUserImage,
      textController: controller.firstNameController,
      focusNode: controller.firstNameNode,
      maxLength: 32,
      inputFormatter: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
      ],
      onFieldSubmitted: (value) {
        controller.lastNameNode?.requestFocus();
      },
      validator: (value) {
        return FormValidator.validateField(value: value, title: AppStrings.firstName.tr);
      },
      inputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }

  /* ===================== Last Name Text Field ===================== */

  _lastNameTextField() {
    return CustomTextField(
      hintText: AppStrings.lastName.tr,
      prefixImagePath: AppAssets.imagesIcUserImage,
      textController: controller.lastNameController,
      focusNode: controller.lastNameNode,
      inputFormatter: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
      ],
      maxLength: 32,
      onFieldSubmitted: (value) {
        controller.emailNode?.requestFocus();
      },
      validator: (value) {
        return FormValidator.validateField(value: value, title: AppStrings.lastName.tr);
      },
      inputType: TextInputType.text,
      textInputAction: TextInputAction.next,
    ).marginOnly(top: margin_20);
  }

  /* ===================== Username Text Field ===================== */
  _usernameTextField() {
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
    ).marginOnly(top: margin_20);
  }
  /* ===================== DOB Text Field ===================== */
  _dobTextField() {
    return CustomTextField(
      hintText: AppStrings.dateOfBirth.tr,
      readOnly: true,
      prefixImagePath: AppAssets.imagesIcBirthday,
      textController: controller.dobController,
      onTap: () {
        controller.datePicker();
      },
      focusNode: controller.dobNode,
      validator: (value) {
        return FormValidator.validateField(value: value, title: AppStrings.dateOfBirth.tr);
      },
      inputType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
    ).marginOnly(top: margin_20);
  }
  
  /* ===================== Password Text Field ===================== */
  _passwordTextField() {
    return CustomTextField(
      isObscure: controller.isPasswordVisible.value,
      hintText: AppStrings.password.tr,
      prefixImagePath: AppAssets.imagesIcPassword,
      textController: controller.passwordController,
      focusNode: controller.passwordNode,
      validator: (value) {
        return FormValidator.validatePassword(value);
      },
      inputType: TextInputType.visiblePassword,
      suffix: GetInkwell(
          onTap: () {
            controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
          },
          child: Icon(
            controller.isPasswordVisible.value == true ? Icons.visibility_off_rounded : Icons.visibility,
            color: AppColors.iconColor,
          )).directionalMarginOnly(right: margin_15),
      textInputAction: TextInputAction.next,
    ).marginOnly(top: margin_20);
  }
  
  /* ===================== Confirm Password Text Field ===================== */
  _confirmPasswordTextField() {
    return CustomTextField(
      isObscure: controller.isConfirmPasswordVisible.value,
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
            controller.isConfirmPasswordVisible.value == true ? Icons.visibility_off_rounded : Icons.visibility,
            color: AppColors.iconColor,
          )).directionalMarginOnly(right: margin_15),
      validator: (value) {
        return FormValidator.validateConfirmPassword(value: value, password: controller.passwordController?.text);
      },
      textInputAction: TextInputAction.done,
    ).marginOnly(top: margin_20);
  }
/* ===================== Signup Button ===================== */
  _signUpButton() {
    return CustomButton(
      onTap: () {
        controller.signUpApiCall();
      },
      title: AppStrings.signUp.tr,
      width: Get.width,
    ).marginOnly(top: margin_30);
  }
  /* ===================== Have an Account Button ===================== */
  _haveAnAccountButton() {
    return Center(
      child: Text.rich(
        TextSpan(text: AppStrings.haveAnAccount.tr, style: TextStyles.poppins12w500()?.copyWith(decoration: TextDecoration.none), children: [
          TextSpan(
              text: AppStrings.signIn.tr,
              style: TextStyle(
                fontSize: font_12,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,decorationColor: Colors.white,
                fontFamily: "Poppins",
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAllNamed(AppRoutes.loginScreen);
                })
        ]),
        textAlign: TextAlign.center,
      ),
    ).marginOnly(top: margin_20, bottom: margin_30);
  }
  /* ===================== Gender Dropdown ===================== */
  _genderDropDown() {
    return DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      isExpanded: true,
      value: controller.selectedGender.value,
      dropdownColor: AppColors.cardColor,
      hint: Row(
        children: [
          Text(
            AppStrings.gender.tr,
            style: TextStyles.poppins14w500(),
          ),
        ],
      ),
      validator: (value) {
        return FormValidator.validateField(value: value, title: AppStrings.gender.tr);
      },
      borderRadius: BorderRadius.circular(radius_10),
      decoration: InputDecoration(
        fillColor: AppColors.textFieldColor.withOpacity(0.38),
        errorStyle: Theme.of(Get.context!).inputDecorationTheme.errorStyle?.copyWith(color: Colors.red),
        errorMaxLines: 4,
        hintText: AppStrings.gender.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
        prefixIcon: AssetImageWidget(
          imagePath: AppAssets.imagesIcGender,
          height: height_20,
          fit: BoxFit.contain,color: AppColors.lightGreyColor,
          width: height_20,
        ).marginOnly(left: margin_25, right: margin_15),
        prefixIconConstraints: BoxConstraints(minHeight: height_20, minWidth: height_20),
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.white,
      ),
      items: [keyMale, keyFemale].map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Row(
            children: [
              Text(
                value,
                style: TextStyles.poppins14w500(),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (String? value) {
        controller.selectedGender.value = value;
      },
    )).marginOnly(top: margin_20);
  }
}
