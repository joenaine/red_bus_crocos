import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'ticket_event.dart';

part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketInitial()) {
    on<TicketEvent>((event, emit) async {
      switch (event) {
        case CheckTicket():
          await _onCheckTicket(event, emit);
        case FetchTickets():
          await onFetchTickets(event, emit);
      }
    });
  }

  Future<void> _onCheckTicket(CheckTicket event, emit) async {
    emit(SLoading());
    Map map = {
      "api_key": "rTD6psMNcuMfewz8YAv825X",
      "project_id": 3,
      "lang": "ru",
      "card_number": event.ticketNUmber
    };
    try {
      final client = Dio();
      final result = await client
          .post('https://ais.citypass.kz/app/v1/cards/find', data: map);
      print(result.data);
      if (result.data["code"] == 0) {
        Ticket ticket = Ticket(
          cardNumber: result.data["data"]["card_number"],
          minLeft: result.data["data"]["time_left"],
          used: result.data["data"]["services"][0]["used"],
          category: result.data["data"]["cat_name"],
          qrLink: result.data["data"]["qr"],
          finalDate: result.data["data"]["final_date"],
        );
        if (ticket.finalDate != null) {
          DateTime dateTime =
              DateTime.parse(ticket.finalDate!.replaceAll(' ', 'T'));
          if (dateTime.isBefore(DateTime.now())) {
            throw Exception();
          }
        }

        final pref = await SharedPreferences.getInstance();
        List<String> list = pref.getStringList('tickets') ?? [];
        List<Ticket> ticketList =
            list.map((e) => Ticket.fromMap(jsonDecode(e))).toList();
        ticketList
            .removeWhere((element) => element.cardNumber == ticket.cardNumber);
        ticketList.add(ticket);
        list = ticketList.map((e) => jsonEncode(e.toMap())).toList();
        pref.setStringList('tickets', list);
        emit(TicketLoaded(ticketList));
        emit(SSuccess());
      } else {
        throw Exception('Error');
      }
    } on Exception catch (e) {
      emit(SFailed());
    }
  }

  Future<void> onFetchTickets(FetchTickets event, emit) async {
    final pref = await SharedPreferences.getInstance();
    List<String> list = pref.getStringList('tickets') ?? [];
    List<Ticket> tickets =
        list.map((e) => Ticket.fromMap(jsonDecode(e))).toList();
    tickets.removeWhere((ticket) {
      if (ticket.finalDate != null) {
        DateTime dateTime =
            DateTime.parse(ticket.finalDate!.replaceAll(' ', 'T'));
        if (dateTime.isBefore(DateTime.now())) {
          return true;
        }
      }
      return false;
    });
    final client = Dio();
    for (Ticket t in tickets) {
      Map map = {
        "api_key": "rTD6psMNcuMfewz8YAv825X",
        "project_id": 3,
        "lang": "ru",
        "card_number": t.cardNumber
      };
      try {
        final result = await client
            .post('https://ais.citypass.kz/app/v1/cards/find', data: map);
        if (result.data["code"] == 0) {
          log(result.data.toString());
          Ticket ticket = Ticket(
            cardNumber: result.data["data"]["card_number"],
            minLeft: result.data["data"]["time_left"],
            used: result.data["data"]["services"][0]["used"],
            category: result.data["data"]["cat_name"],
            qrLink: result.data["data"]["qr"],
            finalDate: result.data["data"]["final_date"],
            duration: result.data["data"]["duration"],
            status: result.data["data"]["status"],
          );
          tickets.remove(t);
          if (ticket.finalDate != null) {
            DateTime dateTime =
                DateTime.parse(ticket.finalDate!.replaceAll(' ', 'T'));
            if (dateTime.isAfter(DateTime.now())) {
              tickets.add(ticket);
            }
          } else {
            tickets.add(ticket);
          }
        }
      } on Exception {}
    }
    list = tickets.map((e) => jsonEncode(e.toMap())).toList();
    pref.setStringList('tickets', list);
    emit(TicketLoaded(tickets));
  }
}

class Ticket {
  Ticket(
      {required this.cardNumber,
      required this.category,
      required this.minLeft,
      required this.qrLink,
      required this.finalDate,
      required this.used,
      this.status,
      this.duration});

  final String cardNumber;
  final String category;
  final bool used;
  final int minLeft;
  final String qrLink;
  final String? finalDate;
  final String? duration;
  final String? status;

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'category': category,
      'used': used,
      'minLeft': minLeft,
      'qr': qrLink,
      'final_date': finalDate,
      'duration': duration,
      'status': status,
    };
  }

  String getStatus(String statusCode) {
    switch (statusCode) {
      case '0':
        return LocaleKeys.ready_to_use.tr();
      case '1':
        return LocaleKeys.activated.tr();
      case '2':
        return LocaleKeys.expired.tr();
      default:
        return '-';
    }
  }

  static Color midColor = const Color.fromRGBO(45, 192, 255, 1);

  Color getStatusColor(String statusCode) {
    switch (statusCode) {
      case '0':
        return midColor;
      case '1':
        return Colors.green;
      case '2':
        return Colors.red;
      default:
        return Colors.grey[600]!;
    }
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    print(map);
    return Ticket(
      cardNumber: map['cardNumber'],
      category: map['category'],
      used: map['used'],
      minLeft: map['minLeft'],
      qrLink: map['qr'],
      status: map['status'].toString(),
      finalDate: map['final_date'],
      duration: map['duration'].toString(),
    );
  }
}
