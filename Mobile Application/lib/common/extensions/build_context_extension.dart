import 'package:learland/_all.dart';

extension BuildContextExtension on BuildContext {
  ServiceProvider get serviceProvider => RepositoryProvider.of<ServiceProvider>(this);
  AppSettings get appSettings => serviceProvider.appSettings;
}
