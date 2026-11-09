import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Normalizes an API response body into a JSON map.
///
/// Dio normally decodes `application/json` responses for us, but some
/// endpoints/tests return a raw string. This helper keeps every repository
/// consistent and turns an unexpected payload into a [FormatException]
/// instead of an unchecked cast error.
Map<String, dynamic> asJsonMap(dynamic data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) return Map<String, dynamic>.from(data);
  if (data is String && data.trim().isNotEmpty) {
    final decoded = jsonDecode(data);
    if (decoded is Map<String, dynamic>) return decoded;
    if (decoded is Map) return Map<String, dynamic>.from(decoded);
  }
  throw const FormatException('Unexpected response payload');
}

/// Builds a public URL for a file stored by the backend.
///
/// The backend stores only the file name in most columns, so callers often
/// need the upload prefix. Absolute URLs are returned untouched.
String? imageUrl(String? path) {
  if (path == null || path.trim().isEmpty) return null;
  final value = path.trim();
  if (value.startsWith('http://') || value.startsWith('https://')) {
    return value;
  }
  final base = dotenv.env['STORE_URL'] ?? dotenv.env['BASE_URL'] ?? '';
  if (base.isEmpty) return value;
  final normalizedBase = base.endsWith('/')
      ? base.substring(0, base.length - 1)
      : base;
  final normalizedPath = value.startsWith('/') ? value.substring(1) : value;
  if (normalizedPath.startsWith('upload/')) {
    return '$normalizedBase/$normalizedPath';
  }
  return '$normalizedBase/upload/$normalizedPath';
}
