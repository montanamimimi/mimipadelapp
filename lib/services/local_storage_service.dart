import 'package:mimipadel/db/app_db.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:drift/drift.dart';
import 'package:mimipadel/models/tournament_player.dart';

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
        finished: tournament.finished
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

  Future<void> cleanDatabase() async {
    await db.cleanDatabase();
  }  
}