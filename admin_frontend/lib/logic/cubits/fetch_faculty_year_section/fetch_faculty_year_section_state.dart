part of 'fetch_faculty_year_section_cubit.dart';

sealed class FetchFacultyYearSectionState extends Equatable {
  const FetchFacultyYearSectionState();

  @override
  List<Object> get props => [];
}

final class FetchFacultyYearSectionInitial extends FetchFacultyYearSectionState {}

class FetchFacultyYearSectionLoading extends FetchFacultyYearSectionState{}

class FetchFacultyYearSectionSuccess extends FetchFacultyYearSectionState{
  final List<YearSectionFacultyModel> sections;

  FetchFacultyYearSectionSuccess({required this.sections});
}

class FetchFacultyYearSectionError extends FetchFacultyYearSectionState{
  final String message;

  FetchFacultyYearSectionError({required this.message});
}