// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserLocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool silent) getLocation,
    required TResult Function() askToEnableLocationServices,
    required TResult Function() askLocationPermission,
    required TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)
        parseLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool silent)? getLocation,
    TResult? Function()? askToEnableLocationServices,
    TResult? Function()? askLocationPermission,
    TResult? Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool silent)? getLocation,
    TResult Function()? askToEnableLocationServices,
    TResult Function()? askLocationPermission,
    TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserLocation value) getLocation,
    required TResult Function(_AskToEnableLocationServices value)
        askToEnableLocationServices,
    required TResult Function(_AskLocationPermission value)
        askLocationPermission,
    required TResult Function(_ParseLocation value) parseLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserLocation value)? getLocation,
    TResult? Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult? Function(_AskLocationPermission value)? askLocationPermission,
    TResult? Function(_ParseLocation value)? parseLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserLocation value)? getLocation,
    TResult Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult Function(_AskLocationPermission value)? askLocationPermission,
    TResult Function(_ParseLocation value)? parseLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationEventCopyWith<$Res> {
  factory $UserLocationEventCopyWith(
          UserLocationEvent value, $Res Function(UserLocationEvent) then) =
      _$UserLocationEventCopyWithImpl<$Res, UserLocationEvent>;
}

/// @nodoc
class _$UserLocationEventCopyWithImpl<$Res, $Val extends UserLocationEvent>
    implements $UserLocationEventCopyWith<$Res> {
  _$UserLocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUserLocationImplCopyWith<$Res> {
  factory _$$GetUserLocationImplCopyWith(_$GetUserLocationImpl value,
          $Res Function(_$GetUserLocationImpl) then) =
      __$$GetUserLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool silent});
}

/// @nodoc
class __$$GetUserLocationImplCopyWithImpl<$Res>
    extends _$UserLocationEventCopyWithImpl<$Res, _$GetUserLocationImpl>
    implements _$$GetUserLocationImplCopyWith<$Res> {
  __$$GetUserLocationImplCopyWithImpl(
      _$GetUserLocationImpl _value, $Res Function(_$GetUserLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? silent = null,
  }) {
    return _then(_$GetUserLocationImpl(
      silent: null == silent
          ? _value.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetUserLocationImpl implements _GetUserLocation {
  const _$GetUserLocationImpl({this.silent = false});

  @override
  @JsonKey()
  final bool silent;

  @override
  String toString() {
    return 'UserLocationEvent.getLocation(silent: $silent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserLocationImpl &&
            (identical(other.silent, silent) || other.silent == silent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, silent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserLocationImplCopyWith<_$GetUserLocationImpl> get copyWith =>
      __$$GetUserLocationImplCopyWithImpl<_$GetUserLocationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool silent) getLocation,
    required TResult Function() askToEnableLocationServices,
    required TResult Function() askLocationPermission,
    required TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)
        parseLocation,
  }) {
    return getLocation(silent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool silent)? getLocation,
    TResult? Function()? askToEnableLocationServices,
    TResult? Function()? askLocationPermission,
    TResult? Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
  }) {
    return getLocation?.call(silent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool silent)? getLocation,
    TResult Function()? askToEnableLocationServices,
    TResult Function()? askLocationPermission,
    TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation(silent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserLocation value) getLocation,
    required TResult Function(_AskToEnableLocationServices value)
        askToEnableLocationServices,
    required TResult Function(_AskLocationPermission value)
        askLocationPermission,
    required TResult Function(_ParseLocation value) parseLocation,
  }) {
    return getLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserLocation value)? getLocation,
    TResult? Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult? Function(_AskLocationPermission value)? askLocationPermission,
    TResult? Function(_ParseLocation value)? parseLocation,
  }) {
    return getLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserLocation value)? getLocation,
    TResult Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult Function(_AskLocationPermission value)? askLocationPermission,
    TResult Function(_ParseLocation value)? parseLocation,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation(this);
    }
    return orElse();
  }
}

abstract class _GetUserLocation implements UserLocationEvent {
  const factory _GetUserLocation({final bool silent}) = _$GetUserLocationImpl;

