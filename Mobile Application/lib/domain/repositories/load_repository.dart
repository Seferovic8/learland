import 'package:learland/_all.dart';

abstract class ILoadRepository {
  Future<List<String>> getNames(String uid);
}

class LoadRepository  implements ILoadRepository {
  @override
  Future<List<String>> getNames(String uid) async {
    final stakleniciConn = FirebaseFirestore.instance.collection(uid);

    final data = await stakleniciConn.get();
    return data.docs.map((e) => e.id).toList();
  }

}
