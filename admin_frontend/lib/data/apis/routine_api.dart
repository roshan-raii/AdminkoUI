import 'dart:convert';

import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class RoutineApiProvider {

  Future<SuccessModel> getYearSection({
    required String token
  }) async{
    try{
   final url = "${ip()}/section/assign/";
    final request = await http.get(Uri.parse(url),
     headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'application/json; charset=UTF-8'
          }
    );
    return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }
 
  Future<SuccessModel> deleteRoutine({
    required String token,
    required int id,

  }) async{
    try{
      final url = "${ip()}/routine/";
      final request = await http.delete(Uri.parse(url),
      headers: {
        'Authorization':'Token $token',
        'Content-Type':'application/json; charset=UTF-8'
      },
      body: jsonEncode({'id':id})
      );
      return SuccessModel.fromMap(jsonDecode(request.body));

    }
    catch(e){
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }
  Future<SuccessModel> postRoutine({
    required String token,
    required String day,
    required String start_time,
    required String end_time,
    required int module,
    required int section 
  }) async{
    try{
      print(start_time);
      print(end_time);
      final url = "${ip()}/routine/";
      final request = await http.post(Uri.parse(url),
      headers: {
        'Authorization':'Token $token',
        'Content-Type':'application/json; chartset=UTF-8'
      }
      ,
      body: jsonEncode({
        'day':day,
        'start_time':start_time,
        'end_time':end_time,
        'module':module,
        'section':section
      })
      );
      print(request.body);
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }
  Future<SuccessModel> getRoutine({
    required String token,
    required int section
  }) async{
    try{
      print(section);
      final url = "${ip()}/routine/?section=${section}";
      final request = await http.get(Uri.parse(url),
      headers: {
        'Authorization':'Token $token'
      }
      );
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Connection Error");
    }
  }

  // Future<SuccessModel> getYearSection({required String token}) async {
  //   try {
  //     final url = "${ip()}/admin/yearSection/";
  //     final request = await http.get(Uri.parse(url), headers: {
  //       'Authorization': 'Token $token',
  //       'Content-Type': 'application/json; charset=UTF-8'
  //     });
  //     return SuccessModel.fromMap(jsonDecode(request.body));
  //   } catch (e) {
  //     return SuccessModel(success: 0, message: "Connection Error");
  //   }
  // }

  // Future<List<RoutineModel>> getRoutine({required String token}) async {
  //   try {
  //     final url = "${ip()}/routine/";
  //     final request = await http.get(Uri.parse(url), headers: {
  //       'Authorization': 'Token $token',
  //       'Content-Type': 'application/json; charset=UTF-8'
  //     });
  //     final body = jsonDecode(request.body);
  //     print(body);
  //     if (body['success'] == 0) {
  //       return [RoutineModel(error: body['message'])];
  //     }
  //     return List.from(body['data'])
  //         .map((e) => RoutineModel.fromMap(e))
  //         .toList();
  //   } catch (e) {
  //     print(e);
  //     return [RoutineModel(error: "Connection Error")];
  //   }
  // }
}
