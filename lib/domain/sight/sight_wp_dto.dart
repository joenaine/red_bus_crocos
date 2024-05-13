class SightWPDto {
  int? id;
  String? title;
  String? content;
  String? slug;
  AcfData? acfData;

  SightWPDto({this.id, this.title, this.content, this.slug, this.acfData});

  SightWPDto.fromJson(Map<String, dynamic> json) {
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
  bool? b3dTurs;
  bool? trigger;

  AcfData({this.b3dTurs, this.trigger});

  AcfData.fromJson(Map<String, dynamic> json) {
    b3dTurs = json['3d_turs'];
    trigger = json['trigger'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3d_turs'] = b3dTurs;
    data['trigger'] = trigger;
    return data;
  }
}
