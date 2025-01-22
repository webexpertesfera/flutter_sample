class FAQDataModel {


  String? sId;
  String? question;
  String? answer;
  bool isExpanded=false;

  FAQDataModel(
      { this.sId,
        this.question,
        this.answer,
        this.isExpanded=false
      });

  FAQDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    question = json['question'];
    answer = json['answer'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}