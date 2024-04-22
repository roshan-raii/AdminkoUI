part of 'fetch_year_sections_cubit.dart';

@immutable
sealed class FetchYearSectionsState {}

final class FetchYearSectionsInitial extends FetchYearSectionsState {}

final class FetchYearSectionsLoading extends FetchYearSectionsState {}

final class FetchYearSectionsSuccess extends FetchYearSectionsState {
  final YearSectionModel yearSections;

  FetchYearSectionsSuccess({required this.yearSections});
}

final class FetchYearSectionsError extends FetchYearSectionsState {
  final String message;

  FetchYearSectionsError({required this.message});
}
