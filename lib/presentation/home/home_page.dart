import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_bus_crocos_project/application/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
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
                      const CameraPosition(target: _pAstana, zoom: 13),
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
                  return GoogleMap(
                    initialCameraPosition:
                        const CameraPosition(target: _pAstana, zoom: 13),
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
                              e.userLocation.longitude))
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
