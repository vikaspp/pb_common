import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'config.dart';
import 'custom_log_interceptor.dart';

enum ApiEnvironment { UAT, Dev, Prod }

extension APIEnvi on ApiEnvironment {
  String? get endpoint {
    switch (this) {
      case ApiEnvironment.UAT:
        return 'http://192.168.1.136:8000/';
      case ApiEnvironment.Dev:
        return 'http://192.168.1.136:8000/';
      case ApiEnvironment.Prod:
        return '';
      default:
        return null;
    }
  }
}

typedef OnError = void Function(String error, Map<String, dynamic> data);
typedef OnResponse<Response> = void Function(Response response);

class DioFactory {
  static final _singleton = DioFactory._instance();

  static Dio? get dio => _singleton._dio;
  static var _authorization = '';

  static void initialiseHeaders(String token) {
    _authorization = 'Bearer $token';
    dio!.options.headers[HttpHeaders.authorizationHeader] = _authorization;
  }

  Dio? _dio;

  DioFactory._instance() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEnvironment.UAT.endpoint!,
        headers: {
          HttpHeaders.authorizationHeader: _authorization,
        },
        connectTimeout: Config.timeout,
        receiveTimeout: Config.timeout,
        sendTimeout: Config.timeout,
      ),
    );
    if (!kReleaseMode) {
      _dio!.interceptors.add(
        CustomLogInterceptor(
          request: Config.logNetworkRequest,
          requestHeader: Config.logNetworkRequestHeader,
          requestBody: Config.logNetworkRequestBody,
          responseHeader: Config.logNetworkResponseHeader,
          responseBody: Config.logNetworkResponseBody,
          error: Config.logNetworkError,
        ),
      );
    }
  }
}
