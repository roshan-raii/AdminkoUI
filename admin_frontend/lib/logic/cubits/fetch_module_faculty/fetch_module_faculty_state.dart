part of 'fetch_module_faculty_cubit.dart';

sealed class FetchModuleFacultyState extends Equatable {
  const FetchModuleFacultyState();

  @override
  List<Object> get props => [];
}

class FetchModuleFacultyInitial extends FetchModuleFacultyState {}

class FetchModuleFacultyLoading extends FetchModuleFacultyState{}

class FetchModuleFacultySuccess extends FetchModuleFacultyState{
  final int? selectedFaculty; 
  final List<FacultyModel> faculties;
  final List<YearModel> years;

  FetchModuleFacultySuccess({required this.faculties, required this.years, required this.selectedFaculty});

  FetchModuleFacultySuccess copyWith({
    int? selectedFaculty,
    List<FacultyModel>? faculties,
    List<YearModel>? years
  }){
    return FetchModuleFacultySuccess(
      faculties: faculties ?? this.faculties,
      selectedFaculty: selectedFaculty ?? this.selectedFaculty,
      years: years ?? this.years
    );
  }
  @override
  List<Object> get props => [selectedFaculty!,faculties,years];
}

class FetchModuleFacultyError extends FetchModuleFacultyState{
  final String message;

  FetchModuleFacultyError({required this.message});
}