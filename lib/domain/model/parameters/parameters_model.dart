import 'dart:convert';

import 'package:learland/_all.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ParametriModel {
  final double vlaznostZemlje;
  final double vlaznostZraka;
  final double temperaturaZraka;
  final double temperaturaZemlje;
  final double jakostSvjetla;
  final double nivoCo2;
  // final bool navodnjavanje;
  // final bool provjetravanje;
  // final bool vrata;
  // final bool grijanje;
  // final bool svjetiljke;

  ParametriModel({
    required this.vlaznostZemlje,
    required this.vlaznostZraka,
    required this.temperaturaZraka,
    required this.temperaturaZemlje,
    required this.jakostSvjetla,
    required this.nivoCo2,
    // required this.navodnjavanje,
    // required this.provjetravanje,
    // required this.vrata,
    // required this.grijanje,
    // required this.svjetiljke,
  });

  ParametriModel copyWith({
    double? vlaznostZemlje,
    double? vlaznostZraka,
    double? temperaturaZraka,
    double? temperaturaZemlje,
    double? jakostSvjetla,
    double? nivoCo2,
    // bool? navodnjavanje,
    // bool? provjetravanje,
    // bool? vrata,
    // bool? grijanje,
    // bool? svjetiljke,
  }) {
    return ParametriModel(
      vlaznostZemlje: vlaznostZemlje ?? this.vlaznostZemlje,
      vlaznostZraka: vlaznostZraka ?? this.vlaznostZraka,
      temperaturaZraka: temperaturaZraka ?? this.temperaturaZraka,
      temperaturaZemlje: temperaturaZemlje ?? this.temperaturaZemlje,
      jakostSvjetla: jakostSvjetla ?? this.jakostSvjetla,
      nivoCo2: nivoCo2 ?? this.nivoCo2,
      // navodnjavanje: navodnjavanje ?? this.navodnjavanje,
      // provjetravanje: provjetravanje ?? this.provjetravanje,
      // vrata: vrata ?? this.vrata,
      // grijanje: grijanje ?? this.grijanje,
      // svjetiljke: svjetiljke ?? this.svjetiljke,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vlaznostZemlje': vlaznostZemlje,
      'vlaznostZraka': vlaznostZraka,
      'temperaturaZraka': temperaturaZraka,
      'temperaturaZemlje': temperaturaZemlje,
      'jakostSvjetla': jakostSvjetla,
      'nivoCo2': nivoCo2,
      // 'navodnjavanje': navodnjavanje,
      // 'provjetravanje': provjetravanje,
      // 'vrata': vrata,
      // 'grijanje': grijanje,
      // 'svjetiljke': svjetiljke,
    };
  }

  factory ParametriModel.fromMap(Map<String, dynamic> map) {
    return ParametriModel(
      vlaznostZemlje: (map['vlaznost_zemlje'] as num).toDouble(),
      vlaznostZraka: (map['vlaznost_zraka'] as num).toDouble(),
      temperaturaZraka: (map['temperatura_zraka'] as num).toDouble(),
      temperaturaZemlje: (map['temperatura_zemlje'] as num).toDouble(),
      jakostSvjetla: (map['jakost_svjetla'] as num).toDouble(),
      nivoCo2: (map['nivo_co2'] as num).toDouble(),
      // navodnjavanje: map['navodnjavanje'] as bool,
      // provjetravanje: map['provjetravanje'] as bool,
      // vrata: map['vrata'] as bool,
      // grijanje: map['grijanje'] as bool,
      // svjetiljke: map['svjetiljke'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParametriModel.fromJson(String source) => ParametriModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
