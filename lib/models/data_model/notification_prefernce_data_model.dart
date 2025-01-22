class  NotificationPreferenceDataModel {
  int? id;
  int? status;
  String? name;

   NotificationPreferenceDataModel({this.id, this.status, this.name});

   NotificationPreferenceDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['name'] = this.name;
    return data;
  }
}