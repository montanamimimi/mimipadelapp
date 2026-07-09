import 'package:mimipadel/db/app_db.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:drift/drift.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/models/tournament_game.dart';

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
      date: row.date,
      started: row.started,
      finished: row.finished,
      points: row.points,
      mixer: row.mixer,
    )).toList();
  }

  // Get single tournament

  Future<Tournament?> getTournament(int id) async {
    try {

      final tournament = await db.getTournament(id);
      return Tournament(
        id: id,
        name: tournament.name,
        date: tournament.date,
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
    final id = await db.insertTournament(
      TournamentTableCompanion.insert(
        name: tournament.name,
        date: tournament.date,
        courts: tournament.courts,
        points: tournament.points,
        started: false,
        finished: false,
        mixer: true,
      ),
    );

    return tournament.copyWith(id: id);
  }

  Future<void> updateTournament(Tournament tournament) async {    
    await db.updateTournament(
      TournamentTableCompanion(
        id: Value(tournament.id),
        name: Value(tournament.name),
        date: Value(tournament.date),
        courts: Value(tournament.courts),
        points: Value(tournament.points),
        started: Value(tournament.started),
        finished: Value(tournament.finished),
        mixer: Value(tournament.mixer),
      ),
    );
  }  

  Future<void> deleteTournament(int id) async {
    await db.deleteTournament(id);
  }

  Future<int> addPlayer(int id, String name) async {
    final playerId = await db.addPlayer(
      TournamentPlayerTableCompanion.insert(
        tournamentId: id,
        name: name,
      ),
    );
    return playerId;
  }

  Future<int> removePlayer(int id) async {
    return await db.removePlayer(id);
  }  

  Future<List<TournamentPlayer>> getTournamentPlayersById(int id) async {
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
          gameNumber: Value(items[i].gameNumber),
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

  Future<List<TournamentGame>> getTournamentGamesById(int id) async {    
    final rows = await db.getTournamentGamesById(id);

    return rows.map((row) => TournamentGame(
      id: row.id,
      gameNumber: row.gameNumber,
      tournamentId: row.tournamentId,
      side1Player1Id: row.side1Player1Id,
      side1Player2Id: row.side1Player2Id,
      side2Player1Id: row.side2Player1Id,
      side2Player2Id: row.side2Player2Id,
      side1Score: row.side1Score,
      side2Score: row.side2Score,
    )).toList();
  }  

  Future<List<TournamentGame>> getTournamentGamesByIdAndRound(int id, int round) async {    
    final rows = await db.getTournamentGamesByIdAndRound(id, round);

    return rows.map((row) => TournamentGame(
      id: row.id,
      gameNumber: row.gameNumber,
      tournamentId: row.tournamentId,
      side1Player1Id: row.side1Player1Id,
      side1Player2Id: row.side1Player2Id,
      side2Player1Id: row.side2Player1Id,
      side2Player2Id: row.side2Player2Id,
      side1Score: row.side1Score,
      side2Score: row.side2Score,
    )).toList();
  }    

  Future<void> updateGameScore(int id, int side1, int side2) async {
    await db.updateGameScore(
      id, 
      TournamentGameTableCompanion(        
        side1Score: Value(side1),
        side2Score: Value(side2),        
      )
    );
  }

  // Dev only

  Future<void> cleanDatabase() async {
    await db.cleanDatabase();
  }
}