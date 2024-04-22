// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Module {
  int? id;
  String? module_name;
  String? description;
  String? error;
  Module({
    this.id,
    this.module_name,
    this.description,
    this.error,
  });

  Module copyWith({
    int? id,
    String? module_name,
    String? description,
    String? error,
  }) {
    return Module(
      id: id ?? this.id,
      module_name: module_name ?? this.module_name,
      description: description ?? this.description,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'module_name': module_name,
      'description': description,
      'error': error,
    };
  }

  factory Module.fromMap(Map<String, dynamic> map) {
    return Module(
      id: map['id'] != null ? map['id'] as int : null,
      module_name: map['module_name'] != null ? map['module_name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Module.fromJson(String source) => Module.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Module(id: $id, module_name: $module_name, description: $description, error: $error)';
  }

  @override
  bool operator ==(covariant Module other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.module_name == module_name &&
      other.description == description &&
      other.error == error;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      module_name.hashCode ^
      description.hashCode ^
      error.hashCode;
  }
}
