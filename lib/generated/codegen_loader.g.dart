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
  "buy_ticket": "Купить билет",
  "travel_time": "Время в пути - 1 час 55 минут",
  "adult_ticket": "Взрослый билет",
  "discount_ticket": "Льготный билет для детей, студентов и пенсионеров",
  "child_under_six": "Детям до 6 лет",
  "free": "бесплатно",
  "tenge": "тенге"
};
static const Map<String,dynamic> uk = {
  "route": "Бағыт",
  "bus_stops": "Аялдамалар",
  "schedule": "Қозғалыс кестесі",
  "tickets": "Билеттер",
  "loading": "Жүктеу",
  "error": "Қате",
  "departure_time": "Кету уақыты",
  "arrival_time": "Келу уақыты",
  "buy_ticket": "Билет сатып алу",
  "travel_time": "Жол жүру уақыты - 1 сағат 55 минут",
  "adult_ticket": "Ересектер билеті",
  "discount_ticket": "Балаларға, студенттерге және зейнеткерлерге арналған жеңілдік билеті",
  "child_under_six": "6 жасқа дейінгі балалар",
  "free": "Тегін",
  "tenge": "Теңге"
};
static const Map<String,dynamic> en = {
  "route": "Route",
  "bus_stops": "Bus Stops",
  "schedule": "Schedule",
  "tickets": "Tickets",
  "loading": "Loading",
  "error": "Error",
  "departure_time": "Departure Time",
  "arrival_time": "Arrival Time",
  "buy_ticket": "Buy Ticket",
  "travel_time": "Travel Time - 1 hour 55 minutes",
  "adult_ticket": "Adult Ticket",
  "discount_ticket": "Discount Ticket for Children, Students, and Pensioners",
  "child_under_six": "Children under 6",
  "free": "free",
  "tenge": "tenge"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "uk": uk, "en": en};
}
