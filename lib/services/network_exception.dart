import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_sample/constants/export.dart';


class NetworkExceptions {
  static String messageData = "";

  static getDioException(error) {
    if (error is Exception) {
      // reportCrash(error.toString());
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              return messageData = AppStrings.requestCancelled.tr;
            case DioErrorType.connectionTimeout:
              return messageData = AppStrings.connectionTimeOut.tr;
            case DioErrorType.unknown:
              List<String> dateParts = error.message!.split(":");
              List<String> message = dateParts[2].split(",");

              if (message[0].trim() == AppStrings.connectionRefused) {
                return messageData = AppStrings.serverUnderMaintance.tr;
              } else if (message[0].trim() == AppStrings.networkUnReachable) {
                return messageData = AppStrings.networkUnReachable.tr;
              } else if (dateParts[1].trim() == AppStrings.falidToHostLookup) {
                return messageData = AppStrings.noInternetConnection.tr;
              } else {
                return messageData = dateParts[1];
              }
            case DioErrorType.receiveTimeout:
              return messageData = AppStrings.timeOut;
            case DioErrorType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  var dataValue= SuccessModel.fromJson(error.response?.data);
                  return dataValue.message;
                case 401:
                  PreferenceManger.clearLoginData();
                  Get.offAllNamed(AppRoutes.loginScreen);
                  try {
                    return messageData = error.response?.data['message'] ??
                        'Unauthorised Exception';
                  } catch (err) {
                    return messageData = 'Unauthorised Exception';
                  }
                case 403:
                  PreferenceManger.clearLoginData();
                  Get.offAllNamed(AppRoutes.loginScreen);
                  try {
                    return messageData = error.response?.data['message'] ??
                        'Unauthorised Exception';
                  } catch (err) {
                    return messageData = 'Unauthorised Exception';
                  }
                case 404:
                  return messageData = /*error.response?.data['message']??*/AppStrings.notFound;
                case 408:
                  return messageData = AppStrings.requestTimeOut;
                case 422:
                  return messageData = error.response?.data['message'];
                case 500:
                  return messageData = AppStrings.internalServerError;
                case 503:
                  return messageData = AppStrings.serviceUnavailable;
                default:
                  return messageData = AppStrings.somethingWorg;
              }
            case DioErrorType.sendTimeout:
              return messageData = AppStrings.timeOut;
            case DioErrorType.badCertificate:
            // TODO: Handle this case.
              break;
            case DioErrorType.badResponse:
            // TODO: Handle this case.
              break;
            case DioErrorType.connectionError:
              return messageData = AppStrings.noInternetConnection.tr;
              break;
          }
        } else if (error is SocketException) {
          return messageData = AppStrings.socketExceptions;
        } else {
          return messageData = AppStrings.unExceptedExption;
        }
      } on FormatException catch (_) {
        return messageData = AppStrings.formetException;
      } catch (_) {
        return messageData = AppStrings.unExceptedExption;
      }
    } else {
      return error.toString().contains(AppStrings.notSubType)
          ? messageData = AppStrings.unableToProcessData.tr
          : messageData = AppStrings.unExceptedExption;
    }
  }

  Future<bool?> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      return false;
    }
  }
}