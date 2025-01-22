import 'package:flutter_sample/constants/export.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Drawer(
          width: Get.width * 0.85,
          backgroundColor: AppColors.drawerColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageAndTitle(
                image: AppAssets.imagesIcProfileDrawer,
                title: AppStrings.profile.tr,
                onTap: () async {
                  Get.back();
                  controller.currentIndex = 3;
                  controller.update();
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcContactScratch,
                title: AppStrings.contactScratch.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.helpTicketsListScreen);
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcTransactionDetails,
                title: AppStrings.transactionDetails.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.transactionDetailScreen);
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcChangePassword,
                title: AppStrings.changePassword.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.changePasswordHomeScreen);
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcSubscription,
                title: AppStrings.manageSubscription.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.subscriptionScreen);
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcNotificationPref,
                title: AppStrings.notificationPreferences.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.notificationPreferenceScreen);
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcTnc,
                title: AppStrings.termsAndConditions.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.staticPagesScreen, arguments: {keyId: keyTermsAndConditions});
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcTnc,
                title: AppStrings.privacyPolicy.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.staticPagesScreen, arguments: {keyId: keyPrivacyPolicy});
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcFaq,
                title: AppStrings.faq.tr,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.faqScreen);
                },
              ),
              Spacer(),
              _imageAndTitle(
                image: AppAssets.imagesIcSignout,
                title: AppStrings.logout.tr,
                onTap: () {
                  Get.dialog(LogoutDialog(
                    title: AppStrings.logout.tr,
                    iconColor: Colors.white,
                    description: AppStrings.areYourSureYouWantToLogout.tr,
                    onYesPress: () {
                      controller.logoutAPICall();
                    },
                  ));
                },
              ),
              _imageAndTitle(
                image: AppAssets.imagesIcDelete,
                title: AppStrings.deleteAccount.tr,
                onTap: () {
                  Get.dialog(LogoutDialog(
                    title: "${AppStrings.warning.tr}",
                    iconColor: Colors.white,
                    description: AppStrings.areYourSureYouWantToDeleteAccount.tr,
                    confirmText: AppStrings.confirm.tr,
                    onYesPress: () {
                      controller.deleteAccountAPICall();
                    },
                  ));
                },
              ).marginOnly(bottom: margin_50),
            ],
          ).marginOnly(top: margin_70, left: margin_20, right: margin_20),
        );
      },
    );
  }

  Widget _imageAndTitle({String? image, String? title, VoidCallback? onTap}) {
    return GetInkwell(
      onTap: onTap ?? () {},
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AssetImageWidget(
            imagePath: image ?? AppAssets.imagesIcProfileDrawer,
            height: width_20,color: Colors.white,
            fit: BoxFit.cover,
          ),
          Text(
            title ?? "",
            style: TextStyles.poppins16w500(),
          ).directionalMarginOnly(left: margin_15),
        ],
      ).directionalMarginSymmetric(vertical: margin_15),
    );
  }
}
