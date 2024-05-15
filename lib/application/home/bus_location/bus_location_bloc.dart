import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gMaps;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huawei_map/huawei_map.dart' as hMaps;
import 'package:injectable/injectable.dart';
import 'package:red_bus_crocos_project/core/utils/helpers/device_info.dart';
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

          bool isHuawei = await DeviceInfoService.isHuaweiDevice();

          if (isHuawei) {
            if (pos != null) {
              late hMaps.LatLng prev;
              state.map(initial: (_) {
                prev = hMaps.LatLng(pos.y!, pos.x!);
              }, busLoaded: (val) {
                prev = val.currentHmaps!;
              });
              emit(BusLocationState.busLoaded(
                  currentHmaps: hMaps.LatLng(pos.y!, pos.x!), prevHmaps: prev));
            }
          }

          if (pos != null) {
            late gMaps.LatLng prev;
            state.map(initial: (_) {
              prev = gMaps.LatLng(pos.y!, pos.x!);
            }, busLoaded: (val) {
              prev = val.current!;
            });
            emit(BusLocationState.busLoaded(
                current: gMaps.LatLng(pos.y!, pos.x!), prev: prev));
          }
        },
      );
    });
  }
}
