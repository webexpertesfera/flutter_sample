import 'package:flutter_sample/constants/export.dart';

class QuestionnaireResponseModel {
  String? apiResponse;
  int? statusCode;
  String? message;
  QuestionData? data;

  QuestionnaireResponseModel(
      {this.apiResponse, this.statusCode, this.message, this.data});

  QuestionnaireResponseModel.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new QuestionData.fromJson(json['data']) : null;
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

class QuestionData {
  List<QuestionDataModel>? questions;

  QuestionData({this.questions});

  QuestionData.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <QuestionDataModel>[];
      json['questions'].forEach((v) {
        questions!.add(new QuestionDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




