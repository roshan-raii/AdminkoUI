part of 'fetch_years_cubit.dart';

@immutable
sealed class FetchYearsState {}

class FetchYearsInitial extends FetchYearsState {}

class FetchYearsLoading extends FetchYearsState {}

class FetchYearsSuccess extends FetchYearsState {
  final List<YearModel> years;

  FetchYearsSuccess({required this.years});
}

class FetchYearsError extends FetchYearsState {
  final String message;

  FetchYearsError(this.message);
}
