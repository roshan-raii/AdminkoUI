// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ForgotPassword {
  String? email;
  String? otp;
  String? password;
  ForgotPassword({
    this.email,
    this.otp,
    this.password,
  });

  ForgotPassword copyWith({
    String? email,
    String? otp,
    String? password,
  }) {
    return ForgotPassword(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'otp': otp,
      'password': password,
    };
  }

  factory ForgotPassword.fromMap(Map<String, dynamic> map) {
    return ForgotPassword(
      email: map['email'] != null ? map['email'] as String : null,
      otp: map['otp'] != null ? map['otp'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgotPassword.fromJson(String source) =>
      ForgotPassword.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ForgotPassword(email: $email, otp: $otp, password: $password)';

  @override
  bool operator ==(covariant ForgotPassword other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.otp == otp &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ otp.hashCode ^ password.hashCode;
}
