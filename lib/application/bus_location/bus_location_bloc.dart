import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:red_bus_crocos_project/domain/bus_location/bus_location_dto.dart';
import 'package:red_bus_crocos_project/infrastructure/core/dio_repo.dart';

part 'bus_location_event.dart';
part 'bus_location_state.dart';
part 'bus_location_bloc.freezed.dart';

@injectable
class BusLocationBloc extends Bloc<BusLocationEvent, BusLocationState> {
  Dio dio;
  DioRepository dioRepository = DioRepository();

  BusLocationBloc(this.dio) : super(const BusLocationState.initial()) {
    on<BusLocationEvent>((event, emit) async {
      await event.map(
        getBusLocation: (_) async {
          TrackingModel? trackingItem = await dioRepository.getBus();
          emit(BusLocationState.busLoaded(
              trackingItem?.item?.pos?.x, trackingItem?.item?.pos?.y));
        },
      );
    });
  }
}
