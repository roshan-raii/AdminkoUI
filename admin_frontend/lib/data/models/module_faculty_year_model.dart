// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/data_exports.dart';

class ModuleFacultyYearModel {
  int? id;
  Module? module;
  String? module_start_date;
  String? module_end_date;
  int? year;
  int? faculty;
  ModuleFacultyYearModel({
    this.id,
    this.module,
    this.module_start_date,
    this.module_end_date,
    this.year,
    this.faculty,
  });
 

  ModuleFacultyYearModel copyWith({
    int? id,
    Module? module,
    String? module_start_date,
    String? module_end_date,
    int? year,
    int? faculty,
  }) {
    return ModuleFacultyYearModel(
      id: id ?? this.id,
      module: module ?? this.module,
      module_start_date: module_start_date ?? this.module_start_date,
      module_end_date: module_end_date ?? this.module_end_date,
      year: year ?? this.year,
      faculty: faculty ?? this.faculty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'module': module?.toMap(),
      'module_start_date': module_start_date,
      'module_end_date': module_end_date,
      'year': year,
      'faculty': faculty,
    };
  }

  factory ModuleFacultyYearModel.fromMap(Map<String, dynamic> map) {
    return ModuleFacultyYearModel(
      id: map['id'] != null ? map['id'] as int : null,
      module: map['module'] != null ? Module.fromMap(map['module'] as Map<String,dynamic>) : null,
      module_start_date: map['module_start_date'] != null ? map['module_start_date'] as String : null,
      module_end_date: map['module_end_date'] != null ? map['module_end_date'] as String : null,
      year: map['year'] != null ? map['year'] as int : null,
      faculty: map['faculty'] != null ? map['faculty'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModuleFacultyYearModel.fromJson(String source) => ModuleFacultyYearModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModuleFacultyYearModel(id: $id, module: $module, module_start_date: $module_start_date, module_end_date: $module_end_date, year: $year, faculty: $faculty)';
  }

  @override
  bool operator ==(covariant ModuleFacultyYearModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.module == module &&
      other.module_start_date == module_start_date &&
      other.module_end_date == module_end_date &&
      other.year == year &&
      other.faculty == faculty;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      module.hashCode ^
      module_start_date.hashCode ^
      module_end_date.hashCode ^
      year.hashCode ^
      faculty.hashCode;
  }
}
