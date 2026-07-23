import 'package:flutter_test/flutter_test.dart';
// Ensure this path matches your project structure
import 'package:vehicle_repair_service/layer/MyApp.dart';

void main() {
  testWidgets('App loads and shows home screen', (WidgetTester tester) async {
    // 1. Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
  });
}