// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SectionModel {
  int? id;
  String? name;
  String? error;
  SectionModel({
    this.id,
    this.name,
    this.error,
  });
  SectionModel.withError({required String error}) {
    this.error = error;
  }

  SectionModel copyWith({
    int? id,
    String? name,
    String? error,
  }) {
    return SectionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'error': error,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SectionModel(id: $id, name: $name, error: $error)';

  @override
  bool operator ==(covariant SectionModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.error == error;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ error.hashCode;
}
