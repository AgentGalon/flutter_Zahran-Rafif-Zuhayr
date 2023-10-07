import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'package:dicebear_api_01/models/home_model.dart';

class HomeViewModel {
  Future<HomeModel> fetchData() async {
    try {
      final response =
          await Dio().get('https://api.dicebear.com/7.x/lorelei/svg');

      if (response.statusCode == 200) {
        final responseData = response.data.toString();
        return HomeModel(apiResponse: responseData);
      } else {
        const Text('Gagal melakukan panggilan API');
        return HomeModel(apiResponse: '');
      }
    } catch (e) {
      Text('Terjadi kesalahan: $e');
      return HomeModel(apiResponse: '');
    }
  }
}
