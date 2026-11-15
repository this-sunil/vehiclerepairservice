import 'package:mcp_dart/mcp_dart.dart';

import '../../src/repair_api.dart';
import 'base_tool.dart';

class SearchServicesTool extends BaseTool {
  SearchServicesTool(this._api);

  final RepairApi _api;

  @override
  String get name => 'search_services';

  @override
  String get description =>
      'Search the vehicle repair service catalogue by keyword, for example '
      '"oil change", "brake pad" or "car wash". Returns matching services with '
      'their name, price and shop. Use this for any question about what a '
      'service costs or what is offered.';

  @override
  ToolInputSchema get inputSchema => JsonSchema.object(
        properties: {
          'query': JsonSchema.string(
            description:
                'Keywords to search for, e.g. "brake pad replacement".',
          ),
        },
        required: ['query'],
      );

  @override
  ToolAnnotations get annotations => const ToolAnnotations(readOnlyHint: true);

  @override
  Future<CallToolResult> execute(
    Map<String, dynamic> args,
    RequestHandlerExtra extra,
  ) {
    return guard(() async {
      final services = await _api.searchServices(
        args['query'] as String,
        sessionId: extra.sessionId,
      );
      return jsonResult({'count': services.length, 'services': services});
    });
  }
}
