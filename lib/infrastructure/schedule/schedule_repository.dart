import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:red_bus_crocos_project/domain/schedule/schedule_dto.dart';

class ScheduleRepository {
  static Future<AcfData> fetchThisOne() async {
    try {
      final client = Dio();
      final result =
          await client.get('https://redbus.kz/ru/wp-json/wl/v1/page/marshruty');

      if (result.statusCode == 200) {
        // log(result.data["acf_data"].toString());
        return AcfData.fromJson(result.data["acf_data"]);
      } else {
        throw Exception('Error on fetchCategories: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }

  // static Future<List<SightWPDto>> fetchSightsThumbs() async {
  //   try {
  //     final client = Dio();
  //     final result =
  //         await client.get('https://redbus.kz/ru/wp-json/wl/v1/posts');

  //     if (result.statusCode == 200) {
  //       return ((result.data as List)
  //           .map((e) => SightWPDto.fromJson(e))
  //           .toList());
  //     } else {
  //       throw Exception('Error on fetchCategories: ${result.statusCode}');
  //     }
  //   } on Exception catch (e) {
  //     print(e);
  //     throw Exception('Error: $e');
  //   }
  // }
}
