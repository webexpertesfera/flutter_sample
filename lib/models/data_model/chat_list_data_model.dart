class ChatListDataModel {
  dynamic response;
  dynamic createdAt;
  dynamic userId;
  dynamic userName;
  dynamic description;
  dynamic amount;
  dynamic method;
  dynamic type;
  dynamic status;

  ChatListDataModel(
      {this.response,
        this.createdAt,
        this.userId,
        this.method,
        this.amount,
        this.userName,
        this.status,
        this.description,
        this.type});

  ChatListDataModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    userName = json['user_name'];
    description = json['description'];
    amount = json['amount'];
    type = json['type'];
    method = json['method'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['type'] = this.type;
    data['method'] = this.method;
    return data;
  }
}