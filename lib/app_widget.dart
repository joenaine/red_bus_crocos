import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_bus_crocos_project/application/bus_location/bus_location_bloc.dart';
import 'package:red_bus_crocos_project/application/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/application/polyline_markers/polyline_markers_bloc.dart';
import 'package:red_bus_crocos_project/core/theme/app_theme.dart';
import 'package:red_bus_crocos_project/domain/location/i_user_location_repository.dart';
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart';
import 'package:red_bus_crocos_project/injection.dart';
import 'package:red_bus_crocos_project/presentation/routes/route_observer.dart';
import 'package:red_bus_crocos_project/presentation/routes/router.dart';

import 'application/sight/sights_bloc.dart';
import 'application/sight_detail/sight_detail_bloc.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>(
          create: (context) => getIt<ConnectivityCubit>(),
        ),
        BlocProvider<UserLocationBloc>(
          create: (context) => UserLocationBloc(
            getIt<IUserLocationRepository>(),
            BlocProvider.of<ConnectivityCubit>(context),
          )..add(const UserLocationEvent.getLocation()),
        ),
        BlocProvider<BusLocationBloc>(
            create: (context) => getIt<BusLocationBloc>()),
        BlocProvider<PolylineMarkersBloc>(
            create: (context) => PolylineMarkersBloc()
              ..add(const PolylineMarkersEvent.generatePolylineMarkers()))
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
