import 'package:flutter_sample/constants/export.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      init: CategoriesController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _categoriesText(),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.categoriesList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: margin_15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    return GetInkwell(
                      onTap: () {
                        Get.toNamed(AppRoutes.cardsListScreen, arguments: {
                          keyId: controller.categoriesList[index].id,
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.imageBorderColor, width: width_1),
                                borderRadius: BorderRadius.circular(radius_50)),
                            child: NetworkImageWidget(
                              imageUrl: "$imageUrl${controller.categoriesList[index].path ?? ""}",
                              errorIcon: Icons.category_outlined,
                              width: width_60,
                              height: width_60,
                              radius: radius_50,
                            ),
                          ),
                          Text(
                            controller.categoriesList[index].name ?? "",
                            style: TextStyles.poppins12w500(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ).marginOnly(top: margin_5),
                        ],
                      ),
                    );
                  },
                ).marginOnly(top: margin_10),
              ),
            ],
          ).marginSymmetric(
            horizontal: margin_30,
          ),
        );
      },
    );
  }

  _categoriesText() {
    return Text(
      AppStrings.categories.tr,
      style: TextStyles.poppins14w500(),
    );
  }
}
