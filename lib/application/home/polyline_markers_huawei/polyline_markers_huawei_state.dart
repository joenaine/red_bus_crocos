part of 'polyline_markers_huawei_bloc.dart';

@freezed
class PolylineMarkersHuaweiState with _$PolylineMarkersHuaweiState {
  factory PolylineMarkersHuaweiState.initial() =>
      const PolylineMarkersHuaweiState(polylines: {});
  const factory PolylineMarkersHuaweiState(
      {Map<PolylineId, Polyline>? polylines}) = _PolylineMarkersState;
}
