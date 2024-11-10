import 'dart:convert';

import 'package:flutter/foundation.dart';
class CategoriesModel {
  final String? name;
  final String? description;
  final List<SightModel>? objects;
  CategoriesModel({
    this.name,
    this.description,
    this.objects,
  });


  factory CategoriesModel.fromMap(Map<String, dynamic> map,
      {bool isJson = false}) {
    return CategoriesModel(
      name: map['name'],
      description: map['description'],
      objects: isJson
          ? List<SightModel>.from(
          json.decode(map['objects'])?.map((x) => SightModel.fromMap(x)))
          : map['objects'] != null
          ? List<SightModel>.from(
          map['objects']?.map((x) => SightModel.fromMap(x)))
          : null,
    );
  }


  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoriesModel(name: $name, description: $description, objects: $objects)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesModel &&
        other.name == name &&
        other.description == description &&
        listEquals(other.objects, objects);
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ objects.hashCode;
}


class SightModel {
  String? obj_id;
  String? post_id;
  String? object_name;
  String? location;
  String? coord;
  String? latitude;
  String? longitude;
  String? discount;
  bool? not_alone_discount;
  bool? sale_blocked;
  String? link;
  String? site;
  String? phone;
  String? work_time;
  String? work_period;
  String? how_use;
  String? how_reach;

  String? popup_description;
  String? travel_time;
  String? obj_img;
  bool? nonresident;
  int? all_limit;
  List<ObjectServicesModel>? services;
  String? description;
  List<String>? photos;

  SightModel({
    this.obj_id,
    this.post_id,
    this.object_name,
    this.location,
    this.coord,
    this.latitude,
    this.longitude,
    this.discount,
    this.not_alone_discount,
    this.sale_blocked,
    this.link,
    this.site,
    this.phone,
    this.work_time,
    this.work_period,
    this.how_use,
    this.how_reach,
    this.travel_time,
    this.popup_description,
    this.obj_img,
    this.nonresident,
    this.all_limit,
    this.services,
    this.description,
    this.photos,
  });



  factory SightModel.fromMap(Map<String, dynamic> map) {
    return SightModel(
      obj_id: map['obj_id'].toString(),
      post_id: map['post_id'].toString(),
      object_name: map['object_name'].toString(),
      location: map['location'].toString(),
      coord: map['coord'].toString(),
      latitude: map['latitude'].toString(),
      longitude: map['longitude'].toString(),
      discount: map['discount'].toString(),
      not_alone_discount: map['not_alone_discount'],
      sale_blocked: map['sale_blocked'],
      link: map['link'].toString(),
      site: map['site'].toString(),
      phone: map['phone'].toString(),
      popup_description: map['popup_description'].toString(),
      work_time: map['work_time'].toString(),
      work_period: map['work_period'].toString(),
      how_use: map['how_use'].toString(),
      how_reach: map['how_reach'].toString(),
      travel_time: map['travel_time'].toString(),
      obj_img: map['obj_img'].toString(),
      nonresident: map['nonresident'],
      all_limit: map['all_limit']?.toInt(),
      description: map['description'].toString(),
      photos: map['photos'] == null ? [] : List<String>.from(map['photos']),
      services: map['services'] != null
          ? List<ObjectServicesModel>.from(map['services']
          .map(
              (key, x) => MapEntry(key, ObjectServicesModel.fromMap(x)))
          .values
          .toList()
        // .map((x) => ObjectServicesModel.fromMap(x)),
      )
          : null,
    );
  }


  factory SightModel.fromJson(String source) =>
      SightModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ObjectModel(obj_id: $obj_id, post_id: $post_id, object_name: $object_name, location: $location, coord: $coord, latitude: $latitude, longitude: $longitude, discount: $discount, not_alone_discount: $not_alone_discount, sale_blocked: $sale_blocked, link: $link, site: $site, phone: $phone, work_time: $work_time, work_period: $work_period, how_use: $how_use, how_reach: $how_reach, travel_time: $travel_time, obj_img: $obj_img, nonresident: $nonresident, all_limit: $all_limit, services: $services, description: $description, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SightModel &&
        other.obj_id == obj_id &&
        other.post_id == post_id &&
        other.object_name == object_name &&
        other.location == location &&
        other.coord == coord &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.discount == discount &&
        other.not_alone_discount == not_alone_discount &&
        other.sale_blocked == sale_blocked &&
        other.link == link &&
        other.site == site &&
        other.phone == phone &&
        other.work_time == work_time &&
        other.work_period == work_period &&
        other.how_use == how_use &&
        other.how_reach == how_reach &&
        other.travel_time == travel_time &&
        other.obj_img == obj_img &&
        other.nonresident == nonresident &&
        other.all_limit == all_limit &&
        listEquals(other.services, services) &&
        other.description == description &&
        listEquals(other.photos, photos);
  }

