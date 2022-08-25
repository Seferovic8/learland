abstract class SwitchEvent {}

class SwitchUpdateEvent extends SwitchEvent {
  bool? timeStatus;
  bool? autoStatus;
  final String title;
  SwitchUpdateEvent({
    this.timeStatus,
    this.autoStatus,
    required this.title,
  });
}
class GetUpdateEvent extends SwitchEvent {
  final String title;
  GetUpdateEvent({
    required this.title,
  });
}
