import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_bus_crocos_project/core/constants/app_variables.dart';
import 'package:red_bus_crocos_project/infrastructure/sights/sights_local_data.dart';

part 'polyline_markers_event.dart';
part 'polyline_markers_state.dart';
part 'polyline_markers_bloc.freezed.dart';

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
    for (int i = 0; i < sightSeeingList.length - 1; i++) {
      LatLng startPoint = sightSeeingList[i];
      LatLng endPoint = sightSeeingList[i + 1];

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
        color: Colors.red,
        points: polylineCoordinates,
        width: 4);

    polylines[id] = polyline;
  }
}
