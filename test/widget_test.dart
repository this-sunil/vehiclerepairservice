import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_repair_service/layer/MyApp.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Wrap in MaterialApp for context
    await tester.pumpWidget(const MaterialApp(home: MyApp()));

    // Wait for all async widgets to finish
    await tester.pumpAndSettle();

    // Verify initial counter
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap '+' icon
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify incremented counter
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}