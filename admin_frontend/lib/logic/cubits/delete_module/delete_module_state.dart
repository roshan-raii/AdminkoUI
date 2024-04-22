part of 'delete_module_cubit.dart';

sealed class DeleteModuleState extends Equatable {
  const DeleteModuleState();

  @override
  List<Object> get props => [];
}

final class DeleteModuleInitial extends DeleteModuleState {}

final class DeleteModuleLoading extends DeleteModuleState{}

final class DeleteModuleSuccess extends DeleteModuleState{
  final String message;

  DeleteModuleSuccess({required this.message});
}

final class DeleteModuleError extends DeleteModuleState{
  final String message;

  DeleteModuleError({required this.message});
}