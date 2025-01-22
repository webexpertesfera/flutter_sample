class PaypalResponseModel {
  String? apiResponse;
  int? statusCode;
  String? message;
  PaypalResponseDataModel? data;

  PaypalResponseModel(
      {this.apiResponse, this.statusCode, this.message, this.data});

  PaypalResponseModel.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new PaypalResponseDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_response'] = this.apiResponse;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PaypalResponseDataModel {
  String? approvalUrl;
  String? successUrl;

  PaypalResponseDataModel({this.approvalUrl, this.successUrl});

  PaypalResponseDataModel.fromJson(Map<String, dynamic> json) {
    approvalUrl = json['approval_url'];
    successUrl = json['success_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approval_url'] = this.approvalUrl;
    data['success_url'] = this.successUrl;
    return data;
  }
}
