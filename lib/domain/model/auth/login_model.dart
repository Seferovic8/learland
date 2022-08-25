// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

class LoginModel {
  final bool? success;
  final String? error;
  final UserCredential? user;

  LoginModel({required this.success, this.error, this.user});

  LoginModel copyWith({
    bool? success,
    String? error,
    UserCredential? user,
  }) {
    return LoginModel(
      success: success ?? this.success,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}
