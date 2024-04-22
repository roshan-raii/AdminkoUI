import 'dart:convert';
import 'package:admin/data/data_exports.dart';
import 'package:collection/collection.dart';

class YearSectionModel {
  final Map<dynamic, List<SectionModel>> sections;
  YearSectionModel({
    required this.sections,
  });

  YearSectionModel copyWith({
    Map<String, List<SectionModel>>? sections,
  }) {
    return YearSectionModel(
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sections': sections,
    };
  }

  factory YearSectionModel.fromMap(Map<dynamic, dynamic> map) {
    Map<String, List<SectionModel>> sectionsMap = {};
    map.forEach((key, value) {
      if (key is String && value is List<dynamic>) {
        sectionsMap[key] = (value as List<dynamic>)
            .map((section) => SectionModel.fromMap(section))
            .toList();
      }
    });
    return YearSectionModel(sections: sectionsMap);
  }
  String toJson() => json.encode(toMap());

  factory YearSectionModel.fromJson(String source) =>
      YearSectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'YearSectionModel(sections: $sections)';

  @override
  bool operator ==(covariant YearSectionModel other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return mapEquals(other.sections, sections);
  }

  @override
  int get hashCode => sections.hashCode;
}
