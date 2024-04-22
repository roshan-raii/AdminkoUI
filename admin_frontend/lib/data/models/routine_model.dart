// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/data_exports.dart';


class RoutineModel {
  int? id;
  SectionModel? section;
  Module? module;
  String? day;
  String? start_time;
  String? end_time;  
  RoutineModel({
    this.id,
    this.section,
    this.module,
    this.day,
    this.start_time,
    this.end_time,
  });

  RoutineModel copyWith({
    int? id,
    SectionModel? section,
    Module? module,
    String? day,
    String? start_time,
    String? end_time,
  }) {
    return RoutineModel(
      id: id ?? this.id,
      section: section ?? this.section,
      module: module ?? this.module,
      day: day ?? this.day,
      start_time: start_time ?? this.start_time,
      end_time: end_time ?? this.end_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'section': section?.toMap(),
      'module': module?.toMap(),
      'day': day,
      'start_time': start_time,
      'end_time': end_time,
    };
  }

  factory RoutineModel.fromMap(Map<String, dynamic> map) {
    return RoutineModel(
      id: map['id'] != null ? map['id'] as int : null,
      section: map['section'] != null ? SectionModel.fromMap(map['section'] as Map<String,dynamic>) : null,
      module: map['module'] != null ? Module.fromMap(map['module'] as Map<String,dynamic>) : null,
      day: map['day'] != null ? map['day'] as String : null,
      start_time: map['start_time'] != null ? map['start_time'] as String : null,
      end_time: map['end_time'] != null ? map['end_time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutineModel.fromJson(String source) => RoutineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoutineModel(id: $id, section: $section, module: $module, day: $day, start_time: $start_time, end_time: $end_time)';
  }

  @override
  bool operator ==(covariant RoutineModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.section == section &&
      other.module == module &&
      other.day == day &&
      other.start_time == start_time &&
      other.end_time == end_time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      section.hashCode ^
      module.hashCode ^
      day.hashCode ^
      start_time.hashCode ^
      end_time.hashCode;
  }
}
