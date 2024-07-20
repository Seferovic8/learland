import 'package:learland/_all.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  late AuthBloc authBloc;
  late StreamSubscription _streamSubscription;

  late String uid;
  SwitchBloc({required this.authBloc}) : super(SwitchState.initialState()) {
    _streamSubscription = authBloc.stream.listen((state) {
      if (state.user != null) {
        uid = state.user!.user!.uid;
      }
    });
    on<SwitchUpdateEvent>(_update);
    on<GetUpdateEvent>(_getStatus);
  }

  Future<void> _update(SwitchUpdateEvent event, Emitter<SwitchState> emit) async {
    bool? autoStatus;
    bool? timeStatus;
    if (event.autoStatus == true && state.timeStatus == true) {
      autoStatus = true;
      timeStatus = false;
      final bool success = await changeStatus(autoStatus: autoStatus, timeStatus: timeStatus, title: event.title);
      if (success) {
        emit(state.copyWith(autoStatus: autoStatus, timeStatus: timeStatus));
      }
    } else if (event.timeStatus == true && state.autoStatus == true) {
      autoStatus = false;
      timeStatus = true;
      final bool success = await changeStatus(autoStatus: autoStatus, timeStatus: timeStatus, title: event.title);
      if (success) {
        emit(state.copyWith(autoStatus: autoStatus, timeStatus: timeStatus));
      }
      emit(state.copyWith(autoStatus: autoStatus, timeStatus: timeStatus));
    } else {
      autoStatus = event.autoStatus ?? state.autoStatus;
      timeStatus = event.timeStatus ?? state.timeStatus;
      final bool success = await changeStatus(autoStatus: autoStatus, timeStatus: timeStatus, title: event.title);
      if (success) {
        emit(state.copyWith(autoStatus: autoStatus, timeStatus: timeStatus));
      }
    }
  }

  Future<void> _getStatus(GetUpdateEvent event, Emitter<SwitchState> emit) async {
    final mapa = await getStatus(title: event.title);
    emit(state.copyWith(autoStatus: mapa['autoStatus'], timeStatus: mapa['timeStatus']));
  }

  Future<bool> changeStatus({required bool autoStatus, required bool timeStatus, required String title}) async {
    try {
      var stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(title).collection('Automatic').doc('smart');
      await stakleniciConn.update({'status': autoStatus});
      stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(title).collection('Automatic').doc('timed');
      await stakleniciConn.update({'status': timeStatus});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, bool>> getStatus({required String title}) async {
    final Map<String, bool> mapa = {'autoStatus': false, 'timeStatus': false};
    var stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(title).collection('Automatic').doc('smart');
    var data = await stakleniciConn.get();
    if (data.data() != null && data.data()!.isNotEmpty) {
      mapa['autoStatus'] = data.data()!['status'] as bool;
    } else {
      mapa['autoStatus'] = false;
    }
    stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(title).collection('Automatic').doc('timed');
    data = await stakleniciConn.get();
    if (data.data() != null && data.data()!.isNotEmpty) {
      mapa['timeStatus'] = data.data()!['status'] as bool;
    } else {
      mapa['timeStatus'] = false;
    }
    return mapa;
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
