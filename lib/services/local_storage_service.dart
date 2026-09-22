import 'package:mimipadel/db/app_db.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:drift/drift.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/player.dart';

class LocalStorageService {

  final AppDatabase db;

  LocalStorageService(this.db);

  // Get all tournaments
  
  Future<List<Tournament>> getTournaments() async {    

    final rows = await db.getTournaments();

    return rows.map((row) => Tournament(
      id: row.id,
      name: row.name,
      courts: row.courts,
      format: row.format,
      date: row.date,
      started: row.started,
      finished: row.finished,
      points: row.points,
      mixer: row.mixer,
    )).toList();
  }

  Future<List<Player>> getPlayers() async {    

    final rows = await db.getPlayers();

    return rows.map((row) => Player(
      id: row.id,
      userId: '',
      name: row.name,
    )).toList();
  }  

  // Get single tournament

  Future<Tournament?> getTournament(String id) async {
    try {

      final tournament = await db.getTournament(id);
      return Tournament(
        id: id,
        name: tournament.name,
        date: tournament.date,
        format: tournament.format,
        courts: tournament.courts,
        points: tournament.points,
        started: tournament.started,
        finished: tournament.finished, 
        mixer: tournament.mixer,
        );
    } catch (_) {
      return null;
    }    
  }

  // Create new tournament

  Future<Tournament> createTournament(Tournament tournament) async {

    await db.insertTournament(
      TournamentTableCompanion.insert(
        id: tournament.id,
        name: tournament.name,
        date: tournament.date,
        format: tournament.format,
        courts: tournament.courts,
        points: tournament.points,
        started: false,
        finished: false,
        mixer: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    return tournament;
  }

  // Delete games by round and tournament id

  Future<void> cleanTournamentRoundGames(String id, int round) async {
    await db.deleteGamesByRoundAndTournamentId(id, round);
  }

  Future<void> updateTournament(Tournament tournament) async {    
    await db.updateTournament(
      TournamentTableCompanion(
        id: Value(tournament.id),
        name: Value(tournament.name),
        date: Value(tournament.date),
        format: Value(tournament.format),
        courts: Value(tournament.courts),
        points: Value(tournament.points),
        started: Value(tournament.started),
        finished: Value(tournament.finished),
        mixer: Value(tournament.mixer),
        synced: Value(tournament.synced),
        createdAt: Value(tournament.createdAt),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }  

  Future<void> deleteTournament(String id) async {
    await db.deleteTournament(id);
  }

  Future<int> addTournamentPlayer(String id, String tid, String name, String pid) async {

    final playerId = await db.addTournamentPlayer(
      TournamentPlayerTableCompanion.insert(
        id: id,
        playerId: pid,
        tournamentId: tid,
        name: name,
      ),
    );
    return playerId;
  }

  Future<int> removeTournamentPlayer(String id) async {
    return await db.removeTournamentPlayer(id);
  }  

  Future<List<TournamentPlayer>> getTournamentPlayersById(String id) async {
    final rows = await db.getTournamentPlayersById(id);

    return rows.map((row) => TournamentPlayer(
      id: row.id,
      tournamentId: row.id,
      name: row.name,
    )).toList();
  }  

  Future<List<TournamentPlayer>> getTournamentPlayers() async {    
    final rows = await db.getTournamentPlayers();

    return rows.map((row) => TournamentPlayer(
      id: row.id,
      tournamentId: row.tournamentId,
      name: row.name,
    )).toList();
  }

  Future<void> createTournamentGames(List<TournamentGame> items) async {
    List<TournamentGameTableCompanion> games = [];

    // change to map later

    for (var i = 0; i < items.length; i++) {
      games.add(
        TournamentGameTableCompanion(
          id: Value(items[i].id),
          round: Value(items[i].round),
          tournamentId: Value(items[i].tournamentId),
          side1Player1Id: Value(items[i].side1Player1Id),
          side1Player2Id: Value(items[i].side1Player2Id),
          side2Player1Id: Value(items[i].side2Player1Id),
          side2Player2Id: Value(items[i].side2Player2Id),
          side1Score: Value(items[i].side1Score),
          side2Score: Value(items[i].side2Score),
        )
      );
    }
    
    await db.addGames(games);
  }

  Future<List<TournamentGame>> getTournamentGamesById(String id) async {    
    final rows = await db.getTournamentGamesById(id);

    return rows.map((row) => TournamentGame(
      id: row.id,
      round: row.round,
      tournamentId: row.tournamentId,
      side1Player1Id: row.side1Player1Id,
      side1Player2Id: row.side1Player2Id,
      side2Player1Id: row.side2Player1Id,
      side2Player2Id: row.side2Player2Id,
      side1Score: row.side1Score,
      side2Score: row.side2Score,
    )).toList();
  }  

  Future<List<TournamentGame>> getTournamentGamesByIdAndRound(String id, int round) async {    
    final rows = await db.getTournamentGamesByIdAndRound(id, round);

    return rows.map((row) => TournamentGame(
      id: row.id,
      round: row.round,
      tournamentId: row.tournamentId,
      side1Player1Id: row.side1Player1Id,
      side1Player2Id: row.side1Player2Id,
      side2Player1Id: row.side2Player1Id,
      side2Player2Id: row.side2Player2Id,
      side1Score: row.side1Score,
      side2Score: row.side2Score,
    )).toList();
  }    

  Future<void> updateGameScore(String id, int side1, int side2) async {
    await db.updateGameScore(
      id, 
      TournamentGameTableCompanion(        
        side1Score: Value(side1),
        side2Score: Value(side2),        
      )
    );
  }

  Future<void> updateTournamentPlayerName(String id, String name) async {
    await db.updateTournamentPlayer(
      id, 
      TournamentPlayerTableCompanion(        
        name: Value(name)       
      )
    );
  }

  Future<void> addPlayer(String id, String name) async {

    await db.addPlayer(
      PlayerTableCompanion.insert(
        id: id,
        userId: '',        
        name: name,
      ),
    );    
  }  

  Future<void> cleanPlayers() async {
    await db.deletePlayers();
  }

  Future<void> cleanAllData() async {
    await db.deleteAllTables();
  }    

}