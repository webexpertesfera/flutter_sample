import 'package:flutter_sample/constants/export.dart';

class ImagePickerSheet extends StatelessWidget {
  final VoidCallback? onCameraPress;
  final VoidCallback? onGalleryPress;

  const ImagePickerSheet({super.key, this.onCameraPress, this.onGalleryPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 3,
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.4,
          ).marginOnly(left: margin_15, right: margin_15, top: margin_15),
          Text(
            AppStrings.selectPickImage.tr,
            style: TextStyles.poppins22w600(),
          ).marginOnly(top: margin_10),
          InkWell(
              onTap: onGalleryPress ?? () {},
              child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.gallery.tr,
                    style: TextStyles.poppins16w600(),
                  )).marginSymmetric(vertical: margin_10)),
          InkWell(
              onTap: onCameraPress ?? () {},
              child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.camera.tr,
                    style: TextStyles.poppins16w600(),
                  )).marginSymmetric(vertical: margin_10)),
          SizedBox(
            height: height_20,
          )
        ],
      ),
    );
  }
}
