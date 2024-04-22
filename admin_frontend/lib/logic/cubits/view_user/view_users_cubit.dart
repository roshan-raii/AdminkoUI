import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_users_state.dart';

class ViewUsersCubit extends Cubit<ViewUsersState> {
  UserRepository _userRepository = new UserRepository();
  ViewUsersCubit() : super(ViewUsersInitial());
  void viewUsers({required String token}) async {
    emit(ViewUsersLoading());
    SuccessModel successModel = await _userRepository.fetchUsers(token: token);
    if (successModel.success == 0) {
      return emit(ViewUsersError(error: successModel.message!));
    }
    List<TeacherModel> teachers = List.from(successModel.data!['teacher'])
        .map((e) => TeacherModel.fromMap(e))
        .toList();
    List<StudentModel> students = List.from(successModel.data!['student'])
        .map((e) => StudentModel.fromMap(e))
        .toList();
    emit(ViewUsersSuccess(teachers: teachers, student: students));
  }

  @override
  void onChange(Change<ViewUsersState> change) {
    print("Current ${change.currentState} next:${change.nextState}");
    super.onChange(change);
  }
}
