  class PlansDataModel {
  int? id;
  String? title;
  String? androidId;
  String? iosId;
  String? description;
  String? feature;
  String? price;
  String? currency;
  int? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  PlansDataModel(
      {this.id,
        this.title,
        this.androidId,
        this.iosId,
        this.description,
        this.price,
        this.feature,
        this.status,
        this.deletedAt,
        this.currency,
        this.createdAt,
        this.updatedAt});

  PlansDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    androidId = json['android_id'];
    iosId = json['ios_id'];
    description = json['description'];
    feature = json['feature'];
    currency = json['currency'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    price = json['price'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['android_id'] = this.androidId;
    data['ios_id'] = this.iosId;
    data['description'] = this.description;
    data['feature'] = this.feature;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['price'] = this.price;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}