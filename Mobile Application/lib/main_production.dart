import 'package:learland/config/models/enviroment_type.dart';

import 'main.dart' as app;
import 'main.dart';

Future main() async {
  environment = EnvironmentType.production;
  await app.main();
}