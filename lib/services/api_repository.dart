import 'dart:convert';

import 'package:flutter_sample/constants/export.dart';









class APIRepository {
  static late DioClient? dioClient;

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
  }

  static Future signUpApiCall({required Map<String, dynamic> dataBody}) async {
    FormData data = FormData.fromMap(dataBody);
    try {
      final response = await dioClient?.post(registerEndPoint, data: data);
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future loginApiCall({required Map<String, dynamic> dataBody}) async {
    FormData data = FormData.fromMap(dataBody);
    try {
      final response = await dioClient?.post(loginEndPoint, data: data);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future otpVerificationApiCall({required Map<String, dynamic> dataBody}) async {
    FormData data = FormData.fromMap(dataBody);
    try {
      final response = await dioClient?.post(verifyOTPEndPoint, data: data);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future forgotPasswordApiCall({@required String? email, @required String? type}) async {
    try {
      final response = await dioClient
          ?.get(forgetPasswordEndPoint, queryParameters: {keyEmail: email, keyType: type});
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future logoutApiCall() async {
    try {
      final response = await dioClient?.get(logoutEndPoint, skipAuth: false);
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future deleteAccountApiCall() async {
    try {
      final response = await dioClient?.get(deleteAccountEndPoint, skipAuth: false);
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future resetPasswordApiCall({dataBody}) async {
    var formData = FormData.fromMap(dataBody);
    try {
      final response = await dioClient?.post(resetPasswordEndPoint, data: formData);
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future profileAPICall() async {
    try {
      final response = await dioClient?.get(profileEndPoint,
          skipAuth: false,
          options:
              Options(headers: {"Accept": "application/json", "Content-Type": "application/json"}));
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future categoriesAPICall() async {
    try {
      final response = await dioClient?.get(
        categoriesListEndPoint,
        skipAuth: false,
      );
      return CategoriesResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future cardsListAPICall({categoryId, search}) async {
    try {
      final response = await dioClient?.get(
        "${cardsListEndPoint}/$categoryId",
        queryParameters: {keySearchKeyword: search},
        skipAuth: false,
      );
      return CardsListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future cardsListAPICallOrder({orderId, search}) async {
    try {
      final response = await dioClient?.get(
        "${orderDetailsEndPoint}/$orderId",
        queryParameters: {keySearchKeyword: search},
        skipAuth: false,
      );
      return CardsListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future personalizedCardsListAPICallOrder({id, search}) async {
    try {
      final response = await dioClient?.get(
        "${personalizedCardsEndPoint}/$id",
        queryParameters: {keySearchKeyword: search},
        skipAuth: false,
      );
      return CardsListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future orderCreateAPICall({dataBody}) async {

    try {
      final response = await dioClient?.post(
        orderCreateEndPoint,
        data: jsonEncode(dataBody),
        skipAuth: false,
      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future paymentAPICall({dataBody}) async {
    try {
      final response = await dioClient?.post(
        paymentCreateEndPoint,
        data: dataBody,
        skipAuth: false,isLoading: false
      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future scratchStatusAPICall({dataBody}) async {
    try {
      final response = await dioClient?.post(
          updateStatusEndPoint,
        data: dataBody,
        skipAuth: false,isLoading: false
      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future homeScreenAPICall() async {
    try {
      final response = await dioClient?.get(
        homeAPIEndPoint,

        skipAuth: false,
      );
      return HomeResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future staticPagesAPICall({type}) async {
    try {
      final response = await dioClient?.get(
        "$contentPagesEndPoint/$type",
        skipAuth: false,
      );
      return StaticPagesResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future faqAPICall() async {
    try {
      final response = await dioClient?.get(
        "$contentPagesEndPoint/$keyFaq",
        skipAuth: false,
      );
      return FAQResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future editProfileAPICall({data}) async {
    var formData=FormData.fromMap(data);
    try {
      final response = await dioClient?.post(
        "$profileEndPoint",
        data: formData,
        skipAuth: false,
      );
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future changePasswordAPICall({data}) async {
    var formData=FormData.fromMap(data);
    try {
      final response = await dioClient?.post(
        changePasswordEndPoint,
        data: formData,
        skipAuth: false,
      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future questionnaireListAPICall() async {

    try {
      final response = await dioClient?.get(
        questionnaireListEndPoint,
        skipAuth: false,
      );
      return QuestionnaireResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }


  static Future responseSubmitAPICall({data}) async {

    try {
      final response = await dioClient?.post(
        responseSubmitEndPoint,
        data: data,
        skipAuth: false,
      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future personalizedBoardsListAPICall() async {
    try {
      final response = await dioClient?.get(
        personalizedBoardsListEndPoint,
        skipAuth: false,
      );
      return PersonalizedBoardsListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future transactionListAPICall() async {
    try {
      final response = await dioClient?.get(
        transactionListEndPoint,
        skipAuth: false,
      );
      return TransactionListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future addTicketAPICall({dataBody}) async {

    try {
      final response = await dioClient?.post(

        addTicketEndPoint,
        data: dataBody,
        skipAuth: false,
      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future ticketsListAPICall({dataBody}) async {
    try {
      final response = await dioClient?.get(
        ticketsListEndPoint,
        skipAuth: false,
      );
      return TicketListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future chatListAPICall({id}) async {
    // try {
      final response = await dioClient?.get(
        "${chatListEndPoint}/$id",
        skipAuth: false,
      );
      return ChatListResponseModel.fromJson(response);
    // } catch (e) {
    //   return Future.error(NetworkExceptions.getDioException(e));
    // }
  }

  static Future sendMessageAPICall({id,data}) async {
    try {
      final response = await dioClient?.post(
        "${chatListEndPoint}/$id",
        skipAuth: false,
        data: data,
          isLoading: true
      );
      return SendMessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future markTicketCompleteAPICall({id,data}) async {
    try {
      final response = await dioClient?.get(
        "${changeStatusEndPoint}/$id",
        skipAuth: false,

      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future giveRatingAPICall({data}) async {
    try {
      final response = await dioClient?.post(
        "${giveRatingEndPoint}",
        skipAuth: false,
        data: data

      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }


  static Future notificationPreferenceListAPICall() async {
    try {
      final response = await dioClient?.get(
        notificationPreferenceEndPoint,
        skipAuth: false,
      );
      return NotificationPreferenceResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }


  static Future changeNotificationPreferenceStatusAPICall({id,status}) async {
    try {
      final response = await dioClient?.get(
        changeNotificationPreferenceEndPoint,
        queryParameters: {typeId:id,typeStatus:status},
        skipAuth: false,
      );
      return SuccessModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future notificationListAPICall() async {
    try {
      final response = await dioClient?.get(
        notificationsListEndPoint,

        skipAuth: false,
      );
      return NotificationListResponseModel.fromJson(response);
      // return response;
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future clearNotificationListAPICall() async {
    try {
      final response = await dioClient?.get(
        clearNotificationsListEndPoint,
        skipAuth: false,
      );
      return SuccessModel.fromJson(response);

    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future payPalPaymentApiCall({data}) async {
    try {
      final response = await dioClient?.post(
        payPalPaymentEndPoint,
        skipAuth: false,
        data: data
      );
      return PaypalResponseModel.fromJson(response);

    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future inAppPlansListApiCall() async {
    try {
      final response = await dioClient?.get(
          inAppPlansListEndPoint,
        skipAuth: false,
      );
      return InAppPlansListResponseModel.fromJson(response);

    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future binancePaymentApiCall({data}) async {
    try {
      final response = await dioClient?.post(
        binancePaymentEndPoint,data: data,
        skipAuth: false,
      );
      return BinancePaymentResponseModel.fromJson(response);

    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future nowPaymentApiCall({data}) async {
    try {
      final response = await dioClient?.post(
        nowPaymentEndPoint,data: data,
        skipAuth: false,
      );
      return BinancePaymentResponseModel.fromJson(response);

    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future verifySubscriptionApi({data}) async {
    try {
      final response = await dioClient?.post(
        verifyPurchaseEndPoint,data: data,
        skipAuth: false,
      );
      return LoginResponseModel.fromJson(response);

    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  static Future subscriptionTicketApi() async {
    try {
      final response = await dioClient?.get(
        subscriptionTicketEndPoint,
        skipAuth: false,
      );
      return SuccessModel.fromJson(response);

    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

}
