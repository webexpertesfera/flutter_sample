import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_sample/constants/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _welcomeView(controller),
                  if (controller.homeDataModel?.categories?.length != 0) ...[
                    _categoriesText(),
                    _categoriesList(controller),
                  ],
                  _bannerList(controller),
                  _bannerIndicator(controller),
                  _countView(controller),
                  GetInkwell(
                      onTap: () async {
                        var result =await Get.toNamed(AppRoutes.questionaireScreen);
                        if(result!=null){
                          print("Result $result");
                          controller.fetchHomeScreenData();
                        }

                      },
                      child: CreatePersonalisedCardsView().marginOnly(top: margin_20, left: margin_20, right: margin_20)),
                  _personalizedBoardsText(controller),
                  _personalizedBoardList(controller),
                  _purchasedBoardsText(controller),
                  _purchasedBoardsList(controller),
                  _popularCategoriesText(),
                  _popularCategoriesList(controller),
                  SizedBox(
                    height: height_20,
                  )
                ],
              ),
            );
          }),
    );
  }

  _welcomeView(HomeController controller) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.hello.tr,
                style: TextStyles.poppins32w700(),
              ).marginOnly(top: margin_20),
              Container(
                width: Get.width * 0.4,
                height: height_1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius_10), color: Colors.white),
              ).marginOnly(top: margin_5),
              Text(
                "${controller.userDataModel?.firstName ?? ""} ${controller.userDataModel?.lastName ?? ""}",
                style: TextStyles.poppins15w500(),
              ).marginOnly(top: margin_10),
              Text(
                AppStrings.dontMissTheChanceToScratch.tr,
                style: TextStyles.poppins15w500(),
              ).marginOnly(top: margin_10),
            ],
          ),
        ),
        Container(
            width: width_80,
            height: width_80,
            padding: EdgeInsets.all(margin_10),
            decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(radius_50)),
            child: NetworkImageWidget(
              imageUrl: "$imageUrl${controller.userDataModel?.image ?? ""}",
              errorImagePath: AppAssets.imagesIcPlaceholder,
              radius: radius_50,
            ))
      ],
    ).marginSymmetric(horizontal: margin_30);
  }

  _categoriesText() {
    return Row(
      children: [
        Expanded(
          child: Text(
            AppStrings.categories.tr,
            style: TextStyles.poppins14w500(),
          ),
        ),
        GetInkwell(
          onTap: () {
            if (Get.isRegistered<MainController>() == true) {
              Get.find<MainController>().changeIndex(2);
            } else {
              Get.offAllNamed(AppRoutes.mainScreen, arguments: {keyIndex: 2});
            }
          },
          child: Text(
            AppStrings.seeAll.tr,
            style: TextStyles.poppins14w500(),
          ),
        ),
      ],
    ).directionalMarginOnly(top: margin_40, right: margin_30, left: margin_30);
  }

  _categoriesList(HomeController controller) {
    return SizedBox(
      height: height_80,
      child: Row(
        children: [
          GetInkwell(
            onTap: () {
              controller.scrollController
                  .animateTo(controller.scrollController.position.pixels - 200, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            child: AssetImageWidget(
              imagePath: AppAssets.imagesIcPrev,
              width: width_10,
              fit: BoxFit.fitWidth,
              height: height_60,
            ).marginOnly(bottom: margin_15, right: margin_10),
          ),
          Expanded(
            child: ListView.separated(
              controller: controller.scrollController,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: controller.homeDataModel?.categories?.length ?? 0,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: margin_10),
              itemBuilder: (context, index) {
                return GetInkwell(
                  onTap: () async {
                    var result = await Get.toNamed(AppRoutes.cardsListScreen,
                        arguments: {keyId: controller.homeDataModel?.categories?[index].id, keyType: typeCategories});
                    if (result != null) {
                      controller.fetchHomeScreenData();
                    }
                  },
                  child: Container(
                    width: width_70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.imageBorderColor, width: width_1), borderRadius: BorderRadius.circular(radius_50)),
                          child: NetworkImageWidget(
                            imageUrl: "$imageUrl${controller.homeDataModel?.categories?[index].path}",
                            width: width_60,
                            height: width_60,
                            errorIcon: Icons.category_outlined,
                            radius: radius_50,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${controller.homeDataModel?.categories?[index].name ?? ""}",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyles.poppins8w500(),
                          ).marginOnly(top: margin_5),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: width_20,
                );
              },
            ),
          ),
          GetInkwell(
            onTap: () {
              controller.scrollController
                  .animateTo(controller.scrollController.position.pixels + 200, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            child: AssetImageWidget(
              imagePath: AppAssets.imagesIcNext,
              width: width_10,
              fit: BoxFit.fitWidth,
              height: height_60,
            ).marginOnly(bottom: margin_15, left: margin_10),
          ),
        ],
      ).marginSymmetric(horizontal: margin_10),
    ).marginOnly(top: margin_15);
  }

  // _bannerList1(HomeController controller) {
  //   return SizedBox(
  //     height: height_100,
  //     child: PageView.builder(
  //       itemCount: controller.homeDataModel?.banners?.length ?? 0,
  //       controller: controller.pageController,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         return Container(
  //             width: Get.width,
  //             height: height_100,
  //             alignment: Alignment.center,
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                   image: NetworkImage(
  //                     "$imageUrl${controller.homeDataModel?.banners?[index].path ?? ""}",
  //                   ),
  //                   fit: BoxFit.cover),
  //             ),
  //             child: Container(
  //               margin: EdgeInsets.symmetric(horizontal: margin_60),
  //               padding: EdgeInsets.symmetric(horizontal: margin_5),
  //
  //               decoration: BoxDecoration(color: AppColors.seaGreenColor,borderRadius: BorderRadius.circular(radius_3)),
  //               child: Text(
  //                 controller.homeDataModel?.banners?[index].title ?? "",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyles.poppins14w500()?.copyWith(fontWeight: FontWeight.bold),
  //               ),
  //             ));
  //       },
  //     ),
  //   ).marginOnly(top: margin_5);
  // }
  _bannerList(HomeController controller) {
    return controller.homeDataModel?.banners?.length == 0
        ? Container()
        : CarouselSlider.builder(
            itemCount: controller.homeDataModel?.banners?.length ?? 0,
            carouselController: controller.pageController,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index, realIndex) {
              return GetInkwell(
                onTap: () {
                  if (controller.homeDataModel?.banners?[index].type == keySubscription) {
                    Get.toNamed(AppRoutes.subscriptionScreen);
                  }else if(controller.homeDataModel?.banners?[index].type==keyContactScratchy){
                    Get.toNamed(AppRoutes.helpTicketsListScreen);
                  }
                },
                child: Container(
                    width: Get.width,
                    height: height_100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      image: DecorationImage(
                          image: NetworkImage(
                            "$imageUrl${controller.homeDataModel?.banners?[index].path ?? ""}",
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: margin_60),
                      padding: EdgeInsets.symmetric(horizontal: margin_5),
                      decoration: BoxDecoration(color: AppColors.seaGreenColor, borderRadius: BorderRadius.circular(radius_3)),
                      child: Text(
                        controller.homeDataModel?.banners?[index].title ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyles.poppins14w500()?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    )),
              );
            },
            options: CarouselOptions(
              height: height_110,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1,
              autoPlay: (controller.homeDataModel?.banners?.length ?? 0) > 1 ? true : false,
              enlargeCenterPage: true,
              initialPage: controller.carouselIndex,
              enlargeFactor: 10,
              onPageChanged: (index, reason) {
                controller.carouselIndex = index;
                controller.centerBanner = controller.homeDataModel?.banners?[index];
                debugPrint(controller.centerBanner?.id.toString());
                controller.update();
              },
            ),
          ).marginOnly(top: margin_10);
  }

  Widget _bannerIndicator(HomeController controller) {
    return (controller.homeDataModel?.banners?.length ?? 0) < 2
        ? Container()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.homeDataModel!.banners!
                .map(
                  (e) => Container(
                    alignment: Alignment.center,
                    width: controller.centerBanner?.id == e.id ? width_15 : width_5,
                    height: width_5,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(radius_10)),
                  ).marginSymmetric(horizontal: margin_2),
                )
                .toList(),
          ).marginOnly(top: margin_10);
  }

  _countView(HomeController controller) {
    return Row(
      children: [
        _countViewTitleAndValue(title: AppStrings.totalNoOfPersonalizedBoard.tr, value: "${controller.homeDataModel?.totalPersonalizedBoard ?? "0"}"),
        SizedBox(
          width: width_10,
        ),
        _countViewTitleAndValue(title: AppStrings.totalNoOfCategoriesBoard.tr, value: "${controller.homeDataModel?.totalCategorizedBoard ?? "0"}"),
      ],
    ).marginOnly(top: margin_25, left: margin_20, right: margin_20);
  }

  Widget _countViewTitleAndValue({String? title, String? value}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(margin_10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_10),
          image: DecorationImage(image: AssetImage(AppAssets.imagesIcGetButtonBg), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Text(
              title ?? "",
              style: TextStyles.poppins10w500()?.copyWith(color: Colors.black, fontSize: font_8),
            ),
            Text(
              value ?? "",
              style: TextStyles.poppins22w600()?.copyWith(color: Colors.black),
            ).marginOnly(
              top: margin_10,
            ),
          ],
        ),
      ),
    );
  }

  _personalizedBoardsText(HomeController controller) {
    return controller.homeDataModel?.personalized?.length == 0
        ? Container()
        : Text(
            AppStrings.personalizedBoards.tr,
            style: TextStyles.poppins14w500(),
          ).marginOnly(top: margin_20, left: margin_30, right: margin_30);
  }

  _purchasedBoardsText(HomeController controller) {
    return controller.homeDataModel?.orders?.length != 0
        ? Text(
            AppStrings.purchasedBoards.tr,
            style: TextStyles.poppins14w500(),
          ).marginOnly(top: margin_20, left: margin_30, right: margin_30)
        : Container();
  }

  _popularCategoriesText() {
    return Text(
      AppStrings.popularCategories.tr,
      style: TextStyles.poppins14w500(),
    ).marginOnly(top: margin_20, left: margin_30, right: margin_30);
  }

  _personalizedBoardList(HomeController controller) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.homeDataModel?.personalized?.length ?? 0,
      padding: EdgeInsets.symmetric(horizontal: margin_15),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GetInkwell(
            onTap: () async {
              if (controller.homeDataModel?.personalized?[index].isExpired == 1) {
                _expiredDialog(controller);
              } else {
                var result = await Get.toNamed(AppRoutes.cardsListScreen,
                    arguments: {keyId: controller.homeDataModel?.personalized?[index].id, keyIsOrderDetail: true, keyType: typePersonalized});
                if (result != null) {
                  controller.fetchHomeScreenData();
                }
              }
            },
            child: CommonCardView(
              cardType: CardType.custom,
              order: controller.homeDataModel?.personalized?[index],
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: height_15);
      },
    ).marginOnly(top: margin_15);
  }

  _purchasedBoardsList(HomeController controller) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.homeDataModel?.orders?.length ?? 0,
      padding: EdgeInsets.symmetric(horizontal: margin_15),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GetInkwell(
            onTap: () async {
              if (controller.homeDataModel?.orders?[index].isExpired == 1) {
                _expiredDialog(controller);
              } else {
                var result = await Get.toNamed(AppRoutes.cardsListScreen,
                    arguments: {keyId: controller.homeDataModel?.orders?[index].id, keyIsOrderDetail: true, keyType: typeCategories});
                if (result != null) {
                  controller.fetchHomeScreenData();
                }
              }
            },
            child: CommonCardView(
              cardType: CardType.allCategories,
              order: controller.homeDataModel?.orders?[index],
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: height_15);
      },
    ).marginOnly(top: margin_15);
  }

  _popularCategoriesList(HomeController controller) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.homeDataModel?.popularCategories?.length ?? 0,
      padding: EdgeInsets.symmetric(horizontal: margin_15),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GetInkwell(
          onTap: () async {
            var result = await Get.toNamed(AppRoutes.cardsListScreen,
                arguments: {keyId: controller.homeDataModel?.popularCategories?[index].id, keyType: typeCategories});
            if (result != null) {
              controller.fetchHomeScreenData();
            }
          },
          child: Container(
            width: Get.width,
            padding: EdgeInsets.only(left: margin_20, right: margin_20, top: margin_15, bottom: margin_10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius_10),
                image: DecorationImage(
                    image: AssetImage(controller.popularCategoryPlaceholderList[index % controller.popularCategoryPlaceholderList.length]),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.homeDataModel?.popularCategories?[index].name ?? "",
                            style: TextStyles.poppins16w600()?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${AppStrings.cardLimit.tr}: ${controller.homeDataModel?.popularCategories?[index].cardLimit ?? ""}",
                            style: TextStyles.poppins12w500(),
                          ).marginOnly(top: margin_3),
                          controller.homeDataModel?.popularCategories?[index].averageRating != null
                              ? Row(
                                  children: [
                                    RatingBarIndicator(
                                      itemSize: height_15,
                                      itemPadding: EdgeInsets.symmetric(horizontal: margin_2),
                                      unratedColor: Colors.white,
                                      rating: double.parse(controller.homeDataModel?.popularCategories?[index].averageRating?.toString() ?? "1"),
                                      itemBuilder: (context, index) {
                                        return AssetImageWidget(
                                          imagePath: AppAssets.imagesIcRatingIcon,
                                          color: Colors.yellow,
                                        );
                                      },
                                    ),
                                    Text(
                                      "${double.parse(controller.homeDataModel?.popularCategories?[index].averageRating.toString() ?? "0").toStringAsFixed(2)}",
                                      style: TextStyles.poppins12w500()?.copyWith(color: index % 2 != 0 ? Colors.black : Colors.white),
                                    ).marginOnly(left: margin_5)
                                  ],
                                ).marginOnly(top: margin_10)
                              : Container(),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: margin_10, horizontal: margin_30),
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(AppAssets.imagesIcGetButtonBg)),
                                borderRadius: BorderRadius.circular(radius_50)),
                            child: Text(
                              AppStrings.getNow.tr,
                              style: TextStyles.poppins12w500()?.copyWith(color: Colors.black),
                            ),
                          ).marginOnly(top: margin_15)
                        ],
                      ),
                    ),
                    NetworkImageWidget(
                      imageUrl: "$imageUrl${controller.homeDataModel?.popularCategories?[index].path ?? ""}",
                      radius: radius_10,
                      errorIcon: Icons.category_outlined,
                      height: width_80,
                      width: width_80,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: height_15,
        );
      },
    ).marginOnly(top: margin_15, bottom: margin_15);
  }

  void _expiredDialog(HomeController controller) {
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
                        controller.getRegisterData();
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
