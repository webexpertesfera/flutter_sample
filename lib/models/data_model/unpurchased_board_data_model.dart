class UnpurchasedBoardDataModel {
  String? id;
  String? createdAt;
  String? categoryName;

  UnpurchasedBoardDataModel({this.id, this.createdAt, this.categoryName});

  UnpurchasedBoardDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['category_name'] = this.categoryName;
    return data;
  }
}