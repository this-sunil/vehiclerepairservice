import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dot_env.dart';
import 'request_context.dart';

/// Domain-level failure the model is allowed to see and recover from.
class RepairApiException implements Exception {
  RepairApiException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// Thin HTTP client over the existing Vehicle Repair Service REST API.
///
/// It knows nothing about MCP. Tools are adapters on top of this class.
///
/// Endpoint shapes were taken from the app itself, not guessed:
///   * `searchService`      POST multipart (`search`, `page`)
///   * `fetchPlan`          POST, no body
///   * `getAllCategory`     GET
///   * `bookAppointment`    POST multipart (`id`, `vehicle_name`, ...)
/// All of them expect `Authorization: Bearer <user token>`.
///
/// Every call takes the MCP `sessionId` so it uses that session's credentials.
class RepairApi {
  RepairApi({
    required this.baseUrl,
    required this.context,
    required this.env,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final String baseUrl;
  final RequestContext context;
  final DotEnv env;
  final http.Client _client;

  static const Duration _timeout = Duration(seconds: 25);

  /// Endpoints in `.env` are paths like `/api/searchService`, but an absolute
  /// URL is accepted too.
  Uri _uri(String envKey, String fallbackPath) {
    final raw = (env[envKey] ?? '').trim();
    final target = raw.isEmpty ? fallbackPath : raw;
    if (target.startsWith('http')) return Uri.parse(target);
    final base = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    final path = target.startsWith('/') ? target : '/$target';
    return Uri.parse('$base$path');
  }

  Map<String, String> _headers(String? sessionId) {
    final credentials = context.forSession(sessionId);
    return {
      'Accept': 'application/json',
      if (credentials != null && credentials.hasToken)
        'Authorization': 'Bearer ${credentials.token}',
    };
  }

  Future<dynamic> _get(Uri uri, String? sessionId) async {
    final res =
        await _client.get(uri, headers: _headers(sessionId)).timeout(_timeout);
    return _decode(res, uri);
  }

  Future<dynamic> _postMultipart(
    Uri uri,
    String? sessionId, [
    Map<String, String> fields = const {},
  ]) async {
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_headers(sessionId))
      ..fields.addAll(fields);

    final streamed = await _client.send(request).timeout(_timeout);
    final res = await http.Response.fromStream(streamed);
    return _decode(res, uri);
  }

  Future<dynamic> _post(Uri uri, String? sessionId) async {
    final res =
        await _client.post(uri, headers: _headers(sessionId)).timeout(_timeout);
    return _decode(res, uri);
  }

  /// The API answers 200 with `status: false` for domain errors, so the body
  /// has to be inspected, not only the status code.
  dynamic _decode(http.Response res, Uri uri) {
    if (res.statusCode == 401 || res.statusCode == 403) {
      final reason = _apiMessage(res.body);
      throw RepairApiException(
        reason ??
            'The API rejected the request (HTTP ${res.statusCode}). '
                'Sign in to the app again so the assistant gets a fresh token.',
      );
    }
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw RepairApiException(
        'HTTP ${res.statusCode} from ${uri.path}: ${_trim(res.body)}',
      );
    }
    if (res.body.isEmpty) return const <String, dynamic>{};

    final dynamic decoded;
    try {
      decoded = jsonDecode(res.body);
    } on FormatException {
      throw RepairApiException(
        'Non-JSON response from ${uri.path}: ${_trim(res.body)}',
      );
    }

    if (decoded is Map<String, dynamic> && decoded['status'] == false) {
      throw RepairApiException(
        (decoded['msg'] as String?)?.trim().isNotEmpty == true
            ? decoded['msg'] as String
            : 'The API reported a failure for ${uri.path}.',
      );
    }
    return decoded;
  }

  /// Pulls the human-readable `msg` out of an error body, when there is one.
  static String? _apiMessage(String body) {
    if (body.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(body);
      if (decoded is Map<String, dynamic>) {
        final msg = decoded['msg'];
        if (msg is String && msg.trim().isNotEmpty) return msg.trim();
      }
    } on FormatException {
      return null;
    }
    return null;
  }

  static String _trim(String value) =>
      value.length <= 300 ? value : '${value.substring(0, 300)}...';

  /// Responses wrap payloads as `{status, msg, result: [...]}`; normalise.
  List<Map<String, dynamic>> _asList(dynamic decoded) {
    if (decoded is List) {
      return decoded
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    if (decoded is Map<String, dynamic>) {
      for (final key in const ['result', 'data', 'records']) {
        final value = decoded[key];
        if (value is List) {
          return value
              .whereType<Map>()
              .map((e) => Map<String, dynamic>.from(e))
              .toList();
        }
      }
    }
    return const [];
  }

  /// POST /api/searchService — multipart form fields `search` and `page`.
  Future<List<Map<String, dynamic>>> searchServices(
    String query, {
    String? sessionId,
  }) async {
    final decoded = await _postMultipart(
      _uri('SEARCH_SERVICE', '/api/searchService'),
      sessionId,
      {'search': query, 'page': '1'},
    );
    return _asList(decoded);
  }

  /// GET /api/getAllCategory — each category carries a `vehicle_type`.
  Future<List<Map<String, dynamic>>> categories({String? sessionId}) async {
    return _asList(
      await _get(_uri('FETCH_CAT_API', '/api/getAllCategory'), sessionId),
    );
  }

  /// Vehicle types are not a separate endpoint; they are the distinct
  /// `vehicle_type` values across the service categories.
  Future<List<String>> vehicleTypes({String? sessionId}) async {
    final types = <String>{};
    for (final category in await categories(sessionId: sessionId)) {
      final type = category['vehicle_type'];
      if (type is String && type.trim().isNotEmpty) types.add(type.trim());
    }
    return types.toList()..sort();
  }

  /// POST /api/fetchPlan — no body.
  Future<List<Map<String, dynamic>>> plans({String? sessionId}) async {
    return _asList(
      await _post(_uri('FETCH_PLAN', '/api/fetchPlan'), sessionId),
    );
  }

  /// POST /api/bookAppointment — multipart, field names copied from
  /// `BookBloc._bookAppointment`.
  Future<Map<String, dynamic>> bookAppointment({
    required String vehicleName,
    required String vehicleType,
    required String registrationNo,
    required String serviceName,
    required String slotDate,
    required String slotTime,
    String? sessionId,
  }) async {
    final credentials = context.forSession(sessionId);
    if (credentials == null || !credentials.hasUid) {
      throw RepairApiException(
        'No user id was forwarded by the app. Sign in again and retry.',
      );
    }

    final decoded = await _postMultipart(
      _uri('BOOK_APPOINTMENT', '/api/bookAppointment'),
      sessionId,
      {
        'id': credentials.uid!,
        'vehicle_name': vehicleName,
        'vehicle_type': vehicleType,
        'registration_no': registrationNo,
        'service_name': serviceName,
        'slot_date': slotDate,
        'slot_time': slotTime,
      },
    );
    if (decoded is Map<String, dynamic>) return decoded;
    return {'result': decoded};
  }
}
