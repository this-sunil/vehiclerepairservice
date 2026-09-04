import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

class Services {
  Services._();

  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 60),
      validateStatus: (status) => status != 401,
    ),
  );

  Dio get dio => _dio;

  Future<void> init() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) async {
          String? token = await Storage.instance.getToken();
          option.headers["Authorization"] = "Bearer $token";
          return handler.next(option);
        },
        onError: (err, handler) async {
          print("Status=>${err.response?.statusCode}");
          int? code = err.response?.statusCode;
          if (code == 401) {
            await refreshToken();
            final retry = await _dio.fetch(err.requestOptions);
            return handler.resolve(retry);
          }
          handler.next(err);
        },
      ),
    );
  }

  static Future<String?> refreshToken() async {
    final token = await Storage.instance.getUID();
    if (token == null) return null;
    try {
      final resp = await _dio.post(
        "${dotenv.env["BASE_URL"]}${dotenv.env["REFRESH_URL"]}",
        data: {"id": token},
      );

      final newToken = resp.data["token"];
      await Storage.instance.setToken(newToken);
      print("Refresh Token=>$newToken");
      return newToken;
    } catch (e) {
      print("Refresh Token Error=>$e");
      throw Exception(e);
    }
  }

  static Future<Response> post(String url, {Options? option, dynamic data}) {
    return _dio.post(url, data: data, options: option);
  }

  static Future<Response> get(String url, Options? option, dynamic data) {
    return _dio.get(url, data: data, options: option);
  }

  static Future<Response> put(String url, {Options? option, dynamic data}) {
    return _dio.post(url, data: data, options: option);
  }

  static Future<Response> patch(String url, {Options? option, dynamic data}) {
    return _dio.patch(url, data: data, options: option);
  }

  static Future<Response> delete(String url, {Options? option, dynamic data}) {
    return _dio.delete(url, data: data, options: option);
  }
}

Future<void> remoteMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Title =>${message.notification?.title}");
    print("Body =>${message.notification?.body}");
  }
}
