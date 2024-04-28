import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_bus_crocos_project/app_widget.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/core/utils/bloc_observer.dart';
import 'package:red_bus_crocos_project/core/utils/translation.dart';
import 'package:red_bus_crocos_project/generated/codegen_loader.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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
  }
  Bloc.observer = RedBusBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/translations',
      fallbackLocale: supportedLocales[1],
      assetLoader: const CodegenLoader(),
      child: AppWidget(),
    ),
  );
}
