import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:mimipadel/entity/tournament_entity.dart';
import 'package:mimipadel/entity/tournament_game_entity.dart';
import 'package:mimipadel/entity/tournament_player_entity.dart';
import 'package:mimipadel/entity/player_entity.dart';

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

@DriftDatabase(tables: [TournamentTable, TournamentPlayerTable, TournamentGameTable, PlayerTable])

class AppDatabase extends _$AppDatabase {
  
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<TournamentTableData>> getTournaments() async {
    return await (select(tournamentTable)
    ..orderBy([(t) => OrderingTerm.desc(t.id)]))
    .get();
  }

  Future<TournamentTableData> getTournament(String id) async {
    return await (select(tournamentTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateTournament(TournamentTableCompanion entity) async {
    return await update(tournamentTable).replace(entity);
  }

  Future<int> insertTournament(TournamentTableCompanion entity) async {
    return await into(tournamentTable).insert(entity);
  }

  Future<int> deleteTournament(String id) async {
    return await (delete(tournamentTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> deleteGamesByRoundAndTournamentId(String id, int round) async {
    await (delete(tournamentGameTable)
          ..where((tbl) => 
          tbl.tournamentId.equals(id) &
          tbl.round.equals(round)))
          .go();
  }

  Future<int> addTournamentPlayer(TournamentPlayerTableCompanion player) async {
    return await into(tournamentPlayerTable).insert(player);
  }

  Future<List<TournamentPlayerTableData>> getTournamentPlayersById(String id) async {
    return await (select(tournamentPlayerTable)
    ..where((tbl) => tbl.tournamentId.equals(id)))
    .get();
  }

  Future<List<TournamentPlayerTableData>> getTournamentPlayers() async {
    return await (select(tournamentPlayerTable)
    ..orderBy([(t) => OrderingTerm.desc(t.id)]))
    .get();
  }

  Future<int> removeTournamentPlayer(String id) async {
    return await (delete(tournamentPlayerTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateTournamentPlayer(String id, TournamentPlayerTableCompanion entity) async {
    await (update(tournamentPlayerTable)
      ..where((tbl) => tbl.id.equals(id)))
      .write(entity);
  }  

  Future<void> addGames(List<TournamentGameTableCompanion> items) async {
    await batch((batch) {
      batch.insertAll(tournamentGameTable, items);
    });
  }

  Future<List<TournamentGameTableData>> getTournamentGamesById(String id) async {
    return await (select(tournamentGameTable)
    ..where((tbl) => tbl.tournamentId.equals(id)))
    .get();
  }  

  Future<List<TournamentGameTableData>> getTournamentGamesByIdAndRound(String id, int round) async {
    return await (select(tournamentGameTable)
    ..where((tbl) => tbl.tournamentId.equals(id) & tbl.round.equals(round)))
    .get();
  }

  Future<void> updateGameScore(String id, TournamentGameTableCompanion entity) async {
    await (update(tournamentGameTable)
      ..where((tbl) => tbl.id.equals(id)))
      .write(entity);
  }  

  Future<List<PlayerTableData>> getPlayers() async {
    return await (select(playerTable)
    ..orderBy([(t) => OrderingTerm.desc(t.name)]))
    .get();
  }

  Future<int> addPlayer(PlayerTableCompanion player) async {
    return await into(playerTable).insert(player);
  }    

  Future<void> deletePlayers() async {
    await delete(playerTable).go();
  }  

  Future<void> deleteAllTables() async {
    await delete(playerTable).go();
    await delete(tournamentTable).go();
    await delete(tournamentPlayerTable).go();
    await delete(tournamentGameTable).go();
  }

}