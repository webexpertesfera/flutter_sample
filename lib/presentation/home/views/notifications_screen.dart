import 'package:flutter_sample/constants/export.dart';

class NotificationsScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notifications.tr,
        actions: [
          GetInkwell(
            onTap: () {
              Get.dialog(LogoutDialog(
                title: AppStrings.areYouSure.tr,
                iconColor: Colors.white,
                description: AppStrings.youWantToClearNotifications.tr,
                 confirmText: AppStrings.confirm.tr,
                onYesPress: () {
                  Get.back();
                  controller.clearNotificationListAPICall();
                },
              ));
            },
            child: Text(
              AppStrings.clear.tr,
              style: TextStyles.poppins12w500()?.copyWith(fontWeight: FontWeight.w700),
            ).directionalMarginOnly(right: margin_10),
          )
        ],
      ),
      body: Obx(
        () => controller.notificationList.isEmpty && controller.isLoading.value==false
            ? noDataFound()
            : ListView.separated(
                shrinkWrap: true,
                itemCount: controller.notificationList.length,
                padding: EdgeInsets.all(margin_15),
                itemBuilder: (context, index) {
                  var data = controller.notificationList[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius_8), border: Border.all(color: Colors.white, width: width_1)),
                    width: Get.width,
                    child: Row(
                      children: [
                        AssetImageWidget(
                          imagePath: AppAssets.imagesIcNotification,
                          width: width_35,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title??"",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.poppins14w500()?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                data.description ?? "",
                                style: TextStyles.poppins12w500(),
                              ).marginOnly(top: margin_5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.white,
                                    size: height_15,
                                  ),
                                  Text(
                                    formatDateTimeStringToLocal(format: "yyyy-MM-dd hh:mm a",date: data.createdAt),
                                    style: TextStyles.poppins12w500(),
                                  ).marginOnly(left: margin_5),
                                ],
                              ).marginOnly(top: margin_2),
                            ],
                          ).marginOnly(left: margin_10),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: height_10,
                  );
                },
              ),
      ),
    );
  }
}
