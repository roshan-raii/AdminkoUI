part of 'add_student_cubit.dart';

@immutable
sealed class AddStudentState {}

class AddStudentInitial extends AddStudentState {}

class AddStudentLoading extends AddStudentState {}

class AddStudentError extends AddStudentState {
  final String message;
  AddStudentError({
    required this.message,
  });
}

class AddStudentSuccess extends AddStudentState {
  final String message;

  AddStudentSuccess({required this.message});
}
