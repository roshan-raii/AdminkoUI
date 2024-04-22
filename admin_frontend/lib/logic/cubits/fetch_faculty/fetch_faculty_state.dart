part of 'fetch_faculty_cubit.dart';

@immutable
sealed class FetchFacultyState {}

class FetchFacultyInitial extends FetchFacultyState {}

class FetchFacultyLoading extends FetchFacultyState {}

class FetchFacultySuccess extends FetchFacultyState {
  final List<FacultyModel> faculties;

  FetchFacultySuccess({required this.faculties});
}

class FetchFacultyError extends FetchFacultyState {
  final String message;

  FetchFacultyError({required this.message});
}
