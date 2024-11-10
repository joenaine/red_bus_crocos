import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AppVersion {
  static Future<VersionInfoModel> getAppVersion() async {
    try {
      return await FirebaseFirestore.instance
          .collection('versions')
          .doc('redbus')
          .get()
          .then((value) {
        log(value.data().toString());
        return VersionInfoModel.fromMap(value.data()!);
      });
    } catch (e) {
      log('Error catching from firestore $e');
      rethrow;
    }
  }
}

class VersionInfoModel {
  final String? androidVersion;
  final String? iosVersion;
  final bool? isReleased;
  final bool? isRequiredAndroid;
  final bool? isRequiredIos;
  final String? title;
  final String? titleKK;
  final String? titleEN;
  final String? content;
  final String? contentKK;
  final String? contentEN;
  final String? androidLink;
  final String? iosLink;
  VersionInfoModel({
    this.androidVersion,
    this.iosVersion,
    this.isReleased,
    this.isRequiredAndroid,
    this.isRequiredIos,
    this.title,
    this.titleKK,
    this.titleEN,
    this.content,
    this.contentKK,
    this.contentEN,
    this.androidLink,
    this.iosLink,
  });

  VersionInfoModel copyWith({
    String? androidVersion,
    String? iosVersion,
    bool? isReleased,
    bool? isRequiredAndroid,
    bool? isRequiredIos,
    String? title,
    String? titleKK,
    String? titleEN,
    String? content,
    String? contentKK,
    String? contentEN,
    String? androidLink,
    String? iosLink,
  }) {
    return VersionInfoModel(
      androidVersion: androidVersion ?? this.androidVersion,
      iosVersion: iosVersion ?? this.iosVersion,
      isReleased: isReleased ?? this.isReleased,
      isRequiredAndroid: isRequiredAndroid ?? this.isRequiredAndroid,
      isRequiredIos: isRequiredIos ?? this.isRequiredIos,
      title: title ?? this.title,
      titleKK: titleKK ?? this.titleKK,
      titleEN: titleEN ?? this.titleEN,
      content: content ?? this.content,
      contentKK: contentKK ?? this.contentKK,
      contentEN: contentEN ?? this.contentEN,
      androidLink: androidLink ?? this.androidLink,
      iosLink: iosLink ?? this.iosLink,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (androidVersion != null) {
      result.addAll({'androidVersion': androidVersion});
    }
    if (iosVersion != null) {
      result.addAll({'iosVersion': iosVersion});
    }
    if (isReleased != null) {
      result.addAll({'isReleased': isReleased});
    }
    if (isRequiredAndroid != null) {
      result.addAll({'isRequiredAndroid': isRequiredAndroid});
    }
    if (isRequiredIos != null) {
      result.addAll({'isRequiredIos': isRequiredIos});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (titleKK != null) {
      result.addAll({'titleKK': titleKK});
    }
    if (titleEN != null) {
      result.addAll({'titleEN': titleEN});
    }
    if (content != null) {
      result.addAll({'content': content});
    }
    if (contentKK != null) {
      result.addAll({'contentKK': contentKK});
    }
    if (contentEN != null) {
      result.addAll({'contentEN': contentEN});
    }
    if (androidLink != null) {
      result.addAll({'androidLink': androidLink});
    }
    if (iosLink != null) {
      result.addAll({'iosLink': iosLink});
    }

    return result;
  }

  factory VersionInfoModel.fromMap(Map<String, dynamic> map) {
    return VersionInfoModel(
      androidVersion: map['androidVersion'],
      iosVersion: map['iosVersion'],
      isReleased: map['isReleased'],
      isRequiredAndroid: map['isRequiredAndroid'],
      isRequiredIos: map['isRequiredIos'],
      title: map['title'],
      titleKK: map['titleKK'],
      titleEN: map['titleEN'],
      content: map['content'],
      contentKK: map['contentKK'],
      contentEN: map['contentEN'],
      androidLink: map['androidLink'],
      iosLink: map['iosLink'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionInfoModel.fromJson(String source) =>
      VersionInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VersionInfoModel(androidVersion: $androidVersion, iosVersion: $iosVersion, isReleased: $isReleased, isRequiredAndroid: $isRequiredAndroid, isRequiredIos: $isRequiredIos, title: $title, titleKK: $titleKK, titleEN: $titleEN, content: $content, contentKK: $contentKK, contentEN: $contentEN, androidLink: $androidLink, iosLink: $iosLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VersionInfoModel &&
        other.androidVersion == androidVersion &&
        other.iosVersion == iosVersion &&
        other.isReleased == isReleased &&
        other.isRequiredAndroid == isRequiredAndroid &&
        other.isRequiredIos == isRequiredIos &&
        other.title == title &&
        other.titleKK == titleKK &&
        other.titleEN == titleEN &&
        other.content == content &&
        other.contentKK == contentKK &&
        other.contentEN == contentEN &&
        other.androidLink == androidLink &&
        other.iosLink == iosLink;
  }

  @override
  int get hashCode {
    return androidVersion.hashCode ^
        iosVersion.hashCode ^
        isReleased.hashCode ^
        isRequiredAndroid.hashCode ^
        isRequiredIos.hashCode ^
        title.hashCode ^
        titleKK.hashCode ^
        titleEN.hashCode ^
        content.hashCode ^
        contentKK.hashCode ^
        contentEN.hashCode ^
        androidLink.hashCode ^
        iosLink.hashCode;
  }
}
