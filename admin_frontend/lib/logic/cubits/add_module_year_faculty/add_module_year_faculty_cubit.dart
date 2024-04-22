import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_module_year_faculty_state.dart';

class AddModuleYearFacultyCubit extends Cubit<AddModuleYearFacultyState> {
  AddModuleYearFacultyCubit() : super(AddModuleYearFacultyInitial());
}
