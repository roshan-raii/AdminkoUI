import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_module_state.dart';

class DeleteModuleCubit extends Cubit<DeleteModuleState> {
  ModuleRepository _moduleRepository = new ModuleRepository();
  DeleteModuleCubit() : super(DeleteModuleInitial());
  void deleteModule({required String token, required int id}) async{
    emit(DeleteModuleLoading());
    SuccessModel successModel = await _moduleRepository.deleteModule(token: token, id: id);
    if(successModel.success == 1){
      return emit(DeleteModuleSuccess(message: successModel.message!));
    }
    emit(DeleteModuleError(message: successModel.message!));
  }
  @override
  void onChange(Change<DeleteModuleState> change) {
    print("Current state ${change.currentState} Next state ${change.nextState}");
    super.onChange(change);
  }
}
