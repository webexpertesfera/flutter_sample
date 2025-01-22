import 'dart:io';

import 'package:flutter_sample/constants/export.dart';

statusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
}

showSnackBar(String message) {
  Get.closeAllSnackbars();
  Get.snackbar(
    AppStrings.appName,
    message,
    icon: Icon(Icons.check_circle_outline_rounded),
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}

showErrorSnackBar(String message) {
  Get.closeAllSnackbars();
  Get.snackbar(
    AppStrings.appName,
    message ?? "",
    icon: Icon(Icons.error_outline_rounded),
    backgroundColor: Colors.blue,
    colorText: Colors.white,
  );
}

showWarningSnackBar(String message) {
  Get.closeAllSnackbars();
  Get.snackbar(
    AppStrings.appName,
    message ?? "",
    icon: Icon(Icons.warning_amber_rounded),
    backgroundColor: AppColors.primaryColor,
    colorText: Colors.black,
  );
}


setOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
Future<File?> pickImage({fromCamera = false}) async {
  XFile? image = await ImagePicker().pickImage(source: fromCamera == true ? ImageSource.camera : ImageSource.gallery);
  if (image != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(sourcePath: image.path, aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
  }
}

String formatDateTime({String? format, DateTime? date}) {
  // Parse the UTC timestamp to a DateTime object
  DateTime dateTime = date ?? DateTime.now();

  // Define the desired date format
  DateFormat formatter = DateFormat(format ?? 'dd/MM/yyyy HH:mm');

  // Format the DateTime object to the desired format
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

String formatDateTimeString({String? format, String? date}) {
  // Parse the UTC timestamp to a DateTime object
  DateTime dateTime = DateTime.parse(date ?? DateTime.now().toString());

  // Define the desired date format
  DateFormat formatter = DateFormat(format ?? 'dd/MM/yyyy HH:mm');

  // Format the DateTime object to the desired format
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

String formatDateTimeStringToLocal({String? format, String? date}) {
  // Parse the UTC timestamp to a DateTime object
  DateTime dateTime = DateTime.parse(date ?? DateTime.now().toString()).toLocal();

  // Define the desired date format
  DateFormat formatter = DateFormat(format ?? 'dd/MM/yyyy HH:mm');

  // Format the DateTime object to the desired format
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

DateTime combineDateTimeWithTimeOfDay({@required DateTime? date, @required TimeOfDay? time}) {
  return DateTime(date!.year, date.month, date.day, time!.hour, time.minute);
}

Widget noDataFound({String? text}) {
  return Center(
    child: Text(
      text ?? AppStrings.noDataFound.tr,
      textAlign: TextAlign.center,
      style: TextStyles.poppins22w600(),
    ),
  );
}

String? getDeviceType() {
  if (GetPlatform.isAndroid) {
    return "android";
  } else {
    return "ios";
  }
}

String? formatDuration(Duration? d) {
  if (d != null) {
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}');
    }

    tokens.add('${minutes < 10 ? "0$minutes" : minutes}');
    tokens.add('${seconds < 10 ? "0$seconds" : seconds}');

    return tokens.join(':');
  }


}


onLanguageChange(LanguageModel languageMode){
  debugPrint(Get.locale.toString());
  PreferenceManger.setLanguage(languageMode.languageCode);
  Get.updateLocale(Locale(languageMode.languageCode ?? ""));
  debugPrint(Get.locale.toString());
}



extension DirectionalWidgetMarginX on Widget {
  Widget directionalMarginAll(double margin) =>
      Container(margin: EdgeInsetsDirectional.all(margin), child: this);

  Widget directionalMarginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
          margin:
          EdgeInsetsDirectional.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget directionalMarginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(
          margin: EdgeInsetsDirectional.only(
              top: top, start: left, end: right, bottom: bottom),
          child: this);

  Widget get marginZero => Container(margin: EdgeInsets.zero, child: this);
}



enum BoardType{categorized,personalized}


bool isAfterDate(String? dateString) {
  // Check if the dateString is null or empty
  if (dateString == null || dateString.isEmpty) {
    return false;
  }

  // Parse the string to a DateTime object
  DateTime inputDate = DateTime.parse(dateString);

  // Get the current date and time
  DateTime now = DateTime.now();

  // Compare if current date is after the input date
  return now.isAfter(inputDate);
}