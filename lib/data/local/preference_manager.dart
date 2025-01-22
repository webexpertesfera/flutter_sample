import 'dart:convert';

import 'package:flutter_sample/constants/export.dart';

class PreferenceManger {
  static const String locale = "locale";
  static const String isFirstLaunch = "isFirstLaunch";
  static const String authToken = "authToken";
  static const String refreshToken = "refreshToken";
  static const String fcmToken = "fcmToken";
  static const String roleId = "roleId";
  static const String loginResponseModel = "loginResponseModel";

  /* ===================== Set Value of First Time Launch App ===================== */

  static firstLaunch(bool? isFirstCheck) {
    localStorage.write(isFirstLaunch, isFirstCheck).onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
    localStorage.read(
      isFirstLaunch,
    );
  }

  /* ===================== Save Auth Token ===================== */

  static saveAuthToken(String? accessToken) {
    localStorage.write(authToken, accessToken);
  }

  /* ===================== Save FCM Token ===================== */

  static saveFcmToken(String? token) {
    localStorage.write(fcmToken, token);
  }

  /* ===================== GET FCM TOKEN FOR PUSH NOTIFICATIONS ===================== */
  static getFcmToken() {
    return localStorage.read(fcmToken) ?? null;
  }

  /* ===================== Set Language ===================== */
  static setLanguage(String? localeValue) {
    localStorage.write(locale, localeValue);
  }

  /* ===================== Get Language ===================== */
  static Locale? getLanguage() {
    final languageTag = localStorage.read(locale) as String?;
    if (languageTag != null) {
      return Locale(languageTag);
    } else {
      return null;
    }
  }

  /* ===================== Get Auth Token ===================== */
  static getAuthToken() {
    return localStorage.read(authToken);
  }

  /* ===================== Save Role of User ===================== */
  static saveRole(int? role) {
    localStorage.write(roleId, role);
  }
  /* ===================== Save User Model ===================== */
  static saveRegisterData(UserDataModel? model) async {
    localStorage.write(loginResponseModel, jsonEncode(model));
  }
  /* ===================== Get Saved Role ===================== */
  static getRole() {
    return localStorage.read(roleId);
  }

  /* ===================== Get Status of first Launch of Application ===================== */
  static getStatusFirstLaunch() {
    return localStorage.read(isFirstLaunch) ?? false;
  }

  /* ===================== Get Saved User Data ===================== */
  static Future getSavedLoginData() async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(loginResponseModel);
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      UserDataModel user = UserDataModel.fromJson(userMap);
      return user;
    }
    return null;
  }

  /* ===================== Clear Token & User Model ===================== */
  static clearLoginData() {
    localStorage.remove(loginResponseModel);
    localStorage.remove(authToken);
  }
}
