import 'package:learland/_all.dart';

abstract class ILocationRepository {
  Future<void> load(AuthModel model, AuthState state);
}
class LocationRepository extends ILocationRepository{
  @override
  Future<void> load(AuthModel model, AuthState state) {
    // TODO: implement load
    throw UnimplementedError();
  }
}