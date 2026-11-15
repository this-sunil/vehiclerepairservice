import 'package:mcp_dart/mcp_dart.dart';

import '../../src/repair_api.dart';
import 'base_tool.dart';

class VehicleTypesTool extends BaseTool {
  VehicleTypesTool(this._api);

  final RepairApi _api;

  @override
  String get name => 'list_vehicle_types';

  @override
  String get description =>
      'List the vehicle types the service supports (for example Bike, Car, '
      'SUV). Call this before booking so you can use one of these exact values '
      'as the vehicle_type when calling book_appointment.';

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
      final types = await _api.vehicleTypes(sessionId: extra.sessionId);
      return jsonResult({'count': types.length, 'vehicle_types': types});
    });
  }
}
