import 'dart:convert';

import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class SectionApiProvider {
  Future<List<SectionModel>> viewAllSections({required String token}) async {
    try {
      final url = "${ip()}/section/all/";
      final request = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      final body = jsonDecode(request.body);
      if (body['success'] == 0) {
        return [SectionModel.withError(error: body['message'])];
      }
      List<SectionModel> sections =
          List.from(body['data']).map((e) => SectionModel.fromMap(e)).toList();
      return sections;
    } catch (e) {
      return [SectionModel.withError(error: 'Connection Error')];
    }
  }
  Future<SuccessModel> deleteFacultyYearSection({
    required String token,
    required int sectionId
  }) async{
    try{
      final url = "${ip()}/section/";
      final request = await http.delete(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "id":sectionId
      })
      );
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }
  Future<SuccessModel> addFacultyYearSection({
    required String token,required int year, required int faculty,required String sectionName
  }) async{
    try{
      final url = "${ip()}/section/";
      final request = await http.post(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        "name":sectionName,
        "year":year,
        "faculty":faculty
      })
      );
      return SuccessModel.fromMap(jsonDecode(request.body)); 
    }
    catch(e){
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }
    Future<SuccessModel> viewFacultyYearSection({required String token,required int year, required int faculty}) async {
    try {
      final url = "${ip()}/section/?year=$year&faculty=$faculty";
      final request = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      final body = jsonDecode(request.body);
      return SuccessModel.fromMap(body);
    } catch (e) {
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }
}

// class Year