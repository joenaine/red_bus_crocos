import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:red_bus_crocos_project/application/home/bus_location/bus_location_bloc.dart';
import 'package:red_bus_crocos_project/application/home/information_modal/information_modal_bloc.dart';
import 'package:red_bus_crocos_project/application/home/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/application/home/polyline_markers/polyline_markers_bloc.dart';
import 'package:red_bus_crocos_project/application/home/polyline_markers_huawei/polyline_markers_huawei_bloc.dart';
import 'package:red_bus_crocos_project/application/locale/locale_bloc.dart';
import 'package:red_bus_crocos_project/application/schedule/schedule_bloc.dart';
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
              ..add(const PolylineMarkersEvent.generatePolylineMarkers())),
        BlocProvider<PolylineMarkersHuaweiBloc>(
            create: (context) => PolylineMarkersHuaweiBloc()
              ..add(
                  const PolylineMarkersHuaweiEvent.generatePolylineMarkers())),
        BlocProvider<SightDetailBloc>(
            create: (context) => getIt<SightDetailBloc>()),
        BlocProvider<ScheduleBloc>(
            create: (context) =>
                ScheduleBloc()..add(const ScheduleEvent.getSchedule())),
        BlocProvider<SightsBloc>(
            create: (context) => getIt<SightsBloc>()..add(FetchSights())),
        BlocProvider<InformationModalBloc>(
            create: (context) => InformationModalBloc()
              ..add(const InformationModalEvent.getInformationModal())),
        BlocProvider<LocaleBloc>(
          create: (context) => getIt<LocaleBloc>(),
        ),
      ],
      child: OverlaySupport.global(
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
      ),
    );
  }
}
