import 'package:flutter_sample/constants/export.dart';

class CategoriesController extends GetxController {
  List<CategoriesDataModel> categoriesList = [];

  @override
  void onReady() {
    fetchCategoriesApiCall();
    super.onReady();
  }

  fetchCategoriesApiCall() async {
    customLoader.show(Get.overlayContext!);
    await APIRepository.categoriesAPICall().then(
      (value) {
        customLoader.hide();
        if (value != null) {
          CategoriesResponseModel categoriesResponseModel = value;
          categoriesList = categoriesResponseModel.data ?? [];
          update();
        }
      },
    ).onError(
      (error, stackTrace) {
        customLoader.hide();
        showErrorSnackBar(error.toString());
      },
    );
  }
}
