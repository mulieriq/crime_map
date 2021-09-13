import 'package:crime_map/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(TestScreen());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
  });

  testWidgets('Test text field', (WidgetTester tester) async {
    await tester.pumpWidget(TestScreen());

    expect(find.text('Enter text'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
