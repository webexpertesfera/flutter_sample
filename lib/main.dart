import 'package:flutter_sample/constants/export.dart';
import 'package:screen_protector/screen_protector.dart';

CustomLoader customLoader = CustomLoader();
GetStorage localStorage = GetStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _init();
  await ScreenProtector.preventScreenshotOn();
  runApp(const MyApp());
}

_init() async {
  await GetStorage.init();
  statusBarColor();
 setOrientation();
  await APIRepository();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await PushNotificationManager.init();
  selectedLanguage();
}

selectedLanguage() {
  Get.updateLocale(TranslationService.locale!);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: AppStrings.appName,
            logWriterCallback: LoggerUtils.write,
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.initialScreen,
            translations: TranslationService(),
            enableLog: true,
            fallbackLocale: TranslationService.fallbackLocale,
            locale: TranslationService.locale,
            supportedLocales: const [
              Locale("en"),
            ],
            localizationsDelegates: const [
              CountryLocalizations.delegate,
            ],
            initialBinding: SplashBinding(),
            getPages: AppPages.routes,
            theme: AppTheme.theme,
          ),
        );
      },
    );
  }
}
