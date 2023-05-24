import 'dart:convert';

import 'package:dio/dio.dart';

import 'log.dart';

class DioLogger {
  static void onSend(String tag, RequestOptions options) {
    Log.verbose(
        '\n$tag - Request Path : [${options.method}] ${options.baseUrl}${options.path} '
        '\n$tag - Request Header : ${options.headers}'
        '$tag - Request Data : ${options.data.toString()}');
  }

  static void onSuccess(
    String tag,
    Response response,
  ) {
    Log.verbose(
        '$tag - Response Path : [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path} '
        '\n$tag - Response Header : ${response.headers}'
        '\n$tag - Response Code : ${response.statusCode}'
        '\n$tag - Response data : ${json.encode(response.data).toString()}');
  }

  static void onError(String tag, DioError error) {
    if (error.response != null) {
      Log.error(
          '$tag - Response Path : [${error.response!.requestOptions.method}] ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path} '
          '\n$tag - Error Header : ${error.response!.headers}'
          '\n$tag - Error Code : ${error.response!.statusCode}'
          '\n$tag - Error data : ${json.encode(error.response?.data).toString()}');
    }

    if (error.type == DioErrorType.connectionTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      Log.error('No Internet');
    }
    Log.error('$tag - Error Message : ${error.message}');
  }
}
