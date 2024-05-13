import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:red_bus_crocos_project/domain/sight/sight_wp_dto.dart';
import 'package:red_bus_crocos_project/infrastructure/sights/sights_wp_repository.dart';

part 'information_modal_event.dart';
part 'information_modal_state.dart';
part 'information_modal_bloc.freezed.dart';

class InformationModalBloc
    extends Bloc<InformationModalEvent, InformationModalState> {
  InformationModalBloc() : super(InformationModalState.initial()) {
    on<InformationModalEvent>((event, emit) async {
      await event.map(
        getInformationModal: (value) async {
          SightWPDto? modalInfo = await SightsWPRepository.fetchThisOne();
          if (modalInfo.acfData?.trigger == true) {
            emit(state.copyWith(modalInfo: modalInfo));
          }
        },
      );
    });
  }
}
