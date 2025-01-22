import 'package:flutter_sample/constants/export.dart';

class AppPages {
  static const initialScreen = AppRoutes.splash;
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignupScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => MainScreen(key: UniqueKey(),),
      binding: HomeBinding(),

    ),
    GetPage(
      name: AppRoutes.categoriesScreen,
      page: () => CategoriesScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
        name: AppRoutes.questionaireScreen,
        page: () => QuestionaireScreen(),
        binding: HomeBinding(),
        ),

    GetPage(
        name: AppRoutes.notificationsScreen,
        page: () => NotificationsScreen(),
        binding: HomeBinding(),
        ),
  ];
}
