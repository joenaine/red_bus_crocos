import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:red_bus_crocos_project/domain/sight/sight_wp_dto.dart';

class SightsWPRepository {
  static Future<SightWPDto> fetchThisOne() async {
    try {
      final client = Dio();
      final result =
          await client.get('https://redbus.kz/ru/wp-json/wl/v1/posts');

      if (result.statusCode == 200) {
        // log(result.data[0].toString());
        return SightWPDto.fromJson(result.data[0]);
      } else {
        throw Exception('Error on fetchCategories: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }

  static Future<SightWPDto> fetchModalMessage() async {
    try {
      final client = Dio();
      final result = await client
          .get('https://redbus.kz/ru/wp-json/wl/v1/posts/modalnoe-okno2');

      if (result.statusCode == 200) {
        // log(result.data[0].toString());
        return SightWPDto.fromJson(result.data[0]);
      } else {
        throw Exception('Error on fetchCategories: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }

  static Future<List<SightWPDto>> fetchSightsThumbs() async {
    try {
      final client = Dio();
      final result =
          await client.get('https://redbus.kz/ru/wp-json/wl/v1/posts');

      if (result.statusCode == 200) {
        return ((result.data as List)
            .map((e) => SightWPDto.fromJson(e))
            .toList());
      } else {
        throw Exception('Error on fetchCategories: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }
}
