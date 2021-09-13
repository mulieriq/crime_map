import 'package:crime_map/src/provider/auth_provider.dart';
import 'package:crime_map/src/views/auth/auth_page.dart';
import 'package:crime_map/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(TestScreen());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(TestScreen());

    expect(find.text('Enter text'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });

  testWidgets('Auth Screen', (WidgetTester tester) async {
    await tester.pumpWidget(
        Provider(create: (context) => AuthProvider(), child: AuthPage()));

    tester.pumpAndSettle();

    expect(find.byType(Column), findsOneWidget);
  });
}