  bool get silent;
  @JsonKey(ignore: true)
  _$$GetUserLocationImplCopyWith<_$GetUserLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AskToEnableLocationServicesImplCopyWith<$Res> {
  factory _$$AskToEnableLocationServicesImplCopyWith(
          _$AskToEnableLocationServicesImpl value,
          $Res Function(_$AskToEnableLocationServicesImpl) then) =
      __$$AskToEnableLocationServicesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AskToEnableLocationServicesImplCopyWithImpl<$Res>
    extends _$UserLocationEventCopyWithImpl<$Res,
        _$AskToEnableLocationServicesImpl>
    implements _$$AskToEnableLocationServicesImplCopyWith<$Res> {
  __$$AskToEnableLocationServicesImplCopyWithImpl(
      _$AskToEnableLocationServicesImpl _value,
      $Res Function(_$AskToEnableLocationServicesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AskToEnableLocationServicesImpl
    implements _AskToEnableLocationServices {
  const _$AskToEnableLocationServicesImpl();

  @override
  String toString() {
    return 'UserLocationEvent.askToEnableLocationServices()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AskToEnableLocationServicesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool silent) getLocation,
    required TResult Function() askToEnableLocationServices,
    required TResult Function() askLocationPermission,
    required TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)
        parseLocation,
  }) {
    return askToEnableLocationServices();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool silent)? getLocation,
    TResult? Function()? askToEnableLocationServices,
    TResult? Function()? askLocationPermission,
    TResult? Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
  }) {
    return askToEnableLocationServices?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool silent)? getLocation,
    TResult Function()? askToEnableLocationServices,
    TResult Function()? askLocationPermission,
    TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
    required TResult orElse(),
  }) {
    if (askToEnableLocationServices != null) {
      return askToEnableLocationServices();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserLocation value) getLocation,
    required TResult Function(_AskToEnableLocationServices value)
        askToEnableLocationServices,
    required TResult Function(_AskLocationPermission value)
        askLocationPermission,
    required TResult Function(_ParseLocation value) parseLocation,
  }) {
    return askToEnableLocationServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserLocation value)? getLocation,
    TResult? Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult? Function(_AskLocationPermission value)? askLocationPermission,
    TResult? Function(_ParseLocation value)? parseLocation,
  }) {
    return askToEnableLocationServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserLocation value)? getLocation,
    TResult Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult Function(_AskLocationPermission value)? askLocationPermission,
    TResult Function(_ParseLocation value)? parseLocation,
    required TResult orElse(),
  }) {
    if (askToEnableLocationServices != null) {
      return askToEnableLocationServices(this);
    }
    return orElse();
  }
}

abstract class _AskToEnableLocationServices implements UserLocationEvent {
  const factory _AskToEnableLocationServices() =
      _$AskToEnableLocationServicesImpl;
}

/// @nodoc
abstract class _$$AskLocationPermissionImplCopyWith<$Res> {
  factory _$$AskLocationPermissionImplCopyWith(
          _$AskLocationPermissionImpl value,
          $Res Function(_$AskLocationPermissionImpl) then) =
      __$$AskLocationPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AskLocationPermissionImplCopyWithImpl<$Res>
    extends _$UserLocationEventCopyWithImpl<$Res, _$AskLocationPermissionImpl>
    implements _$$AskLocationPermissionImplCopyWith<$Res> {
  __$$AskLocationPermissionImplCopyWithImpl(_$AskLocationPermissionImpl _value,
      $Res Function(_$AskLocationPermissionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AskLocationPermissionImpl implements _AskLocationPermission {
  const _$AskLocationPermissionImpl();

  @override
  String toString() {
    return 'UserLocationEvent.askLocationPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AskLocationPermissionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool silent) getLocation,
    required TResult Function() askToEnableLocationServices,
    required TResult Function() askLocationPermission,
    required TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)
        parseLocation,
  }) {
    return askLocationPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool silent)? getLocation,
    TResult? Function()? askToEnableLocationServices,
    TResult? Function()? askLocationPermission,
    TResult? Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
  }) {
    return askLocationPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool silent)? getLocation,
    TResult Function()? askToEnableLocationServices,
    TResult Function()? askLocationPermission,
    TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
    required TResult orElse(),
  }) {
    if (askLocationPermission != null) {
      return askLocationPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserLocation value) getLocation,
    required TResult Function(_AskToEnableLocationServices value)
        askToEnableLocationServices,
    required TResult Function(_AskLocationPermission value)
        askLocationPermission,
    required TResult Function(_ParseLocation value) parseLocation,
  }) {
    return askLocationPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserLocation value)? getLocation,
    TResult? Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult? Function(_AskLocationPermission value)? askLocationPermission,
    TResult? Function(_ParseLocation value)? parseLocation,
  }) {
    return askLocationPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserLocation value)? getLocation,
    TResult Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult Function(_AskLocationPermission value)? askLocationPermission,
    TResult Function(_ParseLocation value)? parseLocation,
    required TResult orElse(),
  }) {
    if (askLocationPermission != null) {
      return askLocationPermission(this);
    }
    return orElse();
  }
}

