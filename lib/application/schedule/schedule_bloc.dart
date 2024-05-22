import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:red_bus_crocos_project/domain/schedule/schedule_dto.dart';
import 'package:red_bus_crocos_project/infrastructure/schedule/schedule_repository.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';
part 'schedule_bloc.freezed.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  Set<AcfData> cachedSet = {};
  ScheduleBloc() : super(const ScheduleState.initial()) {
    on<ScheduleEvent>((event, emit) async {
      await event.map(
        getSchedule: (value) async {
          if (cachedSet.isNotEmpty) {
            emit(ScheduleState.loaded(acfData: cachedSet.first));
          } else {
            try {
              emit(const ScheduleState.initial());
              final AcfData data = await ScheduleRepository.fetchThisOne();
              cachedSet.add(data);
              emit(ScheduleState.loaded(acfData: data));
            } on Exception {
              emit(const ScheduleState.failure());
            }
          }
        },
      );
    });
  }
}
