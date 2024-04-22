part of 'fetch_module_year_faculty_cubit.dart';

sealed class FetchModuleYearFacultyState extends Equatable {
  const FetchModuleYearFacultyState();

  @override
  List<Object> get props => [];
}

final class FetchModuleYearFacultyInitial extends FetchModuleYearFacultyState {}

class FetchModuleYearFacultyLoading extends FetchModuleYearFacultyState{}

class FetchModuleYearFacultySuccess extends FetchModuleYearFacultyState{
  final List<ModuleFacultyYearModel> moduleYearModels;

  FetchModuleYearFacultySuccess({required this.moduleYearModels});
}

class FetchModuleYearFacultyError extends FetchModuleYearFacultyState{
  final String message;

  FetchModuleYearFacultyError({required this.message});
}