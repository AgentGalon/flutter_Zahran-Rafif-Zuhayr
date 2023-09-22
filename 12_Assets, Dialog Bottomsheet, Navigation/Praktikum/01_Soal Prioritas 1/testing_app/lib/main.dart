import 'package:flutter/material.dart';

import 'pages/contacts_page.dart';
import 'pages/gallery_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/contacts': (context) => const ContactsPage(),
        '/gallery': (context) => const GaleryPage(),
      },
    );
  }
}
