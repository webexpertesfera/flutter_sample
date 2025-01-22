class BinancePaymentDataModel {
  String? checkoutUrl;
  String? deeplinkUrl;
  String? returnUrl;
  String? cancelUrl;

  BinancePaymentDataModel({this.checkoutUrl, this.deeplinkUrl, this.returnUrl, this.cancelUrl});

  BinancePaymentDataModel.fromJson(Map<String, dynamic> json) {
    checkoutUrl = json['checkout_url'];
    deeplinkUrl = json['deeplink_url'];
    returnUrl = json['return_url'];
    cancelUrl = json['cancel_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkout_url'] = this.checkoutUrl;
    data['deeplink_url'] = this.deeplinkUrl;
    data['return_url'] = this.returnUrl;
    data['cancel_url'] = this.cancelUrl;
    return data;
  }
}