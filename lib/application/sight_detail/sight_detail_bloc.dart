import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/sight/sight_dto.dart';
import '../../infrastructure/sights/sights_repository.dart';

part 'sight_detail_event.dart';

part 'sight_detail_state.dart';

@injectable
class SightDetailBloc extends Bloc<SightDetailEvent, SightDetailState> {
  final SightsRepository repository;
  Set<SightModel> cachedSet = {};

  SightDetailBloc(this.repository) : super(SightDetailInitial()) {
    on<SightDetailEvent>(
      (event, emit) async {
        switch (event) {
          case (OpenSightEvent()):
            await _onSightOpened(event, emit);
        }
      },
    );
  }

  Future<void> _onSightOpened(OpenSightEvent event, Emitter emit) async {
    if (cachedSet.where((element) => element.obj_id == event.id).isNotEmpty) {
      emit(SightDetailSuccess(
          cachedSet.where((element) => element.obj_id == event.id).first));
    } else {
      try {
        emit(SightDetailInitial());
        final SightModel data = await repository.fetchThisOne(event.id);
        cachedSet.add(data);
        emit(SightDetailSuccess(data));
      } on Exception {
        emit(SightDetailError());
      }
    }
  }
}
