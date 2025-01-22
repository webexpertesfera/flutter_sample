import 'package:flutter_sample/constants/export.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<QuestionaireController>(() => QuestionaireController());
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
