import 'package:drift/drift.dart';

class PlayerTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get name => text().withLength(min: 1, max: 32)();

  @override
  Set<Column> get primaryKey => {id};      
}