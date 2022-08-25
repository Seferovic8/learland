import 'package:learland/_all.dart';

class AutomaticBloc extends Bloc<AutomaticEvent, AutomaticState> {
  final IAutomaticRepository automaticRepository;
  AutomaticBloc({required this.automaticRepository}) : super(AutomaticState(timedStatus: AutomaticTimedStateStatus.initial, smartStatus: AutomaticSmartStateStatus.initial, dateTimeVrijednosti: const {}, smartVrijednosti: const {})) {
    on<LoadSmartAutoEvent>(loadSmart);
    on<AddSmartAutoEvent>(addSmart);
    on<LoadTimeAutoEvent>(loadTIme);
    on<AddTimeAutoEvent>(addTime);
  }
  Future<void> loadSmart(LoadSmartAutoEvent event, Emitter<AutomaticState> emit) async {
    emit(state.copyWith(smartStatus: AutomaticSmartStateStatus.loading));
    final data = await automaticRepository.getSmart(event.uid, event.name);
    emit(state.copyWith(smartStatus: AutomaticSmartStateStatus.loaded, smartVrijednosti: data));
  }

  Future<void> loadTIme(LoadTimeAutoEvent event, Emitter<AutomaticState> emit) async {
    // Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(timedStatus: AutomaticTimedStateStatus.loading));
    final data = await automaticRepository.getTimed(event.uid, event.name);
    emit(state.copyWith(timedStatus: AutomaticTimedStateStatus.loaded, dateTimeVrijednosti: data));
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
