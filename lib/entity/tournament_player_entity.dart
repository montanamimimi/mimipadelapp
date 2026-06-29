import 'package:drift/drift.dart';

class TournamentPlayerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tournamentId => integer()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
}