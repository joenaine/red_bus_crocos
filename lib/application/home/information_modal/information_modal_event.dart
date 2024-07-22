part of 'information_modal_bloc.dart';

@freezed
class InformationModalEvent with _$InformationModalEvent {
  const factory InformationModalEvent.getInformationModal() =
      _GetInformationModal;
  const factory InformationModalEvent.getDismissableModal() =
      _GetInformationModal;
}
