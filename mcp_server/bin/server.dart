import 'dart:io';

import 'package:mcp_dart/mcp_dart.dart';
import 'package:vehicle_repair_mcp/mcp/mcp.dart';
import 'package:vehicle_repair_mcp/src/dot_env.dart';
import 'package:vehicle_repair_mcp/src/repair_api.dart';
import 'package:vehicle_repair_mcp/src/request_context.dart';

/// Run with:
///   dart run bin/server.dart
///
/// Configuration is read from the Flutter project's `.env` (one directory up)
/// so the API URLs and credentials match the app. Environment variables win:
///   REPAIR_API_BASE_URL / BASE_URL, MCP_HOST, MCP_PORT, MCP_ALLOWED_HOSTS,
///   ENV_FILE.
Future<void> main(List<String> args) async {
  final env = Platform.environment;

  final envFile = env['ENV_FILE'] ?? '../.env';
  final dotEnv = DotEnv.load(envFile);

  final baseUrl = _firstNonEmpty([
    env['REPAIR_API_BASE_URL'],
    dotEnv['MCP_API_BASE_URL'],
    env['BASE_URL'],
    dotEnv['BASE_URL'],
  ]);

  if (baseUrl == null) {
    stderr.writeln(
      'No API base URL. Set REPAIR_API_BASE_URL, or add BASE_URL to $envFile.',
    );
    exitCode = 64;
    return;
  }

  final host = env['MCP_HOST'] ?? '0.0.0.0';
  final port = int.tryParse(env['MCP_PORT'] ?? '') ?? 8080;

  final allowedHosts =
      (env['MCP_ALLOWED_HOSTS'] ?? '127.0.0.1,localhost,10.0.2.2')
          .split(',')
          .map((h) => h.trim())
          .where((h) => h.isNotEmpty)
          .toSet();

  // The app forwards its own session token and user id on every request.
  final context = RequestContext();
  final api = RepairApi(
    baseUrl: baseUrl,
    context: context,
    env: dotEnv,
  );

  final server = StreamableMcpServer(
    serverFactory: (_) => createMcpServer(api),
    host: host,
    port: port,
    path: '/mcp',
    // Not an auth wall: just a place to observe the app's credentials before
    // the tool callback runs. The REST API is the real authority.
    authenticator: (request) {
      context.capture(
        sessionId: request.headers.value('mcp-session-id'),
        authorization: request.headers.value(HttpHeaders.authorizationHeader),
        userHeader: request.headers.value('x-user-id'),
      );
      return true;
    },
    // DNS-rebinding protection stays on; only these Host headers are accepted.
    allowedHosts: allowedHosts,
  );

  await server.start();
  stderr.writeln('MCP server listening on http://$host:$port/mcp');
  stderr.writeln('API base URL: $baseUrl');
  stderr.writeln('Allowed hosts: ${allowedHosts.join(', ')}');
  stderr.writeln('Env file: $envFile');

  await ProcessSignal.sigint.watch().first;
  await server.stop();
}

String? _firstNonEmpty(List<String?> values) {
  for (final value in values) {
    final trimmed = value?.trim();
    if (trimmed != null && trimmed.isNotEmpty) return trimmed;
  }
  return null;
}
