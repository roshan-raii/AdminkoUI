import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_faculty_year_section_state.dart';

class FetchFacultyYearSectionCubit extends Cubit<FetchFacultyYearSectionState> {
  SectionRepository _sectionRepository = new SectionRepository();
  FetchFacultyYearSectionCubit() : super(FetchFacultyYearSectionInitial());
  void fetchSections({
    required String token,
    required int faculty,
    required int year
  }) async{
    emit(FetchFacultyYearSectionLoading());
    SuccessModel successModel = await _sectionRepository.viewFacultyYearSection(token: token, year: year, faculty: faculty);
    if(successModel.success == 0){
      emit(FetchFacultyYearSectionError(message: successModel.message!));
      return;
    }
    List<YearSectionFacultyModel> sections = List.from(successModel.data!['section']).map((e) => YearSectionFacultyModel.fromMap(e)).toList();
    emit(FetchFacultyYearSectionSuccess(sections: sections));
    return;

  }
  @override
  void onChange(Change<FetchFacultyYearSectionState> change) {
    print("C ${change.currentState} N ${change.nextState}");
    super.onChange(change);
  }
}
