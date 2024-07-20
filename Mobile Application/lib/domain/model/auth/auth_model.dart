class AuthModel {
  final String email;
  final String password;

  AuthModel({required this.email, required this.password});
  AuthModel copyWith(
    String? email,
    String? password,
  ) =>
      AuthModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
