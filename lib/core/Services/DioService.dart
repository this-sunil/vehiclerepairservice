import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../layer/Widget/Storage.dart';

class DioService {
  static final FlutterSecureStorage storage = const FlutterSecureStorage();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      validateStatus: (status){
        if(status==400 || status==404){
          return true;
        }
        return false;
      }

      // Remove validateStatus
    ),
  );




  static Future<void> init() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: "token");
          if (token != null) {
            _dio.options.headers["Authorization"] = "Bearer $token";
          }

          _dio.options.headers["Content-Type"] = "application/json";
          _dio.options.headers['Accept']="application/json";

          handler.next(options);
        },

        onError: (error, handler) async {
          /// Token expired
           print("Status Code: ${error.response?.data}");
              if(error.response?.statusCode==500){
                final token = await refreshToken();

                if (token != null) {
                  final request = error.requestOptions;
                  request.headers["Authorization"] = "Bearer $token";
                  final response = await _dio.fetch(request);
                  return handler.resolve(response);
                }
              }



          handler.next(error);
        },
      ),
    );

  }

  static Future<String?> refreshToken() async {
    try {

      final refreshId = await Storage.instance.getUID();

      if (refreshId == null) return null;

      final response = await DioService.post(
        "${dotenv.env["BASE_URL"]}/auth/token",
        data: {
          "id": refreshId,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data["token"];

        await storage.write(
          key: "token",
          value: token,
        );

        return token;
      }

      return null;
    } catch (e) {
      log("Refresh Token Error : $e");
      return null;
    }
  }

  static Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> put(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> patch(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) {
    return _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}