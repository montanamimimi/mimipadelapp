// import 'package:mimipadel/models/player.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/services/api_service.dart';
import 'package:mimipadel/services/local_storage_service.dart';

class TournamentRepository {

  final LocalStorageService local;  
  final ApiService api;

  TournamentRepository({required this.local, required this.api});

  // uploading tournaments from api on login

  // Future<List<Tournament>> loadTournaments() async {
  //   return await api.getTournaments();
  // }

  // Usually using local to get data

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
    // api.createTournament(tournament);    

    return tournament;    
  }

  Future<void> updateTournament(Tournament tournament) async {    
   await local.updateTournament(tournament);
  //  api.updateTournament(tournament);
  }

  Future<void> insertTournamentGames(List<TournamentGame> items, String tid) async {
    await local.createTournamentGames(items);
    // api.insertTournamentGames(items, tid);
  }

  Future<void> deleteTournament(String id) async {
    await local.deleteTournament(id);
    // api.deleteTournament(id);    
  }

  Future<void> addTournamentPlayer(String id, String tid, String name, String playerId) async {
    await local.addTournamentPlayer(id, tid, name, playerId);
    api.addTournamentPlayer(id, tid, name, playerId);
  }

  Future<void> removeTournamentPlayer(String id, String tid) async {
    await local.removeTournamentPlayer(id);
    // api.removeTournamentPlayer(id, tid);
  }  

  Future<List<TournamentPlayer>> getTournamentPlayers() async {
    return await local.getTournamentPlayers();
  }

  Future<List<TournamentPlayer>> getTournamentPlayersById(String id) async {
    return await local.getTournamentPlayersById(id);
  }  

  Future<List<TournamentGame>> getTournamentGamesById(String id) async {
    return await local.getTournamentGamesById(id);
  }    

  Future<List<TournamentGame>> getTournamentGamesByIdAndRound(String id, int round) async {
    return await local.getTournamentGamesByIdAndRound(id, round);
  }
  
  Future<void> updateGameScore(String id, int side1, int side2, String tid) async {
    await local.updateGameScore(id, side1, side2);
    // api.updateTournamentGame(id, side1, side2, tid);
  }

  Future<void> updateTournamentPlayerName(String id, String name) async {
    await local.updateTournamentPlayerName(id,name);
  }  

  Future<void> deleteLocalData() async {
    await local.cleanAllData();
  }  
}