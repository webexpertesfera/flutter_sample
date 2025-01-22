import 'package:flutter_sample/constants/export.dart';

class CreatePersonalisedCardsView extends StatelessWidget {
  BoardButtonType? boardType = BoardButtonType.christmas;

  CreatePersonalisedCardsView({super.key, this.boardType = BoardButtonType.christmas});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: margin_20, vertical: margin_10),
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(boardType == BoardButtonType.christmas ? AppAssets.imagesIcBoardBg : AppAssets.imagesIcCreateBoardBg),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(radius_10)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius_10),
            color: AppColors.lightGreyColor,
            gradient: boardType == BoardButtonType.christmas ? AppColors.christmasBoardGradient : null),
        child: Column(
          children: [
            Text(
              AppStrings.createYourOwnPersonlisedCards.tr,
              style: boardType == BoardButtonType.christmas ? TextStyles.protestRiot20w500() : TextStyles.vampiro20w500(),
              textAlign: TextAlign.center,
            ).marginOnly(top: margin_25, left: margin_20, right: margin_20),
            AssetImageWidget(
              imagePath: AppAssets.imagesIcArrowRightRounded,
              width: width_30,
              height: width_30,
              radius: radius_100,
            ).marginSymmetric(vertical: margin_15)
          ],
        ),
      ),
    );
  }
}
