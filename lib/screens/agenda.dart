import 'package:flutter/material.dart';
import 'package:timetable/activity.dart';

const hourSize = 90;
const numberOfDivs = 4;

class AgendaView extends StatelessWidget {
  final List<Activity> activities;

  late final ScrollController scrollController;

  AgendaView({super.key, required this.activities}){
    TimeOfDay now = TimeOfDay.now();
    scrollController = ScrollController(initialScrollOffset: ((now.hour - .5) * hourSize).toDouble());
  }


  List<Widget> buildHours() {
    List<Widget> hours = [];
    for (int i = 0; i < 24 * numberOfDivs; i++) {
      hours.add(
        SizedBox(
          height: hourSize / numberOfDivs,
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (i % numberOfDivs == 0)
                Text(
                  ((i / 4) % 24).toStringAsFixed(0),
                  style: const TextStyle(height: 1),
                ),
              Line(
                color: i % numberOfDivs == 0
                    ? const Color.fromARGB(255, 134, 134, 134)
                    : const Color.fromARGB(255, 199, 199, 199),
              ),
            ],
          ),
        ),
      );
    }
    return hours;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Stack(
          children: [
            Column(children: buildHours()),
            Positioned.fill(
              top: (hourSize / numberOfDivs) / 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Stack(
                  children: activities.map(
                    (activity) => TimetableEntry(
                    start: TimeOfDay(hour: activity.start.hour, minute: activity.start.minute),
                    end: TimeOfDay(hour: activity.end.hour, minute: activity.end.minute),
                    title: activity.title,
                    type: activity.type,
                    room: activity.room,
                  )).toList(),
                ),
              ),
            ),
            Positioned(
                      top:
                          (TimeOfDay.now().hour * 60 + TimeOfDay.now().minute) *
                          hourSize /
                          60 +
                          hourSize / numberOfDivs / 2,
                      left: 0,
                      right: 0,
                      child: Line(color: Colors.red),
                    ),
          ],
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  final Color? color;

  const Line({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(height: 1, color: color));
  }
}

class TimetableEntry extends StatelessWidget {
  final TimeOfDay start;
  final TimeOfDay end;
  final String title;

  final String? type;
  final String? room;

  const TimetableEntry({
    super.key,
    required this.start,
    required this.end,
    required this.title,
    this.type,
    this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (start.hour * 60 + start.minute) / 60 * hourSize,
      left: 0,
      right: 0,
      child: Container(
        height:
            
            ((end.hour * 60 + end.minute) - (start.hour * 60 + start.minute)) /
            60 * hourSize,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorScheme.of(context).tertiaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (type != null) Text(
              type!,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
            ),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${start.format(context)} - ${end.format(context)}',
                ),
                if (room != null) Text(room!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
