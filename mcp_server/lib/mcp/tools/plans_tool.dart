import 'package:mcp_dart/mcp_dart.dart';

import '../../src/repair_api.dart';
import 'base_tool.dart';

class PlansTool extends BaseTool {
  PlansTool(this._api);

  final RepairApi _api;

  @override
  String get name => 'list_plans';

  @override
  String get description =>
      'List the available subscription plans with their price and benefits. '
      'Use this when the user asks about plans, membership or subscription '
      'pricing.';

  @override
  ToolInputSchema get inputSchema => JsonSchema.object(properties: const {});

  @override
  ToolAnnotations get annotations => const ToolAnnotations(readOnlyHint: true);

  @override
  Future<CallToolResult> execute(
    Map<String, dynamic> args,
    RequestHandlerExtra extra,
  ) {
    return guard(() async {
      final plans = await _api.plans(sessionId: extra.sessionId);
      return jsonResult({'count': plans.length, 'plans': plans});
    });
  }
}
