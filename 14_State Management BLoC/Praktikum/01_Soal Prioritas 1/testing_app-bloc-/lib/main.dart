import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/bloc/contact_bloc.dart';
import 'package:testing_app/pages/contacts_page.dart';
import 'package:testing_app/pages/gallery_page.dart';
import 'package:testing_app/pages/home_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactBloc()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/contacts': (context) => const ContactsPage(),
        '/gallery': (context) => const GalleryPage(),
      },
    );
  }
}
