import 'package:learland/_all.dart';

String getNaziv(TypeOfParametri top) {
  switch (top) {
    case TypeOfParametri.vlaznostZemlje:
      return "Vlažnost zemlje:";
    case TypeOfParametri.vlaznostZraka:
      return "Vlažnost zraka:";
    case TypeOfParametri.temperaturaZemlje:
      return "Temperatura zemlje:";
    case TypeOfParametri.temperaturaZraka:
      return "Temperatura zraka:";
    case TypeOfParametri.nivoCo2:
      return "Nivo CO2 u zraku:";
    case TypeOfParametri.jakostSvjetla:
      return "Jakost svjetla:";
  }
}

String getJedinica(TypeOfParametri top) {
  switch (top) {
    case TypeOfParametri.vlaznostZemlje:
      return "ppm/m";
    case TypeOfParametri.vlaznostZraka:
      return "ppm/m";
    case TypeOfParametri.temperaturaZemlje:
      return "°C";
    case TypeOfParametri.temperaturaZraka:
      return "°C";
    case TypeOfParametri.nivoCo2:
      return "%";
    case TypeOfParametri.jakostSvjetla:
      return "jak";
  }
}

bool validatorValues(String key, Map<String, dynamic> vrijednosti) {
  if (vrijednosti[key] == -1123) {
    return false;
  }
  if (key != "jakostSvjetla") {
    if (vrijednosti["${key}1"]! > vrijednosti["${key}2"]!) {
      // _loadUI("data", context);
      return false;
    }
    if (vrijednosti["${key}1"]! < 0) {
      return false;
    }
    if (key == "nivoCo2") {
      if (vrijednosti["${key}1"]! < 0 || vrijednosti["${key}1"]! > 100 || vrijednosti["${key}2"]! < 0 || vrijednosti["${key}2"]! > 100) {
        return false;
      }
    }
  } else {
    if (vrijednosti[key]! < 0 || vrijednosti[key]! > 100) {
      return false;
    }
  }
  return true;
}
// void _loadUI(String data, BuildContext context) {
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text("OK"),
//               )
//             ],
//             title: const Text("Something went wrong"),
//             content: Text(data),
//           );
//         });
//   });
// }

