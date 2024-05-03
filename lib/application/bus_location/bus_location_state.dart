part of 'bus_location_bloc.dart';

@freezed
class BusLocationState with _$BusLocationState {
  const factory BusLocationState.initial() = _Initial;
  const factory BusLocationState.busLoaded(
    double? longitude,
    double? latitude,
  ) = _BusLoaded;
}
