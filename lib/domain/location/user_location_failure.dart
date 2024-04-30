import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:red_bus_crocos_project/domain/location/user_location_data_state.dart';
part 'user_location_failure.freezed.dart';

@freezed
class UserLocationFailure extends UserLocationDataState
    with _$UserLocationFailure {
  const UserLocationFailure._();
  const factory UserLocationFailure.unexpected() = _Unexpected;

  const factory UserLocationFailure.unableToGet() = _UnableToGet;

  const factory UserLocationFailure.locationDisabled(String message) =
      _LocationServiceDisabled;

  const factory UserLocationFailure.locationPermissionDisabled(String message) =
      _LocationPermissionDisabled;
}
