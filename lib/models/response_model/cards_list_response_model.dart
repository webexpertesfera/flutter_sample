import 'package:flutter_sample/constants/export.dart';

class CardsListResponseModel {
  String? apiResponse;
  int? statusCode;
  String? message;
  CardsData? data;

  CardsListResponseModel({this.apiResponse, this.statusCode, this.message, this.data});

  CardsListResponseModel.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new CardsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_response'] = this.apiResponse;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CardsData {
  dynamic payAmount;
  int? isScrached;
  String? categoryName;
  String? categoryImgPath;
  String? lastScratched;
  int? scratchedCards;
  dynamic cardLimit;
  int? totalCards;
  int? canPurchased;
  int? canScratch;
  dynamic rating;
  List<CardsDataModel>? cards;

  CardsData({
    this.payAmount,
    this.cards,
    this.categoryImgPath,
    this.isScrached,
    this.totalCards,
    this.cardLimit,
    this.rating,
    this.categoryName,
    this.canScratch,
    this.canPurchased,
    this.lastScratched,
    this.scratchedCards,
  });

  CardsData.fromJson(Map<String, dynamic> json) {
    payAmount = json['pay_amount'];
    categoryName = json['category_name'];
    isScrached = json['is_scrached'];
    categoryImgPath = json['category_img_path'];
    canPurchased = json['can_purchased'];
    scratchedCards = json['scratched_cards'];
    lastScratched = json['last_scratched'];
    canScratch = json['can_scratch'];
    totalCards = json['total_cards'];
    cardLimit = json['card_limit'];
    rating = json['rating'];
    if (json['cards'] != null) {
      cards = <CardsDataModel>[];
      json['cards'].forEach((v) {
        cards!.add(new CardsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_amount'] = this.payAmount;
    data['category_name'] = this.categoryName;
    data['is_scrached'] = this.isScrached;
    data['last_scratched'] = this.lastScratched;
    data['scratched_cards'] = this.scratchedCards;
    data['total_cards'] = this.totalCards;
    data['rating'] = this.rating;
    data['can_scratch'] = this.canScratch;
    data['can_purchased'] = this.canPurchased;
    data['card_limit'] = this.cardLimit;
    data['category_img_path'] = this.categoryImgPath;
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
