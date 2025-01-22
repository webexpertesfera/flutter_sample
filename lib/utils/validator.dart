import 'package:flutter_sample/constants/app_strings.dart';
import 'package:flutter_sample/constants/export.dart';

class FormValidator {
  // Validate email address
  static String? validateEmail(String? value) {

    if (value == null || value.isEmpty) {
      return AppStrings.emailCantBeEmpty.tr;
    }
    if (!GetUtils.isEmail(value)) {
      return AppStrings.pleaseEnterAValidEmailAddress.tr;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneNoCantBeEmpty.tr;
    }
    if (value.trim().length<8 || value.trim().length>15) {
      return AppStrings.pleaseEnterAValidPhoneNumber.tr;
    }
    return null;
  }

  static String? validateField({String? value,String? title}) {
    if (value == null || value.isEmpty) {
      return '$title ${AppStrings.cantBeEmpty.tr}';
    }
    return null;
  }
  static String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~><]).{8,}$');
    if (value == null || value.isEmpty) {
      return AppStrings.passwordCantBeEmpty.tr;
    }
    if (!regex.hasMatch(value)) {
      return AppStrings.passwordMustContainWarning.tr;
    }
    return null;
  }
  static String? validateConfirmPassword({String? value,String? password}) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmPasswordCantBeEmpty.tr;
    }
    if (value.trim()!=password?.trim()) {
      return AppStrings.confirmPasswordDoesntMatch.tr;
    }
    return null;
  }
}
