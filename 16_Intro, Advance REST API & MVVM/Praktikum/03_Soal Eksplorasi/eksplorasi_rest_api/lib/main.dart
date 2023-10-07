import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eksplorasi_rest_api/pages/home_page.dart';
import 'package:eksplorasi_rest_api/viewmodels/image_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ImageViewModel(),
      child: const ImageGeneratorApp(),
    ),
  );
}

class ImageGeneratorApp extends StatelessWidget {
  const ImageGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageGeneratorPage(),
    );
  }
}
