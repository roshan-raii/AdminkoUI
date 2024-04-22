import 'package:admin/data/models/module_model.dart';
import 'package:admin/data/repositories/module_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_module_state.dart';

class FetchModuleCubit extends Cubit<FetchModuleState> {
  ModuleRepository _moduleRepository = new ModuleRepository();
  FetchModuleCubit() : super(FetchModuleInitial());

  void fetchModules({required String token}) async {
    emit(FetchModuleLoading());
    final List<Module> modules =
        await _moduleRepository.getModule(token: token);
    if (modules.length == 0) {
      return emit(FetchModuleSuccess(modules: []));
    }
    if (modules[0].error != null) {
      return emit(FetchModuleError(message: modules[0].error!));
    }
    return emit(FetchModuleSuccess(modules: modules));
  }
}
