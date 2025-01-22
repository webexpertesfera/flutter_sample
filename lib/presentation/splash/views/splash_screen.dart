import 'package:flutter_sample/constants/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.appName.tr,
                    style: TextStyles.gugi36w600(),
                  ),
                  AssetImageWidget(
                    imagePath: AppAssets.imagesIcSplashLogo,
                    height: width_250,
                  ).marginOnly(top: margin_15)
                ],
              ),
            ),
          );
        });
  }
}
