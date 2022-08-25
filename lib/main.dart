import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learland/config/models/enviroment_type.dart';
import 'package:learland/presentation/painters/login_painter.dart';
import 'package:learland/presentation/root/application.dart';
import 'package:learland/service_providers/context_service_provider_blocs.dart';
import 'package:learland/service_providers/service_provider.dart';

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
