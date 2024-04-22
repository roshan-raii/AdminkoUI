part of 'add_teacher_cubit.dart';

@immutable
sealed class AddTeacherState {}

class AddTeacherInitial extends AddTeacherState {}

class AddTeacherLoading extends AddTeacherState {}

class AddTeacherError extends AddTeacherState {
  final String message;
  AddTeacherError({
    required this.message,
  });
}

class AddTeacherSuccess extends AddTeacherState {
  final String message;

  AddTeacherSuccess({required this.message});
}
