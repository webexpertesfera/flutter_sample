
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_sample/constants/export.dart';
import 'package:flutter_sample/utils/dominant_colors.dart';

class HomeController extends GetxController{
  ScrollController scrollController=ScrollController();
  CarouselSliderController pageController=CarouselSliderController();
  HomeDataModel? homeDataModel;
UserDataModel? userDataModel;
int carouselIndex=0;
BannerDataModel? centerBanner;
  List<String> popularCategoryPlaceholderList = <String>[
    AppAssets.imagesIcPopularCatBg1,
    AppAssets.imagesIcPopularCatBg2,
  ].obs;
  @override
  void onInit() {
    getRegisterData();
    super.onInit();
  }

  @override
  void onReady() {
    fetchHomeScreenData();
    super.onReady();
  }

  getRegisterData() async {
    userDataModel=await PreferenceManger.getSavedLoginData();
    update();
  }
  fetchHomeScreenData() async {
    customLoader.show(Get.overlayContext!);
    await APIRepository.homeScreenAPICall().then((value) {
      customLoader.hide();

      if(value!=null){
        HomeResponseModel homeResponseModel=value;
        homeDataModel=homeResponseModel.data;
        if(homeResponseModel.data?.banners?.length!=0){
          centerBanner=homeResponseModel.data?.banners?[0];
        }
        update();
      }
    },).onError((error, stackTrace) {
      customLoader.hide();
showErrorSnackBar(error.toString());
    },);
  }


}