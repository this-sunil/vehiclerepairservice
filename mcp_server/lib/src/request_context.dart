/// Credentials forwarded from the Flutter app on every MCP request.
///
/// The MCP server is not the auth authority: it only relays the user's own
/// token to the REST API. [capture] is called from the server's
/// `authenticator`, which sees the raw `HttpRequest` headers.
///
/// Credentials are stored per MCP session so two clients never share a token.
/// Requests that arrive before a session id exists (the `initialize` call) are
/// kept as the fallback for the session created immediately afterwards.
class RequestContext {
  Credentials? _fallback;
  final Map<String, Credentials?> _bySession = {};

  /// Called for every HTTP request. Missing credentials are allowed here —
  /// the upstream API decides whether they are required.
  void capture({
    String? sessionId,
    String? authorization,
    String? userHeader,
  }) {
    final credentials = Credentials.parse(
      authorization: authorization,
      userHeader: userHeader,
    );

    if (sessionId != null && sessionId.isNotEmpty) {
      _bySession[sessionId] = credentials;
    }
    _fallback = credentials;
  }

  /// Credentials for one tool call. `null` means "anonymous".
  Credentials? forSession(String? sessionId) {
    if (sessionId != null &&
        sessionId.isNotEmpty &&
        _bySession.containsKey(sessionId)) {
      return _bySession[sessionId];
    }
    return _fallback;
  }

  void clear() {
    _fallback = null;
    _bySession.clear();
  }
}

/// A user's bearer token plus user id.
class Credentials {
  const Credentials({this.token, this.uid});

  final String? token;
  final String? uid;

  bool get hasToken => token != null && token!.isNotEmpty;

  bool get hasUid => uid != null && uid!.isNotEmpty;

  /// Returns `null` when neither value is present.
  static Credentials? parse({
    String? authorization,
    String? userHeader,
  }) {
    final token = _bearer(authorization);
    final uid = _clean(userHeader);
    if (token == null && uid == null) return null;
    return Credentials(token: token, uid: uid);
  }

  static String? _clean(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  static String? _bearer(String? header) {
    final value = _clean(header);
    if (value == null) return null;
    const prefix = 'bearer ';
    if (value.toLowerCase().startsWith(prefix)) {
      return _clean(value.substring(prefix.length));
    }
    return value;
  }
}
