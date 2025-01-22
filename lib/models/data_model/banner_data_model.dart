import '../../constants/export.dart';

class BannerDataModel {
  int? id;
  String? title;
  String? description;
  String? path;
  String? discountCode;
  int? status;
  String? type;
  List<Color>? colorsList;
  String? createdAt;
  String? updatedAt;

  BannerDataModel(
      {this.id,
        this.title,
        this.colorsList,
        this.description,
        this.path,
        this.type,
        this.discountCode,
        this.status,
        this.createdAt,
        this.updatedAt});

  BannerDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    path = json['path'];
    discountCode = json['discount_code'];
    status = json['status'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['path'] = this.path;
    data['discount_code'] = this.discountCode;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}