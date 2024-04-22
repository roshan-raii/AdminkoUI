import 'package:admin/data/data_exports.dart';

class SectionRepository {
  SectionApiProvider apiProver = new SectionApiProvider();
  Future<List<SectionModel>> getSections({required String token}) async {
    return await apiProver.viewAllSections(token: token);
  }
  Future<SuccessModel> viewFacultyYearSection({required String token,required int year, required int faculty}) async {
    return await apiProver.viewFacultyYearSection(token: token, year: year, faculty: faculty);
  }
    Future<SuccessModel> addFacultyYearSection({
    required String token,required int year, required int faculty,required String sectionName
  }) async{
    return await apiProver.addFacultyYearSection(token: token, year: year, faculty: faculty, sectionName: sectionName);
  }
    Future<SuccessModel> deleteFacultyYearSection({
    required String token,
    required int sectionId
  }) async{
    return await apiProver.deleteFacultyYearSection(token: token, sectionId: sectionId);
  }
}
