// ignore_for_file: avoid_print

import 'package:learland/_all.dart';

class SnapshotBloc extends Bloc<SnapshotEvent, SnapshotState> {
  late StreamSubscription _streamSubscriptionpUprav;
  late StreamSubscription _streamSubscriptionParams;
  final ISnapshotRepository snapshotRepository;
  SnapshotBloc({required this.snapshotRepository}) : super(SnapshotState(status: SnapshotStateStatus.initial)) {
    on<LoadSnapshotEvent>(loadSnapshot);
    on<SendSnapshotEvent>(sendSnapshot);
    on<CloseSnapshotEvent>(closeSnapshot);
    on<UpdateSnapshotEvent>(update);
  }

  Future<void> loadSnapshot(LoadSnapshotEvent event, Emitter emit) async {
    final stakleniciConnParams = FirebaseFirestore.instance.collection(event.uid).doc(event.name).collection("Params").doc("Parametri");
    final stakleniciConnUprav = FirebaseFirestore.instance.collection(event.uid).doc(event.name).collection("Params").doc("Upravljanje");
    _streamSubscriptionParams = stakleniciConnParams.snapshots().listen((event) {
      if (event.data()!.isNotEmpty) {
        add(SendSnapshotEvent(state: state.copyWith(status: SnapshotStateStatus.updated, paramModel: ParametriModel.fromMap(event.data() as Map<String, dynamic>))));
      }
    });
    _streamSubscriptionpUprav = stakleniciConnUprav.snapshots().listen((event) {
      if (event.data()!.isNotEmpty) {
        add(SendSnapshotEvent(state: state.copyWith(status: SnapshotStateStatus.updated, upravModel: ControlModel.fromMap(event.data() as Map<String, dynamic>))));
      }
    });
    // // var data  = snapshotRepository.snapshotListen(event.uid, event.name);
    // // data.listen((event) {
    // //   print(event);
    // // });
  }

  Future<void> sendSnapshot(SendSnapshotEvent event, Emitter emit) async {
    if (event.state.upravModel == null && event.state.paramModel == null) {
      emit(state.copyWith(status: SnapshotStateStatus.loading));
      return;
    }
    emit(event.state);
  }

  Future<void> closeSnapshot(CloseSnapshotEvent event, Emitter emit) async {
    _streamSubscriptionParams.cancel();
    _streamSubscriptionpUprav.cancel();
  }

  Future<void> update(UpdateSnapshotEvent event, Emitter emit) async {
    snapshotRepository.updateResult(uid: event.uid, name: event.name, path: event.path, status: event.status);
  }

  @override
  Future<void> close() {
    _streamSubscriptionParams.cancel();
    _streamSubscriptionpUprav.cancel();
    return super.close();
  }
}
