part of 'delete_cubit.dart';

@immutable
sealed class DeleteState {}

final class DeleteInitial extends DeleteState {}

class DeleteLoading extends DeleteState {}

class DeleteError extends DeleteState {
  final String message;
  DeleteError({
    required this.message,
  });
}

class DeleteSuccess extends DeleteState {
  final String message;

  DeleteSuccess({required this.message});
}
