// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BusLocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBusLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBusLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBusLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBusLocation value) getBusLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBusLocation value)? getBusLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBusLocation value)? getBusLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusLocationEventCopyWith<$Res> {
  factory $BusLocationEventCopyWith(
          BusLocationEvent value, $Res Function(BusLocationEvent) then) =
      _$BusLocationEventCopyWithImpl<$Res, BusLocationEvent>;
}

/// @nodoc
class _$BusLocationEventCopyWithImpl<$Res, $Val extends BusLocationEvent>
    implements $BusLocationEventCopyWith<$Res> {
  _$BusLocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBusLocationImplCopyWith<$Res> {
  factory _$$GetBusLocationImplCopyWith(_$GetBusLocationImpl value,
          $Res Function(_$GetBusLocationImpl) then) =
      __$$GetBusLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBusLocationImplCopyWithImpl<$Res>
    extends _$BusLocationEventCopyWithImpl<$Res, _$GetBusLocationImpl>
    implements _$$GetBusLocationImplCopyWith<$Res> {
  __$$GetBusLocationImplCopyWithImpl(
      _$GetBusLocationImpl _value, $Res Function(_$GetBusLocationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBusLocationImpl implements _GetBusLocation {
  const _$GetBusLocationImpl();

  @override
  String toString() {
    return 'BusLocationEvent.getBusLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBusLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBusLocation,
  }) {
    return getBusLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBusLocation,
  }) {
    return getBusLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBusLocation,
    required TResult orElse(),
  }) {
    if (getBusLocation != null) {
      return getBusLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBusLocation value) getBusLocation,
  }) {
    return getBusLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBusLocation value)? getBusLocation,
  }) {
    return getBusLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBusLocation value)? getBusLocation,
    required TResult orElse(),
  }) {
    if (getBusLocation != null) {
      return getBusLocation(this);
    }
    return orElse();
  }
}

abstract class _GetBusLocation implements BusLocationEvent {
  const factory _GetBusLocation() = _$GetBusLocationImpl;
}

/// @nodoc
mixin _$BusLocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double? longitude, double? latitude) busLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double? longitude, double? latitude)? busLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double? longitude, double? latitude)? busLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_BusLoaded value) busLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_BusLoaded value)? busLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_BusLoaded value)? busLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusLocationStateCopyWith<$Res> {
  factory $BusLocationStateCopyWith(
          BusLocationState value, $Res Function(BusLocationState) then) =
      _$BusLocationStateCopyWithImpl<$Res, BusLocationState>;
}

/// @nodoc
class _$BusLocationStateCopyWithImpl<$Res, $Val extends BusLocationState>
    implements $BusLocationStateCopyWith<$Res> {
  _$BusLocationStateCopyWithImpl(this._value, this._then);

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
    extends _$BusLocationStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'BusLocationState.initial()';
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
    required TResult Function(double? longitude, double? latitude) busLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double? longitude, double? latitude)? busLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double? longitude, double? latitude)? busLoaded,
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
    required TResult Function(_BusLoaded value) busLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_BusLoaded value)? busLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_BusLoaded value)? busLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BusLocationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$BusLoadedImplCopyWith<$Res> {
  factory _$$BusLoadedImplCopyWith(
          _$BusLoadedImpl value, $Res Function(_$BusLoadedImpl) then) =
      __$$BusLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double? longitude, double? latitude});
}

/// @nodoc
class __$$BusLoadedImplCopyWithImpl<$Res>
    extends _$BusLocationStateCopyWithImpl<$Res, _$BusLoadedImpl>
    implements _$$BusLoadedImplCopyWith<$Res> {
  __$$BusLoadedImplCopyWithImpl(
      _$BusLoadedImpl _value, $Res Function(_$BusLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(_$BusLoadedImpl(
      freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$BusLoadedImpl implements _BusLoaded {
  const _$BusLoadedImpl(this.longitude, this.latitude);

  @override
  final double? longitude;
  @override
  final double? latitude;

  @override
  String toString() {
    return 'BusLocationState.busLoaded(longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusLoadedImpl &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusLoadedImplCopyWith<_$BusLoadedImpl> get copyWith =>
      __$$BusLoadedImplCopyWithImpl<_$BusLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double? longitude, double? latitude) busLoaded,
  }) {
    return busLoaded(longitude, latitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double? longitude, double? latitude)? busLoaded,
  }) {
    return busLoaded?.call(longitude, latitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double? longitude, double? latitude)? busLoaded,
    required TResult orElse(),
  }) {
    if (busLoaded != null) {
      return busLoaded(longitude, latitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_BusLoaded value) busLoaded,
  }) {
    return busLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_BusLoaded value)? busLoaded,
  }) {
    return busLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_BusLoaded value)? busLoaded,
    required TResult orElse(),
  }) {
    if (busLoaded != null) {
      return busLoaded(this);
    }
    return orElse();
  }
}

abstract class _BusLoaded implements BusLocationState {
  const factory _BusLoaded(final double? longitude, final double? latitude) =
      _$BusLoadedImpl;

  double? get longitude;
  double? get latitude;
  @JsonKey(ignore: true)
  _$$BusLoadedImplCopyWith<_$BusLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
