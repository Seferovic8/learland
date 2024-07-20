import 'package:learland/_all.dart';

// class TimeControlWidget extends TimeWidget {
//   TimeControlWidget({
//     Key? key,
//     required this.width,
//     required this.title,
//   }) : super(key: key);
//   final double width;
//   final String title;

//   @override
//   _TimeControlWidgetState createState() => _TimeControlWidgetState(width, title);
// }

// class _TimeControlWidgetState extends TimeWidgetState<TimeControlWidget> {
class TimeControlWidget extends TimeWidget {
  final txt = TextEditingController();
  final double width;
  final String title;
  final txt2 = TextEditingController();

  // _TimeControlWidgetState(this.width, this.title);
  TimeControlWidget({super.key, required this.width, required this.title});

  String? validateDate(String value) {
    if (value.length != 5) {
      return '';
    }
    return null;
  }

  int txtPreviusLenght = 0;
  int txt2PreviusLenght = 0;
  @override
  Widget build(BuildContext context) {
    // txt.addListener
    return BlocBuilder<AutomaticBloc, AutomaticState>(builder: (context, state) {
      if (state.timedStatus == AutomaticTimedStateStatus.loaded) {
        Future.delayed(Duration.zero, () async {
          txt.text = state.dateTimeVrijednosti['${title.toLowerCase()}1'];
          txt2.text = state.dateTimeVrijednosti['${title.toLowerCase()}2'];
          txtPreviusLenght = txt.text.length;
          txt2PreviusLenght = txt2.text.length;
        });
      }
      return Container(
        margin: const EdgeInsets.only(top: 20),
        width: width * 0.8,
        height: 90,
        decoration: BoxDecoration(border: Border.all(color: ColorStyling.defaultColor, width: 2), borderRadius: BorderRadius.circular(23)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocBuilder<ErrorBloc, ErrorState>(
            builder: (context, errorState) {
              if (errorState.timedError) {
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: ColorStyling.defaultColor, fontSize: 20, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      children: [
                        const Text(
                          'Uključi u:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                        ),
                        Container(
                          //margin: const EdgeInsets.only(top: 1),
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          width: 60,
                          height: 23,

                          child: [AutomaticTimedStateStatus.loaded, AutomaticTimedStateStatus.updated].contains(state.timedStatus)
                              ? TextFormField(
                                  decoration: const InputDecoration(errorStyle: TextStyle(height: 0), counterText: ''),
                                  keyboardType: TextInputType.datetime,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                  maxLength: 5,
                                  controller: txt,
                                  onChanged: (value) {
                                    if (value.length >= 2) {
                                      var start = value.substring(0, 2);
                                      final double? startnum = double.tryParse(start);
                                      if (startnum != null) {
                                        if (startnum >= 24) {
                                          start = '23';
                                        }
                                      }
                                      String end = '';
                                      if (value.length >= 3) {
                                        end = value.substring(3);
                                      }
                                      final double? endnum = double.tryParse(end);
                                      if (endnum != null) {
                                        if (endnum >= 60) {
                                          end = '59';
                                        }
                                      }

                                      var newValue = '$start:';
                                      if (newValue.length < txtPreviusLenght) {
                                        newValue = '';
                                      }
                                      txt.text = newValue;
                                      txt.selection = TextSelection.fromPosition(
                                        TextPosition(offset: txt.text.length),
                                      );
                                      txtPreviusLenght = txt.text.length;
                                    }
                                  },
                                  validator: (value) => validateDate(value as String),
                                  onSaved: (newValue) {
                                    if (newValue != null && newValue.isNotEmpty) {
                                      dateTimeVrijednosti['${title.toLowerCase()}1'] = newValue;
                                    } else {
                                      dateTimeVrijednosti['${title.toLowerCase()}1'] = '';
                                    }
                                  },
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                        // Text(
                        //  getJedinica(typeOfParametri),
                        //  style: typeOfParametri == TypeOfParametri.vlaznostZemlje ? const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Roboto') : const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                        //  ),
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
                          child: [AutomaticTimedStateStatus.loaded, AutomaticTimedStateStatus.updated].contains(state.timedStatus)
                              ? TextFormField(
                                  decoration: const InputDecoration(errorStyle: TextStyle(height: 0)),
                                  keyboardType: TextInputType.datetime,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                                  controller: txt2,
                                  onChanged: (value) {
                                    if (value.length >= 2) {
                                      var start = value.substring(0, 2);
                                      final double? startnum = double.tryParse(start);
                                      if (startnum != null) {
                                        if (startnum >= 24) {
                                          start = '23';
                                        }
                                      }
                                      String end = '';
                                      if (value.length >= 3) {
                                        end = value.substring(3);
                                      }
                                      final double? endnum = double.tryParse(end);
                                      if (endnum != null) {
                                        if (endnum >= 60) {
                                          end = '59';
                                        }
                                      }
                                      var newValue = ':';
                                      if (newValue.length < txt2PreviusLenght) {
                                        newValue = '';
                                      }

                                      txt2.text = newValue;
                                      txt2.selection = TextSelection.fromPosition(
                                        TextPosition(offset: txt2.text.length),
                                      );
                                      txt2PreviusLenght = txt2.text.length;
                                    }
                                  },
                                  validator: (value) => validateDate(value as String),
                                  onSaved: (newValue) {
                                    if (newValue != null && newValue.isNotEmpty) {
                                      dateTimeVrijednosti['${title.toLowerCase()}2'] = newValue;
                                    } else {
                                      dateTimeVrijednosti['${title.toLowerCase()}2'] = '';
                                    }
                                  },
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
