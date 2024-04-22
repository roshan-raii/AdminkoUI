import 'dart:convert';

import 'package:admin/constants/ip.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class DeleteApiProvider {
  Future<SuccessModel> delete(
      {required String close, required String delete}) async {
    try {
      final url = "${ip()}/admin/delete/";
      final request = await http.post(Uri.parse(url),
          body: jsonEncode({'close': close, 'delete': delete}),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      final body = jsonDecode(request.body);
      return SuccessModel.fromMap(body);
    } catch (e) {
      return SuccessModel(success: 0, message: "Connection Error");
    }
  }
}
