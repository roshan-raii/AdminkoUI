import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/data_exports.dart';

part 'fetch_module_year_faculty_state.dart';

class FetchModuleYearFacultyCubit extends Cubit<FetchModuleYearFacultyState> {
  FetchModuleYearFacultyCubit() : super(FetchModuleYearFacultyInitial());
  ModuleRepository _moduleRepository = new ModuleRepository();
  void fetchModuleYearFaculty({required String token, required String faculty, required String year  }) async{
    emit(FetchModuleYearFacultyLoading());
    SuccessModel successModel = await _moduleRepository.getModuleFacultyYearr(token: token, faculty: faculty, year: year);
    if(successModel.success == 0){
      return emit(FetchModuleYearFacultyError(message: successModel.message!));
    }
    List<ModuleFacultyYearModel> moduleFaculty = List.from(successModel.data!['module']).map((e) => ModuleFacultyYearModel.fromMap(e)).toList();
  return  emit(FetchModuleYearFacultySuccess(moduleYearModels: moduleFaculty));
  } 

  @override
  void onChange(Change<FetchModuleYearFacultyState> change) {
    print("C: ${change.currentState} N: ${change.nextState}");
    super.onChange(change);
  }
}

