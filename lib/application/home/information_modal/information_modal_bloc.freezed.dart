// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'information_modal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InformationModalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInformationModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getInformationModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInformationModal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInformationModal value) getInformationModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetInformationModal value)? getInformationModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInformationModal value)? getInformationModal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformationModalEventCopyWith<$Res> {
  factory $InformationModalEventCopyWith(InformationModalEvent value,
          $Res Function(InformationModalEvent) then) =
      _$InformationModalEventCopyWithImpl<$Res, InformationModalEvent>;
}

/// @nodoc
class _$InformationModalEventCopyWithImpl<$Res,
        $Val extends InformationModalEvent>
    implements $InformationModalEventCopyWith<$Res> {
  _$InformationModalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetInformationModalImplCopyWith<$Res> {
  factory _$$GetInformationModalImplCopyWith(_$GetInformationModalImpl value,
          $Res Function(_$GetInformationModalImpl) then) =
      __$$GetInformationModalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetInformationModalImplCopyWithImpl<$Res>
    extends _$InformationModalEventCopyWithImpl<$Res, _$GetInformationModalImpl>
    implements _$$GetInformationModalImplCopyWith<$Res> {
  __$$GetInformationModalImplCopyWithImpl(_$GetInformationModalImpl _value,
      $Res Function(_$GetInformationModalImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetInformationModalImpl implements _GetInformationModal {
  const _$GetInformationModalImpl();

  @override
  String toString() {
    return 'InformationModalEvent.getInformationModal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetInformationModalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInformationModal,
  }) {
    return getInformationModal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getInformationModal,
  }) {
    return getInformationModal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInformationModal,
    required TResult orElse(),
  }) {
    if (getInformationModal != null) {
      return getInformationModal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInformationModal value) getInformationModal,
  }) {
    return getInformationModal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetInformationModal value)? getInformationModal,
  }) {
    return getInformationModal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInformationModal value)? getInformationModal,
    required TResult orElse(),
  }) {
    if (getInformationModal != null) {
      return getInformationModal(this);
    }
    return orElse();
  }
}

abstract class _GetInformationModal implements InformationModalEvent {
  const factory _GetInformationModal() = _$GetInformationModalImpl;
}

/// @nodoc
mixin _$InformationModalState {
  SightWPDto? get modalInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InformationModalStateCopyWith<InformationModalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformationModalStateCopyWith<$Res> {
  factory $InformationModalStateCopyWith(InformationModalState value,
          $Res Function(InformationModalState) then) =
      _$InformationModalStateCopyWithImpl<$Res, InformationModalState>;
  @useResult
  $Res call({SightWPDto? modalInfo});
}

/// @nodoc
class _$InformationModalStateCopyWithImpl<$Res,
        $Val extends InformationModalState>
    implements $InformationModalStateCopyWith<$Res> {
  _$InformationModalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modalInfo = freezed,
  }) {
    return _then(_value.copyWith(
      modalInfo: freezed == modalInfo
          ? _value.modalInfo
          : modalInfo // ignore: cast_nullable_to_non_nullable
              as SightWPDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InformationModalStateImplCopyWith<$Res>
    implements $InformationModalStateCopyWith<$Res> {
  factory _$$InformationModalStateImplCopyWith(
          _$InformationModalStateImpl value,
          $Res Function(_$InformationModalStateImpl) then) =
      __$$InformationModalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SightWPDto? modalInfo});
}

/// @nodoc
class __$$InformationModalStateImplCopyWithImpl<$Res>
    extends _$InformationModalStateCopyWithImpl<$Res,
        _$InformationModalStateImpl>
    implements _$$InformationModalStateImplCopyWith<$Res> {
  __$$InformationModalStateImplCopyWithImpl(_$InformationModalStateImpl _value,
      $Res Function(_$InformationModalStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modalInfo = freezed,
  }) {
    return _then(_$InformationModalStateImpl(
      modalInfo: freezed == modalInfo
          ? _value.modalInfo
          : modalInfo // ignore: cast_nullable_to_non_nullable
              as SightWPDto?,
    ));
  }
}

/// @nodoc

class _$InformationModalStateImpl implements _InformationModalState {
  const _$InformationModalStateImpl({this.modalInfo});

  @override
  final SightWPDto? modalInfo;

  @override
  String toString() {
    return 'InformationModalState(modalInfo: $modalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformationModalStateImpl &&
            (identical(other.modalInfo, modalInfo) ||
                other.modalInfo == modalInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, modalInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InformationModalStateImplCopyWith<_$InformationModalStateImpl>
      get copyWith => __$$InformationModalStateImplCopyWithImpl<
          _$InformationModalStateImpl>(this, _$identity);
}

abstract class _InformationModalState implements InformationModalState {
  const factory _InformationModalState({final SightWPDto? modalInfo}) =
      _$InformationModalStateImpl;

  @override
  SightWPDto? get modalInfo;
  @override
  @JsonKey(ignore: true)
  _$$InformationModalStateImplCopyWith<_$InformationModalStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
