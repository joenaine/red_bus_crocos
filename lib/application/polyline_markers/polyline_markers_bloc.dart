import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_bus_crocos_project/core/constants/app_variables.dart';

part 'polyline_markers_event.dart';
part 'polyline_markers_state.dart';
part 'polyline_markers_bloc.freezed.dart';

List<LatLng> polylineList = [
  const LatLng(51.127435, 71.430624), // Baiterek
  const LatLng(51.1333138441602, 71.41448362556064), // Qonaeva
  const LatLng(51.14717952922538, 71.42252315359177), // Qabanbai na levo
  const LatLng(51.1483954, 71.4147056), // Ailand
  const LatLng(51.163214, 71.409881), // Kenesary
  const LatLng(51.161194, 71.418347), // Irchenko
  const LatLng(51.161249, 71.421492), //Zheltoksan 2/2
  const LatLng(51.161584, 71.428342), //Respublika
  const LatLng(51.151887, 71.428114), //Karaotkel most
  const LatLng(51.146116, 71.411903), //Xan Watyr
  const LatLng(51.117675, 71.401398), //Turan
  const LatLng(51.113018, 71.433133), //Mangilik el
  const LatLng(51.097023, 71.416867), //Uly Dala
  const LatLng(51.085004, 71.411811), //Turar Ryskulov
  const LatLng(51.086471, 71.401699), //Kabanbay
  const LatLng(51.118439, 71.411918), //Almaty
  const LatLng(51.109726, 71.463383), //Panfilova
  const LatLng(51.127626, 71.470630), //Kowkarbaeva
  const LatLng(51.124811, 71.437449), //Dostyk
  const LatLng(51.127435, 71.430624), //Baiterek
];

class PolylineMarkersBloc
    extends Bloc<PolylineMarkersEvent, PolylineMarkersState> {
  PolylineMarkersBloc() : super(PolylineMarkersState.initial()) {
    on<PolylineMarkersEvent>((event, emit) async {
      await event.map(
        generatePolylineMarkers: (_) async {
          await getPolylinePoints().then((coordinates) {
            generatePolylineFromPoints(coordinates);
          });
          emit(state.copyWith(polylines: polylines));
        },
      );
    });
  }

  Map<PolylineId, Polyline> polylines = {};

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    for (int i = 0; i < polylineList.length - 1; i++) {
      LatLng startPoint = polylineList[i];
      LatLng endPoint = polylineList[i + 1];

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          GOOGLE_MAPS_API_KEY,
          PointLatLng(startPoint.latitude, startPoint.longitude),
          PointLatLng(endPoint.latitude, endPoint.longitude),
          travelMode: TravelMode.driving);

      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
      } else {
        print(result.errorMessage);
      }
    }
    return polylineCoordinates;
  }

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blueGrey,
        points: polylineCoordinates,
        width: 4);

    polylines[id] = polyline;
  }
}
