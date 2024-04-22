part of 'view_users_cubit.dart';

@immutable
sealed class ViewUsersState {}

final class ViewUsersInitial extends ViewUsersState {}

class ViewUsersLoading extends ViewUsersState {}

class ViewUsersSuccess extends ViewUsersState {
  final List<TeacherModel> teachers;
  final List<StudentModel> student;

  ViewUsersSuccess({required this.teachers, required this.student});
}

class ViewUsersError extends ViewUsersState {
  final String error;

  ViewUsersError({required this.error});
}
