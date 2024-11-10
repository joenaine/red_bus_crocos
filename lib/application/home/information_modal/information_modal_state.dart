part of 'information_modal_bloc.dart';

@freezed
class InformationModalState with _$InformationModalState {
  const factory InformationModalState(
      {SightWPDto? modalInfo,
      SightWPDto? modalDismissableInfo}) = _InformationModalState;
  factory InformationModalState.initial() => InformationModalState(
      modalInfo: SightWPDto(acfData: AcfData(b3dTurs: false)),
      modalDismissableInfo: null);
}
