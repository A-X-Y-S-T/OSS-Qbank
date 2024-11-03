import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oss_qbank/views/login_view.dart';

void main() {
  testWidgets('LoginView has login button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LoginView()));

    // Verify that the login button exists.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Logout'), findsNothing);

    // Tap the login button.
    await tester.tap(find.text('Login'));
    await tester.pump();

    // You might want to verify if a certain state or widget change occurred
    // after login.
  });
}
