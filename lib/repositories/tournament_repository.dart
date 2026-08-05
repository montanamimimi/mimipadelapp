import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/services/api_service.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';

class TournamentRepository {

  final LocalStorageService local;  
  final ApiService api;

  TournamentRepository({required this.local, required this.api});

  Future<List<Tournament>> getTournaments() async {
    return await local.getTournaments();
  }

  Future<void> cleanTournamentRoundGames(String id, int round) async {
    await local.cleanTournamentRoundGames(id, round);
  }

  Future<Tournament?> getTournamentById(String id) async {

    return await local.getTournament(id);
  }  

  Future<Tournament> createTournament(Tournament tournament) async {     
    await local.createTournament(tournament);
    api.createTournament(tournament);    

    return tournament;    
  }

  Future<void> updateTournament(Tournament tournament) async {    
   await local.updateTournament(tournament);
  }

  Future<void> insertTournamentGames(List<TournamentGame> items) async {
    await local.createTournamentGames(items);
  }

  Future<void> deleteTournament(String id) async {
    await local.deleteTournament(id);
    api.deleteTournament(id);
    
  }

  // Move to TournamentPlayerRepository later

  Future<int> addPlayer(String id, String tid, String name) async {
    return await local.addPlayer(id, tid, name);
  }

  Future<int> removePlayer(String id) async {
    return await local.removePlayer(id);
  }  

  Future<List<TournamentPlayer>> getTournamentPlayers() async {
    return await local.getTournamentPlayers();
  }

  Future<List<TournamentPlayer>> getTournamentPlayersById(String id) async {
    return await local.getTournamentPlayersById(id);
  }  

  // Move to TournamentGameRepository later

  Future<List<TournamentGame>> getTournamentGamesById(String id) async {
    return await local.getTournamentGamesById(id);
  }    

  Future<List<TournamentGame>> getTournamentGamesByIdAndRound(String id, int round) async {
    return await local.getTournamentGamesByIdAndRound(id, round);
  }
  
  Future<void> updateGameScore(String id, int side1, int side2) async {
    await local.updateGameScore(id, side1, side2);
  }

  Future<void> updatePlayerName(String id, String name) async {
    await local.updatePlayerName(id,name);
  }  
}