import '../data_exports.dart';

class LoginRepository {
  LoginApiProvider loginApiProvider = new LoginApiProvider();
  Future<SuccessModel> login(
      {required String email, required String password}) async {
    return await loginApiProvider.login(email: email, password: password);
  }
}
