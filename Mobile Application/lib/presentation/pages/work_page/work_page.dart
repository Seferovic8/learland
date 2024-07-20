import 'package:learland/_all.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});
  static const routeName = '/work-page';
  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String title;
  @override
  void initState() {
    context.read<ErrorBloc>().add(ResetErrorHandlerEvent());
    super.initState();
  }

  int _selectedIndexPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //! Argumenti for test--Promijenuti poslje args ne može biti null
    var args = ModalRoute.of(context)!.settings.arguments;

    if (args != null) {
      args = args as Map<String, String>;
      title = args['title'] as String;
    }
    final List<Widget> pages = [
      ManualModPage(workFullName: title),
      AutomatskiModPage(
        workFullName: title,
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        context.read<SnapshotBloc>().add(CloseSnapshotEvent());

        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: AppDrawer(
          page: Pages.workPage,
          workIndex: 0,
        ),
        appBar: AppBar(
          actions: <Widget>[IconButton(onPressed: () => _scaffoldKey.currentState?.openEndDrawer(), icon: const Icon(Icons.menu, color: ColorStyling.defaultColor))],
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black //change your color here
              ),
          title: Text(
            title,
            style: TextStyling.appBarText,
          ),
        ),
        body: pages[_selectedIndexPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndexPage,
          onTap: (value) {
            context.read<SnapshotBloc>().add(CloseSnapshotEvent());
            _selectPage(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/img/icons/rucni-crne.png'),
              activeIcon: Image.asset('assets/img/icons/rucni-bijele.png'),
              label: 'Ručni mod',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/img/icons/home_automation-crne.png'),
              activeIcon: Image.asset('assets/img/icons/home_automation-bijele.png'),
              label: 'Automatski mod',
            ),
          ],
        ),
      ),
    );
  }
}
