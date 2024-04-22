import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_faculty_state.dart';

class AddFacultyCubit extends Cubit<AddFacultyState> {
  FacultyRepository _facultyRepository = new FacultyRepository();
  AddFacultyCubit() : super(AddFacultyInitial());
  void addFaculty({required String token, required String name}) async {
    emit(AddFacultyLoading());
    SuccessModel _success =
        await _facultyRepository.addFaculty(token: token, name: name);
    if (_success.success == 0) {
      return emit(AddFacultyError(message: _success.message!));
    }
    emit(AddFacultySuccess(message: _success.message!));
  }

  @override
  void onChange(Change<AddFacultyState> change) {
    print("Current ${change.currentState} next ${change.nextState}");
    super.onChange(change);
  }
}
