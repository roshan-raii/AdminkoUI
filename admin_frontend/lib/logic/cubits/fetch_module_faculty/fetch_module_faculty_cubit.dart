import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_module_faculty_state.dart';

class FetchModuleFacultyCubit extends Cubit<FetchModuleFacultyState> {
  ModuleRepository _moduleRepository = new ModuleRepository();

  FetchModuleFacultyCubit() : super(FetchModuleFacultyInitial());

  void fetchYearFaculty({required String token}) async{
    SuccessModel successModel = await _moduleRepository.getFacultyYear(token: token,);
    if(successModel.success == 0){
      return emit(FetchModuleFacultyError(message: successModel.message!));
    }
    List<FacultyModel> faculties = List.from(successModel.data!['faculty']).map((e) => FacultyModel.fromMap(e)).toList();
    List<YearModel> years = List.from(successModel.data!['years']).map((e) => YearModel.fromMap(e)).toList(); 
    return emit(FetchModuleFacultySuccess(faculties: faculties, years: years,selectedFaculty: faculties[0].id));
  }
  void changeCurrentFaculty({required int facultyId}) async{
    if(state is  FetchModuleFacultySuccess){
      
      var currentState = state as FetchModuleFacultySuccess;
       List<FacultyModel> faculties = List<FacultyModel>.from(currentState.faculties).map((e) => e).toList();
      List<YearModel> years = List<YearModel>.from(currentState.years).map((e) => e).toList();
      return emit(currentState.copyWith(
        selectedFaculty: facultyId,
        faculties: faculties,
        years: years
      ));
    }

  }
  @override
  void onChange(Change<FetchModuleFacultyState> change) {
    print("Current State ${change.currentState} Next State ${change.nextState}");
    super.onChange(change);
  }
}
