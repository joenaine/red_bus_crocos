import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart';

getTranslation(dynamic data) {
  debugPrint(locale.languageCode);
  if (locale.languageCode == 'ru' &&
      (data.ru.name != null || data.ru.description != null)) {
    return data.ru;
  }
//default english language
  else {
    return data.en;
  }
}

final supportedLocales = [
  const Locale('kz'),
  const Locale('ru'),
  const Locale('en'),
];

String getLocaleString(BuildContext context) {
  // Get the current locale
  Locale currentLocale = context.locale;

// Convert the locale to a string (e.g., "en")
  // String languageCode = currentLocale.languageCode;

// To get a string representation of the entire locale (e.g., "en_US")
  String localeString = currentLocale.toString();
  final getLocale = <String, String>{
    'kz': 'Қаз',
    'ru': 'Рус',
    'en': 'Eng',
  };
  return getLocale[localeString]!;
}
