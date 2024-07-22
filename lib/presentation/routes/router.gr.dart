// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavigationPage(),
      );
    },
    BusStopDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BusStopDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BusStopDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    BusStopsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BusStopsPage(),
      );
    },
    ChooseLanguageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseLanguagePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HuaweiHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HuaweiHomePage(),
      );
    },
    InitialOnceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialOncePage(),
      );
    },
    ScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SchedulePage(),
      );
    },
    TicketsRoute.name: (routeData) {
      final args = routeData.argsAs<TicketsRouteArgs>(
          orElse: () => const TicketsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TicketsPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [BottomNavigationPage]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BusStopDetailPage]
class BusStopDetailRoute extends PageRouteInfo<BusStopDetailRouteArgs> {
  BusStopDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          BusStopDetailRoute.name,
          args: BusStopDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'BusStopDetailRoute';

  static const PageInfo<BusStopDetailRouteArgs> page =
      PageInfo<BusStopDetailRouteArgs>(name);
}

class BusStopDetailRouteArgs {
  const BusStopDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'BusStopDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [BusStopsPage]
class BusStopsRoute extends PageRouteInfo<void> {
  const BusStopsRoute({List<PageRouteInfo>? children})
      : super(
          BusStopsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BusStopsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseLanguagePage]
class ChooseLanguageRoute extends PageRouteInfo<void> {
  const ChooseLanguageRoute({List<PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HuaweiHomePage]
class HuaweiHomeRoute extends PageRouteInfo<void> {
  const HuaweiHomeRoute({List<PageRouteInfo>? children})
      : super(
          HuaweiHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HuaweiHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitialOncePage]
class InitialOnceRoute extends PageRouteInfo<void> {
  const InitialOnceRoute({List<PageRouteInfo>? children})
      : super(
          InitialOnceRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialOnceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SchedulePage]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketsPage]
class TicketsRoute extends PageRouteInfo<TicketsRouteArgs> {
  TicketsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TicketsRoute.name,
          args: TicketsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TicketsRoute';

  static const PageInfo<TicketsRouteArgs> page =
      PageInfo<TicketsRouteArgs>(name);
}

class TicketsRouteArgs {
  const TicketsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TicketsRouteArgs{key: $key}';
  }
}
