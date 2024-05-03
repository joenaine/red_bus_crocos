part of 'sights_bloc.dart';

@immutable
sealed class SightsEvent {}

final class FetchSights extends SightsEvent{}
