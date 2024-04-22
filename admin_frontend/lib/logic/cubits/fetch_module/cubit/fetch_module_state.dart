part of 'fetch_module_cubit.dart';

@immutable
sealed class FetchModuleState {}

class FetchModuleInitial extends FetchModuleState {}

class FetchModuleLoading extends FetchModuleState {}

class FetchModuleSuccess extends FetchModuleState {
  final List<Module> modules;

  FetchModuleSuccess({required this.modules});
}

class FetchModuleError extends FetchModuleState {
  final String message;

  FetchModuleError({required this.message});
}
