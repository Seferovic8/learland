// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learland/_all.dart';
enum LoadStateStatus {
  initial,
  loading,
  loaded,
}

class LoadState {
  final LoadStateStatus status;
  final List<String>? names;
  final List<String>? searchNames;
  final List<ParametriModel>? model;
  LoadState({
    required this.status,
    this.names,
    this.model,
    this.searchNames,
  });

  LoadState copyWith({
    LoadStateStatus? status,
    List<String>? names,
    List<String>? searchNames,
    List<ParametriModel>? model,
  }) {
    return LoadState(
      status: status ?? this.status,
      names: names ?? this.names,
      model: model ?? this.model,
      searchNames: searchNames ?? this.searchNames,
    );
  }

  int get getLenght {
    if (names != null) {
      return names!.length;
    }
    return 0;
  }

  int get getSearchLenght {
    if (searchNames != null) {
      return searchNames!.length;
    }
    return 0;
  }
}
