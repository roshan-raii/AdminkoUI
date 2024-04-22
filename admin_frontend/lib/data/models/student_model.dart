// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/faculty_model.dart';
import 'package:admin/data/models/section_model.dart';
import 'package:admin/data/models/year_model.dart';

class StudentModel {
  int? id;
  FacultyModel? faculty;
  String? dob;
  String? gender;
  String? contactNumber;
  YearModel? year;
  String? address;
  String? joinDate;
  String? collegeMail;
  SectionModel? section;
  String? email;
  String? full_name;
  String? user_type;
  String? image;
  StudentModel({
    this.id,
    this.faculty,
    this.dob,
    this.gender,
    this.contactNumber,
    this.year,
    this.address,
    this.joinDate,
    this.collegeMail,
    this.section,
    this.email,
    this.full_name,
    this.user_type,
    this.image,
  });

  StudentModel copyWith({
    int? id,
    FacultyModel? faculty,
    String? dob,
    String? gender,
    String? contactNumber,
    YearModel? year,
    String? address,
    String? joinDate,
    String? collegeMail,
    SectionModel? section,
    String? email,
    String? full_name,
    String? user_type,
    String? image,
  }) {
    return StudentModel(
      id: id ?? this.id,
      faculty: faculty ?? this.faculty,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      contactNumber: contactNumber ?? this.contactNumber,
      year: year ?? this.year,
      address: address ?? this.address,
      joinDate: joinDate ?? this.joinDate,
      collegeMail: collegeMail ?? this.collegeMail,
      section: section ?? this.section,
      email: email ?? this.email,
      full_name: full_name ?? this.full_name,
      user_type: user_type ?? this.user_type,
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
      'year': year?.toMap(),
      'address': address,
      'joinDate': joinDate,
      'collegeMail': collegeMail,
      'section': section?.toMap(),
      'email': email,
      'full_name': full_name,
      'user_type': user_type,
      'image': image,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] != null ? map['id'] as int : null,
      faculty: map['faculty'] != null
          ? FacultyModel.fromMap(map['faculty'] as Map<String, dynamic>)
          : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
      year: map['year'] != null
          ? YearModel.fromMap(map['year'] as Map<String, dynamic>)
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      joinDate: map['joinDate'] != null ? map['joinDate'] as String : null,
      collegeMail:
          map['collegeMail'] != null ? map['collegeMail'] as String : null,
      section: map['section'] != null
          ? SectionModel.fromMap(map['section'] as Map<String, dynamic>)
          : null,
      email: map['email'] != null ? map['email'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      user_type: map['user_type'] != null ? map['user_type'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentModel(id: $id, faculty: $faculty, dob: $dob, gender: $gender, contactNumber: $contactNumber, year: $year, address: $address, joinDate: $joinDate, collegeMail: $collegeMail, section: $section, email: $email, full_name: $full_name, user_type: $user_type, image: $image)';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.faculty == faculty &&
        other.dob == dob &&
        other.gender == gender &&
        other.contactNumber == contactNumber &&
        other.year == year &&
        other.address == address &&
        other.joinDate == joinDate &&
        other.collegeMail == collegeMail &&
        other.section == section &&
        other.email == email &&
        other.full_name == full_name &&
        other.user_type == user_type &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        faculty.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        contactNumber.hashCode ^
        year.hashCode ^
        address.hashCode ^
        joinDate.hashCode ^
        collegeMail.hashCode ^
        section.hashCode ^
        email.hashCode ^
        full_name.hashCode ^
        user_type.hashCode ^
        image.hashCode;
  }
}
