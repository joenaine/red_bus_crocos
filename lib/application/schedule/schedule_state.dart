part of 'schedule_bloc.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.loaded({AcfData? acfData}) = _Loaded;
  const factory ScheduleState.failure() = _Failure;
}
