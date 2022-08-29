// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

@immutable
abstract class ErrorColorEvent {}

@immutable
class AddErrorEvent extends ErrorColorEvent {
  final String key;
  AddErrorEvent({
    required this.key,
  });
}

@immutable
class RemoveAllErrors extends ErrorColorEvent {
  final String key;
  RemoveAllErrors({
    required this.key,
  });
}
