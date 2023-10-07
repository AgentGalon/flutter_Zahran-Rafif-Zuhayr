import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:eksplorasi_rest_api/models/image_model.dart';

class ImageViewModel extends ChangeNotifier {
  final Dio _dio = Dio();
  ImageModel? _imageModel;

  ImageModel? get imageModel => _imageModel;

  late TextEditingController nameController;

  ImageViewModel() {
    nameController = TextEditingController();
  }

  Future<void> generateImage(String name) async {
    String apiUrl;

    if (name == 'smokey') {
      apiUrl =
          'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Smokey';
    } else if (name == 'milo') {
      apiUrl = 'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Milo';
    } else {
      final List<String> apiUrls = [
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Jack',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Pumpkin',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Max',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Abby',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Princess',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Jasmine'
      ];

      final random = Random();
      apiUrl = apiUrls[random.nextInt(apiUrls.length)];
    }

    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final responseData = ImageModel.fromJson(response.data);
        _imageModel = responseData;
        notifyListeners();
      } else {
        _imageModel = null;
      }
    } catch (e) {
      _imageModel = null;
    }
  }
}
