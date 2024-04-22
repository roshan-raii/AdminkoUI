// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YearModel {
  int? id;
  String? name;
  String? error;
  YearModel({
    this.id,
    this.name,
    this.error,
  });

  YearModel copyWith({
    int? id,
    String? name,
    String? error,
  }) {
    return YearModel(
      id: id ?? this.id,
      name: name ?? this.name,
      error: error ?? this.error,
    );
  }

  YearModel.withError({required String error}) {
    this.error = error;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'error': error,
    };
  }

  factory YearModel.fromMap(Map<String, dynamic> map) {
    return YearModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory YearModel.fromJson(String source) =>
      YearModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'YearModel(id: $id, name: $name, error: $error)';

  @override
  bool operator ==(covariant YearModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.error == error;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ error.hashCode;
}
