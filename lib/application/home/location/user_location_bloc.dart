import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:red_bus_crocos_project/domain/location/i_user_location_repository.dart';
import 'package:red_bus_crocos_project/domain/location/user_location.dart';
import 'package:red_bus_crocos_project/domain/location/user_location_failure.dart';
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart';
import 'package:bloc_concurrency/src/sequential.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';
part 'user_location_bloc.freezed.dart';

@injectable
class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final IUserLocationRepository _userLocationRepository;
  final ConnectivityCubit _connectivityCubit;

  StreamSubscription<ServiceStatus>? _serviceStatusSubscription;
  StreamSubscription<ConnectivityState>? _connectivitySubscription;

  UserLocationBloc(
    this._userLocationRepository,
    this._connectivityCubit,
  ) : super(const UserLocationState.initial()) {
    _serviceStatusSubscription =
        _userLocationRepository.serviceStatusStream.listen(
      (status) {
        add(const UserLocationEvent.getLocation());
      },
    );

    _connectivitySubscription = _connectivityCubit.stream.listen(
      (event) {
        add(const UserLocationEvent.getLocation(silent: true));
      },
    );

    setEventHandlers();
  }

  void setEventHandlers() {
    on<UserLocationEvent>(
      (event, emit) async {
        await event.map(
          askLocationPermission: (event) async {
            await _userLocationRepository.askToGrantPermission();
            add(const UserLocationEvent.getLocation());
          },
          askToEnableLocationServices: (event) async {
            await _userLocationRepository.askToEnableLocationService();
          },
          getLocation: (e) => e.silent
              ? _silentGetLocationEventHandler(e, emit)
              : _getLocationEventHandler(e, emit),
          parseLocation: (e) => _parseLocationEventHandler(e, emit),
        );
      },
      //restartable doesn't work properly here
      transformer: sequential(),
    );
  }

  Future<void> _silentGetLocationEventHandler(
    _GetUserLocation event,
    Emitter<UserLocationState> emitter,
  ) async {
    final location = await _userLocationRepository.getLocation().timeout(
          const Duration(seconds: 60),
          onTimeout: () => left(
            const UserLocationFailure.unableToGet(),
          ),
        );

    await location.fold(
      (l) {
        //TODO add a separate event to parse error
        //parse the location to show the error
        add(UserLocationEvent.parseLocation(failureOrUserLocation: location));
      },
      (r) async {
        final isLocationDifferent =
            await _userLocationRepository.isLocationDifferent(r);
        if (isLocationDifferent) {
          add(
            UserLocationEvent.parseLocation(
              failureOrUserLocation: location,
            ),
          );
        }
        {
          add(
            UserLocationEvent.parseLocation(
              failureOrUserLocation: location,
              silent: true,
            ),
          );
        }
      },
    );
  }

  Future<void> _parseLocationEventHandler(
    _ParseLocation event,
    Emitter<UserLocationState> emitter,
  ) async {
    await event.failureOrUserLocation.fold(
      (f) {
        f.map(
          unexpected: (failure) {
            emitter(
              UserLocationState.loadFailure(failure),
            );
          },
          unableToGet: (failure) {
            emitter(
              UserLocationState.loadFailure(failure),
            );
          },
          locationDisabled: (failure) {
            emitter(
              UserLocationState.locationDisabled(failure),
            );
          },
          locationPermissionDisabled: (failure) {
            emitter(
              UserLocationState.locationPermissionDisabled(failure),
            );
          },
        );
      },
      (location) async {
        String userAddress = 'Unable to locate';

        //INFO: error when internet is not available
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          location.latitude,
          location.longitude,
        ).onError(
          (error, stackTrace) => [],
        );

        if (placemarks.isNotEmpty) {
          final streetAddress = placemarks[0].street.toString().trim();
          final locality = placemarks[0].locality.toString().trim();
          final separator = streetAddress.isNotEmpty ? ', ' : '';
          userAddress = streetAddress + separator + locality;
        }

        emitter(
          UserLocationState.loadSuccess(
            userLocation: location,
            userAddress: userAddress,
            silent: event.silent,
          ),
        );
      },
    );
  }

  Future<void> _getLocationEventHandler(
    _GetUserLocation event,
    Emitter<UserLocationState> emitter,
  ) async {
    emitter(const UserLocationState.loading());

    final location = await _userLocationRepository.getLocation().timeout(
          const Duration(seconds: 60),
          onTimeout: () => left(
            const UserLocationFailure.unableToGet(),
          ),
        );

    add(UserLocationEvent.parseLocation(failureOrUserLocation: location));
  }

  @override
  Future<void> close() async {
    await _serviceStatusSubscription?.cancel();
    await _connectivitySubscription?.cancel();
    super.close();
  }
}
