import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:red_bus_crocos_project/domain/location/user_location.dart';

import 'user_location_failure.dart';

abstract class IUserLocationRepository {
  Future<Either<UserLocationFailure, UserLocation>> getLocation();

  Future<bool> askToGrantPermission();

  Future<bool> askToEnableLocationService();

  Stream<ServiceStatus> get serviceStatusStream;

  Future<bool> isLocationDifferent(UserLocation location);
}
