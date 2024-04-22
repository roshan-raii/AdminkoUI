import 'dart:convert';

import 'package:admin/data/data_exports.dart';

class YearSectionFacultyModel {
  SectionModel? section;
  YearModel? year;
  FacultyModel? faculty;
  YearSectionFacultyModel({
    this.section,
    this.year,
    this.faculty,
  });

  YearSectionFacultyModel copyWith({
    SectionModel? section,
    YearModel? year,
    FacultyModel? faculty,
  }) {
    return YearSectionFacultyModel(
      section: section ?? this.section,
      year: year ?? this.year,
      faculty: faculty ?? this.faculty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'section': section?.toMap(),
      'year': year?.toMap(),
      'faculty': faculty?.toMap(),
    };
  }

  factory YearSectionFacultyModel.fromMap(Map<String, dynamic> map) {
    return YearSectionFacultyModel(
      section: map['section'] != null ? SectionModel.fromMap(map['section'] as Map<String,dynamic>) : null,
      year: map['year'] != null ? YearModel.fromMap(map['year'] as Map<String,dynamic>) : null,
      faculty: map['faculty'] != null ? FacultyModel.fromMap(map['faculty'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory YearSectionFacultyModel.fromJson(String source) => YearSectionFacultyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'YearSectionFacultyModel(section: $section, year: $year, faculty: $faculty)';

  @override
  bool operator ==(covariant YearSectionFacultyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.section == section &&
      other.year == year &&
      other.faculty == faculty;
  }

  @override
  int get hashCode => section.hashCode ^ year.hashCode ^ faculty.hashCode;
}
