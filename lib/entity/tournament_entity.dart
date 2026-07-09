import 'package:drift/drift.dart';

class TournamentTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
  IntColumn get courts => integer()();
  IntColumn get points => integer()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get started => boolean()();
  BoolColumn get finished => boolean()();
  BoolColumn get mixer => boolean()();
}