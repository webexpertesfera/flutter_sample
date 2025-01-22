import 'package:flutter_sample/constants/export.dart';

class HomeDataModel {
  List<CategoriesDataModel>? popularCategories;
  List<OrderDataModel>? orders;
  List<OrderDataModel>? personalized;
  List<CategoriesDataModel>? categories;
  List<BannerDataModel>? banners;
  dynamic totalPersonalizedBoard;
  dynamic totalCategorizedBoard;

  HomeDataModel({
    this.popularCategories,
    this.orders,
    this.personalized,
    this.categories,
    this.banners,
    this.totalPersonalizedBoard,
    this.totalCategorizedBoard,
  });

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['popular_categories'] != null) {
      popularCategories = <CategoriesDataModel>[];
      json['popular_categories'].forEach((v) {
        popularCategories!.add(new CategoriesDataModel.fromJson(v));
      });
    }
    if (json['orders'] != null) {
      orders = <OrderDataModel>[];
      json['orders'].forEach((v) {
        orders!.add(new OrderDataModel.fromJson(v));
      });
    }
    if (json['personalized'] != null) {
      personalized = <OrderDataModel>[];
      json['personalized'].forEach((v) {
        personalized!.add(new OrderDataModel.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <CategoriesDataModel>[];
      json['categories'].forEach((v) {
        categories!.add(new CategoriesDataModel.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <BannerDataModel>[];
      json['banners'].forEach((v) {
        banners!.add(new BannerDataModel.fromJson(v));
      });
    }
    totalPersonalizedBoard=json['total_personalized_board'];
    totalCategorizedBoard=json['total_categorized_board'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.popularCategories != null) {
      data['popular_categories'] = this.popularCategories!.map((v) => v.toJson()).toList();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.personalized != null) {
      data['personalized'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    data['total_personalized_board'] = this.totalPersonalizedBoard;
    data['total_categorized_board'] = this.totalCategorizedBoard;
    return data;
  }
}
