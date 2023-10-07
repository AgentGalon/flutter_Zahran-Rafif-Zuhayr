import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dicebear_api_01/viewmodels/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicebear Api'),
      ),
      body: Center(
        child: FutureBuilder(
          future: HomeViewModel().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SvgPicture.string(
                snapshot.data!.apiResponse,
                width: 200,
                height: 200,
              );
            }
          },
        ),
      ),
    );
  }
}
