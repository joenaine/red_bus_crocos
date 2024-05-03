import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_bus_crocos_project/application/bus_location/bus_location_bloc.dart';
import 'package:red_bus_crocos_project/application/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/application/sight/sights_bloc.dart';
import 'package:red_bus_crocos_project/core/constants/app_variables.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/infrastructure/bus_location/bus_location_repository.dart';
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

  double zoomValue = 12;

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      context
          .read<BusLocationBloc>()
          .add(const BusLocationEvent.getBusLocation());
    });
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
                      CameraPosition(target: _pAstana, zoom: zoomValue),
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
                  return BlocBuilder<SightsBloc, SightsState>(
                    builder: (context, sightsState) {
                      return BlocBuilder<BusLocationBloc, BusLocationState>(
                        builder: (context, busLocationState) {
                          log(busLocationState.toString());
                          return busLocationState.map(
                            initial: (_) {
                              return GoogleMap(
                                initialCameraPosition: CameraPosition(
                                    target: _pAstana, zoom: zoomValue),
                                markers: {
                                  if (sightsState is SightsLoaded)
                                    ...sightsState.data.map(
                                      (e) => Marker(
                                          markerId:
                                              MarkerId(e.obj_id.toString()),
                                          icon: BitmapDescriptor.defaultMarker,
                                          position: LatLng(
                                              double.parse(e.latitude!),
                                              double.parse(e.longitude!))),
                                    ),
                                  Marker(
                                      markerId: const MarkerId('_myLocation'),
                                      icon:
                                          BitmapDescriptor.defaultMarkerWithHue(
                                              BitmapDescriptor.hueCyan),
                                      position: LatLng(e.userLocation.latitude,
                                          e.userLocation.longitude)),
                                },
                              );
                            },
                            busLoaded: (busLocation) {
                              return GoogleMap(
                                onMapCreated: (controller) {
                                  _mapController.complete(controller);
                                  getPolylinePoints().then((coordinates) =>
                                      generatePolylineFromPoints(coordinates));
                                },
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(e.userLocation.latitude,
                                        e.userLocation.longitude),
                                    zoom: zoomValue),
                                markers: {
                                  if (sightsState is SightsLoaded)
                                    ...sightsState.data.map(
                                      (e) => Marker(
                                          markerId:
                                              MarkerId(e.obj_id.toString()),
                                          icon: BitmapDescriptor.defaultMarker,
                                          position: LatLng(
                                              double.parse(e.latitude!),
                                              double.parse(e.longitude!))),
                                    ),
                                  Marker(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 200,
                                              color: Colors.white,
                                            );
                                          },
                                        );
                                      },
                                      markerId: const MarkerId('_myLocation'),
                                      icon:
                                          BitmapDescriptor.defaultMarkerWithHue(
                                              BitmapDescriptor.hueCyan),
                                      position: LatLng(e.userLocation.latitude,
                                          e.userLocation.longitude)),
                                  Marker(
                                      markerId: const MarkerId('_busLocation'),
                                      icon:
                                          BitmapDescriptor.defaultMarkerWithHue(
                                              BitmapDescriptor.hueGreen),
                                      position: LatLng(
                                          busLocation.latitude ?? 0,
                                          busLocation.longitude ?? 0))
                                },
                                polylines: Set<Polyline>.of(polylines.values),
                              );
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

  Map<PolylineId, Polyline> polylines = {};

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition =
        CameraPosition(target: pos, zoom: zoomValue);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoodinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAPS_API_KEY,
        PointLatLng(_pAstana.latitude, _pAstana.longitude),
        PointLatLng(_pAstanaAiland.latitude, _pAstanaAiland.longitude),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoodinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    return polylineCoodinates;
  }

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 4);

    setState(() {
      polylines[id] = polyline;
    });
  }
}
