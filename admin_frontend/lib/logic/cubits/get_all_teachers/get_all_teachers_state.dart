part of 'get_all_teachers_cubit.dart';

sealed class GetAllTeachersState extends Equatable {
  const GetAllTeachersState();

  @override
  List<Object> get props => [];
}

final class GetAllTeachersInitial extends GetAllTeachersState {}

class GetAllTeachersLoading extends GetAllTeachersState{}

class GetAllTeachersSuccess extends GetAllTeachersState{
  final List<TeacherModel> teachers;

  GetAllTeachersSuccess({required this.teachers});
}

class GetAllTeachersError extends GetAllTeachersState{
  final String message;

  GetAllTeachersError({required this.message});
}