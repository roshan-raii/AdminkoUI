part of 'add_module_teacher_cubit.dart';

sealed class AddModuleTeacherState extends Equatable {
  const AddModuleTeacherState();

  @override
  List<Object> get props => [];
}

 class AddModuleTeacherInitial extends AddModuleTeacherState {}

class AddModuleTeacherLoading  extends AddModuleTeacherState{}


class AddModuleTeacherSuccess extends AddModuleTeacherState{
  final String message;

  AddModuleTeacherSuccess({required this.message});
}

class AddModuleTeacherError extends AddModuleTeacherState{
  final String message;

  AddModuleTeacherError({required this.message});
}