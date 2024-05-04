// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "route": "Маршрут",
  "bus_stops": "Остановки",
  "schedule": "Расписание",
  "tickets": "Билеты",
  "loading": "Загрузка",
  "error": "Ошибка",
  "departure_time": "Время отбытия",
  "arrival_time": "Время прибытия",
  "buy_ticket": "Купить билет"
};
static const Map<String,dynamic> en = {
  "route": "Routes",
  "bus_stops": "Остановки",
  "schedule": "Расписание",
  "tickets": "Билеты",
  "loading": "Loading",
  "error": "Error",
  "departure_time": "Departure Time",
  "arrival_time": "Arrival Time",
  "buy_ticket": "Buy ticket"
};
static const Map<String,dynamic> kz = {
  "route": "Маршрут",
  "bus_stops": "Остановки",
  "schedule": "Расписание",
  "tickets": "Билеты",
  "loading": "Загрузка",
  "error": "Ошибка",
  "departure_time": "Время отбытия",
  "arrival_time": "Время прибытия",
  "buy_ticket": "Купить билет"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en, "kz": kz};
}
