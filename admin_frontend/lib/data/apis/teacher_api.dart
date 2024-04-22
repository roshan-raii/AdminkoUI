import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';
import 'package:http/http.dart' as http;

class TeacherApiProvider {
  Future<SuccessModel> getTeachers({
    required String token
  }) async{
    try{
      final url = "${ip()}/admin/allTeacher/";
      final request = await http.get(Uri.parse(url),
      headers: {
        'Authorization':'Token $token',
        'Content-Type': 'application/json; charset=UTF-8'
      }
      );
      return SuccessModel.fromMap(jsonDecode(request.body));
    }
    catch(e){
      return SuccessModel(success: 0,message: "Something  wen't wrong");
    }
  }
  Future<SuccessModel> addTeacher({
    required String token,
    required String faculty,
    required String dob,
    required String gender,
    required String contactNumber,
    required String address,
    required String joinDate,
    required File image,
    required String full_name,
    required String experience,
    required String qualification,
    required String collegeMail,
    required String user_type,
  }) async {
    try {
      final url = "${ip()}/admin/createTeacher/";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = "Token $token";
      request.fields['faculty'] = faculty;
      request.fields['dob'] = dob;
      request.fields['gender'] = gender;
      request.fields['full_name'] = full_name;
      request.fields['contactNumber'] = contactNumber;
      request.fields['address'] = address;
      request.fields['joinDate'] = joinDate;
      request.fields['experience'] = experience;
      request.fields['qualification'] = qualification;
      request.fields['collegeMail'] = collegeMail;
      request.fields['user_type'] = user_type;
      final contentType = MediaType('image', 'png');
      request.files.add(http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: 'teacher_image.${contentType.subtype}',
        contentType: contentType,
      ));
      final response = await request.send();
      final finalResponse = await http.Response.fromStream(response);
      print("This is the final Response #${finalResponse}");
      return SuccessModel.fromMap(jsonDecode(finalResponse.body));
    } catch (e) {
      return SuccessModel(success: 0, message: 'Connection Error');
    }
  }
}
