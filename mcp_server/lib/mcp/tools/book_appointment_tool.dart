import 'package:mcp_dart/mcp_dart.dart';

import '../../src/repair_api.dart';
import 'base_tool.dart';

class BookAppointmentTool extends BaseTool {
  BookAppointmentTool(this._api);

  final RepairApi _api;

  @override
  String get name => 'book_appointment';

  @override
  String get description =>
      'Create a real vehicle repair booking for the signed-in user. Collect '
      'every field from the user first and repeat the details back for '
      'confirmation before calling this. Use list_vehicle_types for '
      'vehicle_type and search_services for service_name.';

  @override
  ToolInputSchema get inputSchema => JsonSchema.object(
        properties: {
          'vehicle_name': JsonSchema.string(
            description: 'Model of the vehicle, e.g. "Honda City".',
          ),
          'vehicle_type': JsonSchema.string(
            description:
                'One of the values returned by list_vehicle_types, e.g. "Car".',
          ),
          'registration_no': JsonSchema.string(
            description: 'Vehicle registration number.',
          ),
          'service_name': JsonSchema.string(
            description: 'Service being booked, from search_services.',
          ),
          'slot_date': JsonSchema.string(
            description: 'Appointment date in YYYY-MM-DD format.',
          ),
          'slot_time': JsonSchema.string(
            description: 'Appointment time, e.g. "10:00 AM".',
          ),
        },
        required: [
          'vehicle_name',
          'vehicle_type',
          'registration_no',
          'service_name',
          'slot_date',
          'slot_time',
        ],
      );

  @override
  ToolAnnotations get annotations => const ToolAnnotations(
    readOnlyHint: false,
    destructiveHint: false,
    idempotentHint: false,
    openWorldHint: true,
  );

  @override
  Future<CallToolResult> execute(
    Map<String, dynamic> args,
    RequestHandlerExtra extra,
  ) {
    return guard(() async {
      final booking = await _api.bookAppointment(
        vehicleName: args['vehicle_name'] as String,
        vehicleType: args['vehicle_type'] as String,
        registrationNo: args['registration_no'] as String,
        serviceName: args['service_name'] as String,
        slotDate: args['slot_date'] as String,
        slotTime: args['slot_time'] as String,
        sessionId: extra.sessionId,
      );
      return jsonResult({'booked': true, 'booking': booking});
    });
  }
}
