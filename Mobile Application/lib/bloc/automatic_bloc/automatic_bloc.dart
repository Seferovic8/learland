import 'package:learland/_all.dart';

class AutomaticBloc extends Bloc<AutomaticEvent, AutomaticState> {
  final IAutomaticRepository automaticRepository;
  final ErrorBloc errorBloc;
  AutomaticBloc({required this.automaticRepository, required this.errorBloc}) : super(const AutomaticState(timedStatus: AutomaticTimedStateStatus.initial, smartStatus: AutomaticSmartStateStatus.initial, dateTimeVrijednosti: {}, smartVrijednosti: {})) {
    on<LoadSmartAutoEvent>(loadSmart);
    on<AddSmartAutoEvent>(addSmart);
    on<LoadTimeAutoEvent>(loadTIme);
    on<AddTimeAutoEvent>(addTime);
  }
  Future<void> loadSmart(LoadSmartAutoEvent event, Emitter<AutomaticState> emit) async {
    emit(state.copyWith(smartStatus: AutomaticSmartStateStatus.loading));
    final data = await automaticRepository.getSmart(event.uid, event.name);
    if (data != null && data.isNotEmpty) {
      emit(state.copyWith(smartStatus: AutomaticSmartStateStatus.loaded, smartVrijednosti: data));
    } else {
      errorBloc.add(AddErrorHandlerEvent(smartError: true));
    }
  }

  Future<void> loadTIme(LoadTimeAutoEvent event, Emitter<AutomaticState> emit) async {
    // Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(timedStatus: AutomaticTimedStateStatus.loading));
    final data = await automaticRepository.getTimed(event.uid, event.name);
    if (data != null && data.isNotEmpty) {
      emit(state.copyWith(timedStatus: AutomaticTimedStateStatus.loaded, dateTimeVrijednosti: data));
    } else {
      errorBloc.add(AddErrorHandlerEvent(timedError: true));
    }
  }

  Future<void> addSmart(AddSmartAutoEvent event, Emitter<AutomaticState> emit) async {
    emit(state.copyWith(smartStatus: AutomaticSmartStateStatus.updating));
    await automaticRepository.addSmart(event.uid, event.name, event.data);
    emit(state.copyWith(smartStatus: AutomaticSmartStateStatus.updated));
  }

  Future<void> addTime(AddTimeAutoEvent event, Emitter<AutomaticState> emit) async {
    emit(state.copyWith(timedStatus: AutomaticTimedStateStatus.updating));
    await automaticRepository.addTimed(event.uid, event.name, event.data);
    emit(state.copyWith(timedStatus: AutomaticTimedStateStatus.updated));
  }
}
