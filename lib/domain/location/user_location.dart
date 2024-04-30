import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:red_bus_crocos_project/domain/location/user_location_data_state.dart';

part 'user_location.freezed.dart';

@freezed
class UserLocation extends UserLocationDataState with _$UserLocation {
  const UserLocation._();

  const factory UserLocation({
    required double latitude,
    required double longitude,
  }) = _UserLocation;
}
