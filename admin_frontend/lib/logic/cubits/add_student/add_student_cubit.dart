import 'dart:io';

import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  UserRepository _studentRepository = new UserRepository();
  AddStudentCubit() : super(AddStudentInitial());
  void addStudent({
    required String dob,
    required String gender,
    required String contactNumber,
    required String address,
    required String joinDate,
    required File image,
    required String full_name,
    required String section,
    required String token,
    required String collegeMail,
    required String email,
  }) async {
    emit(AddStudentLoading());
    SuccessModel _success = await _studentRepository.addStudent(
        token: token,
        dob: dob,
        gender: gender,
        contactNumber: contactNumber,
        address: address,
        joinDate: joinDate,
        image: image,
        full_name: full_name,
        section: section,
        collegeMail: collegeMail,
        email: email);
    print("token ${token}");
    print("dob ${dob}");
    print("gender ${gender}");
    print("contactNumber ${contactNumber}");
    print("address ${address}");
    print("joinDate ${joinDate}");
    print("full_name ${full_name}");
    print("section ${section}");
    print("collegeMail ${collegeMail}");
    print("email ${email}");

    if (_success.success == 0) {
      return emit(AddStudentError(message: _success.message!));
    }
    emit(AddStudentSuccess(message: _success.message!));
  }

  @override
  void onChange(Change<AddStudentState> change) {
    print("Current ${change.currentState} next ${change.nextState}");
    super.onChange(change);
  }
}
