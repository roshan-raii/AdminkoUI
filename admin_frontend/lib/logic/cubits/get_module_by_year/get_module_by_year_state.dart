part of 'get_module_by_year_cubit.dart';

sealed class GetModuleByYearState extends Equatable {
  const GetModuleByYearState();

  @override
  List<Object> get props => [];
}

final class GetModuleByYearInitial extends GetModuleByYearState {}

final class GetModuleByYearLoading extends GetModuleByYearState{}

class GetModuleByYearSuccess extends GetModuleByYearState{
  final List<Module> modules;

  GetModuleByYearSuccess({required this.modules});
    @override
  List<Object> get props => [modules];
}

class GetModuleByYearError extends GetModuleByYearState{
  final String message;

  GetModuleByYearError({required this.message});
    @override
  List<Object> get props => [message];
}