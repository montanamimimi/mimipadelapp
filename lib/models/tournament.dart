import 'package:intl/intl.dart';

class Tournament {
  int id;
  String name;
  DateTime date;
  int courts;
  int points;
  bool started;
  bool finished;
  bool mixer;

  Tournament({
    required this.id,
    required this.name, 
    required this.date,
    this.courts = 0,
    this.points = 0,
    this.started = false,
    this.finished = false,
    this.mixer = true,
    });

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, date: $date, courts: $courts, points: $points, mixer: $mixer, started: $started, finished: $finished)';
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
    bool? mixer,
  }) {
    return Tournament(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      courts: courts ?? this.courts,
      points: points ?? this.points,
      started: started ?? this.started,      
      finished: finished ?? this.finished,
      mixer: mixer ?? this.mixer,
    );
  } 
}