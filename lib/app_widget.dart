import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:red_bus_crocos_project/core/theme/app_theme.dart';
import 'package:red_bus_crocos_project/presentation/routes/route_observer.dart';
import 'package:red_bus_crocos_project/presentation/routes/router.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RedBus Tour',
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [
          AppRouteObserver(),
        ],
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: AppTheme.lightTheme,
    );
  }
}
