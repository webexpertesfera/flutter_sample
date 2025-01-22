class ResponseSendModel {
  // dynamic questionId;
  dynamic question;
  // dynamic categoryId;
  dynamic id;
  dynamic isCategory;
  dynamic answer;

  ResponseSendModel(
      { this.question, this.answer,this.id,this.isCategory});

  ResponseSendModel.fromJson(Map<String, dynamic> json) {
    // questionId = json['question_id'];
    question = json['question'];
    // categoryId = json['category_id'];
    id = json['id'];
    isCategory = json['is_category'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['question_id'] = this.questionId;
    data['question'] = this.question;
    // data['category_id'] = this.categoryId;
    data['is_category'] = this.isCategory;
    data['id'] = this.id;
    data['answer'] = this.answer;
    return data;
  }
}
