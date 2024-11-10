// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectivityState {
  bool get hasConnection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectivityStateCopyWith<ConnectivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityStateCopyWith<$Res> {
  factory $ConnectivityStateCopyWith(
          ConnectivityState value, $Res Function(ConnectivityState) then) =
      _$ConnectivityStateCopyWithImpl<$Res, ConnectivityState>;
  @useResult
  $Res call({bool hasConnection});
}

/// @nodoc
class _$ConnectivityStateCopyWithImpl<$Res, $Val extends ConnectivityState>
    implements $ConnectivityStateCopyWith<$Res> {
  _$ConnectivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasConnection = null,
  }) {
    return _then(_value.copyWith(
      hasConnection: null == hasConnection
          ? _value.hasConnection
          : hasConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectivityStateImplCopyWith<$Res>
    implements $ConnectivityStateCopyWith<$Res> {
  factory _$$ConnectivityStateImplCopyWith(_$ConnectivityStateImpl value,
          $Res Function(_$ConnectivityStateImpl) then) =
      __$$ConnectivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasConnection});
}

/// @nodoc
class __$$ConnectivityStateImplCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res, _$ConnectivityStateImpl>
    implements _$$ConnectivityStateImplCopyWith<$Res> {
  __$$ConnectivityStateImplCopyWithImpl(_$ConnectivityStateImpl _value,
      $Res Function(_$ConnectivityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasConnection = null,
  }) {
    return _then(_$ConnectivityStateImpl(
      hasConnection: null == hasConnection
          ? _value.hasConnection
          : hasConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectivityStateImpl implements _ConnectivityState {
  const _$ConnectivityStateImpl({required this.hasConnection});

  @override
  final bool hasConnection;

  @override
  String toString() {
    return 'ConnectivityState(hasConnection: $hasConnection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityStateImpl &&
            (identical(other.hasConnection, hasConnection) ||
                other.hasConnection == hasConnection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasConnection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectivityStateImplCopyWith<_$ConnectivityStateImpl> get copyWith =>
      __$$ConnectivityStateImplCopyWithImpl<_$ConnectivityStateImpl>(
          this, _$identity);
}

abstract class _ConnectivityState implements ConnectivityState {
  const factory _ConnectivityState({required final bool hasConnection}) =
      _$ConnectivityStateImpl;

  @override
  bool get hasConnection;
  @override
  @JsonKey(ignore: true)
  _$$ConnectivityStateImplCopyWith<_$ConnectivityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
