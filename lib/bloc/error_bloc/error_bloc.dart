import 'package:learland/_all.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc()
      : super(ErrorState(colors: {
          "vlaznostZemlje": ColorStyling.defaultColor,
          "temperaturaZraka": ColorStyling.defaultColor,
          "nivoCo2": ColorStyling.defaultColor,
          "jakostSvjetla": ColorStyling.defaultColor,
        })) {
    on<AddErrorEvent>(addErrorHandle);
    on<RemoveAllErrors>(removeErrors);
  }
  Future<void> addErrorHandle(AddErrorEvent event, Emitter<ErrorState> emit) async {
    emit(state.copyWith(colors: colorChecker(event.key, state, ColorStyling.validateError)));
  }

  Future<void> removeErrors(RemoveAllErrors event, Emitter<ErrorState> emit) async {
    if (state.colors.values.contains(ColorStyling.validateError)) {
      emit(state.copyWith(colors: colorChecker(event.key, state, ColorStyling.defaultColor)));
    }
  }

  Map<String, Color> colorChecker(String key, ErrorState state, Color color) {
    if (key == "vlaznostZemlje") {
      return {
        "vlaznostZemlje": color,
        "temperaturaZraka": state.colors["temperaturaZraka"] as Color,
        "nivoCo2": state.colors["nivoCo2"] as Color,
        "jakostSvjetla": state.colors["jakostSvjetla"] as Color,
      };
    }
    if (key == "temperaturaZraka") {
      return {
        "vlaznostZemlje": state.colors["vlaznostZemlje"] as Color,
        "temperaturaZraka": color,
        "nivoCo2": state.colors["nivoCo2"] as Color,
        "jakostSvjetla": state.colors["jakostSvjetla"] as Color,
      };
    }
    if (key == "nivoCo2") {
      return {
        "vlaznostZemlje": state.colors["vlaznostZemlje"] as Color,
        "temperaturaZraka": state.colors["temperaturaZraka"] as Color,
        "nivoCo2": color,
        "jakostSvjetla": state.colors["jakostSvjetla"] as Color,
      };
    }
    if (key == "jakostSvjetla") {
      return {
        "vlaznostZemlje": state.colors["vlaznostZemlje"] as Color,
        "temperaturaZraka": state.colors["temperaturaZraka"] as Color,
        "nivoCo2": state.colors["nivoCo2"] as Color,
        "jakostSvjetla": color,
      };
    }
    return {
      "vlaznostZemlje": ColorStyling.defaultColor,
      "temperaturaZraka": ColorStyling.defaultColor,
      "nivoCo2": ColorStyling.defaultColor,
      "jakostSvjetla": ColorStyling.defaultColor,
    };
  }
}
