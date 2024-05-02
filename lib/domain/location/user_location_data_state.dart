import 'package:red_bus_crocos_project/domain/location/user_location.dart';
import 'package:red_bus_crocos_project/domain/location/user_location_failure.dart';

abstract class UserLocationDataState {
  final UserLocation? data;
  final UserLocationFailure? error;

  const UserLocationDataState({this.data, this.error});
}
