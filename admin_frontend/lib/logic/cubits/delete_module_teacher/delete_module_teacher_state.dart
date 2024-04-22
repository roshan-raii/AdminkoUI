part of 'delete_module_teacher_cubit.dart';

sealed class DeleteModuleTeacherState extends Equatable {
  const DeleteModuleTeacherState();

  @override
  List<Object> get props => [];
}

final class DeleteModuleTeacherInitial extends DeleteModuleTeacherState {}

class DeleteModuleTeacherLoading extends DeleteModuleTeacherState{}

class DeleteModuleTeacherError extends DeleteModuleTeacherState{
  final String message;

  DeleteModuleTeacherError({required this.message});
}

class DeleteModuleTeacherSuccess extends DeleteModuleTeacherState{
  final String message;

  DeleteModuleTeacherSuccess({required this.message});
}