import 'package:learland/_all.dart';

@immutable
abstract class LoadEvent {}

class LoadGetNamesEvent extends LoadEvent {
  final String uid;
  LoadGetNamesEvent({required this.uid});
}

class LoadBySearchEvent extends LoadEvent {
  final String searchText;
  LoadBySearchEvent({required this.searchText});
}


