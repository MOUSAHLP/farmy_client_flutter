import 'dart:developer';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:pharma/core/utils/api_const.dart';
import '../../local_resource/data_store.dart';
import 'dio_errors_handler.dart';
import 'interceptors_handler.dart';

class BaseApiClient {

  static Dio client = Dio();
  static const String _acceptHeader = 'application/json';
  static CancelToken getTargetCancelToken = CancelToken();
  static final Map<String, String> _headers = {
    'Accept': _acceptHeader,
    'version': DataStore.instance.getVersion ?? "",
    'authorization': 'Bearer ${DataStore.instance.token ?? ''}',
    'lang' : DataStore.instance.lang,

  };

  BaseApiClient() {
    print('@@@@@@@@@@@@@@@@@');
    print(DataStore.instance.lang);
    print('@@@@@@@@@@@@@@@@@');
    client.interceptors.add(LogInterceptor());
    if (kDebugMode) {
      client.interceptors.add(
        PrettyDioLogger(
          error: true,
          requestBody: true,
          requestHeader: true,
          request: true,
        ),
      );
    }
    client.interceptors.add(ClientInterceptor());
    client.options.baseUrl = ApiConst.baseUrl;
    client.options.sendTimeout = const Duration(seconds: 5);
    // client.options.connectTimeout = const Duration(seconds: 5);
  }

  static Future<Either<String, T>> post<T>(
      {required String url,
      dynamic formData,
      Map<String, dynamic>? queryParameters,
      required T Function(dynamic) converter,
      bool isToken = false,
      dynamic returnOnError}) async {
    try {
      print("formData formData formData formData formData ");
      print(formData);

      var response = await client.post(
        url,
        queryParameters: queryParameters,
        data: formData,
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            print(
                'progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          }
        },
        options: Options(
          headers: _headers,
        ),
      );
      print(response);

      if (((response.statusCode! >= 200 || response.statusCode! <= 205)) &&
          (response.data['error'].toString() != 'true') &&
          (response.data['status'].toString() != 'Error')) {
        if (kDebugMode) {
          log(response.data.toString());
        }
        if (isToken) {
          // DataStore.instance.setToken(response.headers['Authorization']!.first);
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }
      return left(returnOnError ?? dioError["message"] ?? '');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  static Future<Either<String, T>> put<T>(
      {required String url,
      FormData? formData,
      Map<String, dynamic>? queryParameters,
      required T Function(dynamic) converter,
      dynamic returnOnError}) async {
    try {
      var response = await client.put(
        url,
        data: formData,
        queryParameters: queryParameters,
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            print(
                'progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          }
        },
        options: Options(
          headers: _headers,
        ),
      );
      if (((response.statusCode! >= 200 || response.statusCode! <= 205)) &&
          (response.data['error'].toString() != 'true')) {
        if (kDebugMode) {
          log(response.data.toString());
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }
      return left(returnOnError ?? dioError["message"] ?? '');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  static Future<Either<String, T>> get<T>({
    required String url,
    Map<String, dynamic> ?queryParameters ,
    required T Function(dynamic) converter,
    CancelToken? cancelToken,
  }) async {
    // queryParameters?['lang']= "ar";
    try {
      var response = await client.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: _headers,
        ),
        cancelToken: cancelToken,
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 205) {
        if (kDebugMode) {
          log(response.data.toString());
          print(response);
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return left('cancel');
      }
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }
      return left(dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  static Future<Either<String, T>> delete<T>(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Function(dynamic) converter}) async {
    try {
      var response = await client.delete(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: _headers,
        ),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 205) {
        if (kDebugMode) {
          log(response.data.toString());
          print(response);
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return left('Cancel');
      }
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }
      return left(dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }
}
