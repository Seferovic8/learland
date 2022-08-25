import 'package:learland/_all.dart';

abstract class IAutomaticRepository {
  Future<Map<String, dynamic>?> getSmart(String uid, String name);
  Future<void> addSmart(String uid, String name, Map<String, double> data);
  Future<void> addTimed(String uid, String name, Map<String, String> data);
  Future<Map<String, dynamic>?> getTimed(String uid, String name);
}

class AutomaticRepository extends IAutomaticRepository {
  @override
  Future<Map<String, dynamic>?> getSmart(String uid, String name) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name).collection("Odrzavanje").doc("pametno");
    var data = await stakleniciConn.get();
    if (data.exists) {
      return data.data();
    }
    return {};
  }

  @override
  Future<Map<String, dynamic>?> getTimed(String uid, String name) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name).collection("Odrzavanje").doc("timed");
    var data = await stakleniciConn.get();
    if (data.exists) {
      return data.data();
    }
    return {};
  }

  @override
  Future<void> addSmart(String uid, String name, Map<String, double> data) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name).collection("Odrzavanje").doc("pametno");
    await stakleniciConn.update(data);
  }

  @override
  Future<void> addTimed(String uid, String name, Map<String, String> data) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid).doc(name).collection("Odrzavanje").doc("timed");
    await stakleniciConn.update(data);
  }
}
