import 'package:learland/_all.dart';

abstract class IAuthRepository {
  Future<AuthState> login(AuthModel model, AuthState state);
}

class AuthRepository extends IAuthRepository {
  @override
  Future<AuthState> login(AuthModel model, AuthState state) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: model.email, password: model.password);
      state = state.copyWith(status: AuthStateStatus.authenticated, success: true, error: null, user: user);
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(status: AuthStateStatus.error, success: false, error: "Greška", user: null);
      switch (e.code) {
        case "user-not-found":
          state = state.copyWith(error: "Email ili lozinka nisu točni");
          break;
        case "invalid-email":
          state = state.copyWith(error: "Nevažeći email");
          break;
        case "invalid-password":
          state = state.copyWith(error: "Nevažeća lozinka");
          break;
        case "wrong-password":
          state = state.copyWith(error: "Netočna lozinka");
          break;
      }
    }

    return state;
    //user.user.
  }
}
