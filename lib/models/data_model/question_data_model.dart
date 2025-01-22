

import 'package:flutter_sample/constants/export.dart';

class QuestionDataModel {
  int? id;
  String? uniqueQuesId;
  int? questionnaireId;
  int? categoryId;
  String? question;
  String? choiceQuesType;
  String? type;
  String? minValue;
  String? maxValue;

  int? allowDecimalNum;
  int? isCategory;
  int? isRequired;
  int? status;
  String? createdAt;
  String? updatedAt;
  OptionsDataModel? selectedOption;
  List<OptionsDataModel>? getAnswer;
  List<OptionsDataModel>? answer;

  QuestionDataModel(
      {this.id,
        this.uniqueQuesId,
        this.questionnaireId,
        this.categoryId,
        this.question,
        this.choiceQuesType,
        this.answer,
        this.isCategory,
        this.type,
        this.minValue,
        this.maxValue,
        this.allowDecimalNum,
        this.isRequired,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.getAnswer});

  QuestionDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniqueQuesId = json['unique_ques_id'];
    questionnaireId = json['questionnaire_id'];
    categoryId = json['category_id'];
    question = json['question'];
    choiceQuesType = json['choice_ques_type'];
    type = json['type'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    allowDecimalNum = json['allow_decimal_num'];
    isRequired = json['is_required'];
    status = json['status'];
    createdAt = json['created_at'];
    isCategory = json['is_category'];
    updatedAt = json['updated_at'];
    if (json['get_answer'] != null) {
      getAnswer = <OptionsDataModel>[];
      json['get_answer'].forEach((v) {
        getAnswer!.add(new OptionsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unique_ques_id'] = this.uniqueQuesId;
    data['questionnaire_id'] = this.questionnaireId;
    data['category_id'] = this.categoryId;
    data['question'] = this.question;
    data['choice_ques_type'] = this.choiceQuesType;
    data['type'] = this.type;
    data['is_category'] = this.isCategory;
    data['min_value'] = this.minValue;
    data['max_value'] = this.maxValue;
    data['allow_decimal_num'] = this.allowDecimalNum;
    data['is_required'] = this.isRequired;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.getAnswer != null) {
      data['get_answer'] = this.getAnswer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}