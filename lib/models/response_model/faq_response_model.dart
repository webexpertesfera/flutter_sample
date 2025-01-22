import 'package:flutter_sample/constants/export.dart';

class FAQResponseModel {
  String? apiResponse;
  int? statusCode;
  String? message;
  List<FAQDataModel>? data;

  FAQResponseModel(
      {this.apiResponse, this.statusCode, this.message, this.data});

  FAQResponseModel.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FAQDataModel>[];
      json['data'].forEach((v) {
        data!.add(new FAQDataModel.fromJson(v));
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


