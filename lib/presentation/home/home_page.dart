import 'dart:async';
import 'dart:math' as Math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:red_bus_crocos_project/application/home/bus_location/bus_location_bloc.dart';
import 'package:red_bus_crocos_project/application/home/information_modal/information_modal_bloc.dart';
import 'package:red_bus_crocos_project/application/home/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/application/home/polyline_markers/polyline_markers_bloc.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/domain/sight/sight_wp_dto.dart';
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/infrastructure/bus_location/bus_location_repository.dart';
import 'package:red_bus_crocos_project/infrastructure/sights/sights_local_data.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/indents.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/text_sizes.dart';
import 'package:red_bus_crocos_project/presentation/home/helpers/custom_market.dart';
import 'package:red_bus_crocos_project/presentation/home/widgets/cupertino_dialog_alert.dart';
import 'package:red_bus_crocos_project/presentation/home/widgets/modal_dialog.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const LatLng _pAstana = LatLng(51.1323332, 71.4237316);

  late Timer _timer;
  late Timer _timerInfoModal;

  double zoomValue = 12;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  Completer<BitmapDescriptor> starIconCompleter = Completer();
  Completer<BitmapDescriptor> userIconCompleter = Completer();
  Completer<BitmapDescriptor> busIconCompleter = Completer();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      context
          .read<BusLocationBloc>()
          .add(const BusLocationEvent.getBusLocation());
    });
    _timerInfoModal = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted) {
        context
            .read<InformationModalBloc>()
            .add(const InformationModalEvent.getInformationModal());
        if (counter == 0) {
          context
              .read<InformationModalBloc>()
              .add(const InformationModalEvent.getDismissableModal());
        }
      }
    });

    initIcons();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await setBusToken();
    });
  }

  Future<void> setBusToken() async {
    await BusLocationRepository.fetchToken()
        .then((value) async => await BusLocationRepository.setBusToken(value));
  }

  void initIcons() async {
    BitmapDescriptor starIcon =
        await SvgPicture.asset(AppAssets.svg.redStar).toBitmapDescriptor();
    starIconCompleter.complete(starIcon);

    BitmapDescriptor busIcon = await CustomMarker.createCustomMarkerWithTitle(
      AppAssets.svg.busLocation, // Your SVG asset path
      'The Bus',
    );
    busIconCompleter.complete(busIcon);

    BitmapDescriptor userIcon =
        await SvgPicture.asset(AppAssets.svg.userLocation, height: 12)
            .toBitmapDescriptor();
    userIconCompleter.complete(userIcon);

    mapMarkers.addAll(sightSeeingList
        .asMap()
        .map((i, e) => MapEntry(
            i,
            Marker(
                markerId: MarkerId(e.latitude.toString()),
                icon: starIcon,
                infoWindow: InfoWindow(
                  title: sightSeeingNamesList[i],
                ),
                position: LatLng(e.latitude, e.longitude))))
        .values
        .toList());

    // mapMarkers.addAll(sightSeeingList.map(
    //   (e) => Marker(
    //       markerId: MarkerId(e.latitude.toString()),
    //       icon: starIcon,
    //       infoWindow: const InfoWindow(
    //         title: ,
    //       ),
    //       position: LatLng(e.latitude, e.longitude)),
    // ));
  }

  double calculateBearing(LatLng startPoint, LatLng endPoint) {
    final double startLat = toRadians(startPoint.latitude);
    final double startLng = toRadians(startPoint.longitude);
    final double endLat = toRadians(endPoint.latitude);
    final double endLng = toRadians(endPoint.longitude);

    final double deltaLng = endLng - startLng;

    final double y = Math.sin(deltaLng) * Math.cos(endLat);
    final double x = Math.cos(startLat) * Math.sin(endLat) -
        Math.sin(startLat) * Math.cos(endLat) * Math.cos(deltaLng);

    final double bearing = Math.atan2(y, x);

    return (toDegrees(bearing) + 360) % 360;
  }

  double toRadians(double degrees) {
    return degrees * (Math.pi / 180.0);
  }

  double toDegrees(double radians) {
    return radians * (180.0 / Math.pi);
  }

  Set<Marker> mapMarkers = {};
  Set<Polyline> mapPolylines = {};
  LatLng? myLocation;
  LatLng? busPosition;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  bool trigger = false;
  SightWPDto? modalInfo;
  SightWPDto? modalDismissableInfo;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.route.tr(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<ConnectivityCubit, ConnectivityState>(
            listener: (context, state) {
              if (!state.hasConnection) {
                showSimpleNotification(
                    Text(
                      LocaleKeys.no_internet_access.tr(),
                      selectionColor: Colors.white,
                    ),
                    background: Colors.green,
                    duration: const Duration(seconds: 10));
              }
            },
          ),
          BlocListener<UserLocationBloc, UserLocationState>(
            listener: (context, userLocationState) {
              userLocationState.map(
                  initial: (_) {},
                  loading: (_) {},
                  loadSuccess: (value) async {
                    final icon = await userIconCompleter.future;
                    mapMarkers.removeWhere(
                        (element) => element.markerId.value == "_myLocation");
                    mapMarkers.add(
                      Marker(
                        markerId: const MarkerId('_myLocation'),
                        icon: icon,
                        position: LatLng(value.userLocation.latitude,
                            value.userLocation.longitude),
                      ),
                    );

                    myLocation = LatLng(value.userLocation.latitude,
                        value.userLocation.longitude);

                    setState(() {});
                  },
                  loadFailure: (_) {
                    // showCupertinoDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return CupertinoAlertDialog(
                    //         title: const Text('Alert'),
                    //         content: Text(LocaleKeys.not_detect_location.tr()),
                    //         actions: <Widget>[
                    //           CupertinoDialogAction(
                    //             child: const Text('Cancel'),
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //           ),
                    //           CupertinoDialogAction(
                    //             child: const Text('Try again'),
                    //             onPressed: () {
                    //               context.read<UserLocationBloc>().add(
                    //                     const UserLocationEvent.getLocation(),
                    //                   );
                    //               Navigator.of(context).pop();
                    //             },
                    //           ),
                    //         ],
                    //       );
                    //     });
                  },
                  locationDisabled: (_) {
                    CustomCupertinoDialog.call(
                      context: context,
                      content: LocaleKeys.enable.tr(),
                      actionText: LocaleKeys.enable.tr(),
                      onPressed: () {
                        context.read<UserLocationBloc>().add(
                              const UserLocationEvent
                                  .askToEnableLocationServices(),
                            );
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  locationPermissionDisabled: (_) {
                    CustomCupertinoDialog.call(
                      context: context,
                      content: LocaleKeys.location_not_granted.tr(),
                      actionText: LocaleKeys.location_not_granted.tr(),
                      onPressed: () {
                        context.read<UserLocationBloc>().add(
                            const UserLocationEvent.askLocationPermission());
                        Navigator.of(context).pop();
                      },
                    );
                  });
            },
          ),
          BlocListener<InformationModalBloc, InformationModalState>(
            listener: (context, state) {
              modalInfo = state.modalInfo;
              modalDismissableInfo = state.modalDismissableInfo;

              //TODO: UNCOMMENT
              if (state.modalInfo?.acfData?.trigger == true &&
                  state.modalDismissableInfo?.acfData?.trigger == false) {
                trigger = true;
                modalInfo = state.modalInfo;
              } else {
                trigger = false;
              }

              if (state.modalDismissableInfo?.acfData?.trigger == true) {
                ModalDialog.show(context,
                    title: state.modalDismissableInfo?.title,
                    content: state.modalDismissableInfo?.content);
                counter++;
              }
              setState(() {});
            },
          ),
          BlocListener<BusLocationBloc, BusLocationState>(
            listener: (context, state) {
              state.map(
                initial: (_) {},
                busLoaded: (busLocation) async {
                  final icon = await busIconCompleter.future;

                  mapMarkers.removeWhere(
                      (element) => element.markerId.value == "busLocation");
                  mapMarkers.add(Marker(
                      markerId: const MarkerId('busLocation'),
                      icon: icon,
                      position: busLocation.current!,
                      rotation: busLocation.prev != null
                          ? calculateBearing(
                              busLocation.prev!, busLocation.current!)
                          : 0.0));
                  busPosition = busLocation.current;

                  setState(() {});
                },
              );
            },
          ),
          BlocListener<PolylineMarkersBloc, PolylineMarkersState>(
            listener: (context, state) {
              setState(() {
                mapPolylines = Set<Polyline>.of(state.polylines?.values ?? {});
              });
            },
          ),
        ],
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: (controller) {
                _mapController.complete(controller);
              },
              initialCameraPosition:
                  CameraPosition(target: _pAstana, zoom: zoomValue),
              markers: mapMarkers,
              polylines: mapPolylines,
            ),
            if (trigger)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      bottom: kBottomNavigationBarHeight + 50,
                      right: 16,
                      left: 16),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(30)),
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSizes.s24w500(modalInfo?.title ?? ''),
                      Indent.h8(),
                      TextSizes.s16w500(modalInfo?.content ?? '')
                    ],
                  ),
                ),
              ),
            if (myLocation != null && !trigger)
              Positioned(
                  right: 10,
                  bottom: kBottomNavigationBarHeight + 40,
                  child: InkWell(
                    onTap: () {
                      _cameraToPosition(
                          LatLng(myLocation!.latitude, myLocation!.longitude));
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.red,
                      child: Icon(Icons.my_location),
                    ),
                  )),
            if (busPosition != null && !trigger)
              Positioned(
                  right: 10,
                  bottom: kBottomNavigationBarHeight + 120,
                  child: InkWell(
                    onTap: () {
                      _cameraToPosition(busPosition!);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.backgroundDark,
                      child: SvgPicture.asset(AppAssets.svg.busIcon),
                    ),
                  ))
          ],
        ),
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
}
