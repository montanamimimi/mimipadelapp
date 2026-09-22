import 'package:intl/intl.dart';

class Tournament {
  final String id;
  String name;
  DateTime date;
  String format;
  int courts;
  int points;
  bool started;
  bool finished;
  bool mixer;
  bool synced;
  final DateTime createdAt;
  DateTime updatedAt;  

  Tournament({
    required this.id,
    required this.name,
    required this.date,
    required this.format,
    this.courts = 0,
    this.points = 0,
    this.started = false,
    this.finished = false,
    this.mixer = true,
    this.synced = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    }) : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, format: $format, mixer: $mixer, started: $started, finished: $finished)';
  }

  String getDate() {
    return DateFormat('MMM d, yyyy').format(date);
  }

  Tournament copyWith({
    String? id,
    String? name,
    DateTime? date,
    String? format,
    int? courts,
    int? points,
    bool? started,
    bool? finished,
    bool? mixer,
    bool? synced,
  }) {
    return Tournament(
      id: id ?? this.id,      
      name: name ?? this.name,
      date: date ?? this.date,
      format: format ?? this.format,
      courts: courts ?? this.courts,
      points: points ?? this.points,
      started: started ?? this.started,
      finished: finished ?? this.finished,
      mixer: mixer ?? this.mixer,
      synced: synced ?? this.synced,
    );
  } 

}