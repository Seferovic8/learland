import 'package:learland/_all.dart';

class AutomatskiModPage extends StatefulWidget {
  final String workFullName;
  const AutomatskiModPage({super.key, required this.workFullName});

  @override
  State<AutomatskiModPage> createState() => _AutomatskiModPageState();
}

class _AutomatskiModPageState extends State<AutomatskiModPage> {
  @override
  void initState() {
    context.read<AutomaticBloc>().add(LoadSmartAutoEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: widget.workFullName));
    context.read<AutomaticBloc>().add(LoadTimeAutoEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: widget.workFullName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Column(
                children: [
                  MaintranceWidget(
                    workFullName: widget.workFullName,
                  ),
                  TimeWidget(
                    workFullName: widget.workFullName,
                  ),
                ],
              );
            },
          )),
    );
  }
}

bool statusTime = false;
bool statusAuto = true;
Map<String, double> vrijednosti = {
  "vlaznostZemlje1": -1123,
  "vlaznostZemlje2": -1123,
  "temperaturaZraka1": -1123,
  "temperaturaZraka2": -1123,
  "nivoCo21": -1123,
  "nivoCo22": -1123,
  "jakostSvjetla": -1123,
};
Map<String, String> dateTimeVrijednosti = {
  "navodnjavanje1": "",
  "navodnjavanje2": "",
  "grijanje1": "",
  "grijanje2": "",
  "provjetravanje1": "",
  "provjetravanje2": "",
  "svjetiljke1": "",
  "svjetiljke2": "",
};

class MaintranceWidget extends StatelessWidget {
  final form = GlobalKey<FormState>();
  final String? workFullName;
  final List<String> params = ["vlaznostZemlje", "temperaturaZraka", "nivoCo2", "jakostSvjetla"];

  MaintranceWidget({
    Key? key,
    this.workFullName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void formSave() {
      try {
        form.currentState!.save();
      } catch (e) {}
      bool isGone = true;
      if (form.currentState!.validate()) {
        for (var val in params) {
          if (!validatorValues(val, vrijednosti)) {
            context.read<ErrorBloc>().add(AddErrorEvent(key: val));
            isGone = false;
          } else {
            context.read<ErrorBloc>().add(RemoveAllErrors(key: val));
          }
        }
        if (isGone == true) {
          form.currentState!.save();
          context.read<AutomaticBloc>().add(AddSmartAutoEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: workFullName as String, data: vrijednosti));
        }
      } else {
        for (var val in params) {
          if (!validatorValues(val, vrijednosti)) {
            context.read<ErrorBloc>().add(AddErrorEvent(key: val));
          } else {
            context.read<ErrorBloc>().add(RemoveAllErrors(key: val));
          }
        }
      }
    }

    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Automatski Mod",
          style: TextStyle(
            color: ColorStyling.defaultColor,
            fontSize: 23,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: const Text(
                "Pametno održavanje:",
                style: TextStyle(
                  color: ColorStyling.defaultColor,
                  fontSize: 18,
                ),
              ),
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, switchState) {
                return FlutterSwitch(
                  width: 100.0,
                  height: 40.0,
                  valueFontSize: 25.0,
                  toggleSize: 35.0,
                  value: switchState.autoStatus,
                  borderRadius: 30.0,
                  padding: 5.0,
                  showOnOff: true,
                  activeColor: const Color.fromRGBO(64, 129, 6, 1),
                  activeTextColor: Colors.white,
                  inactiveTextColor: Colors.white,
                  inactiveColor: const Color.fromRGBO(165, 22, 81, 1),
                  onToggle: (val) {
                    context.read<SwitchBloc>().add(SwitchUpdateEvent(autoStatus: val, title: workFullName as String));
                  },
                );
              },
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 7),
          height: 508,
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
                color: Colors.grey.withOpacity(context.read<SwitchBloc>().state.autoOpacity),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Form(
            key: form,
            child: BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: !state.autoStatus,
                  child: Column(
                    children: [
                      MaintranceControlWidget(width: width, typeOfParametri: TypeOfParametri.vlaznostZemlje),
                      MaintranceControlWidget(width: width, typeOfParametri: TypeOfParametri.temperaturaZraka),
                      MaintranceControlWidget(width: width, typeOfParametri: TypeOfParametri.nivoCo2),
                      MaintranceControlWidget(width: width, typeOfParametri: TypeOfParametri.jakostSvjetla),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: width - (width * 0.8) - 60, top: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(32, 148, 238, 1)),
                              //textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white,)),
                            ),
                            onPressed: formSave,
                            child: const Text(
                              "Sačuvaj",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}

// class TimeWidget extends StatefulWidget {
//   final String? workFullName;

//   TimeWidget({
//     Key? key,
//     this.workFullName,
//   }) : super(key: key);

//   @override
//   State<TimeWidget> createState() => TimeWidgetState();
// }

// class TimeWidgetState<T extends TimeWidget> extends State<TimeWidget> {
class TimeWidget extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  final String? workFullName;

  TimeWidget({this.workFullName});

  @override
  Widget build(BuildContext context) {
    void saveForm() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.read<AutomaticBloc>().add(AddTimeAutoEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: workFullName as String, data: dateTimeVrijednosti));
        context.read<AutomaticBloc>().add(LoadTimeAutoEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: workFullName as String));
      }
    }

    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 6),
                  child: const Text(
                    "Upravljanje:",
                    style: TextStyle(
                      color: ColorStyling.defaultColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, switchState) {
                  return FlutterSwitch(
                    width: 100.0,
                    height: 40.0,
                    valueFontSize: 25.0,
                  toggleSize: 35.0,
                    value: switchState.timeStatus,
                    borderRadius: 30.0,
                    padding: 5.0,
                    showOnOff: true,
                    activeColor: const Color.fromRGBO(64, 129, 6, 1),
                    activeTextColor: Colors.white,
                    inactiveTextColor: Colors.white,
                    inactiveColor: const Color.fromRGBO(165, 22, 81, 1),
                    onToggle: (val) {
                      context.read<SwitchBloc>().add(SwitchUpdateEvent(timeStatus: val, title: workFullName as String));
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 7),
            height: 508,
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
                  color: Colors.grey.withOpacity(context.read<SwitchBloc>().state.timeOpacity),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return IgnorePointer(
                    ignoring: !state.timeStatus,
                    child: Column(children: [
                      TimeControlWidget(width: width, title: "Navodnjavanje"),
                      TimeControlWidget(width: width, title: "Grijanje"),
                      TimeControlWidget(width: width, title: "Provjetravanje"),
                      TimeControlWidget(width: width, title: "Svjetiljke"),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: width - (width * 0.8) - 60, top: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(32, 148, 238, 1)),
                              //textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white,)),
                            ),
                            onPressed: saveForm,
                            child: const Text(
                              "Sačuvaj",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ]),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
