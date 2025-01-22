

import 'package:flutter_sample/constants/export.dart';

class ChatListResponseModel {
  String? apiResponse;
  int? statusCode;
  String? message;
  List<ChatListDataModel>? data;

  ChatListResponseModel(
      {this.apiResponse, this.statusCode, this.message, this.data});

  ChatListResponseModel.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ChatListDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ChatListDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_response'] = this.apiResponse;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


