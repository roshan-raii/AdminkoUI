import 'dart:convert';

import 'package:admin/constants/ip.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class LoginApiProvider {
  Future<SuccessModel> login(
      {required String email, required String password}) async {
    try {
      final url = "${ip()}/admin/login/";
      final request = await http.post(Uri.parse(url),
          body: jsonEncode({'email': email, 'password': password}),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      final body = jsonDecode(request.body);
      return SuccessModel.fromMap(body);
      // body['syu']
    } catch (e) {
      return SuccessModel(success: 0, message: "Connection Error");
    }
  }
}
