part of 'sight_detail_bloc.dart';

@immutable
sealed class SightDetailState {}

final class SightDetailInitial extends SightDetailState {}

final class SightDetailError extends SightDetailState {
  SightDetailError({this.message});
  final String? message;
}

final class SightDetailSuccess extends SightDetailState {
  SightDetailSuccess(this.data);
  final SightModel data;
}
