import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

/// Central HTTP client used by every repository.
///
/// The client is created lazily so repositories can be constructed before
/// `dotenv` has been loaded (tests, background isolates). A [Dio] instance can
/// be injected through [dio] for hermetic tests.
class DioService {
  DioService._();

  static const String _retriedKey = 'dio_token_retried';

  static Dio? _dio;
  static bool _interceptorInstalled = false;
  static Future<String?>? _refreshInFlight;

  static Dio get dio => _dio ??= _createDio();

  /// Replaces the underlying client. Intended for tests.
  static set dio(Dio value) {
    _dio = value;
    _interceptorInstalled = false;
  }

  static Dio _createDio() {
    return Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        // Non-401 statuses are returned to repositories so they can map the
        // error message from the response body.
        validateStatus: (status) => status != 401,
      ),
    );
  }

  /// Installs the auth interceptor. Safe to call more than once.
  static Future<void> init() async {
    if (_interceptorInstalled) return;
    _interceptorInstalled = true;

    final client = dio;
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await Storage.instance.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          final statusCode = error.response?.statusCode;
          final requestOptions = error.requestOptions;
          final alreadyRetried = requestOptions.extra[_retriedKey] == true;
          final isRefreshRequest = _isRefreshRequest(requestOptions);

          if (statusCode == 401 && !alreadyRetried && !isRefreshRequest) {
            try {
              final newToken = await _refreshTokenOnce();
              if (newToken == null || newToken.isEmpty) {
                return handler.next(error);
              }

              requestOptions.extra[_retriedKey] = true;
              requestOptions.headers['Authorization'] = 'Bearer $newToken';
              final retry = await client.fetch(requestOptions);
              return handler.resolve(retry);
            } catch (e) {
              log('Token refresh failed => $e');
              return handler.next(error);
            }
          }

          handler.next(error);
        },
      ),
    );
  }

  static bool _isRefreshRequest(RequestOptions options) {
    final refreshPath = dotenv.env['REFRESH_URL'];
    if (refreshPath == null || refreshPath.isEmpty) return false;
    return options.path.endsWith(refreshPath) ||
        options.uri.toString().endsWith(refreshPath);
  }

  /// Refreshes the access token, coalescing concurrent 401 retries into a
  /// single request.
  static Future<String?> refreshToken() => _refreshTokenOnce();

  static Future<String?> _refreshTokenOnce() {
    final existing = _refreshInFlight;
    if (existing != null) return existing;

    final future = _performRefresh();
    _refreshInFlight = future;
    return future.whenComplete(() {
      if (identical(_refreshInFlight, future)) _refreshInFlight = null;
    });
  }

  static Future<String?> _performRefresh() async {
    final uid = await Storage.instance.getUID();
    if (uid == null || uid.isEmpty) return null;

    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    final refreshPath = dotenv.env['REFRESH_URL'] ?? '';
    if (baseUrl.isEmpty || refreshPath.isEmpty) return null;

    // Use a bare client so a failing refresh cannot trigger the interceptor
    // again (which previously caused an infinite 401 retry loop).
    final refreshClient = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    final response = await refreshClient.post(
      '$baseUrl$refreshPath',
      data: {'id': uid},
    );

    if (response.statusCode != 200) return null;
    final data = response.data;
    final token = data is Map ? data['token'] : null;
    if (token is! String || token.isEmpty) return null;

    await Storage.instance.setToken(token);
    return token;
  }

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.get(path, queryParameters: queryParameters, options: options);
  }

  static Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.post(
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
    return dio.put(
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
    return dio.patch(
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
    return dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
