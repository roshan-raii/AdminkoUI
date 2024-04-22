import 'dart:convert';

import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class YearApiProvider {
  Future<SuccessModel> addYear(
      {required String token, required String name}) async {
    try {
      final url = "${ip()}/year/";
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

  Future<List<YearModel>> getYears({required String token}) async {
    try {
      final url = "${ip()}/year/";
      final request = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      final body = jsonDecode(request.body);
      if (body['success'] == 0) {
        return [YearModel(error: body['message'])];
      }
      return List.from(body['data']).map((e) => YearModel.fromMap(e)).toList();
    } catch (e) {
      return [YearModel(error: "Connection Error")];
    }
  }
}
