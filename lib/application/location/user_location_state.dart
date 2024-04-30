part of 'user_location_bloc.dart';

@freezed
class UserLocationState with _$UserLocationState {
  const factory UserLocationState.initial() = _Initial;

  const factory UserLocationState.loading() = _Loading;

  const factory UserLocationState.loadSuccess({
    required UserLocation userLocation,
    required String userAddress,
    @Default(false) bool silent,
  }) = _LoadSuccess;

  const factory UserLocationState.loadFailure(
    UserLocationFailure userLocationFailure,
  ) = _LoadFailure;

  const factory UserLocationState.locationDisabled(
    UserLocationFailure userLocationFailure,
  ) = _LocationDisabled;

  const factory UserLocationState.locationPermissionDisabled(
    UserLocationFailure userLocationFailure,
  ) = _LocationPermissionDisabled;
}
