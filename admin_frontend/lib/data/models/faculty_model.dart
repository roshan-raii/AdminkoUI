// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/data_exports.dart';

class FacultyModel {
  int? id;
  String? name;
  String? error;
  FacultyModel({
    this.id,
    this.name,
    this.error,
  });

  FacultyModel.withError({required String error}) {
    this.error = error;
  }

  FacultyModel copyWith({
    int? id,
    String? name,
    String? error,
  }) {
    return FacultyModel(
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

  factory FacultyModel.fromMap(Map<String, dynamic> map) {
    return FacultyModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FacultyModel.fromJson(String source) =>
      FacultyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FacultyModel(id: $id, name: $name, error: $error)';

  @override
  bool operator ==(covariant FacultyModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.error == error;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ error.hashCode;
}
