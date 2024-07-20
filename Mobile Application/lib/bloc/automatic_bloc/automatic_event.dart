// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

@immutable
abstract class AutomaticEvent {}

class LoadSmartAutoEvent extends AutomaticEvent {
  final String uid;
  final String name;
  LoadSmartAutoEvent({
    required this.uid,
    required this.name,
  });
}

class AddSmartAutoEvent extends AutomaticEvent {
  final String uid;
  final String name;
  final Map<String, double> data;
  AddSmartAutoEvent({
    required this.uid,
    required this.name,
    required this.data,
  });
}
class AddTimeAutoEvent extends AutomaticEvent {
  final String uid;
  final String name;
  final Map<String, String> data;
  AddTimeAutoEvent({
    required this.uid,
    required this.name,
    required this.data,
  });
}
class LoadTimeAutoEvent extends AutomaticEvent {
  final String uid;
  final String name;
  LoadTimeAutoEvent({
    required this.uid,
    required this.name,
  });
}
