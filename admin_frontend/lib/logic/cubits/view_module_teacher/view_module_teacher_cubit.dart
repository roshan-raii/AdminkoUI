import 'package:admin/data/data_exports.dart';
import 'package:admin/data/models/module_teacher.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_module_teacher_state.dart';

class ViewModuleTeacherCubit extends Cubit<ViewModuleTeacherState> {
  ModuleRepository moduleRepository = new ModuleRepository();
  ViewModuleTeacherCubit() : super(ViewModuleTeacherInitial());
  void getModuleTeacher({
    required String token,
    required int module
  }) async {
    emit(ViewModuleTeacherLoading());
    SuccessModel successModel = await moduleRepository.getModuleTeacher(token: token, module: module);
    if(successModel.success == 0){
    emit(ViewModuleTeacherError(message: successModel.message!));
    return;
      
    }
  List<ModuleTeacher> moduleTeachers = List.from(successModel.data!["module"]).map((e) => ModuleTeacher.fromMap(e)).toList();
    return emit(ViewModuleTeacherSuccess(moduleTeacher:moduleTeachers ));
  }
  @override
  void onChange(Change<ViewModuleTeacherState> change) {
    print("C ${change.currentState} N ${change.nextState}");
    super.onChange(change);
  }
}
