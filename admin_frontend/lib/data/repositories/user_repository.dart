import 'dart:io';

import 'package:admin/data/apis/delete_api.dart';
import 'package:admin/data/data_exports.dart';

class UserRepository {
  UserApiProvider _userApiProvider = new UserApiProvider();
  StudentApiProvider _studentApiProvider = new StudentApiProvider();
  TeacherApiProvider _teacherApiProvider = new TeacherApiProvider();
  DeleteApiProvider _deleteApiProvider = new DeleteApiProvider();

  Future<SuccessModel> fetchUsers({required String token}) async {
    return await _userApiProvider.fetchAllUsers(token: token);
  }
  Future<SuccessModel> getAllTeachers({
    required String token
  }) async{
    return await _teacherApiProvider.getTeachers(token: token);
  }
  Future<SuccessModel> addStudent({
    required String token,
    required String dob,
    required String gender,
    required String contactNumber,
    required String address,
    required String joinDate,
    required File image,
    required String full_name,
    required String section,
    required String collegeMail,
    required String email,
  }) async {
    print(token);
    print(dob);
    print(gender);
    print(contactNumber);
    print(address);
    print(joinDate);
    print(image);
    print(full_name);
    print(section);
    print(collegeMail);
    print(email);

    return await _studentApiProvider.addStudent(
      token: token,
      dob: dob,
      contactNumber: contactNumber,
      gender: gender,
      address: address,
      joinDate: joinDate,
      image: image,
      fullName: full_name,
      section: section,
      collegeMail: collegeMail,
      email: email,
    );
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
    required String email,
    required String full_name,
    required String experience,
    required String qualification,
    required String collegeMail,
    required String user_type,
  }) async {
    return await _teacherApiProvider.addTeacher(
        token: token,
        faculty: faculty,
        dob: dob,
        gender: gender,
        contactNumber: contactNumber,
        address: address,
        joinDate: joinDate,
        image: image,
        full_name: full_name,
        experience: experience,
        qualification: qualification,
        collegeMail: collegeMail,
        user_type: user_type);
  }

  Future<SuccessModel> delete(
      {required String close,
      required String delete,
      required String token}) async {
    return await _deleteApiProvider.delete(close: close, delete: delete);
  }
}
