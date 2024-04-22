import 'dart:io';

import 'package:admin/data/models/success_model.dart';
import 'package:admin/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_teacher_state.dart';

class AddTeacherCubit extends Cubit<AddTeacherState> {
  UserRepository _teacherRepository = new UserRepository();
  AddTeacherCubit() : super(AddTeacherInitial());
  void addTeacher({
    required String faculty,
    required String dob,
    required String gender,
    required String contactNumber,
    required String address,
    required String joinDate,
    required String collegeMail,
    required String email,
    required String full_name,
    required String user_type,
    required String experience,
    required String qualification,
    required File image,
    required String token,
  }) async {
    emit(AddTeacherLoading());
    SuccessModel _success = await _teacherRepository.addTeacher(
        token: token,
        faculty: faculty,
        dob: dob,
        gender: gender,
        contactNumber: contactNumber,
        address: address,
        joinDate: joinDate,
        image: image,
        full_name: full_name,
        collegeMail: collegeMail,
        email: email,
        user_type: user_type,
        experience: experience,
        qualification: qualification);
    if (_success.success == 0) {
      return emit(AddTeacherError(message: _success.message!));
    }
    emit(AddTeacherSuccess(message: _success.message!));
  }

  @override
  void onChange(Change<AddTeacherState> change) {
    print("Current ${change.currentState} next ${change.nextState}");
    super.onChange(change);
  }
}
