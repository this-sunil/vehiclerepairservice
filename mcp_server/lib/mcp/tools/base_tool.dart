import 'dart:async';
import 'dart:convert';

import 'package:mcp_dart/mcp_dart.dart';

import '../../src/repair_api.dart';

/// One MCP tool = one adapter class. Business logic lives in `lib/src/`.
abstract class BaseTool {
  String get name;
  String get description;
  ToolInputSchema get inputSchema;
  ToolOutputSchema? get outputSchema => null;
  ToolAnnotations? get annotations => null;

  Future<CallToolResult> execute(
    Map<String, dynamic> args,
    RequestHandlerExtra extra,
  );
}

extension ToolRegistration on McpServer {
  void registerBaseTool(BaseTool tool) {
    registerTool(
      tool.name,
      description: tool.description,
      inputSchema: tool.inputSchema,
      outputSchema: tool.outputSchema,
      annotations: tool.annotations,
      callback: tool.execute,
    );
  }
}

/// Turn a JSON-able value into a text tool result.
CallToolResult jsonResult(Object? value) {
  return CallToolResult(
    content: [
      TextContent(text: const JsonEncoder.withIndent('  ').convert(value)),
    ],
  );
}

/// Surface an expected domain failure so the model can recover.
CallToolResult errorResult(String message) {
  return CallToolResult(
    isError: true,
    content: [TextContent(text: message)],
  );
}

/// Runs a tool body and converts every failure into a readable
/// `CallToolResult(isError: true)`.
///
/// Without this, anything that is not a [RepairApiException] (a timeout, a
/// DNS failure, a malformed argument) escapes to the SDK, which replaces the
/// real message with the useless string "Tool execution failed."
Future<CallToolResult> guard(Future<CallToolResult> Function() body) async {
  try {
    return await body();
  } on RepairApiException catch (error) {
    return errorResult(error.message);
  } on TimeoutException {
    return errorResult('The repair service did not respond in time.');
  } catch (error) {
    return errorResult('Unexpected error: $error');
  }
}
