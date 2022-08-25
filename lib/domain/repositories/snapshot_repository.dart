import 'package:learland/_all.dart';

abstract class ISnapshotRepository {
  Stream<Map<String, dynamic>?> snapshotListen(String uid, String name);
  Future<void> updateResult({required String uid, required String name, required String path, required bool status});
}

class SnapshotRepository extends ISnapshotRepository {
  late StreamSubscription _streamSubscription;

  @override
  Stream<Map<String, dynamic>?> snapshotListen(String uid, String name) async* {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name);
    await for (var snapshot in stakleniciConn.snapshots()) {
      yield snapshot.data();
    }
  }

  @override
  Future<void> updateResult({required String uid, required String name, required String path, required bool status}) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name).collection("Params").doc("Upravljanje");

    await stakleniciConn.update({path: status});
  }
}
