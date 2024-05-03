import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:red_bus_crocos_project/domain/bus_location/bus_location_dto.dart';

class BusLocationRepository {
  static Future<String> getEid() async {
    String tok =
        'd610c5141811401bc0eef050fe19b6966A4F9085940B4FE383BF54910B3BB971D1A55EE7';
    String url = 'https://hst-api.wialon.com/wialon/ajax.html?svc=token/login';

    Dio dio = Dio();

    // dio.options.preserveHeaderCase = true;
    // dio.options.headers['content-Type'] = 'application/json';
    // dio.options.headers["authorization"] = tok;

    // FormData formData = FormData.fromMap({
    //   "handler_id": '5cd37a6ed4fc7ae1ff1c612bf74bff00',
    //   "status": "Complete",
    // });

    try {
      Response response = await dio.get(
        url,
        queryParameters: {"params": "{\"token\":\"$tok\"}"},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var userRes = response.data['eid'];
        return userRes.toString();
      } else {
        return 'false';
      }
    } catch (e) {
      return 'error';
    }
  }

  Future<Pos?> getBus() async {
    String url =
        'https://hst-api.wialon.com/wialon/ajax.html?svc=core/search_item';

    Dio dio = Dio();
    String? eid = await getEid();

    try {
      Response response = await dio.get(
        url,
        queryParameters: {
          "params": "{\"id\": 28097339,\"flags\":1025}",
          "sid": eid,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // log('Status Code: ${response.statusCode}');
      if (response.statusCode == 200 &&
          response.data.toString() != '{error: 1}') {
        // log('Response Data: ${response.data}');
        var userRes = Pos.fromJson(response.data['item']['pos']);
        log('Position X: ${userRes.x}');
        return userRes;
      } else {
        // log('Error: Received status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // log('Exception caught: $e');
      return null;
    }
  }
}
