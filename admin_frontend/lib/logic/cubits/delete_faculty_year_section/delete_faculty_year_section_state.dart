part of 'delete_faculty_year_section_cubit.dart';

sealed class DeleteFacultyYearSectionState extends Equatable {
  const DeleteFacultyYearSectionState();

  @override
  List<Object> get props => [];
}

final class DeleteFacultyYearSectionInitial extends DeleteFacultyYearSectionState {}

class DeleteFacultyYearSectionLoading extends DeleteFacultyYearSectionState{

}

class DeleteFacultyYearSectionSuccess extends DeleteFacultyYearSectionState{
  final String message;

  DeleteFacultyYearSectionSuccess({required this.message});
}

class DeleteFacultyYearSectionError extends DeleteFacultyYearSectionState{
  final String message;

  DeleteFacultyYearSectionError({required this.message});
}