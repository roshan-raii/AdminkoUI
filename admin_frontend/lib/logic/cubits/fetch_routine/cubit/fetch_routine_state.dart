part of 'fetch_routine_cubit.dart';

@immutable
sealed class FetchRoutineState extends Equatable {

  @override
  List<Object> get props => [];
}

class FetchRoutineInitial extends FetchRoutineState {}

class FetchRoutineLoading extends FetchRoutineState {}

class FetchRoutineSuccess extends FetchRoutineState {
  final List<RoutineModel> routines;

  FetchRoutineSuccess({required this.routines});
  
  @override
  List<Object> get props => [routines];
}

class FetchRoutineError extends FetchRoutineState {
  final String message;

  FetchRoutineError({required this.message});

  
  @override
  List<Object> get props => [message];
}
