import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_module_by_year_state.dart';

class GetModuleByYearCubit extends Cubit<GetModuleByYearState> {
  ModuleRepository _moduleRepository = new ModuleRepository();
  GetModuleByYearCubit() : super(GetModuleByYearInitial());
  void getModule({
    required String token,
    required String yearId
  }) async{
    emit(GetModuleByYearLoading());
    SuccessModel successModel = await _moduleRepository.getModuleByYear(token: token, id: yearId);
    if(successModel.success == 1){
      return emit(GetModuleByYearSuccess(modules: List.from(successModel.data!['modules']).map((e) => Module.fromMap(e)).toList()));
    }
    emit(GetModuleByYearError(message: successModel.message!));
    return;
  }
  @override
  void onChange(Change<GetModuleByYearState> change) {
    print("C ${change.currentState} N: ${change.nextState}");
    super.onChange(change);
  }
}
