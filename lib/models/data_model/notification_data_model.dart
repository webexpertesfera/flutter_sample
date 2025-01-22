class NotificationDataModel {
  int? id;
  int? userId;
  NotificationData? data;
  dynamic readAt;
  dynamic title;
  dynamic description;
  dynamic createdAt;
  dynamic updatedAt;

  NotificationDataModel(
      {this.id,
        this.userId,
        this.data,
        this.readAt,
        this.createdAt,
        this.title,
        this.description,
        this.updatedAt});

  NotificationDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    data = json['data'] != null ? new NotificationData.fromJson(json['data']) : null;
    readAt = json['read_at'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class NotificationData {
  String? type;
  String? title;
  String? body;
  int? redirectId;

  NotificationData({this.type, this.title, this.body, this.redirectId});

  NotificationData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    body = json['body'];
    redirectId = json['redirect_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['body'] = this.body;
    data['redirect_id'] = this.redirectId;
    return data;
  }
}