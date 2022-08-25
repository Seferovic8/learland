// ignore_for_file: public_member_api_docs, sort_constructors_first
enum SwitchTestStatus {
  initial,
  loading,
  loaded,
  switched,
  switching,
}

class SwitchState {
  SwitchTestStatus status;
  final bool timeStatus;
  final bool autoStatus;

  SwitchState({
    required this.status,
     required this.autoStatus,
     required this.timeStatus,
  });

  factory SwitchState.initialState() {
    return SwitchState(
      status: SwitchTestStatus.initial,
      autoStatus: true,
      timeStatus: false,
    );
  }

  SwitchState copyWith({
    SwitchTestStatus? status,
    bool? autoStatus,
    bool? timeStatus,
  }) {
    return SwitchState(
      status: status ?? this.status,
      autoStatus: autoStatus ?? this.autoStatus,
      timeStatus: timeStatus ?? this.timeStatus,
    );
  }
    double get autoOpacity {
    return autoStatus ? 0.1 : 0.3;
  }

  double get timeOpacity {
    return timeStatus ? 0.1 : 0.3;
  }
}
