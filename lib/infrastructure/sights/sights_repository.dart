import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/sight/sight_dto.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;

@LazySingleton()
class SightsRepository {
  String getLocale() {
    if (global.locale.toString() == 'uk') {
      return 'kz';
    } else {
      return global.locale.toString();
    }
  }

  Future<SightModel> fetchThisOne(String id) async {
    try {
      final client = Dio();
      final result = await client
          .post('https://ais.citypass.kz/app/v1/objects/data', data: {
        "api_key": "rTD6psMNcuMfewz8YAv825X",
        "project_id": "1",
        "lang": getLocale(),
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
        "lang": getLocale()
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
