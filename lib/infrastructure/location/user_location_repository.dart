import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:red_bus_crocos_project/domain/location/i_user_location_repository.dart';
import 'package:red_bus_crocos_project/domain/location/user_location.dart';
import 'package:red_bus_crocos_project/domain/location/user_location_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String lastLongitudeKey = 'last_location_longitude';
const String lastLatitudeKey = 'last_location_latitude';

@LazySingleton(as: IUserLocationRepository)
class UserLocationRepository implements IUserLocationRepository {
  final SharedPreferences _preferences;

  UserLocationRepository(this._preferences);

  @override
  Future<Either<UserLocationFailure, UserLocation>> getLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return left(
        const UserLocationFailure.locationDisabled(
          'Location services are disabled.',
        ),
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return left(
          const UserLocationFailure.locationPermissionDisabled(
            'Location permissions are denied.',
          ),
        );
      } else if (permission == LocationPermission.deniedForever) {
        return left(
          const UserLocationFailure.locationPermissionDisabled(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        );
      }
    }

    //INFO: does not work without internet connection
    Position? position;

    try {
      position = await Geolocator.getCurrentPosition(
        timeLimit: const Duration(seconds: 60),
      );
    } on TimeoutException {
      return left(const UserLocationFailure.unableToGet());
      // ignore: unused_catch_stack
    } catch (e, stacktrace) {
      return left(const UserLocationFailure.unexpected());
    }

    final userLocation = UserLocation(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    await _setLastLocation(userLocation);

    return right(userLocation);
  }

  @override
  Future<bool> askToEnableLocationService() async {
    return Geolocator.openLocationSettings();
  }

  @override
  Future<bool> askToGrantPermission() async {
    return Geolocator.openAppSettings();
  }

  ///INFO: this is not implemented in Geolocator for web
  @override
  Stream<ServiceStatus> get serviceStatusStream =>
      GeolocatorPlatform.instance.getServiceStatusStream();

  Future<UserLocation?> _getLastLocationOrNull() async {
    final double? latitude = _preferences.getDouble(lastLatitudeKey);
    final double? longitude = _preferences.getDouble(lastLongitudeKey);

    if (latitude != null && longitude != null) {
      return UserLocation(
        latitude: latitude,
        longitude: longitude,
      );
    } else {
      return null;
    }
  }

  Future<void> _setLastLocation(UserLocation location) async {
    await _preferences.setDouble(lastLatitudeKey, location.latitude);
    await _preferences.setDouble(lastLongitudeKey, location.longitude);
  }

  ///Location is considered different if it is more than 100 meters
  @override
  Future<bool> isLocationDifferent(UserLocation location) async {
    final UserLocation? lastLocationOrNull = await _getLastLocationOrNull();

    if (lastLocationOrNull == null) {
      return true;
    } else {
      final distance = Geolocator.distanceBetween(
        location.latitude,
        location.longitude,
        lastLocationOrNull.latitude,
        lastLocationOrNull.longitude,
      );
      return distance > 100;
    }
  }
}
