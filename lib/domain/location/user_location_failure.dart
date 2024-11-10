import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_location_failure.freezed.dart';

@freezed
class UserLocationFailure with _$UserLocationFailure {
  const factory UserLocationFailure.unexpected() = _Unexpected;

  const factory UserLocationFailure.unableToGet() = _UnableToGet;

  const factory UserLocationFailure.locationDisabled(String message) =
      _LocationServiceDisabled;

  const factory UserLocationFailure.locationPermissionDisabled(String message) =
      _LocationPermissionDisabled;
}
