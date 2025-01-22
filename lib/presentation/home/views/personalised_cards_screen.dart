import 'package:flutter_sample/constants/export.dart';

class PersonalisedCardsScreen extends StatelessWidget {
  const PersonalisedCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalisedCardsController>(
      init: PersonalisedCardsController(),
      builder: (controller) {
       return Scaffold(
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetInkwell(
                onTap: () async {
                  var result =await Get.toNamed(AppRoutes.questionaireScreen);
                  if(result!=null){
                    print("Result $result");
                    controller.fetchPersonalizedBoardsListApiCall();
                  }
                },
                  child: CreatePersonalisedCardsView()),
              Text(
                AppStrings.previousCreatedCards.tr,
                style: TextStyles.poppins14w500(),
              ).marginOnly(top: margin_20),
              _personalisedCardsList(controller),

            ],
          ).marginSymmetric(horizontal: margin_20,vertical: margin_10),
        ),
      );
    },);
  }

  _personalisedCardsList(PersonalisedCardsController controller) {
    return controller.personalizedBoardsList.isEmpty && controller.isLoading==false?noDataFound(text: AppStrings.noCardsFound.tr).marginOnly(top: Get.height*0.2):ListView.separated(
      shrinkWrap: true,
      itemCount: controller.personalizedBoardsList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GetInkwell(
          onTap: () async {
    if (controller. personalizedBoardsList[index].isExpired==1) {
    _expiredDialog(controller);
    } else {
            var result = await Get.toNamed(AppRoutes.cardsListScreen,
                arguments: {keyId: controller.personalizedBoardsList[index].id, keyIsOrderDetail: true});
            if (result != null) {
              controller.fetchPersonalizedBoardsListApiCall();
            }
          }},
            child: CommonCardView(cardType: CardType.custom,order: controller.personalizedBoardsList[index],));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: height_15);
      },
    ).marginOnly(top: margin_15);
  }
  void _expiredDialog(PersonalisedCardsController controller) {
    Get.dialog(Center(
      child: Container(
        width: Get.width,
        padding: EdgeInsets.all(margin_20),
        margin: EdgeInsets.all(margin_20),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(
              color: Colors.white,
              width: width_2,
            ),
            borderRadius: BorderRadius.circular(radius_12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AssetImageWidget(
              imagePath: AppAssets.imagesIcExpired,
              width: width_80,
            ),
            Text(
              AppStrings.thePurchasedBoardIsExpired,
              style: TextStyles.poppins16w600(),
              textAlign: TextAlign.center,
            ).marginOnly(top: margin_20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () async {
                      Get.back();
                      var result = await Get.toNamed(AppRoutes.subscriptionScreen);
                      if (result != null) {

                      }
                    },
                    title: AppStrings.yes.tr,
                    horizontalPadding: margin_0,
                  ),
                ),
                SizedBox(
                  width: width_10,
                ),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Get.back();
                    },
                    title: AppStrings.no.tr,
                    horizontalPadding: margin_0,
                  ),
                ),
              ],
            ).marginOnly(top: margin_20)
          ],
        ),
      ),
    ));
  }
}
