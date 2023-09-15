import 'package:flutter/material.dart';
// import 'home_page.dart';
import 'contacts_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData.dark(),
      home: ContactsPage(),
    );
  }
}
