import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:eksplorasi_rest_api/viewmodels/image_view_model.dart';

class ImageGeneratorPage extends StatelessWidget {
  const ImageGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageProvider.imageModel?.svgData != null
                ? Column(
                    children: [
                      const Text(
                        'Generated Image:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SvgPicture.string(
                        imageProvider.imageModel!.svgData,
                        width: 200,
                        height: 200,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: imageProvider.nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String name = imageProvider.nameController.text.trim();
                if (name.isNotEmpty) {
                  imageProvider.generateImage(name);
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}
