import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:red_bus_crocos_project/domain/bus_location/bus_location_dto.dart';
import 'package:red_bus_crocos_project/infrastructure/bus_location/bus_location_repository.dart';

part 'bus_location_event.dart';

part 'bus_location_state.dart';

part 'bus_location_bloc.freezed.dart';

@injectable
class BusLocationBloc extends Bloc<BusLocationEvent, BusLocationState> {
  Dio dio;
  BusLocationRepository dioRepository = BusLocationRepository();

  BusLocationBloc(this.dio) : super(const BusLocationState.initial()) {
    on<BusLocationEvent>((event, emit) async {
      await event.map(
        getBusLocation: (_) async {
          Pos? pos = await dioRepository.getBus();

          if (pos != null) {
            late LatLng prev;
            state.map(initial: (_) {
              prev = LatLng(pos.y!, pos.x!);
            }, busLoaded: (val) {
              prev = val.current;
            });
            emit(BusLocationState.busLoaded(LatLng(pos.y!, pos.x!), prev));
          }
        },
      );
    });
  }
}
