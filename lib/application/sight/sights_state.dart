part of 'sights_bloc.dart';

@immutable
sealed class SightsState {}

final class SightsInitial extends SightsState {}

final class SightsError extends SightsState {}

final class SightsLoaded extends SightsState{
  SightsLoaded(this.data);
  final List<SightModel> data;

}
