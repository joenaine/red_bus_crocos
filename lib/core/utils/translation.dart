import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;

getTranslation(dynamic data) {
  debugPrint(global.locale.languageCode);
  if (global.locale.languageCode == 'en' &&
      (data.en.name != null || data.en.description != null)) {
    return data.ru;
  }
  if (global.locale.languageCode == 'uk' &&
      (data.uk.name != null || data.uk.description != null)) {
    return data.uk;
  }
  if (global.locale.languageCode == 'ru' &&
      (data.ru.name != null || data.ru.description != null)) {
    return data.ru;
  }
//default english language
  else {
    return data.ru;
  }
}

final supportedLocales = [
  const Locale('uk'),
  const Locale('ru'),
  const Locale('en'),
];

final getLocale = <String, String>{
  'uk': 'Қаз',
  'ru': 'Рус',
  'en': 'Eng',
};

String getLocaleString(BuildContext context) {
  // Get the current locale
  Locale currentLocale = context.locale;

// Convert the locale to a string (e.g., "en")
  // String languageCode = currentLocale.languageCode;

// To get a string representation of the entire locale (e.g., "en_US")
  String localeString = currentLocale.toString();

  return getLocale[localeString]!;
}

String getScheduleTranslate(String location) {
  if (global.locale.languageCode == 'uk') {
    return _localizedKZ[location] ?? location;
  } else if (global.locale.languageCode == 'en') {
    return _localizedEN[location] ?? location;
  } else {
    return location;
  }
}

final Map<String, String> _localizedEN = {
  'Монумент Астана-Байтерек': 'Astana-Baiterek Monument',
  'ЦСО Айланд': 'CSO Ailand',
  'Лодочная станция (Набережная)': 'Boat Station (Promenade)',
  'ТРЦ Хан Шатыр': 'Khan Shatyr Shopping Mall',
  'Триумфальная Арка': 'Triumphal Arch',
  'Музей Нур-Алем (Expo)': 'Nur-Alem Museum (Expo)',
};

final Map<String, String> _localizedKZ = {
  'Монумент Астана-Байтерек': 'Астана-Байтерек монументі',
  'ЦСО Айланд': 'ЦСО Айланд',
  'Лодочная станция (Набережная)': 'Лодочная станция (Набережная)',
  'ТРЦ Хан Шатыр': 'Хан Шатыр СОД',
  'Триумфальная Арка': 'Триумфальная Арка',
  'Музей Нур-Алем (Expo)': 'Нұр-Әлем музейі (Экспо)',
};

List<String> rusSchedule = [
  "Монумент Астана-Байтерек",
  "ЦСО Айланд",
  "Лодочная станция (Набережная)",
  "ТРЦ Хан Шатыр",
  "Триумфальная Арка",
  "Музей Нур-Алем (Expo)",
  "Монумент Астана-Байтерек"
];

List<String> kazSchedule = [
  "Астана-Байтерек монументі",
  "ЦСО Айланд",
  "Лодочная станция (Набережная)",
  "Хан Шатыр СОД",
  "Триумфальная Арка",
  "Нұр-Әлем музейі (Экспо)",
  "Астана-Байтерек монументі"
];

List<String> engSchedule = [
  "Astana-Baiterek Monument",
  "CSO Ailand",
  "Boat Station (Promenade)",
  "Khan Shatyr Shopping Mall",
  "Triumphal Arch",
  "Nur-Alem Museum (Expo)",
  "Astana-Baiterek Monument"
];
