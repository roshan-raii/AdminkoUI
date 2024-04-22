part of 'fetch_sections_cubit.dart';

@immutable
class FetchSectionsState {}

class FetchSectionsInitial extends FetchSectionsState {}

class FetchSectionsLoading extends FetchSectionsState {}

class FetchSectionsSuccess extends FetchSectionsState {
  final List<SectionModel> sections;

  FetchSectionsSuccess({required this.sections});
}

class FetchSectionsError extends FetchSectionsState {
  final String message;

  FetchSectionsError({required this.message});
}
