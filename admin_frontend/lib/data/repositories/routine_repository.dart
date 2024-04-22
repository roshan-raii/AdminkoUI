import 'package:admin/constants/constant_exports.dart';
import 'package:admin/data/data_exports.dart';

class RoutineRepository {
  RoutineApiProvider _routineApiProvider = new RoutineApiProvider();

  Future<SuccessModel> getYearSection({required String token}) async {
    return await _routineApiProvider.getYearSection(token: token);
  }

  Future<SuccessModel> getRoutine({required String token,required int section}) async {
    return await _routineApiProvider.getRoutine(token: token,section: section);
  }
  Future<SuccessModel> deleteRoutine({
    required String token,
    required int id
  }) async{
    return await _routineApiProvider.deleteRoutine(token: token, id: id); 
  }
  Future<SuccessModel> addRoutine({
    required String token,
    required String day,
    required String start_time,
    required String end_time,
    required int module,
    required int section
  }) async{
    // final  url = "${ip()}/"
    return await _routineApiProvider.postRoutine(token: token, day: day, start_time: start_time, end_time: end_time, module: module, section: section);
  }
}
