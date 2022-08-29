import 'package:learland/_all.dart';

late EnvironmentType environment;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final serviceProvider = await resolveServiceProviderFromEnvironment();
  final rootWidget = RepositoryProvider<ServiceProvider>(
    create: (context) => serviceProvider,
    child: const ContextServiceProviderBloc(
      child: Application(),
    ),
  );
  runApp(rootWidget);
}
