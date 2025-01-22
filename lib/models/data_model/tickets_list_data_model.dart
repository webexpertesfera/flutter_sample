class TicketsListDataModel {
  int? id;
  int? userId;
  int? ticketId;
  String? title;
  String? description;
  String? priority;
  String? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  TicketsListDataModel(
      {this.id,
        this.userId,
        this.ticketId,
        this.title,
        this.description,
        this.priority,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  TicketsListDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    ticketId = json['ticket_id'];
    title = json['title'];
    description = json['description'];
    priority = json['priority'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ticket_id'] = this.ticketId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}