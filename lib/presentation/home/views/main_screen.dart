import 'package:flutter_sample/constants/export.dart';
import 'package:flutter_sample/presentation/home/widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            key: controller.scaffoldKey,

            appBar: CustomAppBar(
              title: "Home Screen",
              leading: Transform.scale(
                  scale: 0.4,
                  child: GetInkwell(
                    onTap: () {
                      controller.scaffoldKey.currentState?.openDrawer();
                    },
                    child: AssetImageWidget(
                      imagePath: AppAssets.imagesIcMenu,
                      width: width_20,
                      height: width_20,
                    ),
                  )),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("HOME SCREEN",style: TextStyles.poppins22w600(),),
                CustomButton(onTap: () {
                  PreferenceManger.clearLoginData();
                  Get.offAllNamed(AppRoutes.loginScreen);

                },title: AppStrings.logout.tr,
                width: Get.width,).marginOnly(top: margin_50)
              ],
            ).marginAll(margin_20),
            backgroundColor: AppColors.primaryColor,

          );
        });
  }


}
