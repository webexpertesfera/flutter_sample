import 'package:flutter_sample/constants/export.dart';

class CommonCardView extends StatelessWidget {
  final CardType? cardType;
  final OrderDataModel? order;

  const CommonCardView({super.key, this.cardType, this.order});

  @override
  Widget build(BuildContext context) {
    return cardType == CardType.custom
        ? _customCardView()
        : cardType == CardType.allCategories
            ? _allCategoryCardView()
            : _recommendedScratchView();
  }

  Widget _customCardView() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_10), image: DecorationImage(image: AssetImage(AppAssets.imagesIcCustomCard), fit: BoxFit.cover)),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order?.uuid ?? "",
                      maxLines: 1,
                      style: TextStyles.porterSansBlock12w500(),
                    ),
                    Text(
                      order?.categoryName ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.poppins14w500()?.copyWith(color: Colors.black),
                    ).marginOnly(top: margin_1),
                    Text.rich(
                      TextSpan(
                          text: "$keyCurrency ${order?.amount ?? ""} ",
                          style: TextStyles.poppins16w600()?.copyWith(shadows: [BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 15)]),
                          children: [

                          ]),
                    ).marginOnly(top: margin_10),
                    Text.rich(
                      TextSpan(
                          text: AppStrings.scratched.tr,
                          style: TextStyles.poppins14w500()?.copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                                text: ": ${order?.scratchedCardsCount ?? ""}/${order?.totalCards ?? ""}",
                                style: TextStyles.poppins12w500()?.copyWith(
                                  color: Colors.black,
                                ))
                          ]),
                    ).marginOnly(top: margin_5),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AssetImageWidget(
                    imagePath: AppAssets.imagesIcCardImage,
                    width: width_60,
                    height: width_60,
                  ),
                  order?.rating!=null?    Row(
                    children: [
                      RatingBarIndicator(
                        itemSize: height_15,
                        itemPadding: EdgeInsets.symmetric(horizontal: margin_2),
                        unratedColor: Colors.white,
                        rating:double.parse(order?.rating.toString()??"1"),
                        itemBuilder: (context, index) {
                          return AssetImageWidget(
                            imagePath: AppAssets.imagesIcRatingIcon,
                            color: Colors.yellow,
                          );
                        },
                      ),
                      Text(
    "${order?.rating??""}",
                        style: TextStyles.poppins12w500()?.copyWith(color: Colors.black),
                      ).marginOnly(left: margin_5)
                    ],
                  ).marginOnly(top: margin_10):Container()
                ],
              )
            ],
          ).marginOnly(top: margin_10, left: margin_20, right: margin_15),
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: margin_20, vertical: margin_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius_10), bottomRight: Radius.circular(radius_10)),
              color: AppColors.customCardBottomColor,
            ),
            child: Text.rich(
                TextSpan(text: "${AppStrings.expiryDate.tr}: ", style: TextStyles.poppins14w500(), children: [
                  TextSpan(
                    text: formatDateTimeString(format: "dd/MM/yyyy", date: order?.expiryDate),
                    style: TextStyles.poppins14w500(),
                  )
                ])),
          ).marginOnly(top: margin_10)
        ],
      ),
    );
  }

  Widget _recommendedScratchView() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_10),
          image: DecorationImage(image: AssetImage(AppAssets.imagesIcRecommendedCard), fit: BoxFit.cover)),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Name",
                      maxLines: 1,
                      style: TextStyles.stalinistOne12w500()?.copyWith(color: Colors.white),
                    ),
                    Text(
                      "Category Name",
                      maxLines: 1,
                      style: TextStyles.poppins12w500(),
                    ).marginOnly(top: margin_1),
                    Text.rich(
                      TextSpan(
                          text: "\$220 ",
                          style: TextStyles.poppins16w600(),
                          children: [TextSpan(text: "\$330", style: TextStyles.poppins12w500()?.copyWith(decoration: TextDecoration.lineThrough))]),
                    ).marginOnly(top: margin_10)
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AssetImageWidget(
                    imagePath: AppAssets.imagesIcCardImage,
                    width: width_60,
                    height: width_60,
                  ),
                  order?.rating!=null?   Row(
                    children: [
                      RatingBarIndicator(
                        itemSize: height_15,
                        itemPadding: EdgeInsets.symmetric(horizontal: margin_2),
                        unratedColor: Colors.white,
                        rating:double.parse(order?.rating.toString()??"1"),
                        itemBuilder: (context, index) {
                          return AssetImageWidget(
                            imagePath: AppAssets.imagesIcRatingIcon,
                            color: Colors.yellow,
                          );
                        },
                      ),
                      Text(
                        "${order?.rating??""}",
                        style: TextStyles.poppins12w500()?.copyWith(color: Colors.black),
                      ).marginOnly(left: margin_5)
                    ],
                  ).marginOnly(top: margin_10):Container()
                ],
              )
            ],
          ).marginOnly(top: margin_10, left: margin_20, right: margin_15),
          DottedLine(
            dashColor: Colors.white,
            dashLength: width_10,
            dashGapLength: height_5,
          ).marginOnly(top: margin_15),
          Row(
            children: [
              Expanded(
                child: Text.rich(TextSpan(text: AppStrings.exp.tr, style: TextStyles.poppins14w500(), children: [
                  TextSpan(
                    text: "09/24",
                    style: TextStyles.poppins14w500()?.copyWith(fontWeight: FontWeight.w600),
                  )
                ])),
              ),
              AssetImageWidget(
                imagePath: AppAssets.imagesIcDownload,
                width: width_15,
                height: width_15,
              ),
              Text(
                AppStrings.download.tr,
                style: TextStyles.poppins12w500(),
              ).marginOnly(left: margin_10)
            ],
          ).marginSymmetric(horizontal: margin_20, vertical: margin_10)
        ],
      ),
    );
  }

  Widget _allCategoryCardView() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_10),
          image: DecorationImage(image: AssetImage(AppAssets.imagesIcAllCategoriesCard), fit: BoxFit.cover)),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${order?.uuid ?? ""}",
                      maxLines: 3,
                      style: TextStyles.porterSansBlock12w500(),
                    ),
                    Text(
                      "${order?.categoryName ?? ""}",
                      maxLines: 3,
                      style: TextStyles.poppins16w600(),
                    ).marginOnly(top: margin_2),

                    // Text(
                    //   "Category Name",
                    //   maxLines: 1,
                    //   style: TextStyles.poppins12w500()?.copyWith(color: Colors.black),
                    // ).marginOnly(top: margin_1),
                    Text.rich(
                      TextSpan(text: "\$${order?.amount} ", style: TextStyles.poppins16w600(), children: [
                        // TextSpan(
                        //     text: "\$330",
                        //     style: TextStyles.poppins12w500()?.copyWith(
                        //         color: Colors.black, decoration: TextDecoration.lineThrough))
                      ]),
                    ).marginOnly(top: margin_10),
                    Text.rich(
                      TextSpan(text: AppStrings.scratched.tr, style: TextStyles.poppins14w500(), children: [
                        TextSpan(
                            text: ": ${order?.scratchedCardsCount ?? ""}/${order?.totalCards ?? ""}",
                            style: TextStyles.poppins12w500()?.copyWith(
                              color: Colors.white,
                            ))
                      ]),
                    ).marginOnly(top: margin_10),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AssetImageWidget(
                    imagePath: AppAssets.imagesIcCardImage,
                    width: width_60,
                    color: AppColors.allCategoriesCardBottomColor,
                    height: width_60,
                  ),
                  order?.rating!=null?       Row(
                    children: [
                      RatingBarIndicator(
                        itemSize: height_15,
                        itemPadding: EdgeInsets.symmetric(horizontal: margin_2),
                        unratedColor: Colors.white,
                        rating: double.parse(order?.rating.toString()??"1"),
                        itemBuilder: (context, index) {
                          return AssetImageWidget(
                            imagePath: AppAssets.imagesIcRatingIcon,
                            color: Colors.yellow,
                          );
                        },
                      ),
                      Text(
                        "${order?.rating??""}",
                        style: TextStyles.poppins12w500()?.copyWith(color: Colors.black),
                      ).marginOnly(left: margin_5)
                    ],
                  ).marginOnly(top: margin_10):Container()
                ],
              )
            ],
          ).marginOnly(top: margin_10, left: margin_20, right: margin_15),
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: margin_20, vertical: margin_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius_10), bottomRight: Radius.circular(radius_10)),
              color: AppColors.allCategoriesCardBottomColor,
            ),
            child: Text.rich(
                TextSpan(text: "${AppStrings.expiryDate.tr}: ", style: TextStyles.poppins14w500()?.copyWith(color: Colors.black), children: [
              TextSpan(
                text: formatDateTimeString(format: "dd/MM/yyyy", date: order?.expiryDate),
                style: TextStyles.poppins14w500()?.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
              )
            ])),
          ).marginOnly(top: margin_10)
        ],
      ),
    );
  }
}
