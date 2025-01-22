import 'package:flutter_sample/constants/export.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback? onYesPress;
  final String? title;
  final String? description;
  final String? confirmText;
  final String? icon;
  final bool showCancelButton;
  final Color? iconColor;

  LogoutDialog({super.key, this.onYesPress, this.title, this.description, this.icon, this.confirmText, this.iconColor,this.showCancelButton=true,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: AppColors.blueTextColor, blurRadius: radius_15)],
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(radius_30)),
        padding: EdgeInsets.all(margin_15),
        margin: EdgeInsets.all(margin_15),
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: GetInkwell(
                      onTap: () {
                        Get.back();
                      },
                      child: AssetImageWidget(
                        imagePath: AppAssets.imagesIcClose,
                        width: width_25,
                        height: width_25,
                      ))),
              icon != null
                  ? Align(
                      alignment: Alignment.center,
                      child: AssetImageWidget(
                        imagePath: icon ?? AppAssets.imagesIcSignout,
                        width: width_50,
                        height: width_50,
                        color:iconColor,
                      ))
                  : Container(),
              Text(
                title ?? "",
                style: TextStyles.poppins18w500(),
                textAlign: TextAlign.center,
              ).marginOnly(top: margin_10, left: margin_10, right: margin_10),
              Text(
                description ?? "",
                style: TextStyles.poppins14w500(),
                textAlign: TextAlign.center,
              ).marginOnly(top: margin_10, left: margin_20, right: margin_20),
              CustomButton(
                onTap: onYesPress ?? () {},
                title: confirmText ?? AppStrings.logout.tr,
                width: Get.width,
              ).marginOnly(top: margin_20),
            showCancelButton==true?  CustomButton(
                onTap: () {
                  Get.back();
                },
                title: AppStrings.cancel.tr,
                color: Colors.transparent,
                borderColor: Colors.white,
                textColor: Colors.white,
                width: Get.width,
              ).marginOnly(top: margin_15):Container()
            ],
          ),
        ),
      ),
    );
  }
}
