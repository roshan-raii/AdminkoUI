// ignore_for_file: must_be_immutable

part of 'delete_routine_cubit.dart';

sealed class DeleteRoutineState extends Equatable {
  const DeleteRoutineState();

  @override
  List<Object> get props => [];
}

final class DeleteRoutineInitial extends DeleteRoutineState {}

final class DeleteRoutineLoading extends DeleteRoutineState{}

class DeleteRoutineSuccess extends DeleteRoutineState{
   String message;

  DeleteRoutineSuccess({required this.message});
    @override
  List<Object> get props => [message];
}

class DeleteRoutineError extends DeleteRoutineState{
  final String message;

  DeleteRoutineError({required this.message});
   @override
  List<Object> get props => [message];
}