import 'package:admin/data/data_exports.dart';

class FacultyRepository {
  FacultyApiProvider _facultyApiProvider = new FacultyApiProvider();
  Future<SuccessModel> addFaculty(
      {required String token, required String name}) async {
    return await _facultyApiProvider.addFaculty(token: token, name: name);
  }

  Future<List<FacultyModel>> getFaculty({required String token}) async {
    return await _facultyApiProvider.getFaculty(token: token);
  }
}
