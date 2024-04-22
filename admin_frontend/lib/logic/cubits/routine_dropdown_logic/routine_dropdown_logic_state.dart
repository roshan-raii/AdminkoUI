part of 'routine_dropdown_logic_cubit.dart';

@immutable
class RoutineDropdownLogicState {
  final Map<dynamic, List<SectionModel>>? yearSection;
  final List<String>? years;
  final List<SectionModel>? sections;
  final String? year;
  final SectionModel? section;

  RoutineDropdownLogicState(
      {this.years, this.sections, this.year, this.section, this.yearSection});
  RoutineDropdownLogicState copyWith(
      {List<String>? years,
      List<SectionModel>? sections,
      String? year,
      Map<dynamic, List<SectionModel>>? yearSection,
      SectionModel? section}) {
    return RoutineDropdownLogicState(
        years: years ?? this.years,
        sections: sections ?? this.sections,
        year: year ?? this.year,
        yearSection: yearSection ?? this.yearSection,
        section: section ?? this.section);
  }
}
