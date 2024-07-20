import 'package:learland/_all.dart';

class LoadBloc extends Bloc<LoadEvent, LoadState> {
  final ILoadRepository loadRepository;
  LoadBloc({required this.loadRepository}) : super(LoadState(status: LoadStateStatus.initial)) {
    on<LoadGetNamesEvent>(getNames);
    on<LoadBySearchEvent>(getBySearch);
  }
  Future<void> getNames(LoadGetNamesEvent event, Emitter emit) async {
    emit(state.copyWith(status: LoadStateStatus.loading));
    final names = await loadRepository.getNames(event.uid);
    emit(state.copyWith(status: LoadStateStatus.loaded, names: names));
  }

  Future<void> getBySearch(LoadBySearchEvent event, Emitter emit) async {
    if (state.names != null) {
      final searched = state.names!.where((element) => element.toLowerCase().startsWith(event.searchText.toLowerCase())).toList();
      emit(state.copyWith(searchNames: searched));
    }
  }
}
