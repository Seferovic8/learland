// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

@immutable
abstract class ErrorEvent {}

class AddErrorHandlerEvent extends ErrorEvent {
  final bool? parametersError;
  final bool? manualError;
  final bool? smartError;
  final bool? timedError;
  AddErrorHandlerEvent({
    this.parametersError,
    this.manualError,
    this.smartError,
    this.timedError,
  });
}
class ResetErrorHandlerEvent extends ErrorEvent{}