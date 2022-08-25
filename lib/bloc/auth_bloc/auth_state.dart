// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

enum AuthStateStatus {
  initial,
  authenticating,
  authenticated,
  error,
}

class AuthState {
  AuthStateStatus status;
  final bool? success;
  final String? error;
  final UserCredential? user;

  AuthState({required this.status, this.success, this.error, this.user});

  AuthState copyWith({
    AuthStateStatus? status,
    bool? success,
    String? error,
    UserCredential? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      success: success ?? this.success,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}
