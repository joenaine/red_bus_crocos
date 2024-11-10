part of 'ticket_bloc.dart';

@immutable
sealed class TicketState {}

final class TicketInitial extends TicketState {}

final class TicketLoaded extends TicketState {
  TicketLoaded(this.list);

  final List<Ticket> list;
}

final class SLoading extends TicketState {}

final class SFailed extends TicketState {}

final class SSuccess extends TicketState {}
