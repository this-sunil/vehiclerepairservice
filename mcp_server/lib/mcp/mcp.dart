import 'package:mcp_dart/mcp_dart.dart';

import '../src/repair_api.dart';
import 'tools/base_tool.dart';
import 'tools/book_appointment_tool.dart';
import 'tools/plans_tool.dart';
import 'tools/search_services_tool.dart';
import 'tools/vehicle_types_tool.dart';

/// The only place an [McpServer] is built. Call this once per transport/session.
McpServer createMcpServer(RepairApi api) {
  final server = McpServer(
    const Implementation(name: 'vehicle-repair', version: '1.0.0'),
  );

  server.registerBaseTool(SearchServicesTool(api));
  server.registerBaseTool(VehicleTypesTool(api));
  server.registerBaseTool(PlansTool(api));
  server.registerBaseTool(BookAppointmentTool(api));

  return server;
}
