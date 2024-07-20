
import 'package:learland/_all.dart';

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final AuthModel authModel;

  AuthLoginEvent({required this.authModel});
}
