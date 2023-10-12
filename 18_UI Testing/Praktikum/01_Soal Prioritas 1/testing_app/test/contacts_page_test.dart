import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/contact_provider.dart';
import 'package:testing_app/pages/contacts_page.dart';

void main() {
  testWidgets('Test ContactsPage UI', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => ContactProvider(),
          child: const ContactsPage(),
        ),
      ),
    );

    // Test title
    expect(find.text('Contacts'), findsOneWidget);

    // Test "Create New Contacts"
    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(find.text('List Contacts'), findsOneWidget);

    // Test text fields
    expect(find.byType(TextField), findsNWidgets(2));

    // Test buttons
    expect(find.text('Pick date'), findsOneWidget);
    expect(find.text('Pick color'), findsOneWidget);
    expect(find.text('Pick file'), findsOneWidget);

    // Test contact list
    expect(find.byType(ListTile), findsNothing);
  });
}
