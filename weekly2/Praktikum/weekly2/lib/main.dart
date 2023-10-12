import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZyApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
      ),
      home: HomePage(),
    );
  }
}
