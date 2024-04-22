import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../constants/constant_exports.dart';
import '../data_exports.dart';

class StudentApiProvider {
  Future<SuccessModel> addStudent({
    required String token,
    required String dob,
    required String gender,
    required String contactNumber,
    required String address,
    required String joinDate,
    required String collegeMail,
    required String section,
    required String email,
    required String fullName,
    required File image,
  }) async {
    try {
      final url = "${ip()}/admin/createStudent/";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = "Token $token";
      request.fields.addAll({
        'dob': dob,
        'gender': gender,
        'contactNumber': contactNumber,
        'address': address,
        'joinDate': joinDate,
        'collegeMail': collegeMail,
        'section': section,
        'email': email,
        'full_name': fullName,
      });
      final contentType = MediaType('image', 'png');
      request.files.add(http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename:
            'teacher_image.${contentType.subtype}', // Ensure the file name includes correct extension
        contentType: contentType,
      ));
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        print(responseData);
        return SuccessModel.fromMap(jsonDecode(responseData));
      } else {
        // Handle non-200 status code, e.g., server errors
        print('Server Error: ${response.statusCode}');
        return SuccessModel(success: 0, message: 'Server Error');
      }
    } catch (e) {
      print('Error: $e');
      return SuccessModel(success: 0, message: 'Connection Error');
    }
  }
}
