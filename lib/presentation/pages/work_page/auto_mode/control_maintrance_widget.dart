import 'package:learland/_all.dart';

class MaintranceControlWidget extends MaintranceWidget {
  final double width;
  final TypeOfParametri typeOfParametri;
  MaintranceControlWidget({
    Key? key,
    required this.width,
    required this.typeOfParametri,
  }) : super(key: key);
  String? validateNum(String? value) {
    if (value == null) {
      return '';
    }
    if (value.isEmpty) {
      return '';
    }
    if (double.tryParse(value) == null) {
      return '';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final txt = TextEditingController();
    final txt2 = TextEditingController();
    return BlocBuilder<ErrorColorBloc, ErrorColorState>(
      builder: (context, state) {
        return BlocBuilder<AutomaticBloc, AutomaticState>(
          builder: (context, autoState) {
            if (autoState.smartStatus == AutomaticSmartStateStatus.loaded) {
              if (typeOfParametri != TypeOfParametri.jakostSvjetla) {
                txt.text = autoState.smartVrijednosti['${typeOfParametri.toString().split('.')[1]}1'].toString();
              } else {
                txt.text = autoState.smartVrijednosti[typeOfParametri.toString().split('.')[1]].toString();
              }
              txt2.text = autoState.smartVrijednosti['${typeOfParametri.toString().split('.')[1]}2'].toString();
            }
            return Container(
              margin: const EdgeInsets.only(top: 20),
              width: width * 0.8,
              height: 90,
              decoration: BoxDecoration(border: Border.all(color: state.colors[typeOfParametri.toString().split('.')[1]] as Color, width: 2), borderRadius: BorderRadius.circular(23)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: BlocBuilder<ErrorBloc, ErrorState>(
                  builder: (context, errorState) {
                    if (errorState.smartError) {
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
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        getNaziv(typeOfParametri),
                        style: const TextStyle(color: ColorStyling.defaultColor, fontSize: 20, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: typeOfParametri != TypeOfParametri.jakostSvjetla
                            ? Row(
                                children: [
                                  const Text(
                                    'Od',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                  ),
                                  Container(
                                      //margin: const EdgeInsets.only(top: 1),
                                      padding: const EdgeInsets.symmetric(horizontal: 7),
                                      width: 60,
                                      height: 23,
                                      child: autoState.smartStatus != AutomaticSmartStateStatus.loading
                                          ? TextFormField(
                                              decoration: const InputDecoration(errorStyle: TextStyle(height: 0)),
                                              keyboardType: TextInputType.number,
                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                              controller: txt,
                                              validator: (value) => validateNum(value),
                                              onSaved: (newValue) {
                                                if (newValue != null && newValue.isNotEmpty) {
                                                  vrijednosti['${typeOfParametri.toString().split('.')[1]}1'] = double.parse(newValue);
                                                } else {
                                                  vrijednosti['${typeOfParametri.toString().split('.')[1]}1'] = -1123;
                                                }
                                              },
                                            )
                                          : const Align(alignment: Alignment.center, child: CircularProgressIndicator())),
                                  Text(
                                    getJedinica(typeOfParametri),
                                    style: typeOfParametri == TypeOfParametri.vlaznostZemlje ? const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Roboto') : const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      'do',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                  Container(
                                      //margin: const EdgeInsets.only(top: 1),
                                      padding: const EdgeInsets.symmetric(horizontal: 7),
                                      width: 60,
                                      height: 23,
                                      child: autoState.smartStatus != AutomaticSmartStateStatus.loading
                                          ? TextFormField(
                                              decoration: const InputDecoration(errorStyle: TextStyle(height: 0)),
                                              keyboardType: TextInputType.datetime,
                                              controller: txt2,
                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                              validator: (value) => validateNum(value),
                                              onSaved: (newValue) {
                                                if (newValue != null && newValue.isNotEmpty) {
                                                  vrijednosti['${typeOfParametri.toString().split('.')[1]}2'] = double.parse(newValue);
                                                } else {
                                                  vrijednosti['${typeOfParametri.toString().split('.')[1]}2'] = -1123;
                                                }
                                              },
                                            )
                                          : const Align(alignment: Alignment.center, child: CircularProgressIndicator())),
                                  Text(
                                    getJedinica(typeOfParametri),
                                    style: typeOfParametri == TypeOfParametri.vlaznostZemlje ? const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Roboto') : const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                  ),
                                ],
                                //  ),
                              )
                            : Row(
                                children: [
                                  const Text(
                                    'Iznad',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                  ),
                                  Container(
                                      //margin: const EdgeInsets.only(top: 1),
                                      padding: const EdgeInsets.symmetric(horizontal: 7),
                                      width: 60,
                                      height: 23,
                                      child: autoState.smartStatus != AutomaticSmartStateStatus.loading
                                          ? TextFormField(
                                              decoration: const InputDecoration(errorStyle: TextStyle(height: 0)),
                                              keyboardType: TextInputType.number,
                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                              controller: txt,
                                              validator: (value) => validateNum(value),
                                              onSaved: (newValue) {
                                                if (newValue != null && newValue.isNotEmpty) {
                                                  vrijednosti[typeOfParametri.toString().split('.')[1]] = double.parse(newValue);
                                                } else {
                                                  vrijednosti[typeOfParametri.toString().split('.')[1]] = -1123;
                                                }
                                              },
                                            )
                                          : const Align(alignment: Alignment.center, child: CircularProgressIndicator())),
                                  const Text(
                                    '%',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                  ),
                                ],
                              ),
                      )
                    ]);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
