import 'package:flutter_sample/constants/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onBackPress;
  final String? title;
  final Color? backgroundColor;

  const CustomAppBar({super.key,this.backgroundColor, this.leading, this.onBackPress, this.actions, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(scrolledUnderElevation: 0.0,backgroundColor: backgroundColor,
      leading: leading ??Transform.scale(

          scale: 0.7,
          child: GetInkwell(
            onTap: onBackPress ??
                () {
                  Get.back();
                },
            child: AssetImageWidget(
              imagePath: AppAssets.imagesIcBack,
              width: width_20,
              height: width_20,
            ),
          )),
      title: Text(title ?? "",style: TextStyles.poppins16w600(),),
      centerTitle: false,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height_50);
}
