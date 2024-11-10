part of 'sight_detail_bloc.dart';

@immutable
sealed class SightDetailEvent {}

final class OpenSightEvent extends SightDetailEvent{
  OpenSightEvent(this.id);
  final String id;
}

