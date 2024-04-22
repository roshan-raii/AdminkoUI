part of 'add_faculty_year_section_cubit.dart';

sealed class AddFacultyYearSectionState extends Equatable {
  const AddFacultyYearSectionState();

  @override
  List<Object> get props => [];
}

final class AddFacultyYearSectionInitial extends AddFacultyYearSectionState {}

class AddFacultyYearSectionLoading extends AddFacultyYearSectionState{}

class AddFacultyYearSectionSuccess extends AddFacultyYearSectionState{
  final String message;

  AddFacultyYearSectionSuccess({required this.message});
}

class AddFacultyYearSectionError extends AddFacultyYearSectionState{
  final String message;

  AddFacultyYearSectionError({required this.message});
}