abstract class _AskLocationPermission implements UserLocationEvent {
  const factory _AskLocationPermission() = _$AskLocationPermissionImpl;
}

/// @nodoc
abstract class _$$ParseLocationImplCopyWith<$Res> {
  factory _$$ParseLocationImplCopyWith(
          _$ParseLocationImpl value, $Res Function(_$ParseLocationImpl) then) =
      __$$ParseLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Either<UserLocationFailure, UserLocation> failureOrUserLocation,
      bool silent});
}

/// @nodoc
class __$$ParseLocationImplCopyWithImpl<$Res>
    extends _$UserLocationEventCopyWithImpl<$Res, _$ParseLocationImpl>
    implements _$$ParseLocationImplCopyWith<$Res> {
  __$$ParseLocationImplCopyWithImpl(
      _$ParseLocationImpl _value, $Res Function(_$ParseLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrUserLocation = null,
    Object? silent = null,
  }) {
    return _then(_$ParseLocationImpl(
      failureOrUserLocation: null == failureOrUserLocation
          ? _value.failureOrUserLocation
          : failureOrUserLocation // ignore: cast_nullable_to_non_nullable
              as Either<UserLocationFailure, UserLocation>,
      silent: null == silent
          ? _value.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ParseLocationImpl implements _ParseLocation {
  const _$ParseLocationImpl(
      {required this.failureOrUserLocation, this.silent = false});

  @override
  final Either<UserLocationFailure, UserLocation> failureOrUserLocation;
  @override
  @JsonKey()
  final bool silent;

  @override
  String toString() {
    return 'UserLocationEvent.parseLocation(failureOrUserLocation: $failureOrUserLocation, silent: $silent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseLocationImpl &&
            (identical(other.failureOrUserLocation, failureOrUserLocation) ||
                other.failureOrUserLocation == failureOrUserLocation) &&
            (identical(other.silent, silent) || other.silent == silent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrUserLocation, silent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParseLocationImplCopyWith<_$ParseLocationImpl> get copyWith =>
      __$$ParseLocationImplCopyWithImpl<_$ParseLocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool silent) getLocation,
    required TResult Function() askToEnableLocationServices,
    required TResult Function() askLocationPermission,
    required TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)
        parseLocation,
  }) {
    return parseLocation(failureOrUserLocation, silent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool silent)? getLocation,
    TResult? Function()? askToEnableLocationServices,
    TResult? Function()? askLocationPermission,
    TResult? Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
  }) {
    return parseLocation?.call(failureOrUserLocation, silent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool silent)? getLocation,
    TResult Function()? askToEnableLocationServices,
    TResult Function()? askLocationPermission,
    TResult Function(
            Either<UserLocationFailure, UserLocation> failureOrUserLocation,
            bool silent)?
        parseLocation,
    required TResult orElse(),
  }) {
    if (parseLocation != null) {
      return parseLocation(failureOrUserLocation, silent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserLocation value) getLocation,
    required TResult Function(_AskToEnableLocationServices value)
        askToEnableLocationServices,
    required TResult Function(_AskLocationPermission value)
        askLocationPermission,
    required TResult Function(_ParseLocation value) parseLocation,
  }) {
    return parseLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserLocation value)? getLocation,
    TResult? Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult? Function(_AskLocationPermission value)? askLocationPermission,
    TResult? Function(_ParseLocation value)? parseLocation,
  }) {
    return parseLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserLocation value)? getLocation,
    TResult Function(_AskToEnableLocationServices value)?
        askToEnableLocationServices,
    TResult Function(_AskLocationPermission value)? askLocationPermission,
    TResult Function(_ParseLocation value)? parseLocation,
    required TResult orElse(),
  }) {
    if (parseLocation != null) {
      return parseLocation(this);
    }
    return orElse();
  }
}

abstract class _ParseLocation implements UserLocationEvent {
  const factory _ParseLocation(
      {required final Either<UserLocationFailure, UserLocation>
          failureOrUserLocation,
      final bool silent}) = _$ParseLocationImpl;

