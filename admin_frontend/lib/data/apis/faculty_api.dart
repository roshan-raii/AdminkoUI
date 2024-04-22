import 'dart:convert';

import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class FacultyApiProvider {
  Future<SuccessModel> addFaculty(
      {required String token, required String name}) async {
    try {
      final url = "${ip()}/faculty/";
      final request = await http
          .post(Uri.parse(url), body: jsonEncode({'name': name}), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      return SuccessModel.fromMap(jsonDecode(request.body));
    } catch (e) {
      return SuccessModel(success: 0, message: "Connection Error");
    }
  }

  Future<List<FacultyModel>> getFaculty({required String token}) async {
    try {
      final url = "${ip()}/faculty/";
      final request = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      final body = jsonDecode(request.body);
      print(body);
      if (body['success'] == 0) {
        return [FacultyModel(error: body['message'])];
      }
      return List.from(body['data'])
          .map((e) => FacultyModel.fromMap(e))
          .toList();
    } catch (e) {
      print(e);
      return [FacultyModel(error: "Connection Error")];
    }
  }
}
