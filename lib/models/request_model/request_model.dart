import 'package:flutter_sample/constants/export.dart';

class RequestModel {
  static Map<String, dynamic> loginRequestModel({String? email, String? password, String? fcmToken, String? deviceType}) {
    Map<String, dynamic> mapData = {};
    mapData["email"] = email;
    mapData["password"] = password;
    mapData["device_token"] = fcmToken??"NOT Found";
    mapData["device_type"] = GetPlatform.isAndroid?"android":"ios";
    debugPrint(mapData.toString());
    return mapData;
  }

  static Map<String, dynamic> signUpRequestModel({String? firstName, String? lastName, String? email, String? password,String? gender,String? dob}) {
    Map<String, dynamic> mapData = {};
    mapData["first_name"] = firstName;
    mapData["last_name"] = lastName;
    mapData["email"] = email;
    mapData["gender"] = gender;
    mapData["dob"] = dob;
    mapData["password"] = password;
    mapData["password_confirmation"] = password;
    mapData["device_token"] = PreferenceManger.getFcmToken();
    mapData["device_type"] = GetPlatform.isAndroid?"android":"ios";
    debugPrint(mapData.toString());
    return mapData;
  }

  static Map<String, dynamic> otpVerifyRequestModel({String? type, String? email, String? otp}) {
    Map<String, dynamic> mapData = {};
    mapData["email"] = email;
    mapData["otp"] = otp;
    mapData["type"] = type;
    debugPrint(mapData.toString());
    return mapData;
  }
  static Map<String, dynamic> addTicketRequestModel({String? title, String? description}) {
    Map<String, dynamic> mapData = {};
    mapData["title"] = title;
    mapData["description"] = description;

    debugPrint(mapData.toString());
    return mapData;
  }

  static Map<String, dynamic> forgotPasswordRequestModel({String? email}) {
    Map<String, dynamic> mapData = {};
    mapData["email"] = email;
    debugPrint(mapData.toString());
    return mapData;
  }

  static Map<String, dynamic> resetPasswordRequestModel({String? email, String? password}) {
    Map<String, dynamic> mapData = {};
    mapData["email"] = email;
    mapData["password"] = password;
    mapData["password_confirmation"] = password;
    debugPrint(mapData.toString());
    return mapData;
  }

  static Map<String, dynamic> orderCreateRequestModel({dynamic cardIds,boardType,responseId}) {
    Map<String, dynamic> mapData = {};
    mapData["card_id"] = cardIds;
    mapData["board_type"] = boardType;
    if(responseId!=null){
      mapData["response_id"] = responseId;
    }
    debugPrint(mapData.toString());
    return mapData;
  }

  static Map<String, dynamic> paymentCreateRequestModel({dynamic orderId, amount, currency, isSave, paymentMethod, paymentMethodId}) {
    Map<String, dynamic> mapData = {};
    mapData["order_id"] = orderId;
    mapData["amount"] = amount;
    mapData["payment_method"] = paymentMethod;
    mapData["payment_method_id"] = paymentMethodId;
    mapData["is_save"] = isSave;
    mapData["currency"] = currency;
    debugPrint(mapData.toString());
    return mapData;
  }
  static Map<String, dynamic> paymentCreate({amount,currency,orderId,type}) {
    Map<String, dynamic> mapData = {};

    mapData["currency"] = currency;
    mapData["amount"] = amount;
    mapData["type"] = type;
    mapData["order_id"] = orderId;
    debugPrint(mapData.toString());
    return mapData;
  }

  static Map<String, dynamic> scratchStatusRequestModel({dynamic cardId, orderId, status}) {
    Map<String, dynamic> mapData = {};
    mapData["order_id"] = orderId;
    mapData["card_id"] = cardId;
    mapData["status"] = status;
    debugPrint(mapData.toString());
    return mapData;
  }
  static Map<String, dynamic> updateProfileRequestModel({firstName,lastName,profile,address,zipcode,gender,phoneNumber,countryCode,countryShortCode,dob}) {
    Map<String, dynamic> mapData = {};
    mapData["first_name"] = firstName;
    mapData["last_name"] = lastName;
    if(profile!=null){
      mapData["profile"] = profile;
    }

    mapData["dob"] = dob;
    mapData["address"] = address;
    mapData["gender"] = gender;
    mapData["country_code"] = countryCode;
    mapData["country_short_code"] = countryShortCode;
    mapData["zip_code"] = zipcode;
    mapData["phone_number"] = phoneNumber;
    debugPrint(mapData.toString());
    return mapData;
  }
  static Map<String, dynamic> changePasswordRequestModel({oldPassword,newPassword,confirmPassword}) {
    Map<String, dynamic> mapData = {};
    mapData["current_password"] = oldPassword;
    mapData["password"] = newPassword;
    mapData["password_confirmation"] = confirmPassword;
    debugPrint(mapData.toString());
    return mapData;
  }
static Map<String, dynamic> responseSubmit({userId,response,}) {
    Map<String, dynamic> mapData = {};
    mapData["user_id"] = userId;
    mapData["response"] = response;

    debugPrint(mapData.toString());
    return mapData;
  }
static Map<String, dynamic> sendMessageRequestModel({type,response,}) {
    Map<String, dynamic> mapData = {};

    mapData["response"] = response;
    mapData["type"] = type;

    debugPrint(mapData.toString());
    return mapData;
  }
static Map<String, dynamic> giveRatingRequestModel({rating,orderId,}) {
    Map<String, dynamic> mapData = {};
    mapData["order_id"] = orderId;
    mapData["rating"] = rating;
    debugPrint(mapData.toString());
    return mapData;
  }
static Map<String, dynamic> verifyPurchaseRequestModel({transactionId,type,amount,planId}) {
    Map<String, dynamic> mapData = {};
    mapData["transaction_id"] = transactionId;
    mapData["type"] = type;
    mapData["status"] = "success";
    mapData["amount"] = amount;
    mapData["plan_id"] = planId;
    debugPrint(mapData.toString());
    return mapData;
  }
}
