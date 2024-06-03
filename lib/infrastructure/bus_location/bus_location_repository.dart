import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:red_bus_crocos_project/domain/bus_location/bus_location_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusLocationRepository {
  static Future<String> fetchToken() async {
    try {
      final client = Dio();
      final result =
          await client.get('https://redbus.kz/ru/wp-json/wl/v1/posts/token');

      if (result.statusCode == 200) {
        // log(result.data["acf_data"].toString());
        return result.data["content"];
      } else {
        throw Exception('Error on fetchToken: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }

  static Future<String> getBusToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('bus_token') ?? '';
  }

  static Future<bool> setBusToken(String tok) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('bus_token', tok);
  }

  static Future<String> getEid() async {
    // String tok =
    //     'd610c5141811401bc0eef050fe19b6966D1035C2A56D10AE6B1D53583D3BF75AC48E15B5';
    String tok = await getBusToken();

    String url = 'https://hst-api.wialon.com/wialon/ajax.html?svc=token/login';

    Dio dio = Dio();

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

      // log('Status Code: ${response.data}');
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
