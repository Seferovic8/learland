import 'package:learland/_all.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const String routeName = "/home";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<LoadBloc>().add(LoadGetNamesEvent(uid: ""));
    context.read<SnapshotBloc>().add(LoadSnapshotEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: "Staklenik1"));

    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          actions: <Widget>[IconButton(onPressed: () => _scaffoldKey.currentState?.openEndDrawer(), icon: const Icon(Icons.menu, color: ColorStyling.defaultColor))],
          backgroundColor: Colors.white,
          // iconTheme: const IconThemeData(color: ColorStyling.defaultColor),
          title: const Text(
            "Dobro došli",
            style: TextStyle(color: ColorStyling.defaultColor, fontFamily: "Montserrat", fontSize: 24),
          )),
      endDrawer: AppDrawer(page: Pages.homePage),
      body: SingleChildScrollView(
        child: Column(children: [
          _VrijemeWidget(height: height),
          _BrojAktivnikWidget(),
          _IzvjestajiWidget(),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LoadPage.routeName);
              },
              child: Text("GO"))
        ]),
      ),
    );
  }
}

class _VrijemeWidget extends StatelessWidget {
  const _VrijemeWidget({
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.7,
      decoration: BoxDecoration(border: Border.all(color: ColorStyling.defaultColor)),
      margin: EdgeInsets.only(top: height * 0.06, left: 10, right: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Vrijeme danas",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const Icon(
          Icons.sunny,
          color: Colors.yellow,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "21",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Icon(Icons.cloud_done),
            ],
          ),
        )
      ]),
    );
  }
}

class _BrojAktivnikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.7,
      decoration: BoxDecoration(border: Border.all(color: ColorStyling.defaultColor)),
      margin: const EdgeInsets.only(top: 28, left: 10, right: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Broj aktivnik staklenika",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "9",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class _IzvjestajiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8, top: 15),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Izvještaj:",
            style: TextStyle(fontSize: 18, color: Color.fromRGBO(172, 185, 185, 1)),
          ),
        ),
        _GreskePanel(width: mediaQuery.size.width, height: mediaQuery.size.height),
        _UpozorenjePanel(width: mediaQuery.size.width, height: mediaQuery.size.height),
      ],
    );
  }
}

class _GreskePanel extends StatelessWidget {
  const _GreskePanel({required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(10),
      width: width,
      height: height * 0.25,
      decoration: BoxDecoration(color: ColorStyling.error, borderRadius: BorderRadius.circular(32)),
      child: const Text(
        "Greške: 0",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

class _UpozorenjePanel extends StatelessWidget {
  const _UpozorenjePanel({required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
      width: width,
      height: height * 0.25,
      decoration: BoxDecoration(color: ColorStyling.warning, borderRadius: BorderRadius.circular(32)),
      child: const Text(
        "Upozrorenja: 0",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
