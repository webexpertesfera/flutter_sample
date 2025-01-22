import 'package:flutter_sample/constants/export.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }

}