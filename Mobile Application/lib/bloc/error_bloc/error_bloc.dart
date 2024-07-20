import 'package:learland/_all.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(ErrorState(manualError: false, parametersError: false, smartError: false, timedError: false)) {
    on<AddErrorHandlerEvent>(handle);
    on<ResetErrorHandlerEvent>(reset);
  }
  Future<void> handle(AddErrorHandlerEvent event, Emitter emit) async {
    emit(state.copyWith(
      parametersError: event.parametersError,
      manualError: event.manualError,
      smartError: event.smartError,
      timedError: event.timedError,
    ));
  }

  Future<void> reset(ResetErrorHandlerEvent event, Emitter emit) async {
    emit(state.copyWith(
      parametersError: false,
      manualError: false,
      smartError: false,
      timedError: false,
    ));
  }
}
