import 'package:drift/drift.dart';

class TournamentGameTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameNumber => integer()();
  IntColumn get tournamentId => integer()();
  IntColumn get side1Player1Id => integer()();
  IntColumn get side1Player2Id => integer()();
  IntColumn get side2Player1Id => integer()();
  IntColumn get side2Player2Id => integer()();
  IntColumn get side1Score => integer()();
  IntColumn get side2Score => integer()();
}