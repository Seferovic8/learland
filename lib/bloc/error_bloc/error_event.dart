// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

@immutable
abstract class ErrorEvent {}

@immutable
class AddErrorEvent extends ErrorEvent {
  final String key;
  AddErrorEvent({
    required this.key,
  });
}

@immutable
class RemoveAllErrors extends ErrorEvent {
  final String key;
  RemoveAllErrors({
    required this.key,
  });
}
