import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/tournament_player.dart';
// import 'package:mimipadel/services/api_service.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';

class TournamentRepository {

  final LocalStorageService? local;  

  TournamentRepository({required this.local});

  Future<List<Tournament>> getTournaments() async {

    if (kIsWeb) {
    }

    return await local!.getTournaments();
  }

  Future<void> cleanTournamentRoundGames(int id, int round) async {
    await local!.cleanTournamentRoundGames(id, round);
  }

  Future<Tournament?> getTournamentById(int id) async {

    if (kIsWeb) {
    }

    return await local!.getTournament(id);
  }  

  Future<Tournament> createTournament(Tournament tournament) async {
    return await local!.createTournament(tournament);
  }

  Future<void> updateTournament(Tournament tournament) async {    
   await local!.updateTournament(tournament);
  }

  Future<void> insertTournamentGames(List<TournamentGame> items) async {
    await local!.createTournamentGames(items);
  }

  Future<void> deleteTournament(int id) async {
    await local!.deleteTournament(id);
  }

  // Move to TournamentPlayerRepository later

  Future<int> addPlayer(int id, String name) async {
    return await local!.addPlayer(id, name);
  }

  Future<int> removePlayer(int id) async {
    return await local!.removePlayer(id);
  }  

  Future<List<TournamentPlayer>> getTournamentPlayers() async {
    return await local!.getTournamentPlayers();
  }

  Future<List<TournamentPlayer>> getTournamentPlayersById(int id) async {
    return await local!.getTournamentPlayersById(id);
  }  

  // Move to TournamentGameRepository later

  Future<List<TournamentGame>> getTournamentGamesById(int id) async {
    return await local!.getTournamentGamesById(id);
  }    

  Future<List<TournamentGame>> getTournamentGamesByIdAndRound(int id, int round) async {
    return await local!.getTournamentGamesByIdAndRound(id, round);
  }
  
  Future<void> updateGameScore(int id, int side1, int side2) async {
    await local!.updateGameScore(id, side1, side2);
  }

  Future<void> updatePlayerName(int id, String name) async {
    await local!.updatePlayerName(id,name);
  }  

  // Dev only 

  Future<void> cleanDatabase() async {
    await local!.cleanDatabase();
  }
}