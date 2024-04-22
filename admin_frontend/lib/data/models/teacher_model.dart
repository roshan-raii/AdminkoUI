// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/faculty_model.dart';

class TeacherModel {
  int? id;
  FacultyModel? faculty;
  String? dob;
  String? gender;
  String? contactNumber;
  String? address;
  String? joinDate;
  String? collegeMail;
  String? email;
  String? full_name;
  String? user_type;
  String? experience;
  String? qualification;
  String? image;
  TeacherModel({
    this.id,
    this.faculty,
    this.dob,
    this.gender,
    this.contactNumber,
    this.address,
    this.joinDate,
    this.collegeMail,
    this.email,
    this.full_name,
    this.user_type,
    this.experience,
    this.qualification,
    this.image,
  });

  TeacherModel copyWith({
    int? id,
    FacultyModel? faculty,
    String? dob,
    String? gender,
    String? contactNumber,
    String? address,
    String? joinDate,
    String? collegeMail,
    String? email,
    String? full_name,
    String? user_type,
    String? experience,
    String? qualification,
    String? image,
  }) {
    return TeacherModel(
      id: id ?? this.id,
      faculty: faculty ?? this.faculty,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      contactNumber: contactNumber ?? this.contactNumber,
      address: address ?? this.address,
      joinDate: joinDate ?? this.joinDate,
      collegeMail: collegeMail ?? this.collegeMail,
      email: email ?? this.email,
      full_name: full_name ?? this.full_name,
      user_type: user_type ?? this.user_type,
      experience: experience ?? this.experience,
      qualification: qualification ?? this.qualification,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'faculty': faculty?.toMap(),
      'dob': dob,
      'gender': gender,
      'contactNumber': contactNumber,
      'address': address,
      'joinDate': joinDate,
      'collegeMail': collegeMail,
      'email': email,
      'full_name': full_name,
      'user_type': user_type,
      'experience': experience,
      'qualification': qualification,
      'image': image,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      id: map['id'] != null ? map['id'] as int : null,
      faculty: map['faculty'] != null
          ? FacultyModel.fromMap(map['faculty'] 
          as Map<String, dynamic>)
          : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      joinDate: map['joinDate'] != null ? map['joinDate'] as String : null,
      collegeMail:
          map['collegeMail'] != null ? map['collegeMail'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      user_type: map['user_type'] != null ? map['user_type'] as String : null,
      experience:
          map['experience'] != null ? map['experience'] as String : null,
      qualification:
          map['qualification'] != null ? map['qualification'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherModel(id: $id, faculty: $faculty, dob: $dob, gender: $gender, contactNumber: $contactNumber, address: $address, joinDate: $joinDate, collegeMail: $collegeMail, email: $email, full_name: $full_name, user_type: $user_type, experience: $experience, qualification: $qualification, image: $image)';
  }

  @override
  bool operator ==(covariant TeacherModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.faculty == faculty &&
        other.dob == dob &&
        other.gender == gender &&
        other.contactNumber == contactNumber &&
        other.address == address &&
        other.joinDate == joinDate &&
        other.collegeMail == collegeMail &&
        other.email == email &&
        other.full_name == full_name &&
        other.user_type == user_type &&
        other.experience == experience &&
        other.qualification == qualification &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        faculty.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        contactNumber.hashCode ^
        address.hashCode ^
        joinDate.hashCode ^
        collegeMail.hashCode ^
        email.hashCode ^
        full_name.hashCode ^
        user_type.hashCode ^
        experience.hashCode ^
        qualification.hashCode ^
        image.hashCode;
  }
}
