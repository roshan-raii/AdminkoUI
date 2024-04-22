import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_module_teacher_state.dart';

class DeleteModuleTeacherCubit extends Cubit<DeleteModuleTeacherState> {
  ModuleRepository _moduleRepository = new ModuleRepository();
  DeleteModuleTeacherCubit() : super(DeleteModuleTeacherInitial());

  void deleteModuleTeacher({
    required String token,
    required int id
  }) async{
    emit(DeleteModuleTeacherLoading());
    SuccessModel successModel =await _moduleRepository.deleteModuleTeacher(token: token, moduleTeacherId: id);
    if(successModel.success == 0){
      return emit(DeleteModuleTeacherError(message: successModel.message!));
    }
    return emit(DeleteModuleTeacherSuccess(message: successModel.message!));
  }
  

}
