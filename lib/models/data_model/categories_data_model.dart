class CategoriesDataModel {
  dynamic id;
  dynamic name;
  dynamic path;
  dynamic cardLimit;
  dynamic status;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic averageRating;
  dynamic totalPurchases;

  CategoriesDataModel( {this.id,
    this.name,
    this.path,
    this.cardLimit,
    this.status,
    this.deletedAt,
    this.averageRating,
    this.createdAt,
    this.updatedAt,
    this.totalPurchases});

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    path = json['path'];
    cardLimit = json['card_limit'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalPurchases = json['total_purchases'];
    if(json['average_rating']!=null){
      averageRating = json['average_rating'];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['path'] = this.path;
    data['card_limit'] = this.cardLimit;
    data['average_rating'] = this.averageRating;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_purchases'] = this.totalPurchases;
    return data;
  }
}
