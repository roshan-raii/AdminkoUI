// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final SuccessModel successModel;

  LoginSuccess({
    required this.successModel,
  });

  @override
  List<Object?> get props => [this.successModel];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'successModel': successModel.toMap(),
    };
  }

  factory LoginSuccess.fromMap(Map<String, dynamic> map) {
    return LoginSuccess(
      successModel:
          SuccessModel.fromMap(map['successModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});

  @override
  List<Object?> get props => [this.message];
}
