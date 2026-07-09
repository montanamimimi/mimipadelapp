import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:mimipadel/entity/tournament_entity.dart';
import 'package:mimipadel/entity/tournament_game_entity.dart';
import 'package:mimipadel/entity/tournament_player_entity.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    final file = File(
      path.join(dbFolder.path, 'db.sqlite'),
    );    

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [TournamentTable, TournamentPlayerTable, TournamentGameTable])

class AppDatabase extends _$AppDatabase {
  
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<TournamentTableData>> getTournaments() async {
    return await (select(tournamentTable)
    ..orderBy([(t) => OrderingTerm.desc(t.id)]))
    .get();
  }

  Future<TournamentTableData> getTournament(int id) async {
    return await (select(tournamentTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateTournament(TournamentTableCompanion entity) async {
    return await update(tournamentTable).replace(entity);
  }

  Future<int> insertTournament(TournamentTableCompanion entity) async {
    return await into(tournamentTable).insert(entity);
  }

  Future<int> deleteTournament(int id) async {
    return await (delete(tournamentTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> addPlayer(TournamentPlayerTableCompanion player) async {
    return await into(tournamentPlayerTable).insert(player);
  }

  Future<List<TournamentPlayerTableData>> getTournamentPlayersById(int id) async {
    return await (select(tournamentPlayerTable)
    ..where((tbl) => tbl.tournamentId.equals(id)))
    .get();
  }

  Future<List<TournamentPlayerTableData>> getTournamentPlayers() async {
    return await (select(tournamentPlayerTable)
    ..orderBy([(t) => OrderingTerm.desc(t.id)]))
    .get();
  }

  Future<int> removePlayer(int id) async {
    return await (delete(tournamentPlayerTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> addGames(List<TournamentGameTableCompanion> items) async {
    await batch((batch) {
      batch.insertAll(tournamentGameTable, items);
    });
  }

  Future<List<TournamentGameTableData>> getTournamentGamesById(int id) async {
    return await (select(tournamentGameTable)
    ..where((tbl) => tbl.tournamentId.equals(id)))
    .get();
  }  

  Future<List<TournamentGameTableData>> getTournamentGamesByIdAndRound(int id, int round) async {
    return await (select(tournamentGameTable)
    ..where((tbl) => tbl.tournamentId.equals(id) & tbl.gameNumber.equals(round)))
    .get();
  }

  Future<void> updateGameScore(int id, TournamentGameTableCompanion entity) async {
    await (update(tournamentGameTable)
      ..where((tbl) => tbl.id.equals(id)))
      .write(entity);
  }  

  // DEV only 

  Future<void> cleanDatabase() async {
    await (delete(tournamentTable)..where((tbl) => tbl.id.isBiggerOrEqualValue(0))).go();
    await (delete(tournamentPlayerTable)..where((tbl) => tbl.id.isBiggerOrEqualValue(0))).go();
    await (delete(tournamentGameTable)..where((tbl) => tbl.id.isBiggerOrEqualValue(0))).go();
  }
}