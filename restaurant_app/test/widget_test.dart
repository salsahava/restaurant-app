import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/main.dart';

void main() {
  // A test to check whether the bottom navigation bar works or not
  testWidgets(
      'should show settings page when clicking the settings bottom navigation bar item',
      (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(MyApp());

    // Verify that it is the restaurant list page by checking the title
    // Expects to find one widget with the text 'Restaurant App' (the title)
    // Expects to find one widget with the text 'Settings' (the bottom navigation bar item)
    expect(find.text('Restaurant App'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    // Tap the settings bottom navigation bar item to navigate to settings page
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    // Verify that it is the settings page by checking the title
    // Expects to find no widget with the text 'Restaurant App'
    // Expects to find two widgets with the text 'Settings' (the title and the bottom navigation bar item)
    expect(find.text('Restaurant App'), findsNothing);
    expect(find.text('Settings'), findsNWidgets(2));
  });
}
