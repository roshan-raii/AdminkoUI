import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_faculty_year_section_state.dart';

class DeleteFacultyYearSectionCubit extends Cubit<DeleteFacultyYearSectionState> {
  SectionRepository _sectionRepository = new SectionRepository();
  DeleteFacultyYearSectionCubit() : super(DeleteFacultyYearSectionInitial());
  void deleteSection({
    required String token,
    required int sectionId
  }) async{
    emit(DeleteFacultyYearSectionLoading());
    SuccessModel successModel = await _sectionRepository.deleteFacultyYearSection(token: token, sectionId: sectionId);
    if(successModel.success == 0){
      emit(DeleteFacultyYearSectionSuccess(message: successModel.message!));
      return;
    }
    emit(DeleteFacultyYearSectionSuccess(message: successModel.message!));
  }
  @override
  void onChange(Change<DeleteFacultyYearSectionState> change) {
    print("C ${change.currentState} N ${change.nextState}");
    super.onChange(change);
  }
}
