// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

class ErrorColorState {
  // Map<String, Color> ErrColors = {
  //   "vlaznostZemlje": ColorStyling.defaultColor,
  //   "temperaturaZraka": ColorStyling.defaultColor,
  //   "nivoCo2": ColorStyling.defaultColor,
  //   "jakostSvjetla": ColorStyling.defaultColor,
  // };
  final Map<String, Color> colors;
  ErrorColorState({
    required this.colors,
  });

  ErrorColorState copyWith({
    Map<String, Color>? colors,
  }) {
    return ErrorColorState(
      colors: colors ?? this.colors,
    );
  }
}
