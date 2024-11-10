import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.freezed.dart';

@freezed
class UserLocation with _$UserLocation {
  const UserLocation._();

  const factory UserLocation({
    required double latitude,
    required double longitude,
  }) = _UserLocation;
}