  Either<UserLocationFailure, UserLocation> get failureOrUserLocation;
  bool get silent;
  @JsonKey(ignore: true)
  _$$ParseLocationImplCopyWith<_$ParseLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserLocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            UserLocation userLocation, String userAddress, bool silent)
        loadSuccess,
    required TResult Function(UserLocationFailure userLocationFailure)
        loadFailure,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationDisabled,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationPermissionDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult? Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationDisabled,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult Function(UserLocationFailure userLocationFailure)? locationDisabled,
    TResult Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LocationDisabled value) locationDisabled,
    required TResult Function(_LocationPermissionDisabled value)
        locationPermissionDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_LocationDisabled value)? locationDisabled,
    TResult? Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LocationDisabled value)? locationDisabled,
    TResult Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationStateCopyWith<$Res> {
  factory $UserLocationStateCopyWith(
          UserLocationState value, $Res Function(UserLocationState) then) =
      _$UserLocationStateCopyWithImpl<$Res, UserLocationState>;
}

/// @nodoc
class _$UserLocationStateCopyWithImpl<$Res, $Val extends UserLocationState>
    implements $UserLocationStateCopyWith<$Res> {
  _$UserLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserLocationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            UserLocation userLocation, String userAddress, bool silent)
        loadSuccess,
    required TResult Function(UserLocationFailure userLocationFailure)
        loadFailure,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationDisabled,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationPermissionDisabled,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult? Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationDisabled,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult Function(UserLocationFailure userLocationFailure)? locationDisabled,
    TResult Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LocationDisabled value) locationDisabled,
    required TResult Function(_LocationPermissionDisabled value)
        locationPermissionDisabled,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_LocationDisabled value)? locationDisabled,
    TResult? Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LocationDisabled value)? locationDisabled,
    TResult Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserLocationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserLocationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            UserLocation userLocation, String userAddress, bool silent)
        loadSuccess,
    required TResult Function(UserLocationFailure userLocationFailure)
        loadFailure,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationDisabled,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationPermissionDisabled,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult? Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationDisabled,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult Function(UserLocationFailure userLocationFailure)? locationDisabled,
    TResult Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LocationDisabled value) locationDisabled,
    required TResult Function(_LocationPermissionDisabled value)
        locationPermissionDisabled,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_LocationDisabled value)? locationDisabled,
    TResult? Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LocationDisabled value)? locationDisabled,
    TResult Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserLocationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserLocation userLocation, String userAddress, bool silent});

  $UserLocationCopyWith<$Res> get userLocation;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocation = null,
    Object? userAddress = null,
    Object? silent = null,
  }) {
    return _then(_$LoadSuccessImpl(
      userLocation: null == userLocation
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as UserLocation,
      userAddress: null == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as String,
      silent: null == silent
          ? _value.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLocationCopyWith<$Res> get userLocation {
    return $UserLocationCopyWith<$Res>(_value.userLocation, (value) {
      return _then(_value.copyWith(userLocation: value));
    });
  }
}

/// @nodoc

class _$LoadSuccessImpl implements _LoadSuccess {
  const _$LoadSuccessImpl(
      {required this.userLocation,
      required this.userAddress,
      this.silent = false});

  @override
  final UserLocation userLocation;
  @override
  final String userAddress;
  @override
  @JsonKey()
  final bool silent;

  @override
  String toString() {
    return 'UserLocationState.loadSuccess(userLocation: $userLocation, userAddress: $userAddress, silent: $silent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.userLocation, userLocation) ||
                other.userLocation == userLocation) &&
            (identical(other.userAddress, userAddress) ||
                other.userAddress == userAddress) &&
            (identical(other.silent, silent) || other.silent == silent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userLocation, userAddress, silent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            UserLocation userLocation, String userAddress, bool silent)
        loadSuccess,
    required TResult Function(UserLocationFailure userLocationFailure)
        loadFailure,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationDisabled,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationPermissionDisabled,
  }) {
    return loadSuccess(userLocation, userAddress, silent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult? Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationDisabled,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
  }) {
    return loadSuccess?.call(userLocation, userAddress, silent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult Function(UserLocationFailure userLocationFailure)? locationDisabled,
    TResult Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(userLocation, userAddress, silent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LocationDisabled value) locationDisabled,
    required TResult Function(_LocationPermissionDisabled value)
        locationPermissionDisabled,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_LocationDisabled value)? locationDisabled,
    TResult? Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LocationDisabled value)? locationDisabled,
    TResult Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements UserLocationState {
  const factory _LoadSuccess(
      {required final UserLocation userLocation,
      required final String userAddress,
      final bool silent}) = _$LoadSuccessImpl;

  UserLocation get userLocation;
  String get userAddress;
  bool get silent;
  @JsonKey(ignore: true)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserLocationFailure userLocationFailure});

  $UserLocationFailureCopyWith<$Res> get userLocationFailure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocationFailure = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == userLocationFailure
          ? _value.userLocationFailure
          : userLocationFailure // ignore: cast_nullable_to_non_nullable
              as UserLocationFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLocationFailureCopyWith<$Res> get userLocationFailure {
    return $UserLocationFailureCopyWith<$Res>(_value.userLocationFailure,
        (value) {
      return _then(_value.copyWith(userLocationFailure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl implements _LoadFailure {
  const _$LoadFailureImpl(this.userLocationFailure);

  @override
  final UserLocationFailure userLocationFailure;

  @override
  String toString() {
    return 'UserLocationState.loadFailure(userLocationFailure: $userLocationFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.userLocationFailure, userLocationFailure) ||
                other.userLocationFailure == userLocationFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userLocationFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            UserLocation userLocation, String userAddress, bool silent)
        loadSuccess,
    required TResult Function(UserLocationFailure userLocationFailure)
        loadFailure,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationDisabled,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationPermissionDisabled,
  }) {
    return loadFailure(userLocationFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult? Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationDisabled,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
  }) {
    return loadFailure?.call(userLocationFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult Function(UserLocationFailure userLocationFailure)? locationDisabled,
    TResult Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(userLocationFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LocationDisabled value) locationDisabled,
    required TResult Function(_LocationPermissionDisabled value)
        locationPermissionDisabled,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_LocationDisabled value)? locationDisabled,
    TResult? Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LocationDisabled value)? locationDisabled,
    TResult Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements UserLocationState {
  const factory _LoadFailure(final UserLocationFailure userLocationFailure) =
      _$LoadFailureImpl;

  UserLocationFailure get userLocationFailure;
  @JsonKey(ignore: true)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationDisabledImplCopyWith<$Res> {
  factory _$$LocationDisabledImplCopyWith(_$LocationDisabledImpl value,
          $Res Function(_$LocationDisabledImpl) then) =
      __$$LocationDisabledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserLocationFailure userLocationFailure});

  $UserLocationFailureCopyWith<$Res> get userLocationFailure;
}

/// @nodoc
class __$$LocationDisabledImplCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res, _$LocationDisabledImpl>
    implements _$$LocationDisabledImplCopyWith<$Res> {
  __$$LocationDisabledImplCopyWithImpl(_$LocationDisabledImpl _value,
      $Res Function(_$LocationDisabledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocationFailure = null,
  }) {
    return _then(_$LocationDisabledImpl(
      null == userLocationFailure
          ? _value.userLocationFailure
          : userLocationFailure // ignore: cast_nullable_to_non_nullable
              as UserLocationFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLocationFailureCopyWith<$Res> get userLocationFailure {
    return $UserLocationFailureCopyWith<$Res>(_value.userLocationFailure,
        (value) {
      return _then(_value.copyWith(userLocationFailure: value));
    });
  }
}

/// @nodoc

class _$LocationDisabledImpl implements _LocationDisabled {
  const _$LocationDisabledImpl(this.userLocationFailure);

  @override
  final UserLocationFailure userLocationFailure;

  @override
  String toString() {
    return 'UserLocationState.locationDisabled(userLocationFailure: $userLocationFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDisabledImpl &&
            (identical(other.userLocationFailure, userLocationFailure) ||
                other.userLocationFailure == userLocationFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userLocationFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDisabledImplCopyWith<_$LocationDisabledImpl> get copyWith =>
      __$$LocationDisabledImplCopyWithImpl<_$LocationDisabledImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            UserLocation userLocation, String userAddress, bool silent)
        loadSuccess,
    required TResult Function(UserLocationFailure userLocationFailure)
        loadFailure,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationDisabled,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationPermissionDisabled,
  }) {
    return locationDisabled(userLocationFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult? Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationDisabled,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
  }) {
    return locationDisabled?.call(userLocationFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult Function(UserLocationFailure userLocationFailure)? locationDisabled,
    TResult Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (locationDisabled != null) {
      return locationDisabled(userLocationFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LocationDisabled value) locationDisabled,
    required TResult Function(_LocationPermissionDisabled value)
        locationPermissionDisabled,
  }) {
    return locationDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_LocationDisabled value)? locationDisabled,
    TResult? Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
  }) {
    return locationDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LocationDisabled value)? locationDisabled,
    TResult Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (locationDisabled != null) {
      return locationDisabled(this);
    }
    return orElse();
  }
}

abstract class _LocationDisabled implements UserLocationState {
  const factory _LocationDisabled(
      final UserLocationFailure userLocationFailure) = _$LocationDisabledImpl;

  UserLocationFailure get userLocationFailure;
  @JsonKey(ignore: true)
  _$$LocationDisabledImplCopyWith<_$LocationDisabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationPermissionDisabledImplCopyWith<$Res> {
  factory _$$LocationPermissionDisabledImplCopyWith(
          _$LocationPermissionDisabledImpl value,
          $Res Function(_$LocationPermissionDisabledImpl) then) =
      __$$LocationPermissionDisabledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserLocationFailure userLocationFailure});

  $UserLocationFailureCopyWith<$Res> get userLocationFailure;
}

/// @nodoc
class __$$LocationPermissionDisabledImplCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res,
        _$LocationPermissionDisabledImpl>
    implements _$$LocationPermissionDisabledImplCopyWith<$Res> {
  __$$LocationPermissionDisabledImplCopyWithImpl(
      _$LocationPermissionDisabledImpl _value,
      $Res Function(_$LocationPermissionDisabledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocationFailure = null,
  }) {
    return _then(_$LocationPermissionDisabledImpl(
      null == userLocationFailure
          ? _value.userLocationFailure
          : userLocationFailure // ignore: cast_nullable_to_non_nullable
              as UserLocationFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLocationFailureCopyWith<$Res> get userLocationFailure {
    return $UserLocationFailureCopyWith<$Res>(_value.userLocationFailure,
        (value) {
      return _then(_value.copyWith(userLocationFailure: value));
    });
  }
}

/// @nodoc

class _$LocationPermissionDisabledImpl implements _LocationPermissionDisabled {
  const _$LocationPermissionDisabledImpl(this.userLocationFailure);

  @override
  final UserLocationFailure userLocationFailure;

  @override
  String toString() {
    return 'UserLocationState.locationPermissionDisabled(userLocationFailure: $userLocationFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionDisabledImpl &&
            (identical(other.userLocationFailure, userLocationFailure) ||
                other.userLocationFailure == userLocationFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userLocationFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermissionDisabledImplCopyWith<_$LocationPermissionDisabledImpl>
      get copyWith => __$$LocationPermissionDisabledImplCopyWithImpl<
          _$LocationPermissionDisabledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            UserLocation userLocation, String userAddress, bool silent)
        loadSuccess,
    required TResult Function(UserLocationFailure userLocationFailure)
        loadFailure,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationDisabled,
    required TResult Function(UserLocationFailure userLocationFailure)
        locationPermissionDisabled,
  }) {
    return locationPermissionDisabled(userLocationFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult? Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationDisabled,
    TResult? Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
  }) {
    return locationPermissionDisabled?.call(userLocationFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            UserLocation userLocation, String userAddress, bool silent)?
        loadSuccess,
    TResult Function(UserLocationFailure userLocationFailure)? loadFailure,
    TResult Function(UserLocationFailure userLocationFailure)? locationDisabled,
    TResult Function(UserLocationFailure userLocationFailure)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (locationPermissionDisabled != null) {
      return locationPermissionDisabled(userLocationFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LocationDisabled value) locationDisabled,
    required TResult Function(_LocationPermissionDisabled value)
        locationPermissionDisabled,
  }) {
    return locationPermissionDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_LocationDisabled value)? locationDisabled,
    TResult? Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
  }) {
    return locationPermissionDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LocationDisabled value)? locationDisabled,
    TResult Function(_LocationPermissionDisabled value)?
        locationPermissionDisabled,
    required TResult orElse(),
  }) {
    if (locationPermissionDisabled != null) {
      return locationPermissionDisabled(this);
    }
    return orElse();
  }
}

abstract class _LocationPermissionDisabled implements UserLocationState {
  const factory _LocationPermissionDisabled(
          final UserLocationFailure userLocationFailure) =
      _$LocationPermissionDisabledImpl;

  UserLocationFailure get userLocationFailure;
  @JsonKey(ignore: true)
  _$$LocationPermissionDisabledImplCopyWith<_$LocationPermissionDisabledImpl>
      get copyWith => throw _privateConstructorUsedError;
}
