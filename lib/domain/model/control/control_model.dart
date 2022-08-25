import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ControlModel {
  final bool navodnjavanje;
  final bool provjetravanje;
  final bool vrata;
  final bool grijanje;
  final bool svjetiljke;
  ControlModel({
    required this.navodnjavanje,
    required this.provjetravanje,
    required this.vrata,
    required this.grijanje,
    required this.svjetiljke,
  });

  ControlModel copyWith({
    bool? navodnjavanje,
    bool? provjetravanje,
    bool? vrata,
    bool? grijanje,
    bool? svjetiljke,
  }) {
    return ControlModel(
      navodnjavanje: navodnjavanje ?? this.navodnjavanje,
      provjetravanje: provjetravanje ?? this.provjetravanje,
      vrata: vrata ?? this.vrata,
      grijanje: grijanje ?? this.grijanje,
      svjetiljke: svjetiljke ?? this.svjetiljke,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'navodnjavanje': navodnjavanje,
      'provjetravanje': provjetravanje,
      'vrata': vrata,
      'grijanje': grijanje,
      'svjetiljke': svjetiljke,
    };
  }

  factory ControlModel.fromMap(Map<String, dynamic> map) {
    return ControlModel(
      navodnjavanje: map['navodnjavanje'] as bool,
      provjetravanje: map['provjetravanje'] as bool,
      vrata: map['vrata'] as bool,
      grijanje: map['grijanje'] as bool,
      svjetiljke: map['svjetiljke'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ControlModel.fromJson(String source) => ControlModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
