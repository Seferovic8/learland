// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

enum AutomaticSmartStateStatus { initial, loading, loaded, updating, updated }

enum AutomaticTimedStateStatus { initial, loading, loaded, updating, updated }

@immutable
class AutomaticState {
  final Map<String, dynamic> dateTimeVrijednosti;
  final Map<String, dynamic> smartVrijednosti;
  final AutomaticSmartStateStatus smartStatus;
  final AutomaticTimedStateStatus timedStatus;
  AutomaticState({
    required this.dateTimeVrijednosti,
    required this.smartVrijednosti,
    required this.smartStatus,
    required this.timedStatus,
  });

  AutomaticState copyWith({
    Map<String, dynamic>? dateTimeVrijednosti,
    Map<String, dynamic>? smartVrijednosti,
    AutomaticSmartStateStatus? smartStatus,
    AutomaticTimedStateStatus? timedStatus,
  }) {
    return AutomaticState(
      dateTimeVrijednosti: dateTimeVrijednosti ?? this.dateTimeVrijednosti,
      smartVrijednosti: smartVrijednosti ?? this.smartVrijednosti,
      smartStatus: smartStatus ?? this.smartStatus,
      timedStatus: timedStatus ?? this.timedStatus,
    );
  }
}
