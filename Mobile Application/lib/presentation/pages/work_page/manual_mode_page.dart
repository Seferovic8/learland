import 'package:learland/_all.dart';

enum TypeOfParametri { vlaznostZemlje, vlaznostZraka, temperaturaZemlje, temperaturaZraka, nivoCo2, jakostSvjetla }

enum TypeOfUpravljanje { navodnjavanje, provjetravanje, grijanje, svjetiljke, vrata }

dynamic getParamFrNaziv(TypeOfParametri top, ParametriModel model) {
  switch (top) {
    case TypeOfParametri.vlaznostZemlje:
      return model.vlaznostZemlje;
    case TypeOfParametri.vlaznostZraka:
      return model.vlaznostZraka;
    case TypeOfParametri.temperaturaZemlje:
      return model.temperaturaZemlje;
    case TypeOfParametri.temperaturaZraka:
      return model.temperaturaZraka;
    case TypeOfParametri.nivoCo2:
      return model.nivoCo2;
    case TypeOfParametri.jakostSvjetla:
      return model.jakostSvjetla;
  }
}

dynamic getUpravFrNaziv(TypeOfUpravljanje top, ControlModel model) {
  switch (top) {
    case TypeOfUpravljanje.navodnjavanje:
      return model.navodnjavanje;
    case TypeOfUpravljanje.provjetravanje:
      return model.provjetravanje;
    case TypeOfUpravljanje.svjetiljke:
      return model.svjetiljke;
    case TypeOfUpravljanje.grijanje:
      return model.grijanje;
    case TypeOfUpravljanje.vrata:
      return model.vrata;
  }
}

class ManualModPage extends StatefulWidget {
  const ManualModPage({
    Key? key,
    required this.workFullName,
  }) : super(key: key);
  final String workFullName;

  @override
  State<ManualModPage> createState() => _ManualModPageState();
}

class _ManualModPageState extends State<ManualModPage> {
  @override
  void initState() {
    context.read<SnapshotBloc>().add(LoadSnapshotEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: widget.workFullName));
    context.read<SwitchBloc>().add(GetUpdateEvent(title: widget.workFullName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _ParametriWidget(),
              _UpravljanjeWidget(
                workFullName: widget.workFullName,
              ),
            ],
          )),
    );
  }
}

class _ParametriWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ručni mod',
          style: TextStyle(
            color: ColorStyling.defaultColor,
            fontSize: 23,
          ),
        ),
        //),
        Container(
          padding: const EdgeInsets.only(left: 8, bottom: 6),
          child: const Text(
            'Parametri:',
            style: TextStyle(
              color: ColorStyling.defaultColor,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          // margin: const EdgeInsets.only(top: 28, left: 10, right: 10),
          height: 680,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: ColorStyling.defaultColor,
              strokeAlign: StrokeAlign.inside,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              _ParametriVrijednosti(typeOfParametri: TypeOfParametri.vlaznostZemlje, width: width),
              _ParametriVrijednosti(typeOfParametri: TypeOfParametri.vlaznostZraka, width: width),
              _ParametriVrijednosti(typeOfParametri: TypeOfParametri.temperaturaZemlje, width: width),
              _ParametriVrijednosti(typeOfParametri: TypeOfParametri.temperaturaZraka, width: width),
              _ParametriVrijednosti(typeOfParametri: TypeOfParametri.nivoCo2, width: width),
              _ParametriVrijednosti(typeOfParametri: TypeOfParametri.jakostSvjetla, width: width),
            ],
          ),
        ),
      ],
    );
  }
}

class _ParametriVrijednosti extends StatelessWidget {
  String uid = '';
  final TypeOfParametri typeOfParametri;
  final double width;

  String getNaziv(TypeOfParametri top) {
    switch (top) {
      case TypeOfParametri.vlaznostZemlje:
        return 'Vlažnost zemlje:';
      case TypeOfParametri.vlaznostZraka:
        return 'Vlažnost zraka:';
      case TypeOfParametri.temperaturaZemlje:
        return 'Temperatura zemlje:';
      case TypeOfParametri.temperaturaZraka:
        return 'Temperatura zraka:';
      case TypeOfParametri.nivoCo2:
        return 'Nivo CO2 u zraku:';
      case TypeOfParametri.jakostSvjetla:
        return 'Jakost svjetla:';
    }
  }

  String getJedinica(TypeOfParametri top) {
    switch (top) {
      case TypeOfParametri.vlaznostZemlje:
        return 'ppm/m';
      case TypeOfParametri.vlaznostZraka:
        return 'ppm/m';
      case TypeOfParametri.temperaturaZemlje:
        return '°C';
      case TypeOfParametri.temperaturaZraka:
        return '°C';
      case TypeOfParametri.nivoCo2:
        return '%';
      case TypeOfParametri.jakostSvjetla:
        return 'jak';
    }
  }

