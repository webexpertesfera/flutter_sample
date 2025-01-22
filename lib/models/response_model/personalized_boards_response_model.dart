import 'package:flutter_sample/constants/export.dart';

class PersonalizedBoardsListResponseModel {
  String? apiResponse;
  int? statusCode;
  String? message;
  PersonalizedBoardData? data;

  PersonalizedBoardsListResponseModel(
      {this.apiResponse, this.statusCode, this.message, this.data});

  PersonalizedBoardsListResponseModel.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new PersonalizedBoardData.fromJson(json['data']) : null;
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

class PersonalizedBoardData {
  List<OrderDataModel>? purchasedBoard;
  List<UnpurchasedBoardDataModel>? unpurchasedBoard;

  PersonalizedBoardData({this.purchasedBoard, this.unpurchasedBoard});

  PersonalizedBoardData.fromJson(Map<String, dynamic> json) {
    if (json['purchased_board'] != null) {
      purchasedBoard = <OrderDataModel>[];
      json['purchased_board'].forEach((v) {
        purchasedBoard!.add(new OrderDataModel.fromJson(v));
      });
    }
    if (json['unpurchased_board'] != null) {
      unpurchasedBoard = <UnpurchasedBoardDataModel>[];
      json['unpurchased_board'].forEach((v) {
        unpurchasedBoard!.add(new UnpurchasedBoardDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.purchasedBoard != null) {
      data['purchased_board'] =
          this.purchasedBoard!.map((v) => v.toJson()).toList();
    }
    if (this.unpurchasedBoard != null) {
      data['unpurchased_board'] =
          this.unpurchasedBoard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




