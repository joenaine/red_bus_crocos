import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/sight/sight_dto.dart';
import '../../infrastructure/sights/sights_repository.dart';

part 'sights_event.dart';

part 'sights_state.dart';

@injectable
class SightsBloc extends Bloc<SightsEvent, SightsState> {
  final SightsRepository repository;
  Set<String> cachedIds = {};

  SightsBloc(this.repository) : super(SightsInitial()) {
    on<SightsEvent>((event, emit) async {
      switch (event) {
        case FetchSights():
          await _fetchSights(emit);
      }
    });
  }

  Future<void> _fetchSights(Emitter emit) async {
    final List<SightModel> data = await repository.fetchSightsThumbs();
    emit(SightsLoaded(data));
  }
}
