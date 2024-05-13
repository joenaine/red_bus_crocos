class ScheduleDto {
  int? id;
  String? title;
  String? content;
  String? slug;
  AcfData? acfData;

  ScheduleDto({this.id, this.title, this.content, this.slug, this.acfData});

  ScheduleDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    slug = json['slug'];
    acfData =
        json['acf_data'] != null ? AcfData.fromJson(json['acf_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['slug'] = slug;
    if (acfData != null) {
      data['acf_data'] = acfData!.toJson();
    }
    return data;
  }
}

class AcfData {
  List<FirstLap>? firstLap;
  List<SecondLap>? secondLap;
  List<ThirdLap>? thirdLap;
  bool? fourthLap;

  AcfData({this.firstLap, this.secondLap, this.thirdLap, this.fourthLap});

  AcfData.fromJson(Map<String, dynamic> json) {
    if (json['first_lap'] != null) {
      firstLap = <FirstLap>[];
      json['first_lap'].forEach((v) {
        firstLap!.add(FirstLap.fromJson(v));
      });
    }
    if (json['second_lap'] != null) {
      secondLap = <SecondLap>[];
      json['second_lap'].forEach((v) {
        secondLap!.add(SecondLap.fromJson(v));
      });
    }
    if (json['third_lap'] != null) {
      thirdLap = <ThirdLap>[];
      json['third_lap'].forEach((v) {
        thirdLap!.add(ThirdLap.fromJson(v));
      });
    }
    fourthLap = json['fourth_lap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (firstLap != null) {
      data['first_lap'] = firstLap!.map((v) => v.toJson()).toList();
    }
    if (secondLap != null) {
      data['second_lap'] = secondLap!.map((v) => v.toJson()).toList();
    }
    if (thirdLap != null) {
      data['third_lap'] = thirdLap!.map((v) => v.toJson()).toList();
    }
    data['fourth_lap'] = fourthLap;
    return data;
  }
}

class FirstLap {
  String? location;
  String? arrivalTime;
  String? departureTime;

  FirstLap({this.location, this.arrivalTime, this.departureTime});

  FirstLap.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    arrivalTime = json['arrival_time'];
    departureTime = json['departure_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['arrival_time'] = arrivalTime;
    data['departure_time'] = departureTime;
    return data;
  }
}

class SecondLap {
  String? location2;
  String? arrivalTime2;
  String? departureTime2;

  SecondLap({this.location2, this.arrivalTime2, this.departureTime2});

  SecondLap.fromJson(Map<String, dynamic> json) {
    location2 = json['location2'];
    arrivalTime2 = json['arrival_time2'];
    departureTime2 = json['departure_time2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location2'] = location2;
    data['arrival_time2'] = arrivalTime2;
    data['departure_time2'] = departureTime2;
    return data;
  }
}

class ThirdLap {
  String? location3;
  String? arrivalTime3;
  String? departureTime3;

  ThirdLap({this.location3, this.arrivalTime3, this.departureTime3});

  ThirdLap.fromJson(Map<String, dynamic> json) {
    location3 = json['location3'];
    arrivalTime3 = json['arrival_time3'];
    departureTime3 = json['departure_time3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location3'] = location3;
    data['arrival_time3'] = arrivalTime3;
    data['departure_time3'] = departureTime3;
    return data;
  }
}
