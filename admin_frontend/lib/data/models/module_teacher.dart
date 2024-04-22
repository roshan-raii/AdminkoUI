// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/data_exports.dart';

class ModuleTeacher {
  int? id;
  Module? module;
  TeacherModel? teacher;
  ModuleTeacher({
    this.id,
    this.module,
    this.teacher,
  });

  ModuleTeacher copyWith({
    int? id,
    Module? module,
    TeacherModel? teacher,
  }) {
    return ModuleTeacher(
      id: id ?? this.id,
      module: module ?? this.module,
      teacher: teacher ?? this.teacher,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'module': module?.toMap(),
      'teacher': teacher?.toMap(),
    };
  }

  factory ModuleTeacher.fromMap(Map<String, dynamic> map) {
    return ModuleTeacher(
      id: map['id'] != null ? map['id'] as int : null,
      module: map['module'] != null ? Module.fromMap(map['module'] as Map<String,dynamic>) : null,
      teacher: map['teacher'] != null ? TeacherModel.fromMap(map['teacher'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModuleTeacher.fromJson(String source) => ModuleTeacher.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModuleTeacher(id: $id, module: $module, teacher: $teacher)';

  @override
  bool operator ==(covariant ModuleTeacher other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.module == module &&
      other.teacher == teacher;
  }

  @override
  int get hashCode => id.hashCode ^ module.hashCode ^ teacher.hashCode;
}
