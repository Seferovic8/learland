// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

@immutable
abstract class SnapshotEvent {}

class LoadSnapshotEvent extends SnapshotEvent {
  final String uid;
  final String name;

  LoadSnapshotEvent({
    required this.uid,
    required this.name,
  });
}

class SendSnapshotEvent extends SnapshotEvent {
  final SnapshotState state;
  SendSnapshotEvent({
    required this.state,
  });
}

class CloseSnapshotEvent extends SnapshotEvent {}

class UpdateSnapshotEvent extends SnapshotEvent {
  final String uid;
  final String name;
  final String path;
  final bool status;
  UpdateSnapshotEvent({
    required this.uid,
    required this.name,
    required this.path,
    required this.status,
  });
}
class AddInstanceEvent extends SnapshotEvent {
  final String uid;
  final String name;

  AddInstanceEvent({
    required this.uid,
    required this.name,
  });
}