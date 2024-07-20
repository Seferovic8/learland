import 'package:learland/_all.dart';

class ContextServiceProviderBloc extends StatelessWidget {
  final Widget child;
  const ContextServiceProviderBloc({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (context) => AuthBloc(authRepository: context.serviceProvider.authRepository),
        ),
        BlocProvider<ErrorBloc>(
          lazy: false,
          create: (context) => ErrorBloc(),
        ),
        BlocProvider<LoadBloc>(
          lazy: false,
          create: (context) => LoadBloc(loadRepository: context.serviceProvider.loadRepository),
        ),
        BlocProvider<SnapshotBloc>(
          lazy: false,
          create: (context) => SnapshotBloc(
            snapshotRepository: context.serviceProvider.snapshotRepository,
            errorBloc: context.read<ErrorBloc>(),
          ),
        ),
        BlocProvider<ErrorColorBloc>(
          lazy: false,
          create: (context) => ErrorColorBloc(),
        ),
        BlocProvider<AutomaticBloc>(
          lazy: false,
          create: (context) => AutomaticBloc(
            automaticRepository: context.serviceProvider.automaticRepository,
            errorBloc: context.read<ErrorBloc>(),
          ),
        ),
        BlocProvider<SwitchBloc>(
          lazy: false,
          create: (context) => SwitchBloc(authBloc: context.read<AuthBloc>()),
        ),
      ],
      child: child,
    );
  }
}
