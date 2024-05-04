part of 'polyline_markers_bloc.dart';

@freezed
class PolylineMarkersState with _$PolylineMarkersState {
  factory PolylineMarkersState.initial() =>
      const PolylineMarkersState(polylines: {});
  const factory PolylineMarkersState({Map<PolylineId, Polyline>? polylines}) =
      _PolylineMarkersState;
}
