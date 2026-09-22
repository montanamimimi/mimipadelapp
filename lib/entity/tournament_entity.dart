import 'package:drift/drift.dart';

class TournamentTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get courts => integer()();
  IntColumn get points => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get format => text()();
  BoolColumn get started => boolean()();
  BoolColumn get finished => boolean()();
  BoolColumn get mixer => boolean()();
  BoolColumn get synced =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};       
}