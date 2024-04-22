import 'dart:convert';

import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends HydratedBloc<LoginEvent, LoginState> {
  LoginRepository repository = new LoginRepository();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<HitLoginEvent>((event, emit) async {
      SuccessModel successModel =
          await repository.login(email: event.email, password: event.password);
      if (successModel.success == 0) {
        return emit(LoginError(message: successModel.message!));
      }
      emit(LoginSuccess(successModel: successModel));
    });
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return LoginSuccess.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    // TODO: implement toJson
    // throw UnimplementedError();
    if (state is LoginSuccess) {
      return state.toMap();
    }
    return null;
  }
}
