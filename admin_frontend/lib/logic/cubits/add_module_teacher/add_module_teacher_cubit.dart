import 'package:admin/data/data_exports.dart';
import 'package:admin/data/models/module_teacher.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_module_teacher_state.dart';

class AddModuleTeacherCubit extends Cubit<AddModuleTeacherState> {
  ModuleRepository _moduleRepository = new ModuleRepository();
  AddModuleTeacherCubit() : super(AddModuleTeacherInitial());

  void addModuleTeacher({
    required String token,
    required int module, 
    required int teacher
  }) async{
    emit(AddModuleTeacherLoading());
    SuccessModel successModel = await _moduleRepository.addModuleTeacher(token: token, module: module, teacher: teacher);
    if(successModel.success == 0){

      emit(AddModuleTeacherError(message: successModel.message! ));
    }
    emit(AddModuleTeacherSuccess(message: successModel.message!));
  }
  @override
  void onChange(Change<AddModuleTeacherState> change) {
    print("C ${change.currentState} N: ${change.nextState}");
    super.onChange(change);
  }
}
