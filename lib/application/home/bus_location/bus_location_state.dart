part of 'bus_location_bloc.dart';

@freezed
class BusLocationState with _$BusLocationState {
  const factory BusLocationState.initial() = _Initial;
  const factory BusLocationState.busLoaded({
    gMaps.LatLng? current,
    gMaps.LatLng? prev,
    hMaps.LatLng? currentHmaps,
    hMaps.LatLng? prevHmaps,
  }) = _BusLoaded;
}
