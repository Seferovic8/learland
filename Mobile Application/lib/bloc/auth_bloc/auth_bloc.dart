import 'package:learland/_all.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthState(status: AuthStateStatus.initial)) {
    on<AuthLoginEvent>(login);
  }
  Future<void> login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStateStatus.authenticating));
    final login = await authRepository.login(event.authModel, state);
    emit(login);
  }
}
