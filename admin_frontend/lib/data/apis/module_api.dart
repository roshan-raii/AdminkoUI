import 'dart:convert';

import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ModuleApiProvider {
  Future<SuccessModel> getModuleByYear({
    required String token,
    required String id
  }) async{
    try{
      final url = "${ip()}/module/moduleYear/?year=${id}";
      final request = await http.get(Uri.parse(url),
      headers: {
        'Authorization':'Token $token',
        'Content-Type':'application/json; charset=UTF-8'
      }
      
      );
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Something wen't wrong");
    }
  }
  Future<SuccessModel> deleteModuleTeacher({
    required String token,
    required int moduleTeacherId
  }) async{
    try{
       final url = "${ip()}/module/teacher/";
      final request = await http.delete(Uri.parse(url),
            headers: {
              'Authorization': 'Token $token',
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({'id':moduleTeacherId})
      );
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Something wen't wrong");
    }
  }
  Future<SuccessModel> postModuleTeacher({
    required String token,
    required int module, 
    required int teacher
  }) async {
    try{
      final url = "${ip()}/module/teacher/";
      final request = await http.post(Uri.parse(url),
            headers: {
              'Authorization': 'Token $token',
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'module':module,
              'teacher':teacher
            })
      );
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,
      message: "Something wen't wrong");
    }
  }
  Future<SuccessModel> getModuleTeacher({
    required String token, 
    required int module
  }) async{
    try{
       final url = "${ip()}/module/teacher/?module=$module";
      final request = await http.get(Uri.parse(url),
      headers: {
              'Authorization': 'Token $token',
              'Content-Type': 'application/json; charset=UTF-8'
            }
      );
      return await SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,
      message: "Something wen't wrong");

    }
     
  }
  Future<SuccessModel> addModule(
      {required String token,
      required String subject,
      required String startDate,
      required String endDate,
      required String description,
      required int year,
      required int faculty
      }) async {
    try {
      final url = "${ip()}/module/";
      final request = await http.post(Uri.parse(url),
          body: jsonEncode({
            'module_name': subject,
            'module_start_date': startDate,
            'module_end_date': endDate,
            'description': description,
            'year':year,
            'faculty':faculty
          }),
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'application/json; charset=UTF-8'
          }
          );
      return SuccessModel.fromMap(jsonDecode(request.body));
    } catch (e) {
      return SuccessModel(success: 0, message: "Connection Error");
    }
  }
  Future<SuccessModel> getFacultyYear({
    required String token
  }) async{
    try{
      final url =  "${ip()}/module/";
      final request = await http.get(Uri.parse(url),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Conection Error");
    }
  }
  Future<SuccessModel> getModuleFacultyYear({required String token,required String faculty, required String year}) async{
    try{
      print(token);
      print(faculty);
      print(year);
      final url = "${ip()}/module/?faculty=${faculty}&year=${year}";
      final request = await http.get(Uri.parse(url),
       headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      final body = jsonDecode(request.body);
      return SuccessModel.fromMap(body);
    }
    catch(e){
      return SuccessModel(
        success: 0,
        message: "Connection Error"
      );
    }
  }
  Future<SuccessModel> deleteModule({required String token, required int id}) async{
    try{
      final url = "${ip()}/module/";
      final request = await http.delete(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({'id':id})
      );
      // return SuccessModel(success: 1,message: "Dele")
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }
  Future<List<Module>> getModule({required String token}) async {
    try {
      final url = "${ip()}/module/";
      final request = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });
      final body = jsonDecode(request.body);
      print(body);
      if (body['success'] == 0) {
        return [Module(error: body['message'])];
      }
      return List.from(body['data'])
          .map((e) => Module.fromMap(e))
          .toList();
    } catch (e) {
      print(e);
      return [Module(error: "Connection Error")];
    }
  }
}
