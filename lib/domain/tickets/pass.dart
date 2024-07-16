import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PassModel {
  final String? card_number;
  final String? cat_name;
  final String? duration;
  final String? status;
  final String? act_date;
  final String? final_date;
  final int? time_left;
  final List<PassServicesModel> services;
  final String? qr;
  PassModel({
    this.card_number,
    this.cat_name,
    this.duration,
    this.status,
    this.act_date,
    this.final_date,
    this.time_left,
    required this.services,
    this.qr,
  });

  PassModel copyWith({
    String? card_number,
    String? cat_name,
    String? duration,
    String? status,
    String? act_date,
    String? final_date,
    int? time_left,
    List<PassServicesModel>? services,
    String? qr,
  }) {
    return PassModel(
      card_number: card_number ?? this.card_number,
      cat_name: cat_name ?? this.cat_name,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      act_date: act_date ?? this.act_date,
      final_date: final_date ?? this.final_date,
      time_left: time_left ?? this.time_left,
      services: services ?? this.services,
      qr: qr ?? this.qr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'card_number': card_number,
      'cat_name': cat_name,
      'duration': duration,
      'status': status,
      'act_date': act_date,
      'final_date': final_date,
      'time_left': time_left,
      'services': json.encode(services.map((x) => x.toMap()).toList()),
      'qr': qr,
    };
  }

  factory PassModel.fromMap(Map<String, dynamic> map, {bool isJson = false}) {
    return PassModel(
      card_number: map['card_number'].toString(),
      cat_name: map['cat_name'],
      duration: map['duration'],
      status: map['status'],
      act_date: map['act_date'] ?? '-',
      final_date: map['final_date'] ?? '-',
      time_left: map['time_left']?.toInt(),
      services: isJson
          ? List<PassServicesModel>.from(json
              .decode(map['services'])
              ?.map((x) => PassServicesModel.fromMap(x)))
          : List<PassServicesModel>.from(
              map['services']?.map((x) => PassServicesModel.fromMap(x))),
      qr: map['qr'],
    );
  }

  String getStatus(String statusCode) {
    switch (statusCode) {
      case '0':
        return 'ready to use';
      case '1':
        return 'activated';
      case '2':
        return 'expired';
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

  String toJson() => json.encode(toMap());

  factory PassModel.fromJson(String source) =>
      PassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PassModel(card_number: $card_number, cat_name: $cat_name, duration: $duration, status: $status, act_date: $act_date, final_date: $final_date, time_left: $time_left, services: $services, qr: $qr)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PassModel &&
        other.card_number == card_number &&
        other.cat_name == cat_name &&
        other.duration == duration &&
        other.status == status &&
        other.act_date == act_date &&
        other.final_date == final_date &&
        other.time_left == time_left &&
        listEquals(other.services, services) &&
        other.qr == qr;
  }

  @override
  int get hashCode {
    return card_number.hashCode ^
        cat_name.hashCode ^
        duration.hashCode ^
        status.hashCode ^
        act_date.hashCode ^
        final_date.hashCode ^
        time_left.hashCode ^
        services.hashCode ^
        qr.hashCode;
  }
}

class PassServicesModel {
  final String? object_id;
  final String? object_name;
  final String? service_name;
  final bool? used;
  final String? use_time;
  PassServicesModel({
    this.object_id,
    this.object_name,
    this.service_name,
    this.used,
    this.use_time,
  });

  PassServicesModel copyWith({
    String? object_id,
    String? object_name,
    String? service_name,
    bool? used,
    String? use_time,
  }) {
    return PassServicesModel(
      object_id: object_id ?? this.object_id,
      object_name: object_name ?? this.object_name,
      service_name: service_name ?? this.service_name,
      used: used ?? this.used,
      use_time: use_time ?? this.use_time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'object_id': object_id,
      'object_name': object_name,
      'service_name': service_name,
      'used': used,
      'use_time': use_time,
    };
  }

  factory PassServicesModel.fromMap(Map<String, dynamic> map) {
    return PassServicesModel(
      object_id: map['object_id'],
      object_name: map['object_name'],
      service_name: map['service_name'],
      used: map['used'],
      use_time: map['use_time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PassServicesModel.fromJson(String source) =>
      PassServicesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PassServicesModel(object_id: $object_id, object_name: $object_name, service_name: $service_name, used: $used, use_time: $use_time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PassServicesModel &&
        other.object_id == object_id &&
        other.object_name == object_name &&
        other.service_name == service_name &&
        other.used == used &&
        other.use_time == use_time;
  }

  @override
  int get hashCode {
    return object_id.hashCode ^
        object_name.hashCode ^
        service_name.hashCode ^
        used.hashCode ^
        use_time.hashCode;
  }
}
