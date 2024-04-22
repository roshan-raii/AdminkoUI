import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_exports.dart';

part 'fetch_faculty_state.dart';

class FetchFacultyCubit extends Cubit<FetchFacultyState> {
  FacultyRepository _facultyRepository = new FacultyRepository();
  FetchFacultyCubit() : super(FetchFacultyInitial());

  void fetchFaulties({required String token}) async {
    emit(FetchFacultyLoading());
    final List<FacultyModel> faculites =
        await _facultyRepository.getFaculty(token: token);
    print(faculites);
    if (faculites.length == 0) {
      return emit(FetchFacultySuccess(faculties: []));
    }
    if (faculites[0].error != null) {
      return emit(FetchFacultyError(message: faculites[0].error!));
    }
    return emit(FetchFacultySuccess(faculties: faculites));
  }
}
