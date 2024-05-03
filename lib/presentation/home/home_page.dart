import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_bus_crocos_project/application/bus_location/bus_location_bloc.dart';
import 'package:red_bus_crocos_project/application/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/infrastructure/core/dio_repo.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const LatLng _pAstana = LatLng(51.169392, 71.449074);
  static const LatLng _pAstanaAiland = LatLng(51.1480892, 71.4161325);
  // final LatLng _busLocation = const LatLng(51.1107, 71.5327233);
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await DioRepository().getBus();
    // });
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      context
          .read<BusLocationBloc>()
          .add(const BusLocationEvent.getBusLocation());
    });
    // context
    //     .read<BusLocationBloc>()
    //     .add(const BusLocationEvent.getBusLocation());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.route.tr(),
      child: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          return BlocBuilder<UserLocationBloc, UserLocationState>(
            builder: (context, userLocationState) {
              return userLocationState.map(
                initial: (_) => const SizedBox(),
                loading: (_) => GoogleMap(
                  initialCameraPosition:
                      const CameraPosition(target: _pAstana, zoom: 9),
                  markers: {
                    const Marker(
                        markerId: MarkerId('_currentLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pAstana),
                    const Marker(
                        markerId: MarkerId('_ailand'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pAstanaAiland),
                  },
                ),
                loadSuccess: (e) {
                  return BlocBuilder<BusLocationBloc, BusLocationState>(
                    builder: (context, busLocationState) {
                      log(busLocationState.toString());
                      return busLocationState.map(
                        initial: (_) {
                          return GoogleMap(
                            initialCameraPosition:
                                const CameraPosition(target: _pAstana, zoom: 9),
                            markers: {
                              const Marker(
                                  markerId: MarkerId('_currentLocation'),
                                  icon: BitmapDescriptor.defaultMarker,
                                  position: _pAstana),
                              const Marker(
                                  markerId: MarkerId('_ailand'),
                                  icon: BitmapDescriptor.defaultMarker,
                                  position: _pAstanaAiland),
                              Marker(
                                  markerId: const MarkerId('_myLocation'),
                                  icon: BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueCyan),
                                  position: LatLng(e.userLocation.latitude,
                                      e.userLocation.longitude)),
                            },
                          );
                        },
                        busLoaded: (busLocation) {
                          return GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: LatLng(busLocation.latitude!,
                                    busLocation.longitude!),
                                zoom: 9),
                            markers: {
                              const Marker(
                                  markerId: MarkerId('_currentLocation'),
                                  icon: BitmapDescriptor.defaultMarker,
                                  position: _pAstana),
                              const Marker(
                                  markerId: MarkerId('_ailand'),
                                  icon: BitmapDescriptor.defaultMarker,
                                  position: _pAstanaAiland),
                              Marker(
                                  markerId: const MarkerId('_myLocation'),
                                  icon: BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueCyan),
                                  position: LatLng(e.userLocation.latitude,
                                      e.userLocation.longitude)),
                              Marker(
                                  markerId: const MarkerId('_busLocation'),
                                  icon: BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueGreen),
                                  position: LatLng(busLocation.latitude!,
                                      busLocation.longitude!))
                            },
                          );
                        },
                      );
                    },
                  );
                },
                loadFailure: (_) {
                  return TextButton(
                      onPressed: () {
                        context.read<UserLocationBloc>().add(
                              const UserLocationEvent.getLocation(),
                            );
                      },
                      child: const Text('Could not detect your location'));
                },
                locationDisabled: (_) {
                  return TextButton(
                      onPressed: () {
                        context.read<UserLocationBloc>().add(
                              const UserLocationEvent
                                  .askToEnableLocationServices(),
                            );
                      },
                      child: const Text('Device location disabled'));
                },
                locationPermissionDisabled: (_) {
                  return TextButton(
                      onPressed: () {
                        context.read<UserLocationBloc>().add(
                            const UserLocationEvent.askLocationPermission());
                      },
                      child: const Text('Device location disabled'));
                },
              );
            },
          );
        },
      ),
    );
  }
}
