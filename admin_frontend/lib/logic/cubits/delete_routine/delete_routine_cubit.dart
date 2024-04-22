import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/ip.dart';

part 'delete_routine_state.dart';

class DeleteRoutineCubit extends Cubit<DeleteRoutineState> {

  RoutineRepository _routineRepository = new RoutineRepository();
  DeleteRoutineCubit() : super(DeleteRoutineInitial());
  void deleteRoutine({
    required String token,
    required int id
  }) async
  {
    emit(DeleteRoutineLoading());
    SuccessModel successModel = await _routineRepository.deleteRoutine(token: token, id: id);
    if(successModel.success == 0){
      return emit(DeleteRoutineError(message: successModel.message!));
    }
    return emit(DeleteRoutineSuccess(message: successModel.message!));
  }
  @override
  void onChange(Change<DeleteRoutineState> change) {
    print("C: ${change.currentState} N: ${change.nextState}");
    super.onChange(change);
  }
}
