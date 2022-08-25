import 'package:flutter/services.dart';
import 'package:learland/_all.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LoadPage extends StatefulWidget {
  LoadPage({super.key});
  static const routeName = "/load-page";

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    context.read<LoadBloc>().add(LoadGetNamesEvent(uid: context.read<AuthBloc>().state.user!.user!.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<SnapshotBloc>().add(LoadSnapshotEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: "Staklenik1"));

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawer(page: Pages.loadPage),
      appBar: AppBar(
        actions: <Widget>[IconButton(onPressed: () => _scaffoldKey.currentState?.openEndDrawer(), icon: const Icon(Icons.menu, color: ColorStyling.defaultColor))],
        backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(color: ColorStyling.defaultColor),
        title: const Text(
          "Dobro došli",
          style: TextStyle(color: ColorStyling.defaultColor, fontFamily: "Montserrat", fontSize: 24),
        ),
      ),
      body: BlocListener<LoadBloc, LoadState>(
        listener: (context, state) {
          if (state.status == LoadStateStatus.loaded) {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: isLoading == true
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: const Color.fromRGBO(162, 191, 132, 1), border: Border.all(strokeAlign: StrokeAlign.inside, color: ColorStyling.defaultColor, width: 2)),
                      ))),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1, crossAxisSpacing: 10, mainAxisExtent: 150),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ListTile(
                        title: Container(
                          height: 34,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1, color: ColorStyling.defaultColor, style: BorderStyle.solid)),
                          child: TextField(
                            onChanged: (value) {
                              context.read<LoadBloc>().add(LoadBySearchEvent(searchText: value));
                            },
                            decoration: const InputDecoration(border: InputBorder.none, hintText: "Pretraži...", contentPadding: EdgeInsets.only(left: 15, bottom: 12), hintStyle: TextStyle(color: Color.fromRGBO(0, 102, 242, 1))),
                          ),
                        ),
                        trailing: const Icon(Icons.search, color: ColorStyling.defaultColor, size: 32),
                      ),
                    ),
                    BlocBuilder<LoadBloc, LoadState>(
                      builder: (context, state) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount: state.searchNames == null ? state.getLenght : state.getSearchLenght,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) => LoadItem(name: state.searchNames == null ? state.names![index] : state.searchNames![index])),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1, crossAxisSpacing: 10, mainAxisExtent: 150, mainAxisSpacing: 10),
                        );
                      },
                    ),
                  ],
                ),
                //)
                // ],
              ),
      ),
      // floatingActionButton: FloatingActionButton,
    );
  }
}
