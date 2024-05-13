part of 'user_location_bloc.dart';

@freezed
class UserLocationEvent with _$UserLocationEvent {
  const factory UserLocationEvent.getLocation({
    @Default(false) bool silent,
  }) = _GetUserLocation;

  const factory UserLocationEvent.askToEnableLocationServices() =
      _AskToEnableLocationServices;

  const factory UserLocationEvent.askLocationPermission() =
      _AskLocationPermission;

  const factory UserLocationEvent.parseLocation({
    required UserLocationDataState failureOrUserLocation,
    @Default(false) bool silent,
  }) = _ParseLocation;
}
