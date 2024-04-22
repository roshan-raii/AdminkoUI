import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'routine_dropdown_logic_state.dart';

class RoutineDropdownLogicCubit extends Cubit<RoutineDropdownLogicState> {
  RoutineDropdownLogicCubit() : super(RoutineDropdownLogicState());

  void changeDropDownValue(
    String year,
  ) {
    Map<dynamic, List<SectionModel>> sections = state.yearSection!;
    List<SectionModel> sectionsList = sections[year]!;
    return emit(state.copyWith(
      section: sectionsList[0],
      year: year,
      sections: sectionsList,
    ));
  }

  void initializeDropDown({YearSectionModel? sectionsMap}) async {
    String year = sectionsMap!.sections.keys.first;
    print(sectionsMap);
    List<SectionModel> sections = sectionsMap.sections[year]!;
    return emit(RoutineDropdownLogicState(
        yearSection: sectionsMap.sections,
        sections: sections,
        year: year,
        years: List.from(sectionsMap.sections.keys)
            .map((e) => e.toString())
            .toList(),
        section: sections[0]));
  }
  @override
  void onChange(Change<RoutineDropdownLogicState> change) {
    print("Current State ${change.currentState} Next State ${change.nextState}");
    super.onChange(change);
  }
}
