import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_teachers_state.dart';

class GetAllTeachersCubit extends Cubit<GetAllTeachersState> {
  UserRepository userRepository = new UserRepository();
  GetAllTeachersCubit() : super(GetAllTeachersInitial());

  void getAllTeachers({
    required String token
  }) async{
    emit(GetAllTeachersLoading());
    SuccessModel successModel = await userRepository.getAllTeachers(token: token);
    if(successModel.success == 0){
      emit(GetAllTeachersError(message: successModel.message!));
      return;
    }
    List<TeacherModel> teachers = List.from(successModel.data!['teachers']).map((e) => TeacherModel.fromMap(e)).toList();
    emit(GetAllTeachersSuccess(teachers: teachers));
    return;
  }
  @override
  void onChange(Change<GetAllTeachersState> change) {
    print("C ${change.currentState} N ${change.nextState}");
    super.onChange(change);
  }
}

