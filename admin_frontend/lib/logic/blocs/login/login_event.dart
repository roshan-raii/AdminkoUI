part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class HitLoginEvent extends LoginEvent {
  final String email;
  final String password;

  HitLoginEvent({required this.email, required this.password});
  // SuccessModel ac = new SuccessModel(success
}
