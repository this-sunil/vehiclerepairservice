import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcp_dart/mcp_dart.dart';

import '../../layer/Widget/Storage.dart';

/// A tool advertised by the MCP server, in the shape Gemini needs.
class McpToolInfo {
  const McpToolInfo({
    required this.name,
    required this.description,
    required this.schema,
  });

  final String name;
  final String description;
  final Map<String, dynamic> schema;
}

/// Owns the single MCP connection for the app.
///
/// Mobile and web cannot spawn stdio servers, so this always talks to a remote
/// MCP server over Streamable HTTP (`MCP_URL` in `.env`).
///
/// The user's own session token is forwarded as a bearer header so the MCP
/// server can call the REST API as that user. `McpAiService` reconnects when
/// the token changes (sign in / sign out).
class McpAiService {
  McpAiService._();

  static final McpAiService instance = McpAiService._();

  McpClient? _client;
  List<McpToolInfo> _tools = const [];
  String? _token;

  bool get isConnected => _client != null;

  List<McpToolInfo> get tools => _tools;

  Future<void> connect() async {
    final token = await Storage.instance.getToken();
    final uid = await Storage.instance.getUID();

    // Already connected with the same credentials.
    if (_client != null && token == _token) return;

    // Token changed (or a previous attempt used a stale one): start over.
    if (_client != null) await disconnect();

    final url = dotenv.env['MCP_URL'];
    if (url == null || url.isEmpty) {
      throw StateError('MCP_URL is missing from .env');
    }

    final client = McpClient(
      const Implementation(name: 'vehicle-repair-app', version: '1.0.0'),
    );

    await client.connect(
      StreamableHttpClientTransport(
        Uri.parse(url),
        opts: StreamableHttpClientTransportOptions(
          requestInit: {
            'headers': {
              if (token != null && token.isNotEmpty)
                'Authorization': 'Bearer $token',
              if (uid != null && uid.isNotEmpty) 'X-User-Id': uid,
            },
          },
        ),
      ),
    );

    _client = client;
    _token = token;

    final page = await client.listTools();
    _tools = [
      for (final tool in page.tools)
        McpToolInfo(
          name: tool.name,
          description: tool.description ?? '',
          schema: tool.inputSchema.toJson(),
        ),
    ];

    log('MCP connected with ${_tools.length} tools: '
        '${_tools.map((t) => t.name).join(', ')}');
  }

  /// Calls a tool and returns its text output. Throws on tool-domain errors.
  Future<String> callTool(String name, Map<String, dynamic> args) async {
    final client = _client;
    if (client == null) throw StateError('MCP is not connected');

    final result = await client.callTool(
      CallToolRequest(name: name, arguments: args),
      options: const RequestOptions(timeout: Duration(seconds: 40)),
    );

    final text = result.content
        .whereType<TextContent>()
        .map((content) => content.text)
        .join('\n')
        .trim();

    if (result.isError) {
      throw StateError(text.isEmpty ? 'Tool "$name" failed' : text);
    }
    return text;
  }

  Future<void> disconnect() async {
    await _client?.close();
    _client = null;
    _tools = const [];
    _token = null;
  }
}
