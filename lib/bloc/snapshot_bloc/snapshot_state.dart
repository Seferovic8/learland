// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

enum SnapshotStateStatus {
  initial,
  loading,
  updated,
}

class SnapshotState {
  final ParametriModel? paramModel;
  final ControlModel? upravModel;
  final SnapshotStateStatus status;
  SnapshotState({
    required this.status,
    this.paramModel,
    this.upravModel,
  });

  SnapshotState copyWith({
    ParametriModel? paramModel,
    ControlModel? upravModel,
    SnapshotStateStatus? status,
  }) {
    return SnapshotState(
      paramModel: paramModel ?? this.paramModel,
      upravModel: upravModel ?? this.upravModel,
      status: status ?? this.status,
    );
  }
}
