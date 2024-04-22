import 'dart:convert';

import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class UserApiProvider {
  Future<SuccessModel> fetchAllUsers({required String token}) async {
    try {
      final url = "${ip()}/admin/allUsers/";
      final request = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      return SuccessModel.fromMap(jsonDecode(request.body));
    } catch (e) {
      return SuccessModel(success: 0, message: "Connection Error");
    }
  }

  // Future<`SuccessModel`>
}
