import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_shop/main.dart';

void main() {
  testWidgets('Fruit Shop smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FruitShopApp());

    // Verify that we start at the login screen.
    expect(find.text('Login Fruit Shop'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
