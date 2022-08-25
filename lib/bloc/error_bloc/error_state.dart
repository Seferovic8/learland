// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';

class ErrorState {
  // Map<String, Color> ErrColors = {
  //   "vlaznostZemlje": ColorStyling.defaultColor,
  //   "temperaturaZraka": ColorStyling.defaultColor,
  //   "nivoCo2": ColorStyling.defaultColor,
  //   "jakostSvjetla": ColorStyling.defaultColor,
  // };
  final Map<String, Color> colors;
  ErrorState({
    required this.colors,
  });


  ErrorState copyWith({
    Map<String, Color>? colors,
  }) {
    return ErrorState(
      colors: colors ?? this.colors,
    );
  }
}
