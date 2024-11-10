part of 'ticket_bloc.dart';

@immutable
sealed class TicketEvent {}

class CheckTicket extends TicketEvent {
  CheckTicket(this.ticketNUmber);

  final String ticketNUmber;
}

class FetchTickets extends TicketEvent{

}