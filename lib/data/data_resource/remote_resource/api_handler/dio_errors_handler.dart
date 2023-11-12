import 'dart:io';
import "package:dio/dio.dart";
import 'package:flutter/foundation.dart';

class DioErrorsHandler {
  static Map data = {"statusCode": -1, "message": "Unknown Error"};

  static dynamic onError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      data["message"] = "Request timeout";
      data["statusCode"] = 408;
    } else if (e.error is SocketException ||
        e.type == DioExceptionType.connectionError) {
      data["message"] = "No Internet Connection!";
    } else if (e.type == DioExceptionType.cancel) {
      data["message"] = "Request canceled!";
    } else if (e.response != null &&
        e.response?.statusCode != null &&
        e.response?.statusMessage != null) {
      if (kDebugMode) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
      }

      data["message"] = e.response!.data["message"];
      data["statusCode"] = e.response!.data["returnedCode"];
    } else if (e.type ==DioExceptionType.unknown ||
        e.type == DioExceptionType.badCertificate ||
        e.type == DioExceptionType.badResponse) {
      data["message"] = "Something Went Wrong";
    }
    return data;
  }
}