  @override
  int get hashCode {
    return obj_id.hashCode ^
    post_id.hashCode ^
    object_name.hashCode ^
    location.hashCode ^
    coord.hashCode ^
    latitude.hashCode ^
    longitude.hashCode ^
    discount.hashCode ^
    not_alone_discount.hashCode ^
    sale_blocked.hashCode ^
    link.hashCode ^
    site.hashCode ^
    phone.hashCode ^
    work_time.hashCode ^
    work_period.hashCode ^
    how_use.hashCode ^
    how_reach.hashCode ^
    travel_time.hashCode ^
    obj_img.hashCode ^
    nonresident.hashCode ^
    all_limit.hashCode ^
    services.hashCode ^
    description.hashCode ^
    photos.hashCode;
  }
}

class ObjectServicesModel {
  final String? serv_id;
  final String? serv_name;
  final List<PricesModel>? prices;
  ObjectServicesModel({
    this.serv_id,
    this.serv_name,
    this.prices,
  });

  ObjectServicesModel copyWith({
    String? serv_id,
    String? serv_name,
    List<PricesModel>? prices,
  }) {
    return ObjectServicesModel(
      serv_id: serv_id ?? this.serv_id,
      serv_name: serv_name ?? this.serv_name,
      prices: prices ?? this.prices,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serv_id': serv_id,
      'serv_name': serv_name,
      'prices': prices?.map((x) => x.toMap()).toList(),
    };
  }

  factory ObjectServicesModel.fromMap(Map<String, dynamic> map) {
    return ObjectServicesModel(
      serv_id: map['serv_id'],
      serv_name: map['serv_name'],
      prices: map['prices'] != null
          ? List<PricesModel>.from(map['prices']
          .map((key, x) => MapEntry(key, PricesModel.fromMap(x)))
          .values
          .toList())
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ObjectServicesModel.fromJson(String source) =>
      ObjectServicesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ObjectServicesModel(serv_id: $serv_id, serv_name: $serv_name, prices: $prices)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ObjectServicesModel &&
        other.serv_id == serv_id &&
        other.serv_name == serv_name &&
        listEquals(other.prices, prices);
  }

  @override
  int get hashCode => serv_id.hashCode ^ serv_name.hashCode ^ prices.hashCode;
}

class PricesModel {
  final String? desc;
  final String? client_cat;
  final String? cat_name;
  final String? price;
  final String? limit;
  PricesModel({
    this.desc,
    this.client_cat,
    this.cat_name,
    this.price,
    this.limit,
  });

  PricesModel copyWith({
    String? desc,
    String? client_cat,
    String? cat_name,
    String? price,
    String? limit,
  }) {
    return PricesModel(
      desc: desc ?? this.desc,
      client_cat: client_cat ?? this.client_cat,
      cat_name: cat_name ?? this.cat_name,
      price: price ?? this.price,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'desc': desc,
      'client_cat': client_cat,
      'cat_name': cat_name,
      'price': price,
      'limit': limit,
    };
  }

  factory PricesModel.fromMap(Map<String, dynamic> map) {
    return PricesModel(
      desc: map['desc'],
      client_cat: map['client_cat'],
      cat_name: map['cat_name'],
      price: map['price'],
      limit: map['limit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PricesModel.fromJson(String source) =>
      PricesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PricesModel(desc: $desc, client_cat: $client_cat, cat_name: $cat_name, price: $price, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PricesModel &&
        other.desc == desc &&
        other.client_cat == client_cat &&
        other.cat_name == cat_name &&
        other.price == price &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return desc.hashCode ^
    client_cat.hashCode ^
    cat_name.hashCode ^
    price.hashCode ^
    limit.hashCode;
  }
}