class StaticPagesDataModel {
  int? id;
  String? title;
  String? content;

  StaticPagesDataModel({this.id, this.title, this.content});

  StaticPagesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.content;
    return data;
  }
}
