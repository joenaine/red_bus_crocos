import 'package:auto_route/auto_route.dart';
import 'package:red_bus_crocos_project/presentation/bottom_navigation/bottom_navigation.dart';
import 'package:red_bus_crocos_project/presentation/bus_stops/bus_stops_page.dart';
import 'package:red_bus_crocos_project/presentation/home/home_page.dart';
import 'package:red_bus_crocos_project/presentation/schedule/schedule_page.dart';
import 'package:red_bus_crocos_project/presentation/tickets/tickets_page.dart';

import '../bus_stops/bus_stop_detail_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(page: BottomNavigationRoute.page, initial: true),
    AdaptiveRoute(page: BusStopDetailRoute.page,),
  ];
}
