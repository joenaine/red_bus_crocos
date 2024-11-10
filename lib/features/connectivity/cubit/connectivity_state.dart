part of 'connectivity_cubit.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({required bool hasConnection}) =
      _ConnectivityState;
}
