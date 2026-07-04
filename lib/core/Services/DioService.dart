import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

class DioService{
  static FlutterSecureStorage storage=FlutterSecureStorage();
  static Dio dio=Dio(BaseOptions(
    baseUrl: dotenv.env['BASE_URL']??'',
    connectTimeout: Duration(seconds: 60),
    receiveTimeout: Duration(seconds: 60),
    sendTimeout: Duration(seconds: 60),
    responseType: .json,
    validateStatus: (status)=>true
  ));
  static Dio get _dio=>dio;
  static Future<void> init() async{
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) async {
          final token = await storage.read(key: "token");
          if (token != null) {
            _dio.options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(option);
        },

        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final newToken = await refreshToken();

            if (newToken != null) {
              final request = error.requestOptions;

              request.headers['Authorization'] = 'Bearer $newToken';

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
    final refreshToken = await Storage.instance.getUID();

    if (refreshToken == null) return null;

    try {
      final response = await Dio().post(
        '${dotenv.env['BASE_URL']}/auth/v1/token',
        data: {"id": refreshToken},
      );

      final newAccessToken = response.data['token'];

      await storage.write(key: 'token', value: newAccessToken);

      return newAccessToken;
    } catch (_) {
      return null;
    }
  }

  static Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {

    return await _dio.get(
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
      }) async {
    log("Login message=>$path");

    return await _dio.post(
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
      }) async {

    return await _dio.patch(
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
      }) async {

    return await _dio.delete(
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
      }) async {

    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

  }


}