class TrackingModel {
  Item? item;
  int? flags;

  TrackingModel({this.item, this.flags});

  TrackingModel.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
    flags = json['flags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (item != null) {
      data['item'] = item!.toJson();
    }
    data['flags'] = flags;
    return data;
  }
}

class Item {
  String? nm;
  int? cls;
  int? id;
  int? mu;
  Pos? pos;
  Lmsg? lmsg;
  int? uacl;

  Item({this.nm, this.cls, this.id, this.mu, this.pos, this.lmsg, this.uacl});

  Item.fromJson(Map<String, dynamic> json) {
    nm = json['nm'];
    cls = json['cls'];
    id = json['id'];
    mu = json['mu'];
    pos = json['pos'] != null ? Pos.fromJson(json['pos']) : null;
    lmsg = json['lmsg'] != null ? Lmsg.fromJson(json['lmsg']) : null;
    uacl = json['uacl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nm'] = nm;
    data['cls'] = cls;
    data['id'] = id;
    data['mu'] = mu;
    if (pos != null) {
      data['pos'] = pos!.toJson();
    }
    if (lmsg != null) {
      data['lmsg'] = lmsg!.toJson();
    }
    data['uacl'] = uacl;
    return data;
  }
}

class Pos {
  int? t;
  int? f;
  int? lc;
  double? y;
  double? x;
  int? c;
  double? z;
  int? s;
  int? sc;

  Pos(
      {this.t,
      this.f,
      this.lc,
      this.y,
      this.x,
      this.c,
      this.z,
      this.s,
      this.sc});

  Pos.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    f = json['f'];
    lc = json['lc'];
    y = json['y'];
    x = json['x'];
    c = json['c'];
    z = json['z'];
    s = json['s'];
    sc = json['sc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['t'] = t;
    data['f'] = f;
    data['lc'] = lc;
    data['y'] = y;
    data['x'] = x;
    data['c'] = c;
    data['z'] = z;
    data['s'] = s;
    data['sc'] = sc;
    return data;
  }
}

class Lmsg {
  int? t;
  int? f;
  String? tp;
  Pos? pos;
  int? i;
  int? lc;
  int? rt;
  P? p;

  Lmsg({this.t, this.f, this.tp, this.pos, this.i, this.lc, this.rt, this.p});

  Lmsg.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    f = json['f'];
    tp = json['tp'];
    pos = json['pos'] != null ? Pos.fromJson(json['pos']) : null;
    i = json['i'];
    lc = json['lc'];
    rt = json['rt'];
    p = json['p'] != null ? P.fromJson(json['p']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['t'] = t;
    data['f'] = f;
    data['tp'] = tp;
    if (pos != null) {
      data['pos'] = pos!.toJson();
    }
    data['i'] = i;
    data['lc'] = lc;
    data['rt'] = rt;
    if (p != null) {
      data['p'] = p!.toJson();
    }
    return data;
  }
}

// class Pos {
//   double? y;
//   double? x;
//   int? c;
//   double? z;
//   int? s;
//   int? sc;

//   Pos({this.y, this.x, this.c, this.z, this.s, this.sc});

//   Pos.fromJson(Map<String, dynamic> json) {
//     y = json['y'];
//     x = json['x'];
//     c = json['c'];
//     z = json['z'];
//     s = json['s'];
//     sc = json['sc'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['y'] = y;
//     data['x'] = x;
//     data['c'] = c;
//     data['z'] = z;
//     data['s'] = s;
//     data['sc'] = sc;
//     return data;
//   }
// }

class P {
  double? hdop;
  int? ioCaused;
  int? movementSens;
  int? power;
  int? battery;

  P({this.hdop, this.ioCaused, this.movementSens, this.power, this.battery});

  P.fromJson(Map<String, dynamic> json) {
    hdop = json['hdop'];
    ioCaused = json['io_caused'];
    movementSens = json['movement_sens'];
    power = json['power'];
    battery = json['battery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hdop'] = hdop;
    data['io_caused'] = ioCaused;
    data['movement_sens'] = movementSens;
    data['power'] = power;
    data['battery'] = battery;
    return data;
  }
}
