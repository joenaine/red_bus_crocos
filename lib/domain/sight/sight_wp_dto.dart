import 'dart:convert';

class SightWPDto {
  final int? id;
  final String? title;
  final String? content;
  final String? slug;
  SightWPDto({
    this.id,
    this.title,
    this.content,
    this.slug,
  });

  SightWPDto copyWith({
    int? id,
    String? title,
    String? content,
    String? slug,
  }) {
    return SightWPDto(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (content != null) {
      result.addAll({'content': content});
    }
    if (slug != null) {
      result.addAll({'slug': slug});
    }

    return result;
  }

  factory SightWPDto.fromMap(Map<String, dynamic> map) {
    return SightWPDto(
      id: map['id']?.toInt(),
      title: map['title'],
      content: map['content'],
      slug: map['slug'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SightWPDto.fromJson(String source) =>
      SightWPDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SightWPDto(id: $id, title: $title, content: $content, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SightWPDto &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.slug == slug;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ content.hashCode ^ slug.hashCode;
  }
}
