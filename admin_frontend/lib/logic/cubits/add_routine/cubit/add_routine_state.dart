part of 'add_routine_cubit.dart';

@immutable
sealed class AddRoutineState {}

class AddRoutineInitial extends AddRoutineState {}

class AddRoutineLoading extends AddRoutineState {}

class AddRoutineError extends AddRoutineState {
  final String message;
  AddRoutineError({
    required this.message,
  });
}

class AddRoutineSuccess extends AddRoutineState {
  final String message;

  AddRoutineSuccess({required this.message});
}
