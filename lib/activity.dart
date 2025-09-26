class Activity {
  final DateTime start;
  final DateTime end;
  final String title;

  final String? room;
  final String? type;

  Activity({required this.start, required this.end, required this.title, this.room, this.type});
}