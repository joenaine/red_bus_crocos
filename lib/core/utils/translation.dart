import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart';

getTranslation(dynamic data) {
  debugPrint(locale.languageCode);
  if (locale.languageCode == 'en' &&
      (data.en.name != null || data.en.description != null)) {
    return data.ru;
  }
  if (locale.languageCode == 'uk' &&
      (data.uk.name != null || data.uk.description != null)) {
    return data.uk;
  }
  if (locale.languageCode == 'ru' &&
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
