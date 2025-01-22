class TransactionListDataModel {
  int? id;
  int? userId;
  String? paymentId;
  String? amount;
  String? clientSecret;
  String? latestCharge;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? orderId;

  TransactionListDataModel(
      {this.id,
        this.userId,
        this.paymentId,
        this.amount,
        this.clientSecret,
        this.latestCharge,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.orderId});

  TransactionListDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    paymentId = json['payment_id'];
    amount = json['amount'];
    clientSecret = json['client_secret'];
    latestCharge = json['latest_charge'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['payment_id'] = this.paymentId;
    data['amount'] = this.amount;
    data['client_secret'] = this.clientSecret;
    data['latest_charge'] = this.latestCharge;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_id'] = this.orderId;
    return data;
  }
}