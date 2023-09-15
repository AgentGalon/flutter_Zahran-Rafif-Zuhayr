import 'package:flutter/material.dart';
import './home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF6200EE),
      ),
      home: const HomePage(),
    );
  }
}
