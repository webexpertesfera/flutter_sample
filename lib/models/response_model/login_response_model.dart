import 'package:flutter_sample/constants/export.dart';
import 'package:flutter_sample/models/data_model/user_data_model.dart';

class LoginResponseModel {
  String? apiResponse;
  int? statusCode;
  String? message;
  UserDataModel? data;

  LoginResponseModel(
      {this.apiResponse, this.statusCode, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new UserDataModel.fromJson(json['data']) : null;
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



