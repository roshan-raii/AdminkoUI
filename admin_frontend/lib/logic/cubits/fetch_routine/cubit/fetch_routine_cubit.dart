import 'package:admin/data/data_exports.dart';
import 'package:admin/data/models/routine_model.dart';
import 'package:admin/data/repositories/routine_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'fetch_routine_state.dart';

class FetchRoutineCubit extends Cubit<FetchRoutineState> {
  RoutineRepository _routineRepository = new RoutineRepository();
  FetchRoutineCubit() : super(FetchRoutineInitial());

  void fetchRoutines({required String token,required int section}) async {
    emit(FetchRoutineLoading());
    SuccessModel successModel = await _routineRepository.getRoutine(token: token, section: section);
    if(successModel.success == 0){
      return emit(FetchRoutineError(message: successModel.message!));
    }
    List<RoutineModel> routines = List.from(successModel.data!['routine']).map((e) => RoutineModel.fromMap(e)).toList();
    emit(FetchRoutineSuccess(routines: routines));
  }
  @override
  void onChange(Change<FetchRoutineState> change) {
    print("C ${change.
    currentState} N ${change.nextState}");
    super.onChange(change);
  }
}
