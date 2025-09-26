import 'package:flutter/material.dart';
import 'package:timetable/activity.dart';
import 'package:timetable/screens/agenda.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dziś"),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Ustawienia',
              onPressed: () {},
          )],
          ),
        body: PageView(
          children: [
            AgendaView(
              activities: [
                Activity(
                  start: DateTime.now().copyWith(hour: 16, minute: 00),
                  end: DateTime.now().copyWith(hour: 17, minute: 30),
                  title: "Technologie XML",
                  type: "Wykład",
                  room: "Lodex B9/F10",
                ),
                Activity(
                  start: DateTime.now().copyWith(hour: 12, minute: 45),
                  end: DateTime.now().copyWith(hour: 14, minute: 15),
                  title: "Programowanie komponentowe",
                  type: "Laboratoria",
                  room: "Fizyka B14/2.11",
                ),
                Activity(
                  start: DateTime.now().copyWith(hour: 10, minute: 45),
                  end: DateTime.now().copyWith(hour: 12, minute: 15),
                  title: "Komputerowa analiza danych",
                  type: "Ćwiczenia",
                  room: "CTI B19/201",
                ),
                Activity(
                  start: DateTime.now().copyWith(hour: 8, minute: 15),
                  end: DateTime.now().copyWith(hour: 9, minute: 45),
                  title: "Seminaria naukowe i współpraca z otoczeniem",
                  type: "Seminarium",
                  room: "On-line",
                ),
              ],
            ),
            AgendaView(
              activities: [
                Activity(
                  start: DateTime.now().copyWith(hour: 16, minute: 00),
                  end: DateTime.now().copyWith(hour: 17, minute: 30),
                  title: "Technologie XML",
                  type: "Wykład",
                  room: "Lodex B9/F10",
                ),
                Activity(
                  start: DateTime.now().copyWith(hour: 11, minute: 15),
                  end: DateTime.now().copyWith(hour: 14, minute: 15),
                  title: "Komputerowa analiza danych",
                  type: "Ćwiczenia",
                  room: "CTI B19/201",
                ),
                Activity(
                  start: DateTime.now().copyWith(hour: 9, minute: 30),
                  end: DateTime.now().copyWith(hour: 10, minute: 45),
                  title: "Seminaria naukowe i współpraca z otoczeniem",
                  type: "Seminarium",
                  room: "On-line",
                ),
              ],
            ),
          ],
        ),
        ),
    );
  }
}
