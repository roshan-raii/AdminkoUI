import 'package:admin/data/data_exports.dart';

class YearRepository {
  YearApiProvider _yearApiProvider = new YearApiProvider();
  Future<SuccessModel> addYear(
      {required String token, required String name}) async {
    return await _yearApiProvider.addYear(token: token, name: name);
  }

  Future<List<YearModel>> getYears({required String token}) async {
    return await _yearApiProvider.getYears(token: token);
  }
}
