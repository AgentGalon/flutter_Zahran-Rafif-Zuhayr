import 'package:flutter_test/flutter_test.dart';
import 'package:weekly1/main.dart';

void main() {
  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app displays 'Welcome To' and 'My ZyApp' text.
    expect(find.text('Welcome To'), findsOneWidget);
    expect(find.text('My ZyApp'), findsOneWidget);

    // Verify that our app displays 'Tap to Contact Us' button.
    expect(find.text('Tap to Contact Us'), findsOneWidget);

    // Tap the 'Tap to Contact Us' button and trigger a frame.
    await tester.tap(find.text('Tap to Contact Us'));
    await tester.pump();

    // Verify that our app displays the contact form.
    expect(find.text('Contact us'), findsOneWidget);
    expect(find.text('First Name'), findsOneWidget);
    expect(find.text('Last Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
  });
}
