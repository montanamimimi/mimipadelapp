import 'package:drift/drift.dart';

class TournamentGameTable extends Table {
  TextColumn get id => text()();
  IntColumn get round => integer()();
  TextColumn get tournamentId => text()();
  TextColumn get side1Player1Id => text()();
  TextColumn get side1Player2Id => text()();
  TextColumn get side2Player1Id => text()();
  TextColumn get side2Player2Id => text()();
  IntColumn get side1Score => integer()();
  IntColumn get side2Score => integer()();

  @override
  Set<Column> get primaryKey => {id};      
}