import 'package:admin/data/data_exports.dart';
import 'package:admin/data/repositories/module_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_module_state.dart';

class AddModuleCubit extends Cubit<AddModuleState> {
  ModuleRepository _moduleRepository = new ModuleRepository();
  AddModuleCubit() : super(AddModuleInitial());
  void addModule(
      {required String token,
      required String subject,
      required String startDate,
      required String endDate,
       required int year,
      required int faculty,
      required String description}) async {
    emit(AddModuleLoading());
    SuccessModel _success = await _moduleRepository.addModule(
        token: token,
        subject: subject,
        startDate: startDate,
        endDate: endDate,
        year: year,
        faculty: faculty,
        description: description);
    if (_success.success == 0) {
      return emit(AddModuleError(message: _success.message!));
    }
    emit(AddModuleSuccess(message: _success.message!));
  }

  @override
  void onChange(Change<AddModuleState> change) {
    print("Current ${change.currentState} next ${change.nextState}");
    super.onChange(change);
  }
}
