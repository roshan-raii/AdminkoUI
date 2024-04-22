import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_faculty_year_section_state.dart';

class AddFacultyYearSectionCubit extends Cubit<AddFacultyYearSectionState> {
  SectionRepository _sectionRepository = new SectionRepository();
  AddFacultyYearSectionCubit() : super(AddFacultyYearSectionInitial());
  void addFacultyYearSection({
    required String token,
    required String name,
    required int year,
    required int faculty
  }) async{
    emit(AddFacultyYearSectionLoading());
    SuccessModel successModel = await _sectionRepository.addFacultyYearSection(token: token, year: year, faculty: faculty, sectionName: name);
    if(successModel.success == 0){
      return emit(AddFacultyYearSectionError(message: successModel.message!));
    }
    return emit(AddFacultyYearSectionSuccess(message: successModel.message!));
  }
  @override
  void onChange(Change<AddFacultyYearSectionState> change) {
    print("C ${change.currentState} N ${change.nextState}");
    super.onChange(change);
  }
}
