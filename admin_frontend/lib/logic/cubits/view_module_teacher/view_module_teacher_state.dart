part of 'view_module_teacher_cubit.dart';

sealed class ViewModuleTeacherState extends Equatable {
  const ViewModuleTeacherState();

  @override
  List<Object> get props => [];
}

final class ViewModuleTeacherInitial extends ViewModuleTeacherState {}


class ViewModuleTeacherLoading extends ViewModuleTeacherState{}

class ViewModuleTeacherError extends ViewModuleTeacherState{
  final String message;

  ViewModuleTeacherError({required this.message});
    @override
  List<Object> get props => [this.message];
}


class ViewModuleTeacherSuccess extends ViewModuleTeacherState{
  final List<ModuleTeacher> moduleTeacher;

  ViewModuleTeacherSuccess({required this.moduleTeacher});
    @override
  List<Object> get props => [this.moduleTeacher];
}