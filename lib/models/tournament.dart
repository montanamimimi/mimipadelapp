import 'package:intl/intl.dart';

class Tournament {
  int id;
  String name;
  DateTime date;
  int courts;
  int points;
  bool started;
  bool finished;

  Tournament({
    required this.id,
    required this.name, 
    required this.date,
    this.courts = 0,
    this.points = 0,
    this.started = false,
    this.finished = false,
    });

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, date: $date, courts: $courts, points: $points, started: $started, finished: $finished)';
  }

  String getDate() {
    return DateFormat('MMM d, yyyy').format(date);
  }

  Tournament copyWith({
    int? id,
    String? name,
    DateTime? date,
    int? courts,
    int? points,
    bool? started,
    bool? finished,
  }) {
    return Tournament(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      courts: courts ?? this.courts,
      points: points ?? this.points,
      started: started ?? this.started,      
      finished: finished ?? this.finished,
    );
  } 
}