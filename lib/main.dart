import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_bus_crocos_project/app_widget.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/core/utils/translation.dart';
import 'package:red_bus_crocos_project/domain/lat_lng/lat_lng_model.dart';
import 'package:red_bus_crocos_project/generated/codegen_loader.g.dart';
import 'package:red_bus_crocos_project/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LatLngDataAdapter());
  await configureInjection();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.red,
      statusBarIconBrightness: Brightness.light));

  final shared = await SharedPreferences.getInstance();
  if (shared.containsKey('locale')) {
    global.locale = supportedLocales.firstWhere(
      (element) =>
          element.languageCode ==
          (shared.get('locale')! as String).substring(0, 2),
    );
    log(global.locale.toString());
  }
  // Bloc.observer = RedBusBlocObserver();
  runApp(
    EasyLocalization(
      startLocale: supportedLocales[1],
      supportedLocales: supportedLocales,
      path: 'assets/translations',
      fallbackLocale: supportedLocales[1],
      assetLoader: const CodegenLoader(),
      child: AppWidget(),
    ),
  );
}
