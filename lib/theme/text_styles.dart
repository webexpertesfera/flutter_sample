import 'package:flutter_sample/constants/export.dart';

class TextStyles{
  static TextStyle? poppins36w600()=>Theme.of(Get.context!).textTheme.headlineLarge;//36,600 Large text Authentication
  static TextStyle? gugi36w600()=>Theme.of(Get.context!).textTheme.headlineLarge?.copyWith(fontFamily:  fontGugi,fontWeight: FontWeight.w500);//36,600 Large text Authentication
  static TextStyle? poppins32w700()=>Theme.of(Get.context!).textTheme.headlineMedium;
  static TextStyle? poppins22w600()=>Theme.of(Get.context!).textTheme.headlineSmall;//22,600
  static TextStyle? poppins20w600()=>Theme.of(Get.context!).textTheme.bodyLarge;
  static TextStyle? vampiro20w500()=>Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontFamily: "VampiroOne",fontWeight: FontWeight.w500,color: AppColors.blueTextColor);
  static TextStyle? protestRiot20w500()=>Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontFamily: "ProtestRiot",fontWeight: FontWeight.w500,color: AppColors.blueTextColor);
  static TextStyle? poppins10w500()=>Theme.of(Get.context!).textTheme.bodyMedium; //16,400
  static TextStyle? poppins14w500()=>Theme.of(Get.context!).textTheme.bodySmall;//14,500
  static TextStyle? poppins16w600()=>Theme.of(Get.context!).textTheme.labelMedium;
  static TextStyle? poppins16w500()=>Theme.of(Get.context!).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500);
  static TextStyle? poppins8w500()=>Theme.of(Get.context!).textTheme.labelSmall;
  static TextStyle? poppins18w500()=>Theme.of(Get.context!).textTheme.displayLarge;
  static TextStyle? poppins15w500()=>Theme.of(Get.context!).textTheme.displayMedium;
  static TextStyle? poppins12w500()=>Theme.of(Get.context!).textTheme.displaySmall;
  static TextStyle? porterSansBlock12w500()=>Theme.of(Get.context!).textTheme.displaySmall?.copyWith(fontFamily: fontPorterSansInline,color: Colors.black);
  static TextStyle? stalinistOne12w500()=>Theme.of(Get.context!).textTheme.displaySmall?.copyWith(fontFamily: fontStalinistOne,color: Colors.black);
}