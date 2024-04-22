// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_faculty_cubit.dart';

@immutable
sealed class AddFacultyState {}

class AddFacultyInitial extends AddFacultyState {}

class AddFacultyLoading extends AddFacultyState {}

class AddFacultyError extends AddFacultyState {
  final String message;
  AddFacultyError({
    required this.message,
  });
}

class AddFacultySuccess extends AddFacultyState {
  final String message;

  AddFacultySuccess({required this.message});
}
