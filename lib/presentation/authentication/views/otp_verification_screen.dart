import 'package:flutter_sample/constants/export.dart';

class OtpVerificationScreen extends GetView<OtpVerificationController> {

  // ===================== Build OTP Verification Screen =====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Obx(
              () => controller.isOtpVerified.value == true ? _otpVerifiedView() : _otpVerificationFormView(),
        ),
      ),
    );
  }

  // ===================== OTP Verification Form View =====================
  _otpVerificationFormView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _otpVerificationText(),
        _enterTheVerificationCode(),
        _pinput(),
        _verifyButton(),
        _resendOtp(),
      ],
    ).marginSymmetric(horizontal: margin_30);
  }

  // ===================== OTP Verification Text =====================
  _otpVerificationText() {
    return Text(
      AppStrings.otpVerification.tr,
      style: TextStyles.poppins36w600(),
    ).marginOnly(top: Get.height * 0.25);
  }

  // ===================== Enter The Verification Code Text =====================
  _enterTheVerificationCode() {
    return Text(
      AppStrings.enterTheVerificationCode.tr,
      style: TextStyles.poppins14w500(),
    );
  }

  // ===================== OTP Pin Input Field =====================
  _pinput() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Pinput(
        controller: controller.pinController,
        defaultPinTheme: pinputTheme(),
        focusedPinTheme: pinputFocusedTheme(),
        submittedPinTheme: pinputFocusedTheme(),
        errorPinTheme: pinputErrorTheme(),
        onTap: () {
          // debugPrint(controllers.otp);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return AppStrings.otpCantBeEmpty.tr;
          }
          if (value.length != 4) {
            return AppStrings.pleaseEnterAValidOTP.tr;
          }
          return null;
        },
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: (pin) => print(pin),
      ).marginOnly(top: margin_40),
    );
  }

  // ===================== Pin Input Theme =====================
  PinTheme pinputTheme() {
    return PinTheme(
      width: height_60,
      height: height_50,
      textStyle: TextStyles.poppins22w600(),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(radius_12),
      ),
    );
  }

  // ===================== Focused Pin Theme =====================
  pinputFocusedTheme() {
    return pinputTheme().copyDecorationWith(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(radius_12),
    );
  }

  // ===================== Error Pin Theme =====================
  pinputErrorTheme() {
    return pinputTheme().copyDecorationWith(
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(radius_12),
    );
  }

  // ===================== Verify Button =====================
  _verifyButton() {
    return CustomButton(
      onTap: () {
        controller.otpVerifyApiCall();
      },
      title: AppStrings.verify.tr,
      width: Get.width,
    ).marginOnly(top: margin_100);
  }

  // ===================== Resend OTP Section =====================
  _resendOtp() {
    return Center(
      child: controller.timerValue.value == 0 ? _didntRecievedCode() : _resendInText(),
    ).marginOnly(top: margin_20);
  }

  // ===================== Didn't Receive Code Text =====================
  _didntRecievedCode() {
    return Text.rich(
      TextSpan(text: AppStrings.didntRecievedCode.tr, children: [
        TextSpan(
            text: AppStrings.resend.tr,
            style: TextStyles.poppins12w500()?.copyWith(
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                controller.resendOTPApiCall();
              }),
      ]),
      style: TextStyles.poppins12w500(),
    );
  }

  // ===================== Resend in Countdown Text =====================
  _resendInText() {
    return Text(
      "${AppStrings.resendIn.tr} 0:${controller.timerValue.value < 10 ? "0${controller.timerValue.value}" : controller.timerValue.value} ${AppStrings.sec.tr}",
      style: TextStyles.poppins12w500(),
    );
  }

  // ===================== OTP Verified View =====================
  _otpVerifiedView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _successImage(),
        _otpVerifiedText(),
        _yourOtpHasBeenVerified(),
      ],
    ).marginSymmetric(horizontal: margin_30);
  }

  // ===================== Success Image =====================
  _successImage() {
    return AssetImageWidget(
      imagePath: AppAssets.imagesIcSuccess,
      width: width_100,
      height: width_100,
    ).marginOnly(top: Get.height * 0.25);
  }

  // ===================== OTP Verified Text =====================
  _otpVerifiedText() {
    return Text(
      AppStrings.otpVerified.tr,
      style: TextStyles.poppins36w600(),
    ).marginOnly(top: margin_40);
  }

  // ===================== OTP Verified Message =====================
  _yourOtpHasBeenVerified() {
    return Text(
      AppStrings.yourOtpHasBeenVerified.tr,
      textAlign: TextAlign.center,
      style: TextStyles.poppins14w500(),
    );
  }
}
