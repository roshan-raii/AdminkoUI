import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_routine_state.dart';

class AddRoutineCubit extends Cubit<AddRoutineState> {
  RoutineRepository _routineRepository = new RoutineRepository();
  AddRoutineCubit() : super(AddRoutineInitial());
  void addRoutine({
    required String token,
    required String day,
    required String start_time,
    required String end_time,
    required int module,
    required int section
  }) async {
    emit(AddRoutineLoading());
    SuccessModel successModel = await _routineRepository.addRoutine(token: token, day: day, start_time: start_time, end_time: end_time, module: module, section: section);
    if(successModel.success == 0){
      return emit(AddRoutineError(message: successModel.message!));
    }
    emit(AddRoutineSuccess(message: successModel.message!)); 

  }

  @override
  void onChange(Change<AddRoutineState> change) {
    print("Current ${change.currentState} next ${change.nextState}");
    super.onChange(change);
  }
}
