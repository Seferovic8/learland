import 'package:learland/_all.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'MontSerrat'),
      home: !context.appSettings.skipLogin ? const LoadPage() : const LoginPage(),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        LoadPage.routeName: (context) =>  const LoadPage(),
        WorkPage.routeName: (context) => const WorkPage(),
      },
    );
  }
}
