import 'package:learland/_all.dart';

class ContextServiceProviderBloc extends StatelessWidget {
  final Widget child;
  const ContextServiceProviderBloc({required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (context) => AuthBloc(authRepository: context.serviceProvider.authRepository),
        ),
        BlocProvider<LoadBloc>(
          lazy: false,
          create: (context) => LoadBloc(loadRepository: context.serviceProvider.loadRepository),
        ),
        BlocProvider<SnapshotBloc>(
          lazy: false,
          create: (context) => SnapshotBloc(snapshotRepository: context.serviceProvider.snapshotRepository),
        ),
        BlocProvider<ErrorBloc>(
          lazy: false,
          create: (context) => ErrorBloc(),
        ),
        BlocProvider<AutomaticBloc>(
          lazy: false,
          create: (context) => AutomaticBloc(automaticRepository: context.serviceProvider.automaticRepository),
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
