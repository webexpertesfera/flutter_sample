import 'package:flutter_sample/constants/export.dart';

class AppColors {
  static const Color primaryColor = Color(0xff020620);
  static const Color textFieldColor = Color(0xff040B40);
  static const Color searchTextFieldColor = Color(0xff477BFB);
  static const Color hintColor = Color(0xffC8C8C8);
  static const Color blueTextColor = Color(0xff2243A0);
  static const Color cardColor = Color(0xff0A153F);
  static const Color borderColor = Color(0xff102056);
  static const Color seaGreenColor = Color(0xff3F94B8);
  static const Color customCardBottomColor = Color(0xff202530);
  static const Color allCategoriesCardBottomColor = Color(0xffDDD5B6);
  static const Color drawerColor = Color(0xff302E59);
  static const Color iconColor = Color(0xff9A9A9A);
  static const Color gradient1 = Color(0xff202020);
  static const Color gradient2 = Color(0xff2A2A2A);
  static const Color lightGreyColor = Color(0xffD9D9D9);
  static const Color chatTextColor = Color(0xff6B7280);
  static const Color sentMessageBgColor = Color(0xff1C2139);
  static const Color chatTextFieldColor = Color(0xffA4AEBB);
  static const Color receivedChatBgColor = Color(0xffEAEEF7);
  static const Color yellowColor = Color(0xffFDC500);
  static const Color chatRecievedBgColor = Color(0xff8677C4);
  static const Color imageBorderColor = AppColors.blueTextColor;
  static  LinearGradient christmasBoardGradient = LinearGradient(
    colors: [
      Color(0xffB37A27).withOpacity(0.8), // 80% opacity
      Color(0xffEDC939).withOpacity(0.8), // 80% opacity
      Color(0xffF7EF60).withOpacity(0.8), // 80% opacity
      Color(0xffCDA834).withOpacity(0.8), // 80% opacity
    ],
    stops: [0.3, 0.51, 0.72, 0.98],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
