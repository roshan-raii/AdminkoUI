import 'package:admin/data/data_exports.dart';

class ModuleRepository {
  ModuleApiProvider _moduleApiProvider = new ModuleApiProvider();
  Future<SuccessModel> deleteModuleTeacher({
      required String token,
    required int moduleTeacherId
  }) async{
    return _moduleApiProvider.deleteModuleTeacher(token: token, moduleTeacherId: moduleTeacherId);
  }
   Future<SuccessModel> getModuleByYear({
    required String token,
    required String id
  }) async{
    return await _moduleApiProvider.getModuleByYear(token: token, id: id);
  }
  Future<SuccessModel> getModuleTeacher({
      required String token, 
    required int module
  }) async{
    return _moduleApiProvider.getModuleTeacher(token: token, module: module);
  }
  Future<SuccessModel> addModuleTeacher({
     required String token,
    required int module, 
    required int teacher
  }) async {
    return _moduleApiProvider.postModuleTeacher(token: token, module: module, teacher: teacher);
  }
  Future<SuccessModel> addModule(
      {required String token,
      required String subject,
      required String startDate,
      required String endDate,
        required int year,
      required int faculty,
      required String description}) async {
    return await _moduleApiProvider.addModule(
      token: token,
      subject: subject,
      startDate: startDate,
      faculty: faculty,
      year: year,
      endDate: endDate,
      description: description,
    );
  }
Future<SuccessModel> getFacultyYear({required String token}) async{
  return await _moduleApiProvider.getFacultyYear(token: token);
}
Future<SuccessModel> getModuleFacultyYearr({required String token,required String faculty, required String year}) async{
  return await _moduleApiProvider.getModuleFacultyYear(token: token, faculty: faculty, year: year);
}
  Future<List<Module>> getModule({required String token}) async {
    return await _moduleApiProvider.getModule(token: token);
  }
  Future<SuccessModel> deleteModule({required String token, required int id}) async{
    return await _moduleApiProvider.deleteModule(token: token, id: id);
  }
}
