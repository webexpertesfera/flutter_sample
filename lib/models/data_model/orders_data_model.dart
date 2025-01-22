class OrderDataModel {
  int? id;
  String? uuid;
  int? paymentId;
  int? userId;
  String? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? expiryDate;

  String? amount;
  int? totalCards;
  int? isExpired;
  String? categoryName;
  dynamic rating;
  String? scratchedCardsCount;

  OrderDataModel(
      {this.id,
        this.uuid,
        this.paymentId,
        this.userId,
        this.expiryDate,
        this.status,
        this.categoryName,
        this.deletedAt,
        this.createdAt,
        this.rating,
        this.updatedAt,
        this.isExpired,
        this.amount,
        this.totalCards,
        this.scratchedCardsCount});

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    paymentId = json['payment_id'];
    userId = json['user_id'];
    status = json['status'];
    rating = json['rating'];
    deletedAt = json['deleted_at'];
    categoryName = json['category_names'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isExpired = json['is_expiry'];
    expiryDate = json['expiry_date'];
    amount = json['amount'];
    totalCards = json['total_cards'];
    scratchedCardsCount = json['scratched_cards_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['payment_id'] = this.paymentId;
    data['user_id'] = this.userId;
    data['expiry_date'] = this.expiryDate;
    data['category_names'] = this.categoryName;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['amount'] = this.amount;
    data['total_cards'] = this.totalCards;
    data['rating'] = this.rating;
    data['is_expiry'] = this.isExpired;
    data['scratched_cards_count'] = this.scratchedCardsCount;
    return data;
  }
}