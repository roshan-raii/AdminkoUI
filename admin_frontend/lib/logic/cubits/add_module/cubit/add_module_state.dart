part of 'add_module_cubit.dart';

@immutable
sealed class AddModuleState {}

class AddModuleInitial extends AddModuleState {}

class AddModuleLoading extends AddModuleState {}

class AddModuleError extends AddModuleState {
  final String message;
  AddModuleError({
    required this.message,
  });
}

class AddModuleSuccess extends AddModuleState {
  final String message;

  AddModuleSuccess({required this.message});
}
