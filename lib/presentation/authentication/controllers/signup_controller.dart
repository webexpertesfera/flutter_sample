import 'package:flutter_sample/constants/export.dart';

class SignupController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text controllers for form fields
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  TextEditingController? dobController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  // Gender selection options
  RxList<GenderModel> genderList = [
    GenderModel(id: keyMale, title: AppStrings.male.tr),
    GenderModel(id: keyFemale, title: AppStrings.female.tr),
  ].obs;

  // Focus nodes for managing field focus
  FocusNode? firstNameNode;
  FocusNode? lastNameNode;
  FocusNode? emailNode;
  FocusNode? passwordNode;
  FocusNode? dobNode;
  FocusNode? confirmPasswordNode;

  // Password visibility toggles
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  // Selected gender and date of birth
  RxnString selectedGender = RxnString();
  Rxn<DateTime> dob = Rxn<DateTime>();

  /* ===================== On Init ===================== */
  @override
  void onInit() {
    _initializeController();
    super.onInit();
  }

  /* ===================== Initialize Controllers and Nodes ===================== */
  _initializeController() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    firstNameNode = FocusNode();
    lastNameNode = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    dobNode = FocusNode();
    confirmPasswordNode = FocusNode();
  }

  /* ===================== Sign Up API Call ===================== */
  signUpApiCall() async {
    if (formKey.currentState!.validate()) {
      var dataBody = RequestModel.signUpRequestModel(
        email: emailController?.text.trim().toLowerCase(),
        password: passwordController?.text.trim(),
        dob: dob.value.toString(),
        firstName: firstNameController?.text.trim(),
        lastName: lastNameController?.text.trim(),
        gender: selectedGender.value,
      );

      await APIRepository.signUpApiCall(dataBody: dataBody).then((value) {
        if (value != null) {
          SuccessModel successModel = value;
          showSnackBar(successModel.message ?? "");
          Get.toNamed(AppRoutes.otpVerificationScreen, arguments: {
            keyEmail: emailController?.text.trim(),
            keyType: keyOtpVerify,
          });
        }
      }).onError((error, stackTrace) {
        showErrorSnackBar(error.toString());
      });
    }
  }

  /* ===================== Date Picker ===================== */
  void datePicker() {
    showDatePicker(
      context: Get.overlayContext!,
      firstDate: dobFirstDate,
      lastDate: dobLastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(onSurface: AppColors.yellowColor), // Set desired color
          ),
          child: child!,
        );
      },
      initialDate: dobLastDate,
    ).then((value) {
      if (value != null) {
        dob.value = value;
        dobController?.text = formatDateTime(date: dob.value, format: "yyyy-MM-dd");
      }
    });
  }
}

/* ===================== Gender Model Class ===================== */
class GenderModel {
  String? id;
  String? title;

  GenderModel({this.id, this.title});
}
