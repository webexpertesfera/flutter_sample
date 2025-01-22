class OptionsDataModel {
  int? id;
  int? questionId;
  bool isSelected=false;
  String? answer;
  String? createdAt;
  String? updatedAt;

  OptionsDataModel(
      {this.id, this.questionId, this.answer, this.createdAt, this.updatedAt,this.isSelected=false});

  OptionsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_id'] = this.questionId;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}