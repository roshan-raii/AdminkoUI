// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuccessModel {
  int? success;
  String? message;
  String? token;
  Map? data;
  String? error;
  SuccessModel({
    this.success,
    this.message,
    this.token,
    this.data,
    this.error,
  });

  SuccessModel copyWith({
    int? success,
    String? message,
    String? token,
    Map? data,
    String? error,
  }) {
    return SuccessModel(
      success: success ?? this.success,
      message: message ?? this.message,
      token: token ?? this.token,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'token': token,
      'data': data,
      'error': error,
    };
  }

  factory SuccessModel.fromMap(Map<String, dynamic> map) {
    return SuccessModel(
      success: map['success'] != null ? map['success'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      data: map['data'] != null ? (map['data'] as Map<String, dynamic>) : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuccessModel.fromJson(String source) =>
      SuccessModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuccessModel(success: $success, message: $message, token: $token, data: $data, error: $error)';
  }

  @override
  bool operator ==(covariant SuccessModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.token == token &&
        other.data == data &&
        other.error == error;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        token.hashCode ^
        data.hashCode ^
        error.hashCode;
  }
}
