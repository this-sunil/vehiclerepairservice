import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../Models/AiMessage.dart';
import 'McpAiService.dart';

/// Gemini chat with automatic MCP tool-calling.
///
/// Flow: user message -> Gemini -> (functionCall -> MCP tool -> functionResponse)*
/// -> final text. The loop stops after [_maxToolRounds] to avoid runaway calls.
class GeminiChatService {
  GeminiChatService({http.Client? client, McpAiService? mcp})
      : _client = client ?? http.Client(),
        _mcp = mcp ?? McpAiService.instance;

  final http.Client _client;
  final McpAiService _mcp;

  static const String _model = 'gemini-2.5-flash';
  static const int _maxToolRounds = 5;

  static const String _systemPrompt = '''
You are the assistant inside a vehicle repair service app.

Rules:
- Use the available tools for anything factual: services, prices, vehicle types,
  plans, bookings. Never invent a service name, price, vehicle type or slot.
- Before booking, confirm vehicle name, vehicle type, registration number,
  service, date and time with the user.
- Keep replies short and practical. Use plain text, no markdown tables.
- If a tool fails, explain the problem in one sentence and offer a next step.
''';

  /// Connects to the MCP server and loads its tools.
  Future<void> warmUp() => _mcp.connect();

  Future<String> send({
    required List<AiMessage> history,
    required String message,
  }) async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw StateError('GEMINI_API_KEY is missing from .env');
    }

    // `connect()` is a no-op when the session token has not changed.
    await _mcp.connect();

    final contents = <Map<String, dynamic>>[
      for (final turn in history)
        {
          'role': turn.role,
          'parts': [
            {'text': turn.text},
          ],
        },
      {
        'role': 'user',
        'parts': [
          {'text': message},
        ],
      },
    ];

    final tools = [
      {
        'functionDeclarations': [
          for (final tool in _mcp.tools)
            {
              'name': tool.name,
              'description': tool.description,
              'parameters': tool.schema,
            },
        ],
      },
    ];

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent?key=$apiKey',
    );

    for (var round = 0; round < _maxToolRounds; round++) {
      final response = await _client.post(
        uri,
        headers: const {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': contents,
          'tools': tools,
          'systemInstruction': {
            'parts': [
              {'text': _systemPrompt},
            ],
          },
          'generationConfig': {'temperature': 0.4},
        }),
      );

      if (response.statusCode != 200) {
        throw StateError(
          'Gemini ${response.statusCode}: ${_shorten(response.body)}',
        );
      }

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = decoded['candidates'] as List?;
      if (candidates == null || candidates.isEmpty) {
        throw StateError('Gemini returned no candidates');
      }

      final content = (candidates.first as Map)['content'] as Map?;
      final parts = (content?['parts'] as List?)
              ?.whereType<Map>()
              .map((part) => Map<String, dynamic>.from(part))
              .toList() ??
          const <Map<String, dynamic>>[];

      final functionCalls =
          parts.where((part) => part['functionCall'] != null).toList();

      if (functionCalls.isEmpty) {
        final text = parts
            .map((part) => part['text'])
            .whereType<String>()
            .join('\n')
            .trim();
        return text.isEmpty ? 'I could not generate a response.' : text;
      }

      // Echo the model's tool request back, then answer each call.
      contents.add({'role': 'model', 'parts': parts});

      final toolResponses = <Map<String, dynamic>>[];
      for (final part in functionCalls) {
        final call = Map<String, dynamic>.from(part['functionCall'] as Map);
        final name = call['name'] as String;
        final args = Map<String, dynamic>.from(
          (call['args'] as Map?) ?? const <String, dynamic>{},
        );

        String output;
        try {
          output = await _mcp.callTool(name, args);
        } catch (error) {
          output = 'Tool error: $error';
        }

        toolResponses.add({
          'functionResponse': {
            'name': name,
            'response': {'result': output},
          },
        });
      }

      contents.add({'role': 'user', 'parts': toolResponses});
    }

    throw StateError('Stopped after $_maxToolRounds tool rounds');
  }

  static String _shorten(String value) =>
      value.length <= 300 ? value : '${value.substring(0, 300)}...';
}
