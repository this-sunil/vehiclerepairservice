import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Ensure this path matches your project structure
import 'package:vehicle_repair_service/layer/MyApp.dart';

void main() {
  testWidgets('App loads and shows home screen', (WidgetTester tester) async {
    // 1. Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // 2. Look for a widget that actually exists in your app.
    // Replace 'Vehicle Repair' with text that is actually on your screen.
    expect(find.textContaining('Vehicle'), findsOneWidget);

    // OR: Look for a specific Icon you use, like a settings icon
    // expect(find.byIcon(Icons.settings), findsOneWidget);
  });
}