  _ParametriVrijednosti({required this.typeOfParametri, required this.width});
  @override
  Widget build(BuildContext context) {
    uid = context.read<AuthBloc>().state.user!.user!.uid;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: width * 0.8,
        height: 90,
        decoration: BoxDecoration(border: Border.all(color: ColorStyling.defaultColor, width: 2), borderRadius: BorderRadius.circular(23)),
        child: BlocBuilder<ErrorBloc, ErrorState>(builder: (context, errorState) {
          if (errorState.parametersError) {
            return Container(
              padding: const EdgeInsets.all(12),
              width: width * 0.8,
              height: 30,
              child: const Text(
                'Dogodila se greška',
                style: TextStyle(color: ColorStyling.error),
              ),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(12),
              child: typeOfParametri != TypeOfParametri.jakostSvjetla
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getNaziv(typeOfParametri),
                          style: const TextStyle(color: ColorStyling.defaultColor, fontSize: 20, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                        ),
                        BlocBuilder<SnapshotBloc, SnapshotState>(builder: (context, state) {
                          if ([SnapshotStateStatus.loading, SnapshotStateStatus.initial].contains(state.status)) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: width * 0.8,
                                height: 30,
                                color: Colors.grey[300]!,
                              ),
                            );
                          }

                          final data = getParamFrNaziv(typeOfParametri, state.paramModel as ParametriModel);
                          final mjernaJedinica = getJedinica(typeOfParametri);
                          return Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${data.toString()} ',
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                ),
                                Text(
                                  mjernaJedinica,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                )
                              ],
                            ),
                          );
                        }),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            getNaziv(typeOfParametri),
                            style: const TextStyle(color: ColorStyling.defaultColor, fontSize: 20, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                          ),
                        ),
                        BlocBuilder<SnapshotBloc, SnapshotState>(
                          builder: (context, state) {
                            if ([SnapshotStateStatus.loading, SnapshotStateStatus.initial].contains(state.status)) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11221),
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                              );
                            }
                            //  print(data);
                            final jakSvjetla = getParamFrNaziv(typeOfParametri, state.paramModel as ParametriModel);
                            return Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11221),
                                  color: jakSvjetla < 10 ? Colors.black : Color.fromRGBO(255, 255, 0, jakSvjetla / 100),
                                ),
                                child: Text(
                                  '${jakSvjetla.toString()}%',
                                  style: TextStyle(fontFamily: 'Roboto', color: jakSvjetla < 10 ? Colors.white : Colors.black),
                                ));
                          },
                        ),
                      ],
                    ));
        }));
  }
}

class _UpravljanjeWidget extends StatelessWidget {
  final String workFullName;

  const _UpravljanjeWidget({required this.workFullName});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final width = mediaQuery.size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 8, bottom: 6),
              child: const Text(
                'Upravljanje:',
                style: TextStyle(
                  color: ColorStyling.defaultColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.only(top: 28, left: 10, right: 10),
            height: 291,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: ColorStyling.defaultColor,
                strokeAlign: StrokeAlign.inside,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                _UpravljanjeKontrola(title: 'Navodnjavanje', typeOfUpravljanje: TypeOfUpravljanje.navodnjavanje, workFullName: workFullName),
                _UpravljanjeKontrola(title: 'Provjetravanje', typeOfUpravljanje: TypeOfUpravljanje.provjetravanje, workFullName: workFullName),
                _UpravljanjeKontrola(title: 'Grijanje', typeOfUpravljanje: TypeOfUpravljanje.grijanje, workFullName: workFullName),
                _UpravljanjeKontrola(title: 'Svjetiljke', typeOfUpravljanje: TypeOfUpravljanje.svjetiljke, workFullName: workFullName),
                _UpravljanjeKontrola(title: 'Vrata', typeOfUpravljanje: TypeOfUpravljanje.vrata, workFullName: workFullName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _loadUI(snapshot, BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              )
            ],
            title: const Text('Something went wrong'),
            content: Text(snapshot.error.toString()),
          );
        });
  });
}

class _UpravljanjeKontrola extends StatelessWidget {
  final String workFullName;
  final String title;
  final TypeOfUpravljanje typeOfUpravljanje;
  bool status = true;
  late String uid;

  _UpravljanjeKontrola({
    Key? key,
    required this.title,
    required this.typeOfUpravljanje,
    required this.workFullName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    uid = context.read<AuthBloc>().state.user!.user!.uid;
    final width = mediaQuery.size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: BlocBuilder<ErrorBloc, ErrorState>(
        builder: (context, errorState) {
          if (errorState.manualError) {
            return Container(
              width: width * 0.8,
              height: 30,
              child: const Text(
                'Dogodila se greška',
                style: TextStyle(color: ColorStyling.error),
              ),
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: ColorStyling.defaultColor,
                  fontSize: 22,
                ),
              ),
              BlocBuilder<SnapshotBloc, SnapshotState>(
                builder: (context, state) {
                  if ([SnapshotStateStatus.loading, SnapshotStateStatus.initial].contains(state.status)) {
                    return const CircularProgressIndicator();
                  }
                  return FlutterSwitch(
                      width: 100.0,
                      height: 43.0,
                      valueFontSize: 25.0,
                      toggleSize: 35.0,
                      value: getUpravFrNaziv(typeOfUpravljanje, state.upravModel as ControlModel),
                      borderRadius: 30.0,
                      padding: 5.0,
                      showOnOff: true,
                      activeColor: const Color.fromRGBO(64, 129, 6, 1),
                      activeTextColor: Colors.white,
                      inactiveTextColor: Colors.white,
                      inactiveColor: const Color.fromRGBO(165, 22, 81, 1),
                      onToggle: (val) {
                        context.read<SnapshotBloc>().add(UpdateSnapshotEvent(uid: uid, name: workFullName, path: title.toLowerCase(), status: val));
                      });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
