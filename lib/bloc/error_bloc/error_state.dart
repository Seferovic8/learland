// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

class ErrorState {
  final bool parametersError;
  final bool manualError;
  final bool smartError;
  final bool timedError;
  ErrorState({
    required this.parametersError,
    required this.manualError,
    required this.smartError,
    required this.timedError,
  });

  ErrorState copyWith({
    bool? parametersError,
    bool? manualError,
    bool? smartError,
    bool? timedError,
  }) {
    return ErrorState(
      parametersError: parametersError ?? this.parametersError,
      manualError: manualError ?? this.manualError,
      smartError: smartError ?? this.smartError,
      timedError: timedError ?? this.timedError,
    );
  }
}
