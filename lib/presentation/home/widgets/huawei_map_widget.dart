import 'dart:async';
import 'dart:math' as Math;
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/application/home/bus_location/bus_location_bloc.dart';
import 'package:red_bus_crocos_project/application/home/information_modal/information_modal_bloc.dart';
import 'package:red_bus_crocos_project/application/home/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/application/home/polyline_markers_huawei/polyline_markers_huawei_bloc.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/domain/sight/sight_wp_dto.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/infrastructure/sights/sights_local_data.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/indents.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/text_sizes.dart';
import 'package:red_bus_crocos_project/presentation/home/widgets/huawei_bitmap.dart';
import 'package:huawei_map/huawei_map.dart';

@RoutePage()
class HuaweiHomePage extends StatefulWidget {
  const HuaweiHomePage({super.key});

  @override
  State<HuaweiHomePage> createState() => _HuaweiHomePageState();
}

class _HuaweiHomePageState extends State<HuaweiHomePage> {
  static const LatLng _pAstana = LatLng(51.1323332, 71.4237316);

  // final LatLng _busLocation = const LatLng(51.1107, 71.5327233);
  late Timer _timer;

  double zoomValue = 12;

  final Completer<HuaweiMapController> _huaweiMapController =
      Completer<HuaweiMapController>();

  Completer<BitmapDescriptor> starIconCompleter = Completer();
  Completer<BitmapDescriptor> userIconCompleter = Completer();
  Completer<BitmapDescriptor> busIconCompleter = Completer();

  @override
  void initState() {
    super.initState();
    // _checkDevice();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      context
          .read<BusLocationBloc>()
          .add(const BusLocationEvent.getBusLocation());
    });
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      context
          .read<InformationModalBloc>()
          .add(const InformationModalEvent.getInformationModal());
    });

    initIcons();
  }

  void initIcons() async {
    BitmapDescriptor starIcon = await SvgPicture.asset(AppAssets.svg.redStar)
        .toBitmapDescriptorHuawei();
    starIconCompleter.complete(starIcon);

    BitmapDescriptor busIcon = await SvgPicture.asset(AppAssets.svg.busLocation)
        .toBitmapDescriptorHuawei();
    busIconCompleter.complete(busIcon);

    BitmapDescriptor userIcon =
        await SvgPicture.asset(AppAssets.svg.userLocation)
            .toBitmapDescriptorHuawei();
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
    final double startLat = toRadians(startPoint.lat);
    final double startLng = toRadians(startPoint.lng);
    final double endLat = toRadians(endPoint.lat);
    final double endLng = toRadians(endPoint.lng);

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

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.route.tr(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserLocationBloc, UserLocationState>(
            listener: (context, userLocationState) {
              userLocationState.map(
                  initial: (_) {},
                  loading: (_) {},
                  loadSuccess: (value) async {
                    final icon = await userIconCompleter.future;
                    mapMarkers.removeWhere(
                        (element) => element.markerId.id == "_myLocation");
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
                  loadFailure: (_) {},
                  locationDisabled: (_) {},
                  locationPermissionDisabled: (_) {});
            },
          ),
          BlocListener<InformationModalBloc, InformationModalState>(
            listener: (context, state) {
              modalInfo = state.modalInfo;
              //TODO: UNCOMMENT
              if (state.modalInfo?.acfData?.trigger == true) {
                trigger = true;
                modalInfo = state.modalInfo;
              } else {
                trigger = false;
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
                      (element) => element.markerId.id == "busLocation");
                  mapMarkers.add(Marker(
                      markerId: const MarkerId('busLocation'),
                      icon: icon,
                      position: busLocation.currentHmaps!,
                      rotation: busLocation.prev != null
                          ? calculateBearing(
                              busLocation.prevHmaps!, busLocation.currentHmaps!)
                          : 0.0));
                  busPosition = busLocation.currentHmaps;

                  setState(() {});
                },
              );
            },
          ),
          BlocListener<PolylineMarkersHuaweiBloc, PolylineMarkersHuaweiState>(
            listener: (context, state) {
              setState(() {
                mapPolylines = Set<Polyline>.of(state.polylines?.values ?? {});
              });
            },
          ),
        ],
        child: Stack(
          children: [
            HuaweiMap(
              onMapCreated: (HuaweiMapController controller) {
                _huaweiMapController.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(_pAstana.lat, _pAstana.lng), zoom: zoomValue),
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
                          LatLng(myLocation!.lat, myLocation!.lng));
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.lightRed,
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
    final HuaweiMapController controller = await _huaweiMapController.future;
    CameraPosition newCameraPosition =
        CameraPosition(target: pos, zoom: zoomValue);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }
}
