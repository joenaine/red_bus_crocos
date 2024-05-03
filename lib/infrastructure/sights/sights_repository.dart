import 'package:dio/dio.dart';

import '../../domain/sight/sight_dto.dart';

class SightsRepository {
  Future<SightModel> fetchThisOne(String id) async {
    try {
      final client = Dio();
      final result = await client
          .post('https://ais.citypass.kz/app/v1/objects/data', data: {
        "api_key": "rTD6psMNcuMfewz8YAv825X",
        "project_id": "1",
        "lang": "ru",
        "object_id": id,
      });

      if (result.statusCode == 200) {
        return SightModel.fromMap(result.data["data"]);
      } else {
        throw Exception('Error on fetchCategories: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }

  Future<List<SightModel>> fetchSightsThumbs() async {
    try {
      final client = Dio();
      final result = await client
          .post('https://ais.citypass.kz/app/v1/objects/cat-list', data: {
        "api_key": "rTD6psMNcuMfewz8YAv825X",
        "project_id": "1",
        "lang": "ru"
      });

      if (result.statusCode == 200) {
        return ((result.data["data"]["categories"] as List)
                .firstOrNull["objects"] as List)
            .map((e) => SightModel.fromMap(e))
            .toList();
      } else {
        throw Exception('Error on fetchCategories: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }
}
