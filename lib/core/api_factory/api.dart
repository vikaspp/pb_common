import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'dio_factory.dart';

enum HttpMethod { delete, get, patch, post, put }

extension HttpMethods on HttpMethod {
  String? get value {
    switch (this) {
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      default:
        return null;
    }
  }
}

class Api {
  static const catchError = _catchError;

  static void _catchError(e, stackTrace, OnError onError) {
    if (e is DioError) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.unknown) {
        onError('Server unreachable', {});
      } else if (e.type == DioErrorType.badResponse) {
        final response = e.response;
        if (response != null) {
          final data = response.data;
          if (data != null && data is Map<String, dynamic>) {
            onError('Failed to get response: ${e.message}', data);
            return;
          }
        }
        onError('Failed to get response: ${e.message}', {});
      } else {
        onError('Request cancelled', {});
      }
    } else {
      onError(e?.toString() ?? 'Unknown error occurred', {});
    }
  }

  //General Request
  static Future<void> request({
    HttpMethod method = HttpMethod.get,
    required String path,
    required APIResponse res,
    required String key,
    Map? params,
    OnResponse? onResponse,
  }) async {
    try {
      dio.Response response;
      switch (method) {
        case HttpMethod.post:
          response = await DioFactory.dio!.post(
            path,
            options: Options(
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              },
            ),
            data: params,
          );
          break;
        case HttpMethod.delete:
          response = await DioFactory.dio!.delete(
            path,
            data: params,
          );
          break;
        case HttpMethod.get:
          response = await DioFactory.dio!.get(
            path,
          );
          break;
        case HttpMethod.patch:
          response = await DioFactory.dio!.patch(
            path,
            data: params,
          );
          break;
        case HttpMethod.put:
          response = await DioFactory.dio!.put(
            path,
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
            data: params,
          );
          break;
        default:
          return;
      }

      if (response.statusCode == 401) {
        print('Success Error');
      } else {
        res.onResponse(key, response.data);
        // onResponse!(response.data);
      }
    } catch (e) {
      String errorMessage = "";
      if (e is DioError) {
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.sendTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.unknown) {
          errorMessage = 'Server unreachable';
        } else if (e.type == DioErrorType.badResponse) {
          errorMessage = e.response!.data['detail'];
        } else {
          errorMessage = "Request cancelled";
        }
      } else {
        errorMessage = "Something went wrong! Please try again.";
      }
      print('errorMessage : $e');
    }
  }
}

mixin class APIResponse {
  onResponse(String apiKey, dynamic response) {}

  onError(String apiKey, String error) {}
}
