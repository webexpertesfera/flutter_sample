import 'package:flutter_sample/constants/export.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.white.withOpacity(0.3),
      selectionHandleColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_22, color: Colors.white)),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFieldColor,
      errorStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_14, color: Colors.white),
      filled: true,
      hintStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_15, color: AppColors.hintColor),
      labelStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_15, color: Colors.white),
      // isDense: true,
      focusColor: Colors.transparent,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
      focusedErrorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
      errorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius_50), borderSide: BorderSide(color: Colors.transparent, width: width_0)),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Poppins", fontSize: font_36, color: Colors.white),
      headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: font_32, color: Colors.white),
      headlineSmall: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Poppins", fontSize: font_22, color: Colors.white),
      bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Poppins", fontSize: font_20, color: Colors.white),
      bodyMedium: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_10, color: Colors.white),
      bodySmall: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_14, color: Colors.white),
      labelMedium: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Poppins", fontSize: font_16, color: Colors.white),
      labelSmall: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_8, color: Colors.white),
      displayLarge: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Poppins", fontSize: font_18, color: Colors.white),
      displayMedium: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_15, color: Colors.white),
      displaySmall: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: font_12, color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.primaryColor,
      dayStyle: TextStyle(fontSize: font_14),
      dayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.black; // Selected date text color
        } else if (states.contains(MaterialState.disabled)) {
          return Colors.grey; // Unavailable date text color
        }
        return Colors.white; // Default date text color
      }),
      headerForegroundColor: Colors.white,

      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white; // Selected date text color
        }
        return Colors.transparent; // Default date text color
      }),yearOverlayColor: MaterialStateProperty.all(AppColors.yellowColor.withOpacity(0.5)),
      todayBackgroundColor: MaterialStateProperty.all(AppColors.yellowColor.withOpacity(0.5)),
      todayForegroundColor: MaterialStateProperty.all(Colors.white),
      dividerColor: AppColors.yellowColor,
      yearStyle: TextStyle(color: Colors.white, fontSize: font_14),
      yearForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.black; // Selected year text color
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey; // Selected year text color
        }
        return Colors.white; // Default year text color
      }),
      yearBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.yellowColor; // Selected year text color
        }
        return Colors.transparent;
      }),
      weekdayStyle: TextStyle(color: AppColors.yellowColor, fontSize: font_18, fontWeight: FontWeight.bold),
      confirmButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.yellowColor),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: font_16, fontWeight: FontWeight.bold))),
      cancelButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.yellowColor),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: font_16, fontWeight: FontWeight.bold))),
      headerHeadlineStyle: TextStyle(color: AppColors.yellowColor, fontSize: font_32, fontWeight: FontWeight.bold),
      headerHelpStyle: TextStyle(color: Colors.white, fontSize: font_18),
    ),
  );
}
