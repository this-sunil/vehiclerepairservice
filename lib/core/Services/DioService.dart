import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

class DioService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      validateStatus: (v) => true,
      // Remove validateStatus
    ),
  );

  static Dio get dio => _dio;

  static Future<void> init() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await Storage.instance.getToken();
          options.headers["Authorization"] = "Bearer $token";

          handler.next(options);
        },

        onError: (error, handler) async {
          print("Status=>${error.response?.statusCode}");
          if (error.response?.statusCode == 401) {
            await refreshToken();
            final retry = await dio.fetch(error.requestOptions);
            return handler.resolve(retry);
          }
          handler.next(error);
        },
      ),
    );
  }

  static Future<String?> refreshToken() async {
    final refreshToken = await Storage.instance.getToken();

    if (refreshToken == null) return null;
    print("Refresh Token=>$refreshToken");
    try {
      final response = await DioService.post(
        '${dotenv.env['BASE_URL']}${dotenv.env['REFRESH_URL']}',
        data: {"id": refreshToken},
      );

      final newAccessToken = response.data['token'];

      await Storage.instance.setToken(newAccessToken);
      print("New Token=>$newAccessToken");
      return newAccessToken;
    } on DioException catch (e) {
      //log("Dio Exception=>${e.message}");
    } catch (_) {
      return null;
    }
    return null;
  }

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get(path, queryParameters: queryParameters, options: options);
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
