
import 'dart:io';

import 'package:flutter_sample/constants/export.dart';




const _defaultConnectTimeout =
Duration(milliseconds: Duration.millisecondsPerMinute);
const _defaultReceiveTimeout =
Duration(milliseconds: Duration.millisecondsPerMinute);

class DioClient {
  final String baseUrl;

  late Dio _dio;

  final List<Interceptor>? interceptors;

  DioClient(
      this.baseUrl,
      Dio dio, {
        this.interceptors,
      }) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout =   _defaultConnectTimeout
      ..options.receiveTimeout =  _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8',"accept":"application/json"};
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      _dio.interceptors.add(DioLogger(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: true,
      ));
    }
  }

  Future<dynamic> get(
      String uri, {
        Map<String, dynamic>? queryParameters,

        Map<String, dynamic>? pathVariables, // Added path variables
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
        bool? skipAuth
      }) async {
    try {
      if (skipAuth == false) {
        var token = PreferenceManger.getAuthToken();
        debugPrint("token $token");
        if (token != null) {
          options = Options(headers: {"Authorization": "Bearer $token"});
        }
      }
      if (pathVariables != null && pathVariables.isNotEmpty) {
        pathVariables.forEach((key, value) {
          uri = "${uri}/$value";
        });
      }


      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? pathVariables,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        bool? skipAuth,
        bool isLoading=true,
      }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      if(isLoading==true){
        customLoader.show(Get.overlayContext);
      }
      if (skipAuth == false) {
        var token = PreferenceManger.getAuthToken();
        debugPrint("authorization============ $token");
        if (token != null) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        }
      }
      if (pathVariables != null && pathVariables.isNotEmpty) {
        pathVariables.forEach((key, value) {
          uri = "${uri}/$value";
        });
      }
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if(isLoading==true){
        customLoader.hide();
      }
      return response.data;
    } on FormatException catch (_) {
      if(isLoading==true){
        customLoader.hide();
      }
      throw FormatException("Unable to process the data");
    } catch (e) {
      if(isLoading==true){
        customLoader.hide();
      }
      throw e;
    }
  }

  Future<dynamic> patch(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}

/*
*     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
*
* */