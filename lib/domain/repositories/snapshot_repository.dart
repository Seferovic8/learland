import 'package:learland/_all.dart';

abstract class ISnapshotRepository {
  Stream<Map<String, dynamic>?> snapshotListen(String uid, String name);
  Future<void> updateResult({required String uid, required String name, required String path, required bool status});
  Future<void> add({required String uid, required String name});
}

class SnapshotRepository extends ISnapshotRepository {
  //late StreamSubscription _streamSubscription;

  @override
  Stream<Map<String, dynamic>?> snapshotListen(String uid, String name) async* {
    // final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name);
    // await for (var snapshot in stakleniciConn.snapshots()) {
    //   yield snapshot.data();
    // }
  }

  @override
  Future<void> updateResult({required String uid, required String name, required String path, required bool status}) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name).collection('Maintrance').doc('manual');

    await stakleniciConn.update({path: status});
  }

  @override
  Future<void> add({required String uid, required String name}) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name);
    stakleniciConn.set({});
    stakleniciConn.collection('Automatic').doc('smart').set({
      'vlaznostZemlje1': 0,
      'vlaznostZemlje2': 0,
      'temperaturaZraka1': 0,
      'temperaturaZraka2': 0,
      'nivoCo21': 0,
      'nivoCo22': 0,
      'jakostSvjetla': 0,
      'status': false,
    });
    stakleniciConn.collection('Automatic').doc('timed').set({
      'navodnjavanje1': '',
      'navodnjavanje2': '',
      'grijanje1': '',
      'grijanje2': '',
      'provjetravanje1': '',
      'provjetravanje2': '',
      'svjetiljke1': '',
      'svjetiljke2': '',
      'status': false,
    });
    stakleniciConn.collection('Maintrance').doc('parameters').set({
      'temperatura_zraka': 0,
      'nivo_co2': 0,
      'jakost_svjetla': 0,
      'vlaznost_zraka': 0,
      'vlaznost_zemlje': 0,
      'temperatura_zemlje': 0,
    });
    stakleniciConn.collection('Maintrance').doc('manual').set({
      'navodnjavanje': false,
      'grijanje': false,
      'provjetravanje': false,
      'svjetiljke': false,
      'vrata': false,
    });
  }
}
