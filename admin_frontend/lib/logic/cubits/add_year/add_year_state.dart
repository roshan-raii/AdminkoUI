part of 'add_year_cubit.dart';

@immutable
sealed class AddYearState {}

class AddYearInitial extends AddYearState {}

class AddYearLoading extends AddYearState {}

class AddYearSuccess extends AddYearState {
  final String message;

  AddYearSuccess({required this.message});
}

class AddYearError extends AddYearState {
  final String message;

  AddYearError({required this.message});
